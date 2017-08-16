#!/usr/bin/python

import RPi.GPIO as GPIO
import time

pin1 = 21
pin2 = 20
pin3 = 16

loop = 5
wait = 0.1

GPIO.setmode(GPIO.BCM)
GPIO.setup(pin1, GPIO.OUT)
GPIO.setup(pin2, GPIO.OUT)
GPIO.setup(pin3, GPIO.OUT)

for i in range(0, loop):
    GPIO.output(pin1, GPIO.HIGH)
    time.sleep(wait)
    GPIO.output(pin2, GPIO.HIGH)
    time.sleep(wait)
    GPIO.output(pin3, GPIO.HIGH)
    time.sleep(wait)
    GPIO.output(pin1, GPIO.LOW)
    time.sleep(wait)
    GPIO.output(pin2, GPIO.LOW)
    time.sleep(wait)
    GPIO.output(pin3, GPIO.LOW)
    time.sleep(wait)

GPIO.cleanup()

