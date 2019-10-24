#!/bin/bash

cd /home/jovyan/work
# git reflog requires a name and email if user is not in passwd
# even if you're only cloning
export GIT_COMMITTER_NAME=anonymous
export GIT_COMMITTER_EMAIL=anon@localhost

# set directory names: 
AUTOGIS_DIR="/home/jovyan/work/autogis"
GEOPYTHON_DIR="/home/jovyan/work/geopython"
EXERCISES_DIR="/home/jovyan/work/exercises"
NOTEBOOKS_DIR="/home/jovyan/work/notebooks"

# Check for existince of geopython directory, make if missing
if [ ! -d "$GEOPYTHON_DIR" ]; then
    mkdir $GEOPYTHON_DIR
fi

# Check for existince of exercises directory in root, move if exists
if [ -d "$EXERCISES_DIR" ]; then
    mv $EXERCISES_DIR $GEOPYTHON_DIR
fi

# Check for existince of notebooks directory in root, move if exists
if [ -d "$NOTEBOOKS_DIR" ]; then
    mv $NOTEBOOKS_DIR $GEOPYTHON_DIR
fi


# Check for existince of autogis directory, make if missing
if [ ! -d "$AUTOGIS_DIR" ]; then
    mkdir $AUTOGIS_DIR
fi
cd $AUTOGIS_DIR

# Create exercises directory if it doesn't exist
EXERCISE_DIR="$AUTOGIS_DIR/exercises"
if [ ! -d "$EXERCISE_DIR" ]; then
    mkdir $EXERCISE_DIR
fi

# Grab notebooks repository
NOTEBOOK_DIR="$AUTOGIS_DIR/notebooks"
if [ -d "$NOTEBOOK_DIR" ]; then
    # Change directories and pull
    cd "$NOTEBOOK_DIR"
    git pull origin master
else
    # Clone the notebooks directory
    git clone https://github.com/Automating-GIS-processes/notebooks2019.git
    
    # Rename the folder as notebooks
    mv notebooks2019 notebooks
fi

cd /home/jovyan/work



