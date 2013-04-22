#!/bin/bash
set -e

BOOTSTRAP=$(dirname $(dirname $0))
BASE_LESS_FILE=$BOOTSTRAP/less/bootstrap.less
OUTPUT_FOLDER=$BOOTSTRAP/../hub/bootstrap
echo BOOTSTRAP=$BOOTSTRAP
echo BASE_LESS_FILE=$BASE_LESS_FILE
echo OUTPUT_FOLDER=$OUTPUT_FOLDER

read -p "Continue? [yN] " -n 1
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi
echo

echo Compiling $BASE_LESS_FILE
mkdir -p $BOOTSTRAP/dist/css
lessc $BASE_LESS_FILE > $BOOTSTRAP/dist/css/bootstrap.css

echo Copying over to $OUTPUT_FOLDER
mkdir -p $OUTPUT_FOLDER/css $OUTPUT_FOLDER/img $OUTPUT_FOLDER/js
cp $BOOTSTRAP/dist/css/*.css $OUTPUT_FOLDER/css/
cp $BOOTSTRAP/img/* $OUTPUT_FOLDER/img/
cp $BOOTSTRAP/js/*.js $OUTPUT_FOLDER/js/

echo done
