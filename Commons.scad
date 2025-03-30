pitch = 2.54;
pcb_height = 1.7;

delta = 0.25;

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

module usb_double_a_port() {
   color("silver")
      cube([13, 16, 15]);

   color("silver") translate([-1, -1, 0])
      cube([15, 1, 17]);
}

module usb_micro_port() {
   color("silver")
      cube([8, 5.5, 3]);
}

module usb_b_port() {
   color("silver")
      cube([12, 16, 10.5]);
}

module hdmi_port() {
   color("silver")
      cube([15, 11, 6]);
}

module hdmi_mini_port() {
   color("silver")
      cube([7.5, 11.2, 3.2]);
}

module hdmi_micro_port() {
   color("silver")
      cube([6.5, 7.5, 3.4]);
}

module rj45_port() {
   color("silver")
      cube([16, 21, 13.5]);
}

module power_jack() {
   color("black")
      cube([8.9, 13.7, 11]);
}

module audio_jack() {
   color("black")
      cube([7, 12, 5.5]);

   color("black") translate([3.5, 0, 5.5/2]) rotate([90, 0, 0])
      cylinder(h = 3, d= 5.5, $fn=32);
}

module micro_sd_card_slot_with_card() {
   color("silver")
      cube([11.5, 11, 1.5]);

   color("blue") translate([0, 11, 0])
      cube([11.5, 4, 1.5]);
}
