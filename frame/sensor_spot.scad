sensor_spot_excess = 0.2;
sensor_spot_y_padding = 4;
sensor_spot_width = sensor_width;
sensor_spot_length = sensor_length + play*2 + sensor_spot_y_padding*2;
sensor_spot_height = quartz_height + sensor_thick + sensor_spot_excess;

sensor_void_length = sensor_length + play*2 - sensor_y_padding*2;

base_height = 1;
base_crossbar_width = 10;

base_renforcement_height = 3;
base_renforcement_width = 2;

module sensor_spot_body() {
    translate([0, -play - sensor_spot_y_padding,0])
        cube([sensor_spot_width, sensor_spot_length, sensor_spot_height]);
}

module sensor_spot_cavity() {
    translate([-play, -play,sensor_spot_height - sensor_thick - sensor_spot_excess])
        cube([sensor_width+play*2, sensor_length + play*2, a_few]);
}

module sensor_spot_void() {
    translate([-play, -play + sensor_y_padding, 0])
        cube([sensor_width+play*2, sensor_void_length, a_few]);
}

module sensor_spot_base() {
        cube([sensor_width, sensor_length, base_height]);
}

/* module sensor_spot_connection_left_void() {

    translate([-play,-play+sensor_y_padding,0])
    cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

}

module sensor_spot_connection_right_void() {

    translate([(sensor_width-base_crossbar_width)/2+base_crossbar_width,-play+sensor_y_padding,0])
    cube([(sensor_width-base_crossbar_width)/2+play, sensor_length-sensor_y_padding*2+play*2, a_few]);

} */

module sensor_spot_connector_void() {
    translate([sensor_x_padding-play, sensor_length - a_few/2, base_height])
        cube([sensor_width-sensor_x_padding*2+play*2, a_few, a_few]);
}

module sensor_spot_quartz_void() {
    translate([0, sensor_length - quartz_length-quartz_y_offset-quartz_margin_y, 0])
        cube([quartz_width+quartz_x_offset+quartz_margin_x, quartz_length+quartz_y_offset+quartz_margin_y, a_few]);
}

module sensor_spot_back_colmuns() {
    translate([sensor_back_hole_x,sensor_back_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);

    translate([sensor_width-sensor_back_hole_x,sensor_back_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);
}

module sensor_spot_front_colmuns() {
    translate([sensor_front_hole_x,sensor_length-sensor_front_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);

    translate([sensor_width-sensor_front_hole_x,sensor_length-sensor_front_hole_y,0])
    cylinder(r=sensor_hole_r, h=sensor_spot_height);
}


module sensor_spot_base_renforcement_y() {
    translate([sensor_width/2-base_renforcement_width/2, 0,0])
        cube([base_renforcement_width, sensor_length-sensor_front_hole_y,  base_renforcement_height]);
}

module sensor_spot_base_renforcement_x() {
    translate([sensor_front_hole_x, sensor_length-sensor_front_hole_y-base_renforcement_width/2,0])
        cube([sensor_width-sensor_front_hole_x*2, base_renforcement_width, base_renforcement_height]);
}

module sensor_spot() {
    difference() {
        sensor_spot_body();
        sensor_spot_cavity();
        sensor_spot_void();
        /* sensor_spot_connection_left_void();
        sensor_spot_connection_right_void(); */
        sensor_spot_connector_void();

    }
    difference() {
        sensor_spot_base();
        sensor_spot_quartz_void();
    }
    sensor_spot_back_colmuns();
    sensor_spot_front_colmuns();

    sensor_spot_base_renforcement_x();
    sensor_spot_base_renforcement_y();
}
