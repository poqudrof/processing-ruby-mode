

#!/bin/bash

echo "Install Processing depedencies to Maven"

mvn install:install-file -Dfile=./lib/core.jar -DgroupId=processing -DartifactId=core -Dversion=2.2.1 -Dpackaging=jar
mvn install:install-file -Dfile=./lib/pde.jar -DgroupId=processing -DartifactId=pde -Dversion=2.2.1 -Dpackaging=jar

echo "Compile... "
mvn install

echo "Create the library... "
sh create.sh

echo "Finished ! You can copy the RubyMode  folder to your sketchbook/modes folder." 
