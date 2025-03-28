include <Commons.scad>

esp32_dev_kit_depth = 28.5;
esp32_dev_kit_width = 51.5;

module ESP32_Dev_Kit() {
   color("green")
      cube([esp32_dev_kit_depth, esp32_dev_kit_width, pcb_height]);
   
   translate([(esp32_dev_kit_depth - 10*pitch)/2 + pitch/2, 8.5, 0])
      union() {
         rotate([0, 180, 0])
            pin_header(15, 1);
         
         translate([10*pitch, 0, 0]) rotate([0, 180, 0])
            pin_header(15, 1);
      }

   translate([(esp32_dev_kit_depth - 9)/2, -1, pcb_height])
      usb_3_0_port();

   color("silver") translate([(esp32_dev_kit_depth - 16)/2, 27, pcb_height])
      cube([16, 17.5, 3]);
}