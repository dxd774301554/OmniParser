#!/bin/bash

# 初始化额外参数变量
EXTRA_ARGS=""

# 检查 PORT 环境变量并设置相应的参数
if [[ -n $PORT ]]; then
    EXTRA_ARGS+=" --port $PORT"
fi

if [[ -n $HOST ]]; then
    EXTRA_ARGS+=" --host $HOST"
fi

if [[ -n $DEVICE ]]; then
    EXTRA_ARGS+=" --device $DEVICE"
fi

if [[ -n $SOM_MODEL_PATH ]]; then
    EXTRA_ARGS+=" --som_model_path $SOM_MODEL_PATH"
fi

if [[ -n $CAPTION_MODEL_NAME ]]; then
    EXTRA_ARGS+=" --caption_model_name $CAPTION_MODEL_NAME"
fi

if [[ -n $CAPTION_MODEL_PATH ]]; then
    EXTRA_ARGS+=" --caption_model_path $CAPTION_MODEL_PATH"
fi

# 检查并运行Python脚本
if [[ -f /workspace/OmniParser/api_server.py ]]; then
    echo "Running "
    echo "Starting api_server.py with the following arguments: $EXTRA_ARGS"
    cd /workspace/OmniParser
    python api_server.py $EXTRA_ARGS
else
    echo "api_server.py not found"
    exit 1
fi
