include <connector.scad>

$fn=100;
default_thick = 2;
min_thick = 0.3;

a_few = 10;
play = 0.25;

sensor_width_margin = 0.4;

sensor_length = 59.6;
sensor_width = 39.45 + sensor_width_margin*2;
sensor_thick = 1.5;

sensor_hole_d = 2.7;
sensor_hole_r = sensor_hole_d/2;
sensor_back_hole_x = 5.5 + sensor_hole_r + sensor_width_margin;
sensor_back_hole_y = 5.3 + sensor_hole_r;
sensor_front_hole_x = 1.1 + sensor_hole_r + sensor_width_margin ;
sensor_front_hole_y = 14.3 + sensor_hole_r;



quartz_length = 10;
quartz_width = 3.5;
quartz_height = 4.9 + 0.5 - sensor_thick;
quartz_margin = 1;

quartz_x_offset = 0.5;
quartz_y_offset = 2;

sensor_x_padding = 5;
sensor_y_padding = 1.5;


sensor_spot_excess = 0.2;
sensor_spot_y_padding = 4;
sensor_spot_width = sensor_width;
sensor_spot_length = sensor_length + play*2 + sensor_spot_y_padding*2;
sensor_spot_height = quartz_height + sensor_thick + sensor_spot_excess;

sensor_void_length = sensor_length + play*2 - sensor_y_padding*2;

/* ramp_bottom_length = 20; */
ramp_bottom_length = 6;
ramp_top_length = sensor_spot_y_padding;
ramp_height = sensor_spot_height;

base_height = 1;
base_crossbar_width = 10;

base_renforcement_height = 3;
base_renforcement_width = 2;


channel_width = 30;

frame_end_wall_length=play*2 + sensor_length + channel_width + ramp_top_length;
frame_end_wall_connector_void_length=50;


clip_height = sensor_spot_height - 1;
clip_r = 1.1;
clip_width = 1.5;

