include <../modules/rule.scad>

thick = 3;
side = 15;
space_x = 3;
space_y = 2;
r=6;
$fn = 100;

led_d = 5.4;
led_r = led_d/2;

bar_thick = 2;


startlights_length = side*5+space_x*4;
startlights_height = side*2+space_y;

gate_hook_width = 17;
gate_hook_thick = 1.5;
gate_hook_space = 3;

gate_hook_x2_width = 54.4;


module bar_x() {
    cube([side*5,bar_thick,bar_thick]);
}

module bar_y() {
    cube([side,space_y,bar_thick]);
}

module cowl() {

    /* %import("cowl4.stl"); */
    translate([side/2,side/2,4])
    union() {
        difference() {
            cylinder(h = 6, r1 = 6, r2 = 5.5);
            translate([0,0,-0.1])
            cylinder(h = 6.5, r1 = 5, r2 = 5);
            hull() {
                translate([0,-6.5,6])
                cube([15,15,0.1], center=true);

                translate([0,-8.5,0])
                cube([15,15,0.1], center=true);
            }
            hull() {
                translate([0,6,8.5])
                cube([15,0.1,5], center=true);

                translate([0,0,7.5])
                cube([15,0.1,5], center=true);
            }




        }

    }
}

module led() {
    inner_d = 4.85;
    outer_d = led_d;
    height = 8.45;

    color("red")
    union() {
        translate([0,0,height-inner_d/2])
        sphere(r=inner_d/2);

        cylinder(r=inner_d/2, h=height-inner_d/2);
        cylinder(r=outer_d/2, h=1);
    }
}

module leds_2() {

    translate([side/2,side/2+space_y+side,thick-1.5])
    led();

    translate([side/2,side/2,thick-1.5])
    led();
}

module leds_10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j,0, 0])
        leds_2();
    }
}


module startlight() {

    play = 0.4;

    /* scale([0.164,0.164,0.164])
    translate([45.7,55,13]) */
    /* %import("cowl4.stl"); */

    color("grey")
    union() {
        cowl();
        difference() {
            union() {
                cube([side,side,thick]);

                difference() {
                    translate([side/2,side/2,1])
                    cylinder(r=r, h=thick);

                    translate([side/2,side/2,1])
                    cylinder(r=r-1, h=thick+1);
                }
            }
            translate([side/2,side/2,-1])
            cylinder(r=led_r, h=10);

            translate([side/2,side/2,-0.5])
            cylinder(r=led_r+play, h=thick);

        }
    }

}


module startlights_2() {
    translate([0,side+space_y, 0])
    startlight();

    startlight();

    color("grey")
    translate([0,side, 0])
    bar_y();
}

module startlights_10() {
    for (j=[0:4]) {
        translate([(side+space_x)*j,0, 0])
        startlights_2();
    }

    color("grey")
    for (i=[0:1]) {

        translate([0,(side+space_y)*i+bar_thick,0])
        bar_x();

        translate([0,(side+space_y)*i+side-bar_thick*2,0])
        bar_x();
    }
}

module hook() {
    play=0.4;
    min_thick=0.15;

    module interconn() {
        translate([0,0,gate_hook_space])
        cube([gate_hook_space,bar_thick,gate_hook_thick]);
    }

    module hook_bar() {
        translate([0,0,gate_hook_space+gate_hook_thick])
        cube([startlights_length, bar_thick, bar_thick]);
    }

    translate([0,startlights_height-bar_thick-space_y,-gate_hook_space-gate_hook_thick-bar_thick])
    union() {
        translate([0,-gate_hook_space+bar_thick,0])
        cube([startlights_length, gate_hook_space, gate_hook_space]);

        interconn();

        translate([startlights_length-gate_hook_space,0,0])
        interconn();

        translate([(startlights_length-gate_hook_space)/2,0,0])
        interconn();

        hook_bar();

        for (j=[0:3]) {
            translate([(side+space_x)*j+side+play,0,0])
            union(){
                translate([0,-bar_thick*2,gate_hook_space+gate_hook_thick])
                union() {

                    translate([0,bar_thick,0])
                    cube([space_x-play*2,bar_thick, bar_thick]);

                    cube([space_x-play*2,bar_thick, bar_thick*3+play*2]);

                    translate([0,0,bar_thick*2+play*2])
                    cube([space_x-play*2,bar_thick*3, bar_thick]);

                    translate([0,bar_thick*3-min_thick,0])
                    cube([space_x-play*2,min_thick, bar_thick*3+play*2]);
                }
            }
        }
    }
}

hook();


/* startlights_10(); */
/* leds_10(); */

/* startlights_2(); */
/* led(); */

/* translate([0,-30,0])
rule(startlights_length); */
