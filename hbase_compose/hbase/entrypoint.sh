#!/bin/bash
set -e

echo "Starting HBase (master + regionserver)..."
${HBASE_HOME}/bin/start-hbase.sh

# UI/로그가 유지되도록 tail
tail -f ${HBASE_HOME}/logs/* &
wait
