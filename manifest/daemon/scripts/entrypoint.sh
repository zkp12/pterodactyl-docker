#!/bin/bash
echo "Starting docker...."
cd /srv/daemon
echo "Starting docker...."
docker start
echo "Starting daemon...."
npm start