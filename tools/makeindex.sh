#!/bin/bash
#
# make index-file with all markdown-files
#
# sverre.stikbakke@ntnu.no 18.04.2016
#

MDFILES='../index/*.md'
TEMPLATE='notes.html'
CSS='ntnu-bb.css'

source ./globals.sh
source ./compileindex.sh
source ./processmdfiles.sh
