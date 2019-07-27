module frame_block_body() {
    sensor_spot();
    channel();
}

module frame_block() {
    /* ramp_in(); */
    frame_block_body();
    /* ramp_out(); */
}



module sim_frame_block(n=8) {
    for (i = [0:n-1]) {
        translate([sensor_width*i,0,0])
        union() {
            frame_block();
        }
    }
}

module print_frame_block_body(n=4) {
    difference() {
        for (i = [0:n-1]) {
            translate([sensor_width*i,0,0])
            frame_block_body();
        }
        print_frame_block_body_clips_void(n);
    }
}
