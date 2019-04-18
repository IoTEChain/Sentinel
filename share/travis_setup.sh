#!/bin/bash
set -evx

mkdir ~/.iotedata

# safety check
if [ ! -f ~/.iotedata/.iote.conf ]; then
  cp share/iote.conf.example ~/.dashcore/iote.conf
fi
