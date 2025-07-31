if [ $# -ne 1 ]; then
    echo "Usage: $0 <PID>"
    exit 1
fi

pid="$1"
proc_dir="/proc/$pid"

if [ ! -d "$proc_dir" ]; then
    echo "Process with PID $pid does not exist."
    exit 1
fi

echo "Process Name:"
cat "$proc_dir/comm" 2>/dev/null

echo "Executable Path:"
readlink "$proc_dir/exe" 2>/dev/null

echo "Memory Usage:"
if [ -r "$proc_dir/statm" ]; then
    rss_pages=$(awk '{print $2}' "$proc_dir/statm")
    page_size=$(getconf PAGESIZE)
    memory_bytes=$((rss_pages * page_size))
    echo "$memory_bytes"
else
    echo "Unavailable"
fi

echo "Command Line Arguments:"
tr '\0' ' ' < "$proc_dir/cmdline" 2>/dev/null
echo

echo "Environment Variables:"
tr '\0' '\n' < "$proc_dir/environ" 2>/dev/null