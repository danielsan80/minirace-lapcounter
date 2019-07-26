include <frame/frame.scad>
include <modules/rule.scad>


module clips_void_part1() {

    translate([0,-play-ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+ramp_top_length/2,0])
    clip_void();

    translate([0,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();



    translate([sensor_spot_width*4,-play-ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width*4,sensor_length+play+ramp_top_length/2,0])
    clip_void();

    translate([sensor_spot_width*4,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length/2,0])
    clip_void();


    for (i = [0:3]) {
        translate([sensor_spot_width*i+sensor_spot_width/2,sensor_length+play+sensor_spot_y_padding+channel_width+ramp_top_length,0])
        rotate([0,0,90])
            clip_void();

         translate([sensor_spot_width*i+sensor_spot_width/2,-play-ramp_top_length,0])
        rotate([0,0,90])
            clip_void();
    }
}


module frame_module_part1() {

    difference() {
        union() {
            /* ramp_in(); */
            sensor_spot();
            channel();
            /* ramp_out(); */
        }
        /* clips_void(); */
    }
}




/* translate([-sensor_width,0,0])
    frame_end();

translate([sensor_width*9,0,0])
    mirror([1,0,0])
    frame_end();
 */


 /* FRAME MODULE x4 */
/* difference() {
    for (i = [0:3]) {
        translate([sensor_width*i,0,0])
            union() {
//                channel_cover();
                frame_module_part1();
//                color("blue")
//                sensor();
//                ramp_out();
            }
    }
    clips_void_part1();
} */


/* CHANNEL COVER x4 */
/* rotate([180,0,0])
for (i = [0:3]) {
   translate([sensor_width*i,0,0])
       union() {
           channel_cover();
       }
} */


/* CHANNEL COVER x6 */
clips();
