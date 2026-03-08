#!/bin/zsh
TITLE=$1
if [ -z "$TITLE" ]; then
	echo "error"
	exit 1
fi

SLUG=$(echo $TITLE | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

DATE=$(date +"%Y-%m-%d")
echo "Creating post: $DATE-$SLUG"
mkdir -p _drafts
FILENAME=_drafts/$DATE-$SLUG.md
echo "---" > $FILENAME
echo "layout: post" >> $FILENAME
echo "title: $TITLE" >> $FILENAME
echo "date: $DATE" >> $FILENAME
echo "categories: " >> $FILENAME
echo "---" >> $FILENAME
