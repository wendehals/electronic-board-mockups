include <Arduino.scad>
include <Raspberry_Pi.scad>

$fn=32;

Arduino(UNO);

translate([65, 0, 0])
   Arduino(MEGA2560);

translate([130, 0, 0])
    Raspberry_Pi_Zero();