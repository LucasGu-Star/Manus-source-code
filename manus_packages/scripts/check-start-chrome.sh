#!/bin/bash

# 等待 sandbox-runtime 健康检查通过
while ! curl -s http://localhost:8330/healthz -o /dev/null -w "%{http_code}" | grep -q "200"; do
    echo "[chrome] Waiting for sandbox-runtime to be ready..."
    sleep 1
done

echo "sandbox-runtime is ready, starting chrome..."
# 执行原来的 chrome 启动脚本
exec /opt/.manus/.packages/scripts/start-chrome.sh