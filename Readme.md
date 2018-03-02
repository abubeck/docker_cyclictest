# Run cyclictests in the container

    docker run -it --privileged iotexperiments.azurecr.io/emx/cyclictest /root/cyclictest -l50000 -m -Sp90 -i200 -h0 -q

With the "-p" option you can modify the process priority.

# Create load in parallel

    docker run -it --privileged iotexperiments.azurecr.io/emx/cyclictest /root/load.sh

# Analyse data

The following analysis was done on an raspberry pi zero w. The cycletest was running within a docker container and without (direct) with the following cycletest settings:

    cyclictest -l50000 -m -Sp99 -i200 -h0 -q (Prio 99)
    cyclictest -l50000 -m -Sp20 -i200 -h0 -q (Prio 20)

The load task is running in parallel. 
Data was gathered over 1min runtime.

The results:

|         | Priority           | Avg. latencies (ms)  | Max. latencies (ms) |
| ------------- | ------------- | ----- | ------ |
| Docker        | 99 | 49 | 139 |
| Docker        | 20 | 47 | 909 |
| Direct        | 99 | 49 | 158 |
| Direct        | 20 | 48 | 1013 |

