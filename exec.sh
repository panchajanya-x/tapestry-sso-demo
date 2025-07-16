#!/usr/bin/env bash
docker build -t auth0-angular-sample .
docker run --init -p 8080:8080 -it auth0-angular-sample
