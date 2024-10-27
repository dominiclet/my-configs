#!/bin/bash

selected_session=$(tmux list-sessions | fzf)
session_name=${selected_session%%:*}

tmux switch-client -t $session_name
