include <Commons.scad>

raspberry_zero_depth = 30;
raspberry_zero_width = 65;

pcb_height = 1.4;

module Raspberry_Pi_Zero() {
   difference(){
      translate([3, 3, 0]) color("green")
         minkowski(){
            cube([raspberry_zero_depth - 6, raspberry_zero_width - 6, pcb_height/2]);
            cylinder(h = pcb_height/2, r = 3, center = false);
   }

   translate([3.5, 3.5, -0.5])
      cylinder(h = 2, d = 2.7);
   translate([raspberry_zero_depth - 3.5, 3.5, -0.5])
      cylinder(h = 2, d = 2.7);
   translate([3.5, raspberry_zero_width - 3.5, -0.5])
      cylinder(h = 2, d = 2.7);
   translate([raspberry_zero_depth - 3.5, raspberry_zero_width - 3.5, -0.5])
      cylinder(h = 2, d = 2.7);
}

   translate([raspberry_zero_depth - 3.5 - pitch, (raspberry_zero_width - 20*pitch)/2, pcb_height])
      pin_header(20, 2);

   translate([-0.5, raspberry_zero_width - 12.4 - 11.2/2, pcb_height])
      hdmi_mini_port();

   translate([-1, raspberry_zero_width - 41.4 - 8/2, pcb_height])
      usb_micro_port();

   translate([-1, raspberry_zero_width - 54 - 8/2, pcb_height])
      usb_micro_port();

   color("silver") translate([6.5, -2.5, pcb_height])
      cube([11.5, 15, 1.5]);

   color("white") translate([(raspberry_zero_depth - 17)/2, raspberry_zero_width - 3, pcb_height])
      cube([17, 4, 1]);
}
