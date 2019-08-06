
module print_frame_block_body_clips_void_main(n=4) {
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
        print_frame_block_body_clips_void_main();
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
print_frame_block_body_backup();

/* CHANNEL COVER BACKUP x3 */
/* print_channel_cover_backup(); */
