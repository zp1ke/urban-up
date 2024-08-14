#!/bin/sh

lsb_release -a

echo ""
terraform -v

echo ""
aws --version

echo ""
ansible --version

git config --global --add safe.directory /workspaces/*
