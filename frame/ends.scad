frame_end_wall_connector_void_length=50;

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

module frame_end_wall_connector_void() {
    translate([0,-play-frame_end_y_padding_back+(frame_end_body_length-frame_end_wall_connector_void_length)/2,0])
    cube([frame_end_x_padding_left, frame_end_wall_connector_void_length,frame_height]);
}


module frame_end_body() {
    frame_end_base();
    difference() {
        frame_end_wall();
        frame_end_wall_connector_void();
    }
//    sensor_spot();
//    channel();
}

module frame_end() {
    /* ramp_in(); */
    frame_end_body();
    /* ramp_out(); */
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
