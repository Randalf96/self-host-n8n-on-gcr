#!/bin/sh
set -e

# Cloud Run injects PORT; default to 5678 if absent
PORT="${PORT:-5678}"
export N8N_PORT="$PORT"

# Always listen on all interfaces inside the container
export N8N_HOST="${N8N_HOST:-0.0.0.0}"

echo "Starting n8n on $N8N_HOST:$N8N_PORT"
echo "DB_TYPE=$DB_TYPE DB_HOST=$DB_POSTGRESDB_HOST DB_PORT=$DB_POSTGRESDB_PORT"

# Run official entrypoint *with explicit args* so we control host/port
exec /docker-entrypoint.sh n8n start --host="$N8N_HOST" --port="$N8N_PORT"