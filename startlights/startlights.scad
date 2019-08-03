thick = 3;
side = 15;
space_x = 2;
space_y = 2;
r=6;
$fn = 100;

led_d = 5.4;
led_r = led_d/2;

bar_thick = 2;

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
                    cylinder(r=r-1.5, h=thick+1);
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



/* startlights_10();
leds_10(); */

startlights_2();
/* led(); */
