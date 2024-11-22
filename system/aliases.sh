alias youtube-dl-mp3='youtube-dl --extract-audio --audio-format mp3'

if [ -e $ROOT_DIR/system/aliases_local.sh ]; then
    source $ROOT_DIR/system/aliases_local.sh
fi
