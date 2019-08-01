frame_end_door_length=58.4;
frame_end_door_width=8.1;
frame_end_door_inner_width=6;
frame_end_door_height=8.6;
frame_end_door_base_thick=2;

frame_end_y_padding_back = y_padding_back;
frame_end_y_padding_center = y_padding_center;
frame_end_y_padding_front = y_padding_front;
frame_end_y_paddings = frame_end_y_padding_back+frame_end_y_padding_front;

frame_end_x_padding_left = y_padding_back;
frame_end_x_padding_right = y_padding_back;
frame_end_x_paddings = frame_end_x_padding_left+frame_end_x_padding_right;

frame_end_body_length = frame_end_y_paddings + play + sensor_length + play + y_padding_center + channel_width;
frame_end_width = sensor_width;

frame_end_wires_void_length=frame_end_width-frame_end_x_padding_left*2-frame_end_x_padding_right*2;


frame_end_cover_leg_thick = 1.5;
frame_end_cover_play = 0.4;

module frame_end_base() {
    translate([0,-play-frame_end_y_padding_back,0])
    cube([frame_end_width, frame_end_body_length, base_height]);
}

module frame_end_wall() {
    translate([0,-play-frame_end_y_padding_back,0])
    cube([frame_end_x_padding_left, frame_end_body_length, frame_height]);

    translate([frame_end_width-frame_end_x_padding_right,+sensor_length+play,0])
    cube([frame_end_x_padding_right, frame_end_y_padding_center, frame_height]);

    translate([0,-play-frame_end_y_padding_back,0])
    cube([frame_end_width,frame_end_y_padding_back, frame_height]);

    translate([0,-play-frame_end_y_paddings+frame_end_body_length,0])
    cube([frame_end_width,frame_end_y_padding_back, frame_height]);
}

module frame_end_uprights(ext=false) {
    function upright_height() = !ext?frame_height-base_height-play:frame_height*2-base_height-play;
    n=3;

    for (i=[1:n-1]) {
        translate([frame_end_width/2, -play-frame_end_y_padding_back + frame_end_body_length/n*i])
        cylinder(r=1.5, h=upright_height());
    }

}

module frame_end_door_void() {
    translate([-play,-play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2,base_height])
    cube([frame_end_x_padding_left+play*2, frame_end_door_length + play*2,frame_height+play]);

    translate([-play-frame_end_door_width+frame_end_door_inner_width,-play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2,min_thick])
    cube([frame_end_door_width+play*2,frame_end_door_length+play*2,frame_end_door_base_thick]);
}


module frame_end_body() {
    /* frame_end_uprights(ext=true); */
    difference() {
        union() {
            frame_end_base();
            frame_end_wall();
            frame_end_door_dock();
        }
        frame_end_door_void();
        frame_end_wires_void();
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

module frame_end_wires_void() {
    translate([(frame_end_width-frame_end_wires_void_length)/2,-play-frame_end_y_padding_back-play, base_height])
    cube([frame_end_wires_void_length, frame_end_y_padding_back+play*2, a_few]);
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


module frame_end_cover_leg_back(ext=false) {
    function leg_height() = !ext?frame_height-base_height:frame_height*2-base_height;

    cube([frame_end_x_padding_left-frame_end_cover_play, frame_end_cover_leg_thick, leg_height()]);

    translate([frame_end_x_padding_left-frame_end_cover_play+frame_end_wires_void_length,0,0])
    cube([frame_end_x_padding_right*2, frame_end_cover_leg_thick, leg_height()]);

}

module frame_end_cover_leg_front(ext=false) {
    function leg_height() = !ext?frame_height-base_height:frame_height*2-base_height;

    cube([
        frame_end_width-frame_end_x_padding_left-frame_end_cover_play,
        frame_end_cover_leg_thick,
        leg_height()
    ]);
}

module frame_end_cover_leg_right(ext=false) {
    function leg_height() = !ext?frame_height-base_height:frame_height*2-base_height;

    translate([
        0,
        frame_end_y_padding_center+frame_end_cover_play*2+frame_end_cover_leg_thick,
        0
    ])
    cube([
        frame_end_x_padding_right,
        frame_end_cover_leg_thick,
        leg_height()
    ]);

    cube([
        frame_end_x_padding_right,
        frame_end_cover_leg_thick,
        leg_height()
    ]);
/*
    cube([
        frame_end_cover_leg_thick,
        frame_end_y_padding_center+play*2+frame_end_cover_leg_thick*2,
        frame_height-base_height
    ]); */
}

module frame_end_cover_leg_left(ext=false) {
    function leg_height() = !ext?frame_height-base_height:frame_height*2-base_height;

    translate([0,frame_end_cover_leg_thick+frame_end_cover_play+default_thick+(frame_end_door_length+play*2)+default_thick+frame_end_cover_play,0])
    cube([
        frame_end_x_padding_left,
        frame_end_cover_leg_thick,
        leg_height()
    ]);

    cube([
        frame_end_x_padding_left,
        frame_end_cover_leg_thick,
        leg_height()
    ]);
}


module frame_end_cover_legs(ext=false) {
    translate([
        frame_end_x_padding_left+frame_end_cover_play,
        -play+frame_end_cover_play,
        base_height
    ])
    frame_end_cover_leg_back(ext);

    translate([
        frame_end_x_padding_left+frame_end_cover_play,
        -play-frame_end_y_padding_back+frame_end_body_length-frame_end_y_padding_front-frame_end_cover_play -frame_end_cover_leg_thick,
        base_height
    ])
    frame_end_cover_leg_front(ext);

    translate([
        frame_end_width-frame_end_x_padding_right,
        sensor_length+play-frame_end_cover_play-frame_end_cover_leg_thick,
        base_height
    ])
    frame_end_cover_leg_right(ext);

    translate([
        frame_end_x_padding_left+frame_end_cover_play,
        -play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2))/2-default_thick-frame_end_cover_play-frame_end_cover_leg_thick,
        base_height
    ])
    frame_end_cover_leg_left(ext);
}


module frame_end_cover_plate() {

