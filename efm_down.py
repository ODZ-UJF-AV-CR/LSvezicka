#!/usr/bin/python3
import time
import serial
import logging
from logging.handlers import TimedRotatingFileHandler

time.sleep(30)

port = '/dev/ttyUSB1'

baud = 9600

ser = serial.Serial(port, baud, timeout=10)

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

logname = "/home/ubuntu/data/vezicka/efm_down/efm_down.csv"
handler = TimedRotatingFileHandler(logname, when='h', interval=1, utc=True)
#handler.setLevel(logging.INFO)
#handler.suffix = "%Y%m%d%H%M"
logger.addHandler(handler)

print(port, logname)

while True:
	try:
		reading = ser.readline()
		if (len(reading) > 0):
			data = str(round(time.time(),2)) + ',' + str(reading,'utf-8')
			print(data)
			logger.info(data)
	except:
		time.sleep(1)
		continue


