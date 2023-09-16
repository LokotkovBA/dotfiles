# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bars
echo "---" | tee -a /tmp/polybar1.log
polybar main 2>&1 | tee -a /tmp/main.log & disown
polybar vertical 2>&1 | tee -a /tmp/vertical.log & disown
polybar right 2>&1 | tee -a /tmp/right.log & disown
polybar left 2>&1 | tee -a /tmp/left.log & disown

echo "Bars launched..."
