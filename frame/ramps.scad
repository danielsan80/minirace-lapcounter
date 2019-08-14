/* ramp_bottom_length = 20; */
ramp_bottom_length = 80;
ramp_top_length = y_padding;
ramp_height = frame_height;

module ramp_in() {
    hull() {
        translate([0,-play -ramp_bottom_length,0])
            cube([sensor_width_m, ramp_bottom_length, min_thick]);

        translate([0,-play -ramp_top_length, ramp_height - min_thick ])
            cube([sensor_width_m, ramp_top_length, min_thick]);
    }
}

module ramp_out() {
    hull() {
        translate([0,sensor_length+play+y_padding_center+channel_width,0])
            cube([sensor_width_m, ramp_bottom_length, min_thick]);

        translate([0,sensor_length+play+y_padding_center+channel_width, ramp_height - min_thick ])
            cube([sensor_width_m, ramp_top_length, min_thick]);
    }
}


module ramp_end() {
    ramp_length = 50;

    hull() {
        cube([sensor_width_m, min_thick, ramp_height*2]);
        cube([min_thick, ramp_length, ramp_height*2]);
    }
}

module sim_ramp_end_left() {
    translate([-sensor_width_m, frame_block_body_length-y_padding_back-play])
    ramp_end();
}

module print_ramp_end_left() {
    difference() {
        ramp_end();
        print_ramp_end_clips_void();
    }
}
