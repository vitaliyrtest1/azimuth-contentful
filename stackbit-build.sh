#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://vitaliy-stackbit.ngrok.io/project/5f05cb3ea231b780921ed04c/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://vitaliy-stackbit.ngrok.io/pull/5f05cb3ea231b780921ed04c
curl -s -X POST https://vitaliy-stackbit.ngrok.io/project/5f05cb3ea231b780921ed04c/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://vitaliy-stackbit.ngrok.io/project/5f05cb3ea231b780921ed04c/webhook/build/publish > /dev/null
