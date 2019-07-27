channel_width = 30;

channel_cover_leg_side = 1.5;
channel_cover_leg_thick = 1.5;
channel_cover_leg_back_length = sensor_x_padding-play;
channel_y_padding_front = y_padding_front;
channel_y_padding_back = y_padding_center;
channel_y_paddings = channel_y_padding_back+channel_y_padding_front;



module channel_body() {
    translate([0,sensor_length+play,0])
    cube([sensor_width, channel_width+channel_y_paddings, frame_height]);
}
module channel_cavity() {
    translate([-play,sensor_length+play+channel_y_padding_back,base_height])
    cube([sensor_width+play*2, channel_width, a_few]);
}

module channel_connector_void() {
    sensor_spot_connector_void();
}

module channel() {
    difference() {
        channel_body();
        channel_connector_void();
        channel_cavity();
    }

}

module channel_cover_leg() {
    cube([channel_cover_leg_side, channel_cover_leg_side, frame_height-base_height]);
}

module channel_cover_leg_back() {
    cube([sensor_x_padding-play, channel_cover_leg_thick, frame_height-base_height]);
}

module channel_cover_leg_front() {
    cube([sensor_width, channel_cover_leg_thick, frame_height-base_height]);
}

module channel_cover_legs() {
    translate([0,sensor_length+play+channel_y_padding_back+play,base_height])
    channel_cover_leg_back();

    translate([sensor_width-channel_cover_leg_back_length ,sensor_length+play+channel_y_padding_back+play,base_height])
    channel_cover_leg_back();

    translate([0,sensor_length+play+channel_y_padding_back + channel_width -play -channel_cover_leg_side ,base_height])
    channel_cover_leg_front();
}

module channel_cover_legs_old() {
    translate([0,sensor_length+play+channel_y_padding_back+play,base_height])
    channel_cover_leg();

    translate([sensor_width-channel_cover_leg_side ,sensor_length+play+channel_y_padding_back+play,base_height])
    channel_cover_leg();

    translate([0,sensor_length+play+channel_y_padding_back + channel_width -play -channel_cover_leg_side ,base_height])
    channel_cover_leg();

    translate([sensor_width-channel_cover_leg_side ,sensor_length+play+channel_y_padding_back + channel_width -play -channel_cover_leg_side,base_height])
    channel_cover_leg();


    /* translate([0,sensor_length+play*2+channel_y_padding,base_height + play])
    cube([sensor_width, channel_width-play*2, frame_height-base_height-play]); */

}

module channel_cover() {
    translate([0,sensor_length+play+channel_y_padding_back+play,frame_height - base_height])
    cube([sensor_width, channel_width-play*2, base_height]);

    channel_cover_legs();

}

module sim_channel_cover(n=8) {
    for (i = [0:n-1]) {
        translate([sensor_width*i,0,0])
        channel_cover();
    }
}

module print_channel_cover(n=4) {
    rotate([180,0,0])
    for (i = [0:n-1]) {
        translate([sensor_width*i,0,0])
        union() {
            channel_cover();
        }
    }
}
