include <../../modules/rule.scad>

upright_shift = 0.41225;

/*
## upright_ext1 ##

translate([0,0,38.676])
intersection(){
    import("gate/upright.stl");
    translate([-50,-50,37.588])
    cube([100,100,50]);
}

*/


/* ## traverse_ext1 ## */

/* intersection(){
    import("gate/traverse_186mm.stl");
    translate([34.7,-50,-50])
        cube([100,100,100]);
}

%translate([0,0,0])
intersection(){
    import("gate/traverse_186mm.stl");
    translate([-127.52,-50,-50])
        cube([100,100,100]);
}

import("gate/traverse_186mm.stl");
%translate([-38.7759,0,0])
import("gate/mods/traverse_ext1_L.stl");

import("gate/traverse_186mm.stl");
%translate([38.6758,0,0])
import("gate/mods/traverse_ext1_R.stl");
 */



/* ## gate_ext ## */


translate([-38.82,0,0])
import("upright_1.1.1.stl");

translate([1.5-38.82-upright_shift,0,77.55+38.676])
import("../1.0_original/angle_L.stl");

translate([97.9-upright_shift,0,88.1+38.676])
import("traverse_1.1.1.stl");

translate([203.0+38.75-upright_shift,0,77.55+38.676])
import("../1.0_original/angle_R.stl");

translate([203.7+38.75,0,0])
import("upright_1.1.1.stl");







translate([-10.58-38.82,-120,0])
rule(x=225.67+38.82+38.75);

translate([-90,-26.74,0])
rule(y=53.48);

translate([-200,0,0])
rule(z=105.65+38.676);

translate([11.43-38.82,-80,0])
rule(x=181.66+38.82+38.75);

translate([-140,0,0])
rule(z=88.1+38.676);
