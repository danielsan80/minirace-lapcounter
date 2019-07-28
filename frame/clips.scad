clip_height = frame_height - 1;
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

    translate([0,-play-y_padding_back/2,0])
    clip_void();

    translate([sensor_spot_width,-play-y_padding_back/2,0])
    clip_void();

    translate([0,sensor_length+play+y_padding_center+channel_width+y_padding_front/2,0])
    clip_void();

    translate([sensor_spot_width,sensor_length+play+y_padding_center+channel_width+y_padding_front/2,0])
    clip_void();
}

module print_clips(n=6) {

    for (i = [0:n-1]) {
        translate([0,-i*5,0])
            clip();
    }

}

module print_frame_block_body_clips_void(n=4) {

    translate([0,-play-y_padding_back/2,0])
    clip_void();

    translate([0,sensor_length+play+y_padding_center/2,0])
    clip_void();

    translate([0,sensor_length+play+y_padding_center+channel_width+y_padding_front/2,0])
    clip_void();



    translate([sensor_spot_width*n,-play-y_padding_back/2,0])
    clip_void();

    translate([sensor_spot_width*n,sensor_length+play+y_padding_center/2,0])
    clip_void();

    translate([sensor_spot_width*n,sensor_length+play+y_padding_center+channel_width+y_padding_front/2,0])
    clip_void();


    for (i = [0:n-1]) {
        translate([sensor_spot_width*i+sensor_spot_width/2,sensor_length+play+y_padding_center+channel_width+y_padding_front,0])
        rotate([0,0,90])
            clip_void();

        translate([sensor_spot_width*i+sensor_spot_width/2,-play-y_padding_back,0])
        rotate([0,0,90])
            clip_void();
    }
}

module print_frame_end_body_clips_void() {


    translate([frame_end_width,-play-y_padding_back/2,0])
    clip_void();

    translate([frame_end_width,sensor_length+play+y_padding_center/2,0])
    clip_void();

    translate([frame_end_width,sensor_length+play+y_padding_center+channel_width+y_padding_front/2,0])
    clip_void();


    /* translate([frame_end_width/2,-play-frame_end_y_padding_back + frame_end_body_length,0])
    rotate([0,0,90])
        clip_void(); */

    translate([frame_end_x_padding_left+frame_end_x_padding_left/2,-play-frame_end_y_padding_back + frame_end_body_length,0])
    rotate([0,0,90])
        clip_void();

    translate([frame_end_width-frame_end_x_padding_right-frame_end_x_padding_right/2,-play-frame_end_y_padding_back + frame_end_body_length,0])
    rotate([0,0,90])
        clip_void();


    /* translate([frame_end_width/2,-play-frame_end_y_padding_back,0])
    rotate([0,0,90])
        clip_void(); */

    translate([frame_end_x_padding_left+frame_end_x_padding_left/2,-play-frame_end_y_padding_back,0])
    rotate([0,0,90])
        clip_void();

    translate([frame_end_width-frame_end_x_padding_right-frame_end_x_padding_right/2,-play-frame_end_y_padding_back,0])
    rotate([0,0,90])
        clip_void();
}
