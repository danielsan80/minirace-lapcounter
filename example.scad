include <frame.scad>
include <rule.scad>

translate([-sensor_width,0,0])
    frame_end();

translate([sensor_width*9,0,0])
    mirror([1,0,0])
    frame_end();


for (i = [0:7]) {
    translate([sensor_width*i,0,0])
    union() {
        channel_cover();
        frame_module();
        color("blue")
        sensor();
    }
}

translate([-sensor_width/2,(sensor_length+sensor_spot_y_padding+channel_width)/2,sensor_spot_height])
union() {
    scale([1.77,1.77,1.77])
    import("gate/gate.stl");
}









translate([-sensor_width,-120,0])
rule(x=403);

translate([-60,-play-ramp_bottom_length,0])
rule(y=215);

translate([-130,0,0])
rule(z=192);

translate([0,-80,0])
rule(x=321);

translate([-90,0,0])
rule(z=160.5);
