sensor_width_margin_min = 0.4;
sensor_width_margin = 0.4;

sensor_length = 59.6;
sensor_width = 39.45;
sensor_width_m = sensor_width + sensor_width_margin*2;
sensor_thick = 1.5;

sensor_hole_d = 2.7;
sensor_hole_r = sensor_hole_d/2;
sensor_back_hole_x = 5.5 + sensor_hole_r;
sensor_back_hole_y = 5.3 + sensor_hole_r;
sensor_front_hole_x = 1.1 + sensor_hole_r;
sensor_front_hole_y = 14.3 + sensor_hole_r;

quartz_length = 10;
quartz_width = 3.5;
quartz_height = 4.9 + 0.5 - sensor_thick;
quartz_margin_x = 2;
quartz_margin_y = 1;

quartz_x_offset = 0.1;
quartz_y_offset = 2;

sensor_x_padding = 5;
sensor_y_padding = 1.5;

module sensor() {
    translate([sensor_width_margin,0,quartz_height])
        union() {
            difference() {
                cube([sensor_width, sensor_length, sensor_thick]);

                translate([sensor_back_hole_x, sensor_back_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_width-sensor_back_hole_x, sensor_back_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_front_hole_x, sensor_length - sensor_front_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

                translate([sensor_width - sensor_front_hole_x, sensor_length - sensor_front_hole_y, -play])
                    cylinder(r=sensor_hole_r, h=a_few);

            }
            translate([quartz_x_offset, sensor_length-quartz_length-quartz_y_offset, -quartz_height])
                cube([quartz_width,quartz_length,quartz_height]);
        }
}

module sim_sensor(n=8) {
    for (i = [0:n-1]) {
        translate([sensor_width_m*i,0,0])
        union() {
            color("blue")
            sensor();
        }
    }
}
