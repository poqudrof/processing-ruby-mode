Ruby Mode for PDE (Processing)
==============================

Fork from [tyfkda github](https://github.com/tyfkda/processing-ruby-mode)

**Also Work in progress**

This is additional mode for PDE, [Processing](http://www.processing.org/) IDE.
You can write graphical application in Ruby.
Code to run application is taken from [ruby-processing](https://github.com/jashkenas/ruby-processing).

# Updates from the original repository.

* Compilation with Maven + bash script instead of Makefile. 
* Binary distribution (see in the release section). 


# Installation from binary. 

* Download the archive [here](http://jiii.fr/git/processing-ruby-mode/RubyMode.zip).
* Unzip it and copy the contents in the sketchbook/modes folder.
* Restart Processing and select the mode from the IDE. 


# Compilation from sources.
## Requirements
* Java tools: `javac`, `jar`  (preferably the whole JDK). 
* Maven 
* Bash (on Windows)

## How to build

* `sh compilation.sh`

You may encounter a few problems, if it does not compile look for missing dependencies.


## How to use Ruby mode in PDE
* Choose `Ruby` from mode pull down menu in PDE

# Info
* JRuby: jruby-complete-1.7.12.jar
