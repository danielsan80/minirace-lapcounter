
/* OLD
module frame() {

    difference() {

        hull() {
            translate([0,-ramp_bottom_length -play,0])
                cube([sensor_width, sensor_length+ramp_bottom_length + ramp_top_length + play*2, min_thick]);

            translate([0,-ramp_top_length-play, quartz_height+sensor_thick+ sensor_spot_excess - min_thick ])
            cube([sensor_width, sensor_length+ramp_top_length*2 + play*2, min_thick]);
        }

        translate([-play,-play,quartz_height])
            cube([sensor_width+play*2, sensor_length+play*2, a_few]);

        translate([-play,-play,quartz_height])
            cube([sensor_width+play*2, sensor_length+play*2, a_few]);

        translate([-play,-play+sensor_y_padding,base_height])
        cube([sensor_width+play*2, sensor_length-sensor_y_padding*2+play*2, a_few]);

        translate([-play,-play+sensor_y_padding,0])
        cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

        translate([(sensor_width-base_crossbar_width)/2+base_crossbar_width+play,-play+sensor_y_padding,0])
            cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);


        translate([sensor_x_padding+play, sensor_length - a_few/2, base_height])
            cube([sensor_width-sensor_x_padding*2-play*2, a_few, a_few]);

        }


} */

/* OLD
 module frame_channel() {
  translate([0,sensor_length+play+ramp_top_length,0])
  cube([sensor_width, channel_width, base_height]);
} */


//translate([0,0,sensor_spot_height])
//rotate([0,180,0])
//channel_cover();


//frame_block();

//translate([5, -10, 0])
//clips();


/* color("blue")
sensor(); */


/* translate([0,ramp_bottom_length,0])
    union() {
        translate([-sensor_width,0,0])
        frame_end();

        frame_block();

        translate([sensor_width,0,0])
        frame_block();
    }
*/



/* OLD
frame();

frame_channel(); */
