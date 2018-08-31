#!/bin/sh

# ScssファイルをCssファイルに変換
sass --scss --watch ./src/:./build/ -t expanded