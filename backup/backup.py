#!/usr/bin/python3

from napalm import get_network_driver
import json
import csv
import sys

with open('/etc/ansible/backup/inventory.csv', newline='') as csvfile:
     reader = csv.DictReader(csvfile)
     for row in reader:
        driver = get_network_driver(row['OS'])
        device = driver(row['host'], row['username'], row['password'])
        device.open()
        sys.stdout = open(row['host'], "w")
        print(device.get_config()['running'])
        device.close()
