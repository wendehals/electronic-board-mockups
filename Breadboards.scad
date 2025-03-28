include <Commons.scad>

FULL_SIZE = 0;
HALF_SIZE = 1;
MINI = 2;

breadboard_depth = 55;
breadboard_width = 166;
breadboard_height = 10;

half_size_breadboard_width = 82;

mini_breadboard_depth = 35;
mini_breadboard_width = 47;

module Breadboard(size = FULL_SIZE) {
   if (size == FULL_SIZE) {
      full_size_breadboard();
   } else if (size == HALF_SIZE) {
      half_size_breadboard();
   } else {
      mini_breadboard();
   }
}

module full_size_breadboard() {
   difference() {
      color("white")
         cube([breadboard_depth, breadboard_width, breadboard_height]);

      color("white") translate([(breadboard_depth - pitch)/2, -delta, 8])
         cube([pitch, breadboard_width + 2*delta, 2 + delta]);

      translate([(breadboard_depth - 12*pitch)/2, (breadboard_width - 65*pitch)/2, 0])
         pin_holes();

      translate([(breadboard_depth - 12*pitch)/2 + 7*pitch, (breadboard_width - 65*pitch)/2, 0])
         pin_holes();

      translate([1.96, (breadboard_width - 59*pitch)/2, 0])
         for(i = [0 : 1 : 9]) {
            translate([0, i*6*pitch, 0])
               pin_holes(2, 5);
         }

      translate([breadboard_depth - 2*pitch - 1.96, (breadboard_width - 59*pitch)/2, 0])
         for(i = [0 : 1 : 9]) {
            translate([0, i*6*pitch, 0])
               pin_holes(2, 5);
         }
   }

   color("white") translate([breadboard_depth, 12.5, 1])
      cube([2, 4.5, 5]);

   color("white") translate([breadboard_depth, (breadboard_width - 4.5)/2, 1])
      cube([2, 4.5, 5]);

   color("white") translate([breadboard_depth, breadboard_width - 17, 1])
      cube([2, 4.5, 5]);
}

module half_size_breadboard() {
   difference() {
      color("white")
         cube([breadboard_depth, half_size_breadboard_width, breadboard_height]);

      color("white") translate([(breadboard_depth - pitch)/2, -delta, 8])
         cube([pitch, half_size_breadboard_width + 2*delta, 2 + delta]);

      translate([(breadboard_depth - 12*pitch)/2, (half_size_breadboard_width - 30*pitch)/2, 0])
         pin_holes(5, 30);

      translate([(breadboard_depth - 12*pitch)/2 + 7*pitch, (half_size_breadboard_width - 30*pitch)/2, 0])
         pin_holes(5, 30);

      translate([1.96, (half_size_breadboard_width - 29*pitch)/2, 0])
         for(i = [0 : 1 : 4]) {
            translate([0, i*6*pitch, 0])
               pin_holes(2, 5);
         }

      translate([breadboard_depth - 2*pitch - 1.96, (half_size_breadboard_width - 29*pitch)/2, 0])
         for(i = [0 : 1 : 4]) {
            translate([0, i*6*pitch, 0])
               pin_holes(2, 5);
         }
   }

   color("white") translate([breadboard_depth, 12, 1])
      cube([2, 4, 5]);

   color("white") translate([breadboard_depth, half_size_breadboard_width - 16, 1])
      cube([2, 4, 5]);

   color("white") translate([2.5, half_size_breadboard_width, 1])
      cube([4, 2, 5]);

   color("white") translate([(breadboard_depth - 4)/2, half_size_breadboard_width, 1])
      cube([4, 2, 5]);

   color("white") translate([breadboard_depth - 6.5, half_size_breadboard_width, 1])
      cube([4, 2, 5]);
}

module mini_breadboard() {
   difference() {
      color("white")
         cube([mini_breadboard_depth, mini_breadboard_width, breadboard_height]);

      color("white") translate([(mini_breadboard_depth - pitch)/2, (mini_breadboard_width - 32)/2, 8])
         cube([pitch, 32, 2 + delta]);

      translate([(mini_breadboard_depth - 12*pitch)/2, (mini_breadboard_width - 17*pitch)/2, 0])
         pin_holes(5, 17);

      translate([(mini_breadboard_depth - 12*pitch)/2 + 7*pitch, (mini_breadboard_width - 17*pitch)/2, 0])
         pin_holes(5, 17);
   }

   color("white") translate([-2, (mini_breadboard_width - 4.5)/2, 1])
      cube([2, 4.5, 5]);

   color("white") translate([(mini_breadboard_depth - 4.5)/2, mini_breadboard_width, 1])
      cube([4.5, 2, 5]);
}

module pin_holes(rows = 5, columns = 65) {
   for(r = [0 : 1 : rows - 1]) {
      for (c = [0 : 1 : columns - 1]) {
         color("white") translate([r*pitch + 0.77, c*pitch + 0.77, 4.5])
            cube([1, 1, 6]);
      }
   }
}
