#!/usr/bin/env bash

docker run --rm -it \
    --mount type=bind,src=`pwd`/articles,dst=/work/articles \
    --mount type=bind,src=`pwd`/downloads,dst=/work/dl \
    pizerow_buildroot
