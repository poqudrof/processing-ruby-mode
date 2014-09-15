Ruby Mode for PDE (Processing)
==============================

Fork from [tyfkda github](https://github.com/tyfkda/processing-ruby-mode)

**Also Work in progress**

This is additional mode for PDE, [Processing](http://www.processing.org/) IDE.
You can write graphical application in Ruby.
Code to run application is taken from [ruby-processing](https://github.com/jashkenas/ruby-processing).

# Updates from the original repository.

* Linux support in the Makefile. 
* Binary distribution.

# Installation from binary. 

* Download the archive [here](http://jiii.fr/git/processing-ruby-mode/RubyMode.zip).
* Unzip it and copy the contents in the sketchbook/modes folder.
* Restart Processing and select the mode from the IDE. 



# Compilation from sources.
## Requirements
* Java tools: `javac`, `jar`
* Processing runtime jars: `core.jar`, `pde.jar`

## How to build
* Type `make` at the repository root directory.
* `RubyMode.jar` will be created

## How to install
+ Create `RubyMode` directory in `modes` directory in Processing working directory:
  * MacOSX: `~/Documents/Processing/modes/`
  * Windows: `%homepath%\Documents\modes\`
  * Linux: `~/sketchbook/modes/`
+ Copy all files under `others/` directory into created `RubyMode` directory
+ Copy `RubyMode.jar` into `RubyMode/mode` directory
+ Reboot Processing

## How to use Ruby mode in PDE
* Choose `Ruby` from mode pull down menu in PDE

# Info
* JRuby: jruby-complete-1.7.12.jar
