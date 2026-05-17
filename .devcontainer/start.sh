#!/bin/bash
tmux kill-session -t ali2020 2>/dev/null || true
tmux new-session -d -s ali2020
tmux send-keys -t ali2020 "sudo /usr/local/bin/xray run -c /etc/xray/config.json &>/tmp/xray.log" Enter
sleep 2
show-link.sh
tmux new-window -t ali2020 -n keepalive
tmux send-keys -t ali2020:keepalive "while true; do curl -s --max-time 5 https://github.com/ -o /dev/null; sleep 180; done" Enter
echo "[ali2020] Xray is running in background (tmux session: ali2020)"
echo "[ali2020] View logs: tmux attach -t ali2020"
