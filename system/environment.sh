# Set your custom environment variables here
export JAVA_HOME="$HOME/.current_jdk"
export GOROOT='/opt/go'
export GOPATH='/opt/gopath'
export NODE_PATH='/opt/node'

CUSTOM_PATH+=":$JAVA_HOME/bin"
CUSTOM_PATH+=":$GOROOT/bin"
CUSTOM_PATH+=":$GOPATH/bin"
CUSTOM_PATH+=":$NODE_PATH/bin"

PATH="$CUSTOM_PATH:$PATH"
