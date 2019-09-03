#!/bin/bash

cd /home/jovyan/work
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=anonymous
export GIT_COMMITTER_EMAIL=anon@localhost

# Grab notebooks repository
NOTEBOOK_DIR='/home/jovyan/work/notebooks'
if [ -d "$NOTEBOOK_DIR" ]; then
    # Change directories and pull
    cd "$NOTEBOOK_DIR"
    git pull origin master
else
    # Clone the notebooks directory
    git clone https://github.com/geo-python/notebooks.git
fi

# Create exercises directory if it doesn't exist
EXERCISE_DIR='/home/jovyan/work/exercises'
if [ ! -d "$EXERCISE_DIR" ]; then
    mkdir $EXERCISE_DIR
fi

# Go to containing folder
cd "$NOTEBOOK_DIR"/notebooks
