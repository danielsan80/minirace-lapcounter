include <frame/frame.scad>
include <modules/rule.scad>

module sim_frame_end_left() {
    translate([-sensor_width,0,0])
    frame_end();
}

module sim_frame_end_right() {
    translate([sensor_width*9,0,0])
    mirror([1,0,0])
    frame_end();
}

module sim_frame_block_array(n=8) {
    for (i = [0:n-1]) {
        translate([sensor_width*i,0,0])
        union() {
            //        channel_cover();
            frame_block();
            //        color("blue")
            //        sensor();
        }
    }
}

module sim_gate_ext1() {
    upright_width = 22;
    gate_ratio = 1.325;

    translate([
        -sensor_width+(upright_width*gate_ratio)/2,
        (sensor_length+sensor_spot_y_padding+channel_width)/2,
        sensor_spot_height]
    )
    union() {
        scale([gate_ratio,gate_ratio,gate_ratio])
        import("gate/mods/gate_ext1.stl");
    }


    translate([-130,0,0])
    rule(z=196.4);

    translate([-90,0,0])
    rule(z=173.5);
}


module sim_gate() {
    translate([-sensor_width/2,(sensor_length+sensor_spot_y_padding+channel_width)/2,sensor_spot_height])
    union() {
        scale([1.77,1.77,1.77])
        import("gate/gate.stl");
    }

    translate([-130,0,0])
    rule(z=192);

    translate([-90,0,0])
    rule(z=160.5);
}


/** FRAME **/
sim_frame_block_array();
sim_frame_end_left();
sim_frame_end_right();


/** RULES **/
translate([-sensor_width,-120,0])
rule(x=403);

translate([-60,-play-ramp_bottom_length,0])
rule(y=ramp_bottom_length*2+sensor_length+ramp_top_length+channel_width+play*2);


translate([0,-80,0])
rule(x=321);


/* GATE */
/* sim_gate(); */



/* GATE EXT1 */
/* sim_gate_ext1(); */
