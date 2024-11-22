# Set your custom environment variables here
CUSTOM_PATH+="."

# Groovy and Grails
export JAVA_HOME='/Library/Java/JavaVirtualMachines/current'
#export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_79-osx/'
CUSTOM_PATH+=":$JAVA_HOME/bin"
CUSTOM_PATH+=":/usr/local/opt/maven/bin"
# GRAILS_HOME='/opt/grails'
# CUSTOM_PATH+=":$GRAILS_HOME/bin"

# CUSTOM_PATH+=":/opt/gradle/bin"
# CUSTOM_PATH+=":/opt/nodejs/bin"
# CUSTOM_PATH+=":/opt/mongo/bin"

PATH="$CUSTOM_PATH:$PATH"
