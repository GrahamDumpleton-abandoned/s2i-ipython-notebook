#!/bin/sh

cp -rp $HOME/jupyter $HOME/.jupyter
cp -rp $HOME/ipython $HOME/.ipython

if [ x"$IPYTHON_CLUSTER_LABEL" != x"" ]; then
    cat $HOME/ipython/profile_default/security/ipcontroller-client.json | \
        sed -e "s/ipcontroller/ipcontroller-$IPYTHON_CLUSTER_LABEL/" > \
        $HOME/.ipython/profile_default/security/ipcontroller-client.json
    cat $HOME/ipython/profile_default/security/ipcontroller-engine.json | \
        sed -e "s/ipcontroller/ipcontroller-$IPYTHON_CLUSTER_LABEL/" > \
        $HOME/.ipython/profile_default/security/ipcontroller-engine.json
fi

if [ x"$IPYTHON_CONTAINER_TYPE" = x"controller" ]; then
    exec ipcontroller
fi

if [ x"$IPYTHON_CONTAINER_TYPE" = x"engine" ]; then
    exec ipengine
fi

IPYTHON_NOTEBOOK_DIR=${IPYTHON_NOTEBOOK_DIR:-/opt/app-root/src}

exec ipython notebook --no-browser --debug --log-level=DEBUG \
    --notebook-dir=$IPYTHON_NOTEBOOK_DIR --ip=* --port=8080
