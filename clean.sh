#!/bin/bash
cd "$(dirname "$0")" || exit 1
rm -rf agent/log/*
rm -rf proofread_material/*
rm -rf result/*