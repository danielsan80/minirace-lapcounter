include <../../modules/rule.scad>

upright_width=28.334;
upright_length=68.9;
$fn=100;
hole_r = 4;



module binary(void=false) {
    width= 2;
    height =2;
    foot_length = 7;
    leg_length = 20;
    function p() = void?0.4:0;
    function pd() = void?0.7:0;
    color("red")
    union() {
        translate([0,-p(),0])
        cube([width+pd(),width+p()*2,leg_length+pd()]);

        translate([0,-p(),0])
        cube([foot_length+pd(),width+p()*2,width+pd()]);
    }
}

/* ## gate_scaled ## */

module binaries(void=false) {
    translate([22.60, 0, 163.24])
    union() {
        translate([0, 7.6, 0])
        binary(void);

        translate([0, -9.6, 0])
        binary(void);
    }
}


import("upright_1.2.1.stl");

/** ANGLE L **/
translate([1.4,0.2,149.75])
import("angle_L_1.2.stl");

binaries();

translate([5,0,148.75])
color("red")
cylinder(r=hole_r, h=6);


/** TRAVERSE **/

translate([0,0,30])
union() {
    translate([175.6,0.05,149.75+13.6])
    import("traverse_1.2.stl");

    color("blue")
    binaries(true);

    color("blue")

    translate([362.2,0,0])
    mirror([1,0,0])
    binaries(true);

}


/** ANGLE R **/

translate([360.8,0.2-0.33,149.75])
import("angle_R_1.2.stl");

translate([362.2,0,0])
mirror([1,0,0])
binaries(false);

translate([362.15-5,0,148.75])
color("red")
cylinder(r=hole_r, h=6);

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
