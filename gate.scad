include <rule.scad>


/* ## gate ## */

import("gate/upright.stl");

translate([1.5,0,77.55])
import("gate/angle_L.stl");

translate([97.9,0,88.1])
import("gate/traverse_186mm.stl");

translate([203.0,0,77.55])
import("gate/angle_R.stl");

translate([203.7,0,0])
import("gate/upright.stl");





translate([-10.58,-120,0])
rule(x=225.67);

translate([-60,-26.74,0])
rule(y=53.48);

translate([-130,0,0])
rule(z=105.65);

translate([11.43,-80,0])
rule(x=181.66);

translate([-90,0,0])
rule(z=88.1);
