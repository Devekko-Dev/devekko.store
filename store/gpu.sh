##!/bin/bash
#! /usr/bin/env bash
export PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# cd /opt/devekko/store

set -ex

while ! pg_isready -q -h store_pgvector_dev -p 5432 -U admin
do
 echo "$(date) - waiting for database to start"
 sleep 15
done

# MIX_ENV=prod mix ecto.reset
echo "iex -S mix phx.server"
MIX_ENV=gpu mix ecto.migrate
MIX_ENV=gpu iex -S mix phx.server
#MIX_ENV=prod elixir --sname  -S mix phx.server
# sleep infinity
# prod
