#!/usr/bin/python3

import subprocess
import time
from io import StringIO
import pandas as pd

#https://docs.python.org/3/library/subprocess.html#subprocess.run
network_status =subprocess.run(["ifconfig", "docker0"], capture_output=True, text=True)

try:
    while True:
        devices_status =subprocess.run(["lsusb"], capture_output=True,text=True)
        network_status =subprocess.run(["ifconfig", "docker0"], capture_output=True, text=True)
        
        #Replace HyperX with whatever device you want to check for an activate connection for
        if 'docker' in network_status.stdout and 'HyperX' in devices_status.stdout:
            print('Connections still active...')
            time.sleep(5)
        else:
            raise Exception("Error, connection is no longer active. Exiting while loop...")

except Exception as error:
    print(error)
