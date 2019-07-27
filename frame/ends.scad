frame_end_door_length=58.6;
frame_end_door_width=8.1;
frame_end_door_inner_width=6;
frame_end_door_height=8.6;
frame_end_door_base_thick=3;

frame_end_y_padding_back = y_padding_back;
frame_end_y_padding_front = y_padding_front;
frame_end_y_paddings = frame_end_y_padding_back+frame_end_y_padding_front;

frame_end_x_padding_left = y_padding_back;

frame_end_body_length = frame_end_y_paddings + play + sensor_length + play + y_padding_center + channel_width;



module frame_end_base() {
    translate([0,-play-frame_end_y_padding_back,0])
    cube([sensor_width, frame_end_body_length, base_height]);
}

module frame_end_wall() {
    translate([0,-play-frame_end_y_padding_back,0])
    cube([frame_end_x_padding_left, frame_end_body_length, frame_height]);

    translate([0,-play-frame_end_y_padding_back,0])
    cube([sensor_width,frame_end_y_padding_back, frame_height]);

    translate([0,-play-frame_end_y_paddings+frame_end_body_length,0])
    cube([sensor_width,frame_end_y_padding_back, frame_height]);
}

module frame_end_door_void() {
    translate([-play,-play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2,base_height])
    cube([frame_end_x_padding_left+play*2, frame_end_door_length + play*2,frame_height+play]);

    translate([-play-frame_end_door_width+frame_end_door_inner_width,-play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2,min_thick])
    cube([frame_end_door_width+play*2,frame_end_door_length+play*2,frame_end_door_base_thick]);
}


module frame_end_body() {
    difference() {
        union() {
            frame_end_base();
            frame_end_wall();
            frame_end_door_dock();
        }
        frame_end_door_void();
    }
//    sensor_spot();
//    channel();
}

module frame_end() {
    /* ramp_in(); */
    frame_end_body();
    /* ramp_out(); */
}


module frame_end_door() {
    color("red")
    translate([-frame_end_door_width+frame_end_door_inner_width,-play-frame_end_y_padding_back+(frame_end_body_length-frame_end_door_length)/2,min_thick])
    union() {
        cube([frame_end_door_width,frame_end_door_length,frame_end_door_base_thick]);

        translate([0,0.5,0])
        cube([frame_end_door_width-frame_end_door_inner_width,frame_end_door_length-1,frame_end_door_height]);
    }
}

module frame_end_door_dock() {
    y_offset = -play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2-default_thick;

    module short() {
        cube([frame_end_door_inner_width+default_thick+play,default_thick, frame_end_door_base_thick+min_thick*2 ]);
    }

    module long() {
        cube([default_thick, frame_end_door_length+play*2+default_thick*2, frame_end_door_base_thick+min_thick*2 ]);
    }

    translate([0,y_offset,0])
    short();

    translate([0,y_offset+frame_end_door_length+play*2+default_thick,0])
    short();

    translate([frame_end_door_inner_width+play,y_offset,0])
    long();
}


module sim_frame_end_left() {
    translate([-sensor_width,0,0])
    frame_end();
}

module sim_frame_end_door_left() {
    translate([-sensor_width,0,0])
    frame_end_door();
}


module sim_frame_end_right() {
    translate([sensor_width*9,0,0])
    mirror([1,0,0])
    frame_end();
}


module test_print_frame_end_left() {
    intersection() {
        frame_end();
        translate([-2, 12,-1])
        cube([12,70,30]);
    }
}
