# Set your custom environment variables here
export JAVA_HOME="$HOME/.current_jdk"

CUSTOM_PATH+=":$JAVA_HOME/bin"

PATH="$CUSTOM_PATH:$PATH"

if [ -e $ROOT_DIR/system/environment_local.sh ]; then
    source $ROOT_DIR/system/environment_local.sh
fi
