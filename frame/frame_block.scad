
frame_block_body_length = y_padding_back+play+sensor_length+play+y_padding_center+channel_width+y_padding_front;

num_frame_block = 8;

function frame_total_length(n=8) = sensor_width_m*n+sensor_side_spacer_width*2;


module frame_block_body() {
    sensor_spot();
    channel();
}

module frame_block() {
    /* ramp_in(); */
    frame_block_body();
    /* ramp_out(); */
}

module frame_block_spacer() {
    sensor_spot_spacer();
    channel_spacer();
}



module sim_frame_block(n=8, spacer_left=false, spacer_right=false) {
    if (spacer_left) {
        frame_block_spacer();
    }
    for (i = [0:n-1]) {
        translate([sensor_side_spacer_width+sensor_width_m*i,0,0])
        union() {
            frame_block();
        }
    }
    if (spacer_right) {
        translate([sensor_side_spacer_width+sensor_width_m*n,0,0])
        frame_block_spacer();
    }
}

module sim_frame_block_only_padding_back(n=8) {
    fix = 0.1;

    for (i = [0:n-1]) {
        translate([sensor_width_m*i,0,0])
        difference() {
            frame_block();
            translate([-fix,0,-fix])
            cube([sensor_width_m+fix*2,500, sensor_spot_height+fix*2]);
        }
    }
}

module sim_frame_block_no_padding_back(n=8) {
    fix = 0.1;

    for (i = [0:n-1]) {
        translate([sensor_width_m*i,0,0])
        difference() {
            frame_block();
            translate([-fix,-500,-fix])
            cube([sensor_width_m+fix*2,500, sensor_spot_height+fix*2]);
        }
    }
}

module print_frame_block_body(n=4) {
    difference() {
        for (i = [0:n-1]) {
            translate([sensor_width_m*i,0,0])
            frame_block_body();
        }
        print_frame_block_body_clips_void(n);
    }
}
