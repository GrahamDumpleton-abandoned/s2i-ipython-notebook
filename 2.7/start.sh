#!/bin/sh

cp -rp /.whiskey/ipython $HOME/.ipython

if [ "$IPYTHON_CONTAINER_TYPE" = "controller" ]; then
    exec ipcontroller
fi

if [ "$IPYTHON_CONTAINER_TYPE" = "engine" ]; then
    exec ipengine
fi

exec ipython notebook --no-browser --debug --log-level=DEBUG \
    --notebook-dir=/app --ip=* --port=8080
