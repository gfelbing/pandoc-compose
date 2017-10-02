#!/bin/sh

set -e

BASEPATH=$(realpath "$(dirname $0)")
VERSION=$(cat "$BASEPATH/VERSION.txt")
GIT_TAG="v$VERSION"

echo -n "Running unit tests..."
python -m unittest tests
echo "done."

echo -n "Uploading to pypi..."
python setup.py sdist upload
echo "done."

echo -n "Tagging last commit with '$GIT_TAG'..."
git tag "$GIT_TAG"
echo "done."

echo -n "Pushing current branch and tag..."
git push --tags
echo "done."
