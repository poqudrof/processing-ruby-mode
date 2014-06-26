$LOAD_PATH << File.dirname(__FILE__)

unless defined? SKETCH_PATH
  SKETCH_PATH = ARGV.shift
  SKETCH_ROOT = File.dirname(SKETCH_PATH)
  $LOAD_PATH << SKETCH_ROOT
end

module Processing
  CONFIG = {}
end

def get_class_paths(str)
  # Assumes that the string has separator on the top.
  # ex. ':/Applications/Processing.app/Contents/Java/core/library/core.jar:/Applications/...'
  separator = str[0]
  str[1..-1].split(separator)
end

unless Processing::CONFIG.has_key?('PROCESSING_ROOT')
  Processing::CONFIG['PROCESSING_ROOT'] = ARGV.shift
end

require 'ruby-processing/helpers/string'
require 'ruby-processing/helpers/numeric'
require 'ruby-processing/app'

module Processing
  def self.exported?
    false
  end

  def self.load_and_run_sketch
    source = self.read_sketch_source
    has_sketch = !!source.match(/^[^#]*< Processing::App/)
    has_methods = !!source.match(/^[^#]*(def\s+setup|def\s+draw)/)

    loads = Dir.glob("#{SKETCH_ROOT}/*.rb").map do |path|
      "load '#{File.basename(path)}'"
    end.join("\n")

    if has_sketch
      load SKETCH_PATH
      Processing::App.sketch_class.new if !$app
    else
      # For use with "bare" sketches that don't want to define a class or methods
      if has_methods
        code = <<-EOS
          class Sketch < Processing::App
            #{loads}
            #{source}
          end
        EOS
      else
        code = <<-EOS
          class Sketch < Processing::App
            #{loads}
            def setup
              size(DEFAULT_WIDTH, DEFAULT_HEIGHT, JAVA2D)
              #{source}
              no_loop
            end
          end
        EOS
      end
      begin
        Object.class_eval(code, SKETCH_PATH, -1)
        Processing::App.sketch_class.new
      rescue Exception => exc
        $stderr.print(exc.to_s)
      end
    end
  end

  # Read in the sketch source code. Needs to work both online and offline.
  def self.read_sketch_source
    File.read(SKETCH_PATH)
  end

  def self.restart_sketch
    if $app
      $app.close
      $app = nil
    end
    load_and_run_sketch
  end
end

# Thread to handle messages from PDE.
t = Thread.new do
  while $stdin.gets
    case $_.chomp
    when 'close'
      if $app
        $app.close
        $app = nil
      end
    when /^requestRestart (.*)$/  # Restart request
      Processing.restart_sketch
    end
  end
end

Processing.load_and_run_sketch

t.join
