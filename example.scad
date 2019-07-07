include <frame.scad>

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





module rule(x=0, y=0, z=0) {
    function xx() = x ? x : 10;
    function yy() = y ? y : 10;
    function zz() = z ? z : 10;

/* aaa */
    function value_x() = x ? x : "?";
    function value_xy() = y ? y : value_x();
    function value_xyz() = z ? z : value_xy();
    function value() = str(value_xyz());

    translate([0,-11,0])
    text(value(), size=8);
    cube([xx(),yy(),zz()]);
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
