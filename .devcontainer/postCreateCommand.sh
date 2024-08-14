#!/bin/sh

lsb_release -a

echo ""
terraform -v

echo ""
aws --version

git config --global --add safe.directory /workspaces/*
