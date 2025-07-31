model_name=$(grep -m1 "model name" /proc/cpuinfo)
cpu_cores=$(grep -m1 "cpu cores" /proc/cpuinfo)
cpu_mhz=$(grep -m1 "cpu MHz" /proc/cpuinfo)
cache_size=$(grep -m1 "cache size" /proc/cpuinfo)

echo "$model_name"
echo "$cpu_cores"
echo "$cpu_mhz"
echo "$cache_size"