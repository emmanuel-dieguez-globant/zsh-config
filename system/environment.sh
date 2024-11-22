# Set your custom environment variables here
export API_BOT_TOKEN='1018896613:AAHvMo0q7M_Z2pw1NcemCdsb9pOT_J5CDPI'
export JAVA_HOME="$HOME/.current_jdk"
export GOROOT='/opt/go'
export GOPATH='/opt/gopath'
export NODE_PATH='/opt/node'

CUSTOM_PATH+=":$JAVA_HOME/bin"
CUSTOM_PATH+=":$GOROOT/bin"
CUSTOM_PATH+=":$GOPATH/bin"
CUSTOM_PATH+=":$NODE_PATH/bin"

PATH="$CUSTOM_PATH:$PATH"
