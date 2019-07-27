/* ramp_bottom_length = 20; */
ramp_bottom_length = 80;
ramp_top_length = sensor_spot_y_padding;
ramp_height = sensor_spot_height;

module ramp_in() {
    hull() {
        translate([0,-ramp_bottom_length -play,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,-ramp_top_length-play, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}

module ramp_out() {
    hull() {
        translate([0,sensor_length+play+sensor_spot_y_padding+channel_width,0])
            cube([sensor_width, ramp_bottom_length, min_thick]);

        translate([0,sensor_length+play+sensor_spot_y_padding+channel_width, ramp_height - min_thick ])
            cube([sensor_width, ramp_top_length, min_thick]);
    }
}
