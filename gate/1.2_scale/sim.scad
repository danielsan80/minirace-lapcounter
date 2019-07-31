include <../../modules/rule.scad>

upright_width=28.334;
upright_length=68.9;
$fn=100;
hole_r = 4;

/** BINARIES **/

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

module binaries(void=false) {
    translate([22.60, 0, 163.24])
    union() {
        translate([0, 7.6, 0])
        binary(void);

        translate([0, -9.6, 0])
        binary(void);
    }
}

/** TRAVERSE CLIPS **/

module traverse_clip(void=false) {
    length = 14;
    /* r = 1.25; */
    r = 1;
    function p() = void?0.4:0;
    function pd() = void?0.7:0;

    rotate([0,90,0])
    translate([0,0,-length/2])
    cylinder(r=r+p(), h=length+pd()*2);
}

module traverse_clips(void=false) {

    color("green")
    translate([5.52099,0,0])
    union() {
        translate([0,-8.63,2.28])
        traverse_clip(void);

        translate([0,+8.55,2.28])
        traverse_clip(void);

        translate([0,-8.63,18.75])
        traverse_clip(void);

        translate([0,+8.55,18.75])
        traverse_clip(void);

    }
}


/** UPRIGHT LEFT **/

/* import("stl/1.2.0/upright_1.2.0_scaled.stl");

union() {
    translate([0,0,-1])
    color("red")
    cylinder(r=hole_r, h=15);

    translate([0,upright_length/4,-1])
    color("red")
    cylinder(r=hole_r, h=15);

    translate([0,-upright_length/4,-1])
    color("red")
    cylinder(r=hole_r, h=15);
} */

import("stl/1.2.1/upright_1.2.1_holes.stl");

/** ANGLE LEFT **/


/* translate([1.4,0.2,149.75])
import("stl/1.2.0/angle_L_1.2.0_scaled.stl");

binaries();
*/


/* translate([1.4,0.2,149.75])
import("stl/1.2.1/angle_L_1.2.1_with-bin.stl");

translate([5,0,148.75])
color("red")
cylinder(r=hole_r, h=6); */

translate([1.4,0.2,149.75])
import("stl/1.2.2/angle_L_1.2.2_with-hole.stl");



/** TRAVERSE **/

translate([0,0,30])
union() {

    /* translate([175.6,0.05,149.75+13.6])
    import("stl/1.2.0/traverse_1.2.0_scaled.stl");

    color("blue")
    binaries(true);

    color("blue")
    translate([362.2,0,0])
    mirror([1,0,0])
    binaries(true); */

    /* translate([175.6,0.05,149.75+13.6])
    import("stl/1.2.1/traverse_1.2.1_with-bin-L.stl"); */

    /* translate([175.6,0.05,149.75+13.6])
    import("stl/1.2.2/traverse_1.2.2_with-bin-LR.stl"); */

    /* translate([175.6,0.05,149.75+13.6])
    union() {
        translate([0,0,30])
        import("stl/1.2.3/traverse_L_1.2.3_split.stl");
        import("stl/1.2.3/traverse_R_1.2.3_split.stl");
    } */

    translate([175.6,0.05,149.75+13.6])
    union() {
        translate([0,0,30])
        import("stl/1.2.4/traverse_L_1.2.4_clip.stl");
        import("stl/1.2.4/traverse_R_1.2.4_clip.stl");
        traverse_clips();
    }
}


/** ANGLE RIGHT **/

/* translate([360.8,0.2-0.33,149.75])
import("stl/1.2.0/angle_R_1.2.0_scaled.stl");

translate([362.2,0,0])
mirror([1,0,0])
binaries(false); */

/* translate([360.8,0.2-0.33,149.75])
import("stl/1.2.1/angle_R_1.2.1_with-bin.stl");

translate([362.15-5,0,148.75])
color("red")
cylinder(r=hole_r, h=6); */

translate([360.8,0.2-0.33,149.75])
import("stl/1.2.2/angle_R_1.2.2_with-hole.stl");



/** UPRIGHT LEFT **/

/* translate([362.15,0,0])
import("stl/1.2.0/upright_1.2.0_scaled.stl"); */

translate([362.15,0,0])
import("stl/1.2.1/upright_1.2.1_holes.stl");





/** TRAVERSE SPLIT **/
/* import("stl/1.2.2/traverse_1.2.2_with-bin-LR.stl"); */

/** part left **/
/* translate([5.52099,-20,-10])
cube([160,40,40]); */

/** part right **/
/* translate([5.52099-160,-20,-10])
cube([160,40,40]); */

/* echo(upright_length/4); */


/** TRAVERSE CLIP **/

/* translate([-20,0,0])
union() {
    import("stl/1.2.3/traverse_L_1.2.3_split.stl");

}

translate([20,0,0])
union() {
    import("stl/1.2.3/traverse_R_1.2.3_split.stl");
    color("red")
    traverse_clips(true);

} */
