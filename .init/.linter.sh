#!/bin/bash
cd /tmp/kavia/workspace/code-generation/notion-inspired-todo-list-3271-3286/frontend
npm run build
EXIT_CODE=$?
if [ $EXIT_CODE -ne 0 ]; then
   exit 1
fi