        difference() {
            translate([
                frame_end_x_padding_left+frame_end_cover_play,
                -play+frame_end_cover_play,
                frame_height - base_height
            ])
            cube([
                frame_end_width-frame_end_x_padding_left-frame_end_cover_play,
                frame_end_body_length-frame_end_y_paddings-frame_end_cover_play*2,
                base_height
            ]);


            translate([
                frame_end_width-frame_end_x_padding_right-frame_end_cover_play,
                sensor_length +play-frame_end_cover_play,
                frame_height - base_height
            ])
            cube([
                frame_end_x_padding_right+frame_end_cover_play,
                frame_end_y_padding_center+frame_end_cover_play*2,
                base_height
            ]);

        }

    translate([
        0,
        -play-frame_end_y_padding_back+(frame_end_body_length-(frame_end_door_length+play*2-frame_end_cover_play*2))/2,
        frame_height - base_height
    ])
    cube([
        frame_end_x_padding_left+frame_end_cover_play,
        frame_end_door_length+play*2-frame_end_cover_play*2,
        base_height
    ]);
}


module frame_end_cover_plate_ext_void() {
    translate([frame_end_x_padding_left,-play,frame_height-base_height])
    cube([
        frame_end_width-frame_end_x_paddings,
        frame_end_body_length-frame_end_y_paddings,
        base_height
    ]);
}

module frame_end_cover_ext_wall() {
    translate([0,0,frame_height])
    union() {
        translate([0,-play-frame_end_y_padding_back,0])
        cube([frame_end_x_padding_left+frame_end_cover_play, frame_end_body_length, frame_height]);

        translate([frame_end_width-frame_end_x_padding_right-frame_end_cover_play,-play-frame_end_y_padding_back,0])
        cube([frame_end_x_padding_right+frame_end_cover_play, frame_end_body_length, frame_height]);

        translate([0,-play-frame_end_y_padding_back,0])
        cube([frame_end_width,frame_end_y_padding_back+frame_end_cover_play, frame_height]);

        translate([0,-play-frame_end_y_paddings+frame_end_body_length-frame_end_cover_play,0])
        cube([frame_end_width,frame_end_y_padding_back+frame_end_cover_play, frame_height]);
    }
}

module frame_end_cover_ext_plate() {
    translate([0,-play-frame_end_y_padding_back,frame_height*2-base_height])
    cube([frame_end_width, frame_end_body_length, base_height]);

}


module frame_end_hole() {
    translate([frame_end_width,0,0])
    sim_gate_bolt(true);
}


module frame_end_cover() {
    /* translate([0,sensor_length+play+channel_y_padding_back+play,frame_height - base_height])
    cube([sensor_width, channel_width-play*2, base_height]); */

    difference() {
        union() {
            difference() {
                frame_end_cover_plate();

                frame_end_cover_plate_ext_void();

            }

            frame_end_cover_ext_wall();
            frame_end_cover_ext_plate();

            frame_end_cover_legs(ext=true);
        }

        frame_end_hole();
    }

}


module sim_frame_end_left() {
    translate([-frame_end_width,0,0])
    frame_end();
}

module sim_frame_end_cover_left() {
    translate([-frame_end_width,0,0])
    frame_end_cover();
}

module sim_frame_end_cover_right() {
    translate([frame_end_width*9,0,0])
    mirror([1,0,0])
    frame_end_cover();
}

module sim_frame_end_door_left() {
    translate([-frame_end_width,0,0])
    frame_end_door();
}


module sim_frame_end_right() {
    translate([frame_end_width*9,0,0])
    mirror([1,0,0])
    frame_end();
}


module print_frame_end_body_left() {
    difference() {
        frame_end_body();
        print_frame_end_body_clips_void();
    }
}

module test_print_frame_end_left() {
    intersection() {
        frame_end();
        translate([-2, 12,-1])
        cube([12,70,30]);
    }
}
