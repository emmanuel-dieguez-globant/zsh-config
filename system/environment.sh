# Set your custom environment variables here
CUSTOM_PATH+="."

export JAVA_HOME="$HOME/current_jdk"
CUSTOM_PATH+=":$JAVA_HOME/bin"

PATH="$CUSTOM_PATH:$PATH"
