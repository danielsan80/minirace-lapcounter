gate_bolt_r = 4;
gate_bolt_h = 10;
gate_upright_width=28.334;
gate_upright_length=68.9;
$fn=100;

module sim_gate_original() {
    translate([-sensor_width_m/2,(sensor_length+y_padding_center+channel_width)/2,frame_height])
    union() {
        scale([1.77,1.77,1.77])
        import("gate/1.0_original/gate.stl");
    }
}

module sim_gate_original_rules() {
    translate([-130,0,0])
    rule(z=192);

    translate([-90,0,0])
    rule(z=160.5);
}

module sim_gate_ext() {
    upright_width = 22;
    upright_shift = 0.41225;
    gate_ratio = 1.287908;

    translate([
        -sensor_width_m/2,
        (sensor_length+y_padding_center+channel_width)/2,
        frame_height]
    )
    union() {
        scale([gate_ratio,gate_ratio,gate_ratio])
        translate([-upright_shift,0,0])
        import("gate/1.1_ext/gate.stl");
    }

    /* translate([-sensor_width_m,20,0])
    color("blue")
    rule(x=(sensor_width_m-(upright_width*gate_ratio))/2);

    translate([-(sensor_width_m-upright_width*gate_ratio)/2-upright_width*gate_ratio,12,0])
    color("green")
    rule(x=upright_width*gate_ratio);

    translate([sensor_width_m*9-(sensor_width_m-(upright_width*gate_ratio))/2,20,0])
    color("blue")
    rule(x=(sensor_width_m-(upright_width*gate_ratio))/2);

    translate([sensor_width_m*9-(sensor_width_m-upright_width*gate_ratio)/2-upright_width*gate_ratio,12,0])
    color("green")
    rule(x=upright_width*gate_ratio); */
}

module sim_gate_ext_rules() {
    translate([-130,0,0])
    rule(z=196.4);

    translate([-90,0,0])
    rule(z=173.5);
}



module sim_gate_scaled() {
    translate([
        -(sensor_width+sensor_width_margin_min)/2,
        (sensor_length+y_padding_center+channel_width)/2,
        frame_height]
    )
    union() {
        import("gate/1.2_scale/upright_1.2.1.stl");

        translate([1.4,0.2,149.75])
        import("gate/1.2_scale/angle_L_1.2.2.stl");

        translate([175.6,0,149.75+13.6])
        union() {
            import("gate/1.2_scale/traverse_L_1.2.4.stl");
            import("gate/1.2_scale/traverse_R_1.2.4.stl");
        }

        translate([360.8,0.2,149.75])
        import("gate/1.2_scale/angle_R_1.2.2.stl");

        translate([362.15,0,0])
        import("gate/1.2_scale/upright_1.2.1.stl");
    }

}

module gate_bolt(void = false) {
    function p() = void? 0 : 0.4;
    color("red")
    cylinder(r=gate_bolt_r-p(), h=gate_bolt_h);
}

module gate_bolts(void=false) {
    union() {
        gate_bolt(void);

        translate([0,gate_upright_length/4,0])
        gate_bolt(void);

        translate([0,-gate_upright_length/4,0])
        gate_bolt(void);
    }
}

module sim_gate_bolts(void=false) {
    translate([
        -sensor_width_m/2,
        (sensor_length+y_padding_center+channel_width)/2,
        frame_height]
    )
    color("red")
    gate_bolts(void);
}

module sim_gate_bolt(void=false) {
    translate([
        -sensor_width_m/2,
        (sensor_length+y_padding_center+channel_width)/2,
        frame_height]
    )
    color("red")
    gate_bolt(void);
}



/** ALIASES **/

module sim_gate_ext1() {
    sim_gate_ext();
}
module sim_gate_ext1_rules() {
    sim_gate_ext_rules();
}

module sim_gate() {
    sim_gate_original();
}
module sim_gate_rules() {
    sim_gate_original_rules();
}
