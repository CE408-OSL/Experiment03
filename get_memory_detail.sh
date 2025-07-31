mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free=$(grep MemFree /proc/meminfo | awk '{print $2}')
buffers=$(grep Buffers /proc/meminfo | awk '{print $2}')
cached=$(grep ^Cached /proc/meminfo | awk '{print $2}')

mem_used=$((mem_total - mem_free - buffers - cached))

echo "Total Memory:  ${mem_total} kB"
echo "Used Memory:   ${mem_used} kB"
echo "Free Memory:   ${mem_free} kB"