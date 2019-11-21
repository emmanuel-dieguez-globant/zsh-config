# Set your custom environment variables here
CUSTOM_PATH+="."

export JAVA_HOME='/Library/Java/JavaVirtualMachines/current'
CUSTOM_PATH+=":$JAVA_HOME/bin"
CUSTOM_PATH+=":/usr/local/opt/maven/bin"

PATH="$CUSTOM_PATH:$PATH"
