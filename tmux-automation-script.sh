#!/usr/bin/env bash

MAIN_WINDOW_NAME="Code"
PROJECT_ROOT=$(pwd)
PROJECT_DEFAULT_CMD="nvim"

setup_builders() {
        tmux new-window -n "Builders"
        tmux send-keys "cd $PROJECT_ROOT" C-m
        tmux send-keys "npm run serve" C-m
        tmux split-window -v -p 67
        tmux send-keys "cd $PROJECT_ROOT" C-m
        tmux send-keys "npm run watch-js" C-m
        tmux split-window -v -p 50
        tmux send-keys "cd $PROJECT_ROOT" C-m
        tmux send-keys "npm run watch-sass" C-m
}

main() {
        tmux new-window -n "$MAIN_WINDOW_NAME"
        tmux send-keys "cd $PROJECT_ROOT" C-m
        if [[ "$PROJECT_DEFAULT_CMD" != "" ]]; then
                tmux send-keys "$PROJECT_DEFAULT_CMD" C-m
        fi
        setup_builders
	tmux previous-window
}

main

