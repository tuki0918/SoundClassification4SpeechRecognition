#!/bin/bash

##############################

WORK_DIR=/usr/src/app
NOTEBOOKS_DIR=$WORK_DIR/notebooks

##############################

usage() {
    cat <<-EOF
    Usage: $0 {build|boot}
EOF
    exit 1
}

case "$1" in
    # コンテナの作成
    build)
        docker image build --no-cache -t py36-jupyter .
        ;;
    # 立ち上げ
    boot)
        docker container run --rm -it \
            --name py36-tips \
            -v $PWD:$WORK_DIR \
            -w $WORK_DIR \
            -p 8888:8888 \
            py36-jupyter bash -c "jupyter notebook \
            --notebook-dir=$NOTEBOOKS_DIR \
            --allow-root --no-browser --port=8888 --ip=*"
        ;;
    *)
        usage
        ;;
esac