/* ramp_bottom_length = 20; */
ramp_bottom_length = 80;
ramp_top_length = y_padding;
ramp_height = frame_height;

module ramp_in() {
    hull() {
        translate([0,-play -ramp_bottom_length,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,-play -ramp_top_length, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}

module ramp_out() {
    hull() {
        translate([0,sensor_length+play+y_padding_center+channel_width,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,sensor_length+play+y_padding_center+channel_width, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}
