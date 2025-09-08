#!/usr/bin/env bash

set -euo pipefail

# Change to the directory where this script resides
cd "$(dirname "$0")"

# Optional usage: ./push.sh "Your commit message here"
if [ $# -eq 0 ]; then
  MSG="chore: update $(date '+%Y-%m-%d %H:%M:%S')"
else
  MSG="$1"
fi

echo "--------------------------------------------------"
echo "Repository status before commit:"
git status
echo "--------------------------------------------------"

# Stage all changes (new, modified, deleted)
git add -A

# Commit; if there is nothing to commit, continue without error
if ! git commit -m "$MSG"; then
  echo "Nothing to commit. Skipping commit."
fi

# Push to origin/main
git push origin main

exit 0


