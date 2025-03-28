pitch = 2.54;
pcb_height = 1.7;

delta = 0.5;

FEMALE = 0;
MALE = 1;

module pin_header(pins = 1, rows = 1, type = MALE) {
   for (i = [0 : 1 : rows - 1]) {
      for (j = [0 : 1 : pins - 1]) {
         translate([i * pitch, j * pitch, 0])
            if (type == FEMALE) 
               pin_female();
            else
               pin_male();
      }
   }
}

module pin_female() {
   difference() {
      color("black")
         cube([pitch, pitch, 8]);

      translate([(pitch - 0.65)/2, (pitch - 0.65)/2, 1])
         cube([0.65, 0.65, 7.5]);
   }

   color("gold") translate([(pitch - 0.65)/2, (pitch - 0.65)/2, -3])
      cube([0.64, 0.64, 4]);
}

module pin_male(){
    color("black")
        cube([pitch, pitch, pitch]);

    color("gold") translate([(pitch - 0.65)/2, (pitch - 0.65)/2, -3])
        cube([0.64, 0.64, 11]); 
}

module usb_3_0_port() {
   color("silver") translate([1, 7.5, 1]) rotate([90, 0, 0])
      minkowski() {
         cube([7, 1, 1]);
         cylinder(h = 6.5, d = 2, $fn=32);
      }
}

module usb_micro_port() {
   color("silver")
      cube([5.5, 8, 3]);
}

module usb_b_port() {
   color("silver")
      cube([12, 16, 10.5]);
}

module hdmi_mini_port() {
   color("silver")
      cube([7.5, 11.2, 3.2]);
}

module power_jack() {
   color("black")
      cube([8.9, 13.7, 11]);
}
