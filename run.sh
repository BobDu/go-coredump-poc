#!/bin/bash
set -x

GOTRACEBACK=crash ./main
EXIT_CODE=$?
echo "Go program exited with status code: $EXIT_CODE"

CORE_FILE=$(ls core.* 2>/dev/null)
if [ -n "$CORE_FILE" ]; then
    TS=$(date +%s)
    mv "$CORE_FILE" "${TS}.core"
    if aws s3 cp "${TS}.core" "s3://${CORE_DUMP_S3_BUCKET}/${TS}.core"; then
        echo "Core dump file ${TS}.core uploaded to S3."
    else
        echo "Failed to upload core dump ${TS}.core to S3."
    fi
else
    echo "No core dump file found."
fi

exit $EXIT_CODE
