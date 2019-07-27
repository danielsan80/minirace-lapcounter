clip_height = sensor_spot_height - 1;
clip_r = 1.1;
clip_width = 1.5;

module clip() {
    boneclip(
        height = clip_height-0.5,
        r = clip_r,
        width = clip_width,
        dinstance = 1 -0.2
    );
}
module clip_void() {
    boneclip(
        void=true,
        height = clip_height,
        r = clip_r,
        width = clip_width
    );
}


module clips_void() {

    translate([0,-play-ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width,-play-ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();
}

module print_clips(n=6) {

    for (i = [0:n-1]) {
        translate([0,-i*5,0])
            clip();
    }

}

module print_frame_block_body_clips_void(n=4) {

    translate([0,-play-ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();



    translate([sensor_spot_width*n,-play-ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width*n,sensor_length+play+ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width*n,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();


    for (i = [0:n-1]) {
        translate([sensor_spot_width*i+sensor_spot_width/2,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length,0])
        rotate([0,0,90])
            clip_void();

         translate([sensor_spot_width*i+sensor_spot_width/2,-play-ramp_top_length,0])
        rotate([0,0,90])
            clip_void();
    }
}
