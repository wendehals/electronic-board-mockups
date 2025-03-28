include <Arduino.scad>
include <Raspberry_Pi.scad>
include <Breadboards.scad>
include <ESP.scad>

$fn=16;

Arduino(UNO);

translate([65, 0, 0])
   Arduino(MEGA2560);

translate([130, 0, 0])
    Raspberry_Pi_Zero();

translate([0, arduino_mega2560_width + 10, 0])
   Breadboard();

translate([breadboard_depth + 10, arduino_mega2560_width + 10, 0])
   Breadboard(HALF_SIZE);

translate([2*breadboard_depth + 2*10, arduino_mega2560_width + 10, 0])
   Breadboard(MINI);

translate([170, 0, 0])
   ESP32_Dev_Kit();
