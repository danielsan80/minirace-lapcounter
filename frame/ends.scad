frame_end_wall_length=play*2 + sensor_length + channel_width + ramp_top_length;
frame_end_wall_connector_void_length=50;

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


module sim_frame_end_left() {
    translate([-sensor_width,0,0])
    frame_end();
}

module sim_frame_end_right() {
    translate([sensor_width*9,0,0])
    mirror([1,0,0])
    frame_end();
}
