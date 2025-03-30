include <Commons.scad>

raspberry_depth = 56;
raspberry_width = 85;

raspberry_zero_depth = 30;
raspberry_zero_width = 65;

module Raspberry_Pi_3_ModelB() {
	raspberry_pi_modelb_commons();

   translate([raspberry_depth - 9.64 - pitch, raspberry_width - 61.5 - pitch, pcb_height])
      pin_header(2, 2);

   translate([-1 + 5.5, raspberry_width - 10.6 - 8/2, pcb_height]) rotate([0, 0, 90])
      usb_micro_port();

   translate([-1 + 11, raspberry_width - 32 - 15/2, pcb_height]) rotate([0, 0, 90])
      hdmi_port();

   translate([0, raspberry_width - 53.3 + 7/2, pcb_height]) rotate([0, 0, 270])
      audio_jack();

   translate([10.25 - 16/2, -2, pcb_height])
      rj45_port();

   translate([47 - 13/2, -1, pcb_height])
      usb_double_a_port();

   translate([29 - 13/2, -1, pcb_height])
      usb_double_a_port();
}

module Raspberry_Pi_4_ModelB() {
	raspberry_pi_modelb_commons();

   translate([raspberry_depth - 9.64 - pitch, raspberry_width - 61.5 - pitch, pcb_height])
      pin_header(2, 2);

   translate([-1 + 7, raspberry_width - 11.2 - 7/2, pcb_height]) rotate([0, 0, 90])
      usb_3_0_port();

   translate([-1, raspberry_width - 25.8 - 6.5/2, pcb_height])
      hdmi_micro_port();

   translate([-1, raspberry_width - 39.2 -6.5/2, pcb_height])
      hdmi_micro_port();

   translate([0, raspberry_width - 53.3 + 7/2, pcb_height]) rotate([0, 0, 270])
      audio_jack();

   translate([9 - 13/2, -1, pcb_height])
      usb_double_a_port();

   translate([27 - 13/2, -1, pcb_height])
      usb_double_a_port();

   translate([45.75 - 16/2, -2, pcb_height])
      rj45_port();
}

module Raspberry_Pi_5_ModelB() {
	raspberry_pi_modelb_commons();

   translate([9.5 - pitch, raspberry_width - 61.5 - pitch, pcb_height])
      pin_header(2, 2);

   translate([-1 + 7, raspberry_width - 11.2 - 7/2, pcb_height]) rotate([0, 0, 90])
      usb_3_0_port();

   translate([-1, raspberry_width - 25.8 - 6.5/2, pcb_height])
      hdmi_micro_port();

   translate([-1, raspberry_width - 39.2 -6.5/2, pcb_height])
      hdmi_micro_port();

   translate([10.2 - 16/2, -2, pcb_height])
      rj45_port();

   translate([47 - 13/2, -1, pcb_height])
      usb_double_a_port();

   translate([29.1 - 13/2, -1, pcb_height])
      usb_double_a_port();
}

module Raspberry_Pi_Zero() {
   difference(){
      translate([3, 3, 0]) color("green")
         minkowski(){
            cube([raspberry_zero_depth - 6, raspberry_zero_width - 6, pcb_height/2]);
            cylinder(h = pcb_height/2, r = 3, center = false);
         }

      translate([3.5, 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([raspberry_zero_depth - 3.5, 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([3.5, raspberry_zero_width - 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([raspberry_zero_depth - 3.5, raspberry_zero_width - 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
   }

   translate([raspberry_zero_depth - 3.5 - pitch, (raspberry_zero_width - 20*pitch)/2, pcb_height])
      pin_header(20, 2);

   translate([-0.5, raspberry_zero_width - 12.4 - 11.2/2, pcb_height])
      hdmi_mini_port();

   translate([-1 + 5.5, raspberry_zero_width - 41.4 - 8/2, pcb_height]) rotate([0, 0, 90])
      usb_micro_port();

   translate([-1 + 5.5, raspberry_zero_width - 54 - 8/2, pcb_height]) rotate([0, 0, 90])
      usb_micro_port();

   translate([raspberry_zero_depth - 19, raspberry_zero_width - 12.5, pcb_height])
      micro_sd_card_slot_with_card();

   color("white") translate([(raspberry_zero_depth - 17)/2, -1, pcb_height])
      cube([17, 4, 1]);
}

module raspberry_pi_modelb_commons() {
   difference(){
      translate([3, 3, 0]) color("green")
         minkowski(){
            cube([raspberry_depth - 6, raspberry_width - 6, pcb_height/2]);
            cylinder(h = pcb_height/2, r = 3, center = false);
         }

      translate([3.5, 23.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([raspberry_depth - 3.5, 23.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([3.5, raspberry_width - 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
      translate([raspberry_depth - 3.5, raspberry_width - 3.5, -delta])
         cylinder(h = pcb_height + 2*delta, d = 2.7, $fn=32);
   }

   translate([raspberry_depth - 3.5 - pitch, 23.5 + (58 - 20*pitch)/2, pcb_height])
      pin_header(20, 2);

   translate([(raspberry_depth - 11.5)/2, raspberry_width - 12.5, -1.5])
      micro_sd_card_slot_with_card();
}
