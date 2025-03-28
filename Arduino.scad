include <Commons.scad>

arduino_depth = 53.34;
arduino_uno_width = 68.58;
arduino_mega2560_width = 101.6;

pcb_height = 1.7;

arduino_uno_shape = [ 
   [0.0, 0.0],
   [0.0, 66.04],
   [12.95, 66.04],
   [15.5, arduino_uno_width],
   [48.26, arduino_uno_width],
   [arduino_depth - pitch, 66.04],
   [arduino_depth, 66.04],
   [arduino_depth, 0.0]
];

arduino_uno_mounts = [
   [pitch, 15.24],
   [17.78, 66.04],
   [45.72, 66.04],
   [arduino_depth - pitch, 13.97]
];

arduino_mega2560_shape = [ 
   [0.0, 0.0],
   [0.0, 99.04],
   [12.95, 99.04],
   [15.5, arduino_mega2560_width],
   [48.26, arduino_mega2560_width],
   [arduino_depth - pitch, 99.04],
   [arduino_depth, 99.04],
   [arduino_depth, 0.0]
];

arduino_mega2560_mounts = [
   [pitch, 15.24],
   [17.78, 66.04],
   [45.72, 66.04],
   [arduino_depth - pitch, 13.97],
   [pitch, 90.17],
   [arduino_depth - pitch, 96.52]
];

UNO = [arduino_uno_shape, arduino_uno_mounts];
MEGA2560 = [arduino_mega2560_shape, arduino_mega2560_mounts];


module Arduino(type = UNO) {
   difference() {
      color("green")
         pcb(type[0]);

         pcb_holes(type[1]);
   }

   translate([9.53, -6.35, pcb_height])
      usb_b_port();

   translate([41.28, -4.5, pcb_height])
      power_jack();

   translate([pitch/2, 17.53, pcb_height])
      pin_header(10, 1, FEMALE);

   translate([pitch/2, 44.45, pcb_height])
      pin_header(8, 1, FEMALE);

   translate([arduino_depth - 1.5*pitch, 26.67, pcb_height])
      pin_header(8, 1, FEMALE);

   if (type == UNO) {
      translate([arduino_depth - 1.5*pitch, 49.53, pcb_height])
         pin_header(6, 1, FEMALE);
   }
   else if (type == MEGA2560) {
      translate([arduino_depth - 1.5*pitch, 49.53, pcb_height])
         pin_header(8, 1, FEMALE);

      translate([pitch/2, 67.31, pcb_height])
         pin_header(8, 1, FEMALE);

      translate([arduino_depth - 1.5*pitch, 72.39, pcb_height])
         pin_header(8, 1, FEMALE);

      translate([18.5*pitch, 92.71, pcb_height]) rotate([0, 0, 90])
         pin_header(18, 2, FEMALE);
   }

   translate([22.86 + 2.5*pitch, arduino_uno_width - 2.5*pitch, pcb_height]) rotate([0, 0, 90])
      pin_header(3, 2);
}

module pcb(shape, height = pcb_height) {
   linear_extrude(height)
      polygon(shape);
}

module pcb_holes(mounts, height = pcb_height) {
   for(i = mounts) {
      translate([i[0], i[1], -delta])
         cylinder(h = height + 2*delta, r = 3.2/2, $fn=32);
   }
}
