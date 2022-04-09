#!/bin/sh

for i in `find ../lib -type f -name "*.jar"` ; do jar xf $i ; done
