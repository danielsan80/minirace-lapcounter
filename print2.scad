
module print_frame_block_body_backup_clips_void(n=4) {
    include <frame/all.scad>
    channel_width = 50;
    print_frame_block_body_clips_void(n);
}

module print_frame_block_body_backup_without_clips_void(n=3) {
    include <frame/all.scad>
    channel_width = 50;
    sensor_width_margin = 7.10833333333333333;

    for (i = [0:n-1]) {
        translate([sensor_width_m*i,0,0])
        frame_block_body();
    }
}


module print_frame_block_body_backup() {
    difference() {
        print_frame_block_body_backup_without_clips_void();
        print_frame_block_body_backup_clips_void();
    }
}

module print_channel_cover_backup() {
    include <frame/all.scad>
    channel_width = 50;
    sensor_width_margin = 7.10833333333333333;

    /* rotate([180,0,0]) */
    print_channel_cover(3);
}




/* FRAME BLOCK BODY BACKUP x3 */
/* print_frame_block_body_backup(); */

/* CHANNEL COVER BACKUP x3 */
/* print_channel_cover_backup(); */




module print_frame_block_body_main2_domain() {
    include <frame/all.scad>

    translate([-a_few,-a_few-play-y_padding_back, -a_few])
    cube([frame_total_length()/2+a_few, frame_block_body_length+a_few*2, frame_height+a_few*2]);

}

/** BODY LEFT **/

module print_frame_block_body_main2_left_without_clips_void() {
    include <frame/all.scad>


    sensor_width_margin = sensor_width_margin_for_6;
    sensor_side_spacer_width = sensor_side_spacer_width_for_5;

    intersection() {
        sim_frame_block(n=5,spacer_left=true, spacer_right=true);
        print_frame_block_body_main2_domain();
    }

}

module print_frame_block_body_main2_left_clips_void() {
    include <frame/all.scad>
    print_frame_block_body_clips_void(4);
}

module print_frame_block_body_main2_left_patch() {
    include <frame/all.scad>

    color("red")
    translate([frame_total_length()/2-5, sensor_length,0])
    cube([5,5, base_height]);
}

module print_frame_block_body_main2_left() {

    difference() {
        print_frame_block_body_main2_left_without_clips_void();
        print_frame_block_body_main2_left_clips_void();
    }
    print_frame_block_body_main2_left_patch();

}


/** BODY RIGHT **/

module print_frame_block_body_main2_right_without_clips_void() {
    include <frame/all.scad>


    sensor_width_margin = sensor_width_margin_for_6;
    sensor_side_spacer_width = sensor_side_spacer_width_for_5;

    intersection() {
        sim_frame_block(n=5,spacer_left=true, spacer_right=true);
        translate([frame_total_length(n=5)/2+a_few,0,0])
        print_frame_block_body_main2_domain();
    }

}


module print_frame_block_body_main2_right_clips_void() {
    include <frame/all.scad>

    translate([frame_total_length()/2,0,0])
    print_frame_block_body_clips_void(4);
}

module print_frame_block_body_main2_right_patch() {
    include <frame/all.scad>

    color("red")
    translate([frame_total_length()/2, sensor_length,0])
    cube([5,5, base_height]);
}


module print_frame_block_body_main2_right() {

    difference() {
        print_frame_block_body_main2_right_without_clips_void();
        print_frame_block_body_main2_right_clips_void();
    }
    print_frame_block_body_main2_right_patch();

}


/** COVERS MAIN2" **/

module print_channel_cover_main2_left() {
    include <frame/all.scad>

    sensor_width_margin = sensor_width_margin_for_6;
    sensor_side_spacer_width = sensor_side_spacer_width_for_5;

    rotate([180,0,0])
    intersection() {
        sim_channel_cover(n=5,spacer_left=true, spacer_right=true);
        print_frame_block_body_main2_domain();

    }
}


module print_channel_cover_main2_right() {
    include <frame/all.scad>

    sensor_width_margin = sensor_width_margin_for_6;
    sensor_side_spacer_width = sensor_side_spacer_width_for_5;

    rotate([180,0,0])
    intersection() {
        sim_channel_cover(n=5,spacer_left=true, spacer_right=true);
        translate([frame_total_length(n=5)/2+a_few,0,0])
        print_frame_block_body_main2_domain();
    }
}





/* FRAME BLOCK BODY MAIN2 x2.5 */
/* print_frame_block_body_main2_left(); */
print_frame_block_body_main2_right();

/* CHANNEL COVER MAIN2 x2.5 */
/* print_channel_cover_main2_left();
print_channel_cover_main2_right(); */
