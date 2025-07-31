echo -e "PID\tCOMMAND"
echo "-------------------------"

for pid in /proc/[0-9]*; do
    pid_num=$(basename "$pid")
    if [[ -r "$pid/comm" ]]; then
        cmd=$(cat "$pid/comm")
        echo -e "$pid_num\t$cmd"
    fi
done