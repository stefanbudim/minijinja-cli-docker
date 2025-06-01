#!/bin/bash
cat <<EOF
Deleting git tag $@ and pushing to remote.

EOF

git tag -d $@

git push origin :refs/tags/$@
# This tells Git to push an empty reference (i.e., delete) for that tag.
