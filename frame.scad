sensor_height = 59.6;
sensor_width = 39.45;
sensor_thick = 1.5;

quartz_height = 10;
quartz_width = 3.5;
quartz_thick = 4.9 - sensor_thick;

quartz_x_offset = 0.5;
quartz_y_offset = 2;

default_thick = 2;
min_thick = 0.3;

frame_excess = 0.2;

a_few = 10;

play = 0.4;
frame_top_margin = 2;
frame_bottom_margin = 20;
frame_base_height = 1;
frame_height = quartz_width + sensor_thick + frame_base_height;

frame_support_y = 1.5;
frame_support_x = 5;

frame_connection_width = 10;


module sensor() {
    translate([0,0,quartz_thick])
        union() {
            cube([sensor_width, sensor_height, sensor_thick]);
            translate([sensor_width-quartz_width-quartz_x_offset, sensor_height-quartz_height-quartz_y_offset, -quartz_thick])
                cube([quartz_width,quartz_height,quartz_thick]);
        }
}

module frame() {
    
    difference() {

        hull() {
            translate([0,-frame_bottom_margin -play,0])
                cube([sensor_width, sensor_height+frame_bottom_margin + frame_top_margin+ play, min_thick]);
        
            translate([0,-frame_top_margin-play, quartz_thick+sensor_thick+ frame_excess - min_thick ])
            cube([sensor_width, sensor_height+frame_top_margin*2 + play*2, min_thick]);
        }
        
        translate([-play,-play,quartz_thick])
            cube([sensor_width+play*2, sensor_height+play*2, a_few]);
        
        translate([-play,-play,quartz_thick])
            cube([sensor_width+play*2, sensor_height+play*2, a_few]);
        
        translate([-play,-play+frame_support_y,frame_base_height])
        cube([sensor_width+play*2, sensor_height-frame_support_y*2+play*2, a_few]);
        
        translate([-play,-play+frame_support_y,0])
        cube([(sensor_width-frame_connection_width)/2+play, sensor_height-frame_support_y*2+play*2, a_few]);
        
        translate([(sensor_width-frame_connection_width)/2+frame_connection_width+play,-play+frame_support_y,0])
            cube([(sensor_width-frame_connection_width)/2+play, sensor_height-frame_support_y*2+play*2, a_few]);


        translate([frame_support_x+play, sensor_height - a_few/2, frame_base_height])        
            cube([sensor_width-frame_support_x*2-play*2, a_few, a_few]);        
        
        }
        
        
}

color("red")
sensor();

frame();


