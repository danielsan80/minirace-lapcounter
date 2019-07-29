include <../../modules/rule.scad>

upright_width=28.334;
upright_length=68.9;
$fn=100;
hole_r = 4;

/* ## gate_scaled ## */


import("upright_1.2.1.stl");

translate([1.4,0.2,149.75])
import("angle_L_1.2.stl");

translate([175.6,0,149.75+13.6])
import("traverse_1.2.stl");

translate([360.8,0.2,149.75])
import("angle_R_1.2.stl");

translate([362.15,0,0])
import("upright_1.2.1.stl");


translate([0,0,-1])
color("red")
cylinder(r=hole_r, h=15);

translate([0,upright_length/4,-1])
color("red")
cylinder(r=hole_r, h=15);

translate([0,-upright_length/4,-1])
color("red")
cylinder(r=hole_r, h=15);


echo(upright_length/4);
