module sim_gate_ext1() {
    upright_width = 22;
    gate_ratio = 1.325;

    translate([
        -sensor_width+(upright_width*gate_ratio)/2,
        (sensor_length+y_padding_center+channel_width)/2,
        frame_height]
    )
    union() {
        scale([gate_ratio,gate_ratio,gate_ratio])
        import("gate/mods/gate_ext1.stl");
    }


}

module sim_gate_ext1_rules() {
    translate([-130,0,0])
    rule(z=196.4);

    translate([-90,0,0])
    rule(z=173.5);
}


module sim_gate() {
    translate([-sensor_width/2,(sensor_length+y_padding_center+channel_width)/2,frame_height])
    union() {
        scale([1.77,1.77,1.77])
        import("gate/gate.stl");
    }
}

module sim_gate_rules() {
    translate([-130,0,0])
    rule(z=192);

    translate([-90,0,0])
    rule(z=160.5);
}
