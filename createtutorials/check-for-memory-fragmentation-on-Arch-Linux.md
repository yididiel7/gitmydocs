Here are the key commands to check for memory fragmentation on Linux:

Primary Commands

1. /proc/buddyinfo - Most Direct Method

cat /proc/buddyinfo

Shows free memory blocks by order (power of 2). High counts in small
orders + low counts in large orders = fragmentation.

2. vmstat - Memory Pressure Indicators

vmstat -m

Look for high numa_hit/numa_miss ratios and pgmajfault (major page
faults).

3. slabtop - Kernel Memory Allocation

slabtop

Shows kernel object cache usage; high fragmentation appears as many
small objects.

Comprehensive Commands

4. procinfo or procps Tools

# Memory statistics including fragmentation

cat /proc/meminfo | grep -E
"(MemTotal|MemFree|Committed_AS|AnonPages|Slab)"

# Huge pages (related to fragmentation)

cat /proc/sys/vm/nr_hugepages

cat /proc/meminfo | grep Huge

5. numactl - NUMA-Aware Analysis

# NUMA memory distribution

numactl --hardware


numactl --show

6. perf - Advanced Memory Analysis
# Memory fragmentation events

perf stat -e kmem:mm_page_alloc,kmem:mm_page_free sleep 5

Quick Fragmentation Check Script

#!/bin/bash
echo "=== Memory Fragmentation Check ==="
echo "Buddy Info:"
cat /proc/buddyinfo
echo -e "\nKey MemInfo:"
cat /proc/meminfo | grep -E "(MemFree|AnonPages|Slab|Huge)"
echo -e "\nVMStat:"
vmstat -s | grep -E "(memory|page)"


Interpretation Tips:

- Healthy: Good distribution across block orders in buddyinfo

- Fragmented: Many small blocks, few large blocks, high major page
faults

- Slab fragmentation: High slab usage with many objects in
/proc/slabinfo

The cat /proc/buddyinfo command is your primary tool for direct
fragmentation analysis.
