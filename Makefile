TARGET=RubyMode.jar

SRC_ROOT_PATH=src
SRCDIR=$(SRC_ROOT_PATH)/processing/mode/ruby
OUTPUT_PATH=classes

DIST_PATH=$(SKETCHBOOK)/modes/RubyMode/mode/

SRCS=$(wildcard $(SRCDIR)/*.java)

#----------------------------------------------
# Enter Processing version here 
PROCESSING_VERSION=2.2.1

# Or
# PROCESSING_ROOT=$(HOME)/processing-2.2.1
#----------------------------------------------

OS=$(shell uname)

ifeq ($(OS), Darwin)
	PROCESSING_PATH=/Applications/Processing.app
	PROCESSING_CORE_JAR=$(PROCESSING_PATH)/Contents/Java/core.jar
 	PROCESSING_APP_JAR=$(PROCESSING_PATH)/Contents/Java/pde.jar
else

  ifndef PROCESSING_ROOT
    PROCESSING_ROOT=$(PATH)/processing-$(PROCESSING_VERSION)
  endif

  PROCESSING_PATH=$(PROCESSING_ROOT)
  PROCESSING_CORE_JAR=$(PROCESSING_PATH)/core/library/core.jar
  PROCESSING_APP_JAR=$(PROCESSING_PATH)/lib/pde.jar
endif



all:	$(DIST_PATH)/$(TARGET)

$(DIST_PATH)/$(TARGET):	$(TARGET)
	cp $(TARGET) $(DIST_PATH)

$(TARGET):	$(SRCS)
	javac -d $(OUTPUT_PATH) -sourcepath $(SRC_ROOT_PATH) -cp src:$(PROCESSING_CORE_JAR):$(PROCESSING_APP_JAR) src/processing/mode/ruby/RubyMode.java
	jar -cvf $@ -C $(OUTPUT_PATH) .

clean:
	rm -rf $(OUTPUT_PATH)/processing $(TARGET)

RubyMode.zip:	$(TARGET)
	mkdir RubyMode && \
	cp -r others/* RubyMode/ && \
	cp $(TARGET) RubyMode/mode/ && \
	zip -r $@ RubyMode && \
	rm -rf RubyMode