module sensor() {
    translate([0,0,quartz_height])
        union() {
            difference() {
                cube([sensor_width, sensor_length, sensor_thick]);

                translate([sensor_back_hole_x, sensor_back_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_width-sensor_back_hole_x, sensor_back_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_front_hole_x, sensor_length - sensor_front_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_width - sensor_front_hole_x, sensor_length - sensor_front_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

            }
            translate([quartz_x_offset, sensor_length-quartz_length-quartz_y_offset, -quartz_height])
                cube([quartz_width,quartz_length,quartz_height]);
        }
}

module ramp_in() {
    hull() {
        translate([0,-ramp_bottom_length -play,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,-ramp_top_length-play, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}

module sensor_spot_body() {
    translate([0, -play - sensor_spot_y_padding,0])
        cube([sensor_spot_width, sensor_spot_length, sensor_spot_height]);
}

module sensor_spot_cavity() {
    translate([-play, -play,sensor_spot_height - sensor_thick - sensor_spot_excess])
        cube([sensor_width+play*2, sensor_length + play*2, a_few]);
}

module sensor_spot_void() {
    translate([-play, -play + sensor_y_padding, 0])
        cube([sensor_width+play*2, sensor_void_length, a_few]);
}

module sensor_spot_base() {
        cube([sensor_width, sensor_length, base_height]);
}

/* module sensor_spot_connection_left_void() {

    translate([-play,-play+sensor_y_padding,0])
    cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

}

module sensor_spot_connection_right_void() {

    translate([(sensor_width-base_crossbar_width)/2+base_crossbar_width,-play+sensor_y_padding,0])
    cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

} */

module sensor_spot_connector_void() {
    translate([sensor_x_padding-play, sensor_length - a_few/2, base_height])
        cube([sensor_width-sensor_x_padding*2+play*2, a_few, a_few]);
}

module sensor_spot_quartz_void() {
    translate([0, sensor_length - quartz_length-quartz_y_offset-quartz_margin, 0])
        cube([quartz_width+quartz_x_offset+quartz_margin, quartz_length+quartz_y_offset+quartz_margin, a_few]);
}

module sensor_spot_back_colmuns() {
    translate([sensor_back_hole_x,sensor_back_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);

    translate([sensor_width-sensor_back_hole_x,sensor_back_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);
}

module sensor_spot_front_colmuns() {
    translate([sensor_front_hole_x,sensor_length-sensor_front_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);

    translate([sensor_width-sensor_front_hole_x,sensor_length-sensor_front_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);
}


module sensor_spot_base_renforcement_y() {
    translate([sensor_width/2-base_renforcement_width/2, 0,0])
        cube([base_renforcement_width, sensor_length-sensor_front_hole_y,  base_renforcement_height]);
}

module sensor_spot_base_renforcement_x() {
    translate([sensor_front_hole_x, sensor_length-sensor_front_hole_y-base_renforcement_width/2,0])
        cube([sensor_width-sensor_front_hole_x*2, base_renforcement_width, base_renforcement_height]);
}

module sensor_spot() {
    difference() {
        sensor_spot_body();
        sensor_spot_cavity();
        sensor_spot_void();
        /* sensor_spot_connection_left_void();
        sensor_spot_connection_right_void(); */
        sensor_spot_connector_void();

    }
    difference() {
        sensor_spot_base();
        sensor_spot_quartz_void();
    }
    sensor_spot_back_colmuns();
    sensor_spot_front_colmuns();

    sensor_spot_base_renforcement_x();
    sensor_spot_base_renforcement_y();
}

module channel_body() {
    translate([0,sensor_length+play,0])
    cube([sensor_width, channel_width + sensor_spot_y_padding*2, sensor_spot_height]);
}
module channel_cavity() {
    translate([-play,sensor_length+play+sensor_spot_y_padding,base_height])
    cube([sensor_width+play*2, channel_width, a_few]);
}

module ramp_out() {
    hull() {
        translate([0,sensor_length+play+sensor_spot_y_padding+channel_width,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,sensor_length+play+sensor_spot_y_padding+channel_width, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}

module channel() {
    difference() {
        channel_body();
        sensor_spot_connector_void();
        channel_cavity();
    }

}


module clip() {
    connector(
        height = clip_height-0.5,
        r = clip_r,
        width = clip_width
    );
}
module clip_void() {
    connector(
        void=true,
        height = clip_height,
        r = clip_r,
        width = clip_width
    );
}


module clips_void() {

    translate([0,-play-ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width,-play-ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();
}


module frame_module() {

    difference() {
        union() {
            ramp_in();
            sensor_spot();
            channel();
            ramp_out();
        }
        clips_void();
    }
}

channel_cover_leg_side = 1.5;
module channel_cover_leg() {
    cube([channel_cover_leg_side, channel_cover_leg_side, sensor_spot_height-base_height]);
}

module channel_cover() {
    translate([0,sensor_length+play*2+sensor_spot_y_padding,sensor_spot_height - base_height])
    cube([sensor_width, channel_width-play*2, base_height]);

    translate([0,sensor_length+play*2+sensor_spot_y_padding,base_height])
    channel_cover_leg();

    translate([sensor_width-channel_cover_leg_side ,sensor_length+play*2+sensor_spot_y_padding,base_height])
    channel_cover_leg();

    translate([0,sensor_length+play*2+sensor_spot_y_padding + channel_width -play*2 -channel_cover_leg_side ,base_height])
    channel_cover_leg();

    translate([sensor_width-channel_cover_leg_side ,sensor_length+play*2+sensor_spot_y_padding+ channel_width -play*2 -channel_cover_leg_side,base_height])
    channel_cover_leg();


    /* translate([0,sensor_length+play*2+sensor_spot_y_padding,base_height + play])
    cube([sensor_width, channel_width-play*2, sensor_spot_height-base_height-play]); */

}


translate([0,0,sensor_spot_height])
rotate([0,180,0])
channel_cover();



/* OLD
module frame() {

    difference() {

        hull() {
            translate([0,-ramp_bottom_length -play,0])
                cube([sensor_width, sensor_length+ramp_bottom_length + ramp_top_length + play*2, min_thick]);

            translate([0,-ramp_top_length-play, quartz_height+sensor_thick+ sensor_spot_excess - min_thick ])
            cube([sensor_width, sensor_length+ramp_top_length*2 + play*2, min_thick]);
        }

        translate([-play,-play,quartz_height])
            cube([sensor_width+play*2, sensor_length+play*2, a_few]);

        translate([-play,-play,quartz_height])
            cube([sensor_width+play*2, sensor_length+play*2, a_few]);

        translate([-play,-play+sensor_y_padding,base_height])
        cube([sensor_width+play*2, sensor_length-sensor_y_padding*2+play*2, a_few]);

        translate([-play,-play+sensor_y_padding,0])
        cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

        translate([(sensor_width-base_crossbar_width)/2+base_crossbar_width+play,-play+sensor_y_padding,0])
            cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);


        translate([sensor_x_padding+play, sensor_length - a_few/2, base_height])
            cube([sensor_width-sensor_x_padding*2-play*2, a_few, a_few]);

        }


} */

/* OLD
 module frame_channel() {
  translate([0,sensor_length+play+ramp_top_length,0])
  cube([sensor_width, channel_width, base_height]);
} */


module frame_end_base() {

    translate([0,-play,0])
    cube([sensor_width, play*2 + sensor_length + channel_width + ramp_top_length,base_height]);

}

module frame_end_wall() {

    translate([0,-play,0])
    cube([ramp_top_length, frame_end_wall_length,sensor_spot_height]);

}

module frame_end_wall_connector_void() {

    translate([0,-play+(frame_end_wall_length-frame_end_wall_connector_void_length)/2,0])
    cube([ramp_top_length, frame_end_wall_connector_void_length,sensor_spot_height]);

}


module frame_end() {
    ramp_in();
    frame_end_base();
    difference() {

        frame_end_wall();
        frame_end_wall_connector_void();
    }
//    sensor_spot();
//    channel();
    ramp_out();
}

module clips() {

    for (i = [0:3]) {
        translate([0,-i*5,0])
            clip();
    }

}


//frame_module();

//translate([5, -10, 0])
//clips();


/* color("blue")
sensor(); */


/* translate([0,ramp_bottom_length,0])
    union() {
        translate([-sensor_width,0,0])
        frame_end();

        frame_module();

        translate([sensor_width,0,0])
        frame_module();
    } */


/* OLD
frame();

frame_channel(); */
