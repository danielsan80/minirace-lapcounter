include <frame/all.scad>

module sim_frame_rules() {
    translate([-sensor_width_m,-120,0])
    rule(x=403);

    translate([-60,-play-ramp_bottom_length,0])
    rule(y=ramp_bottom_length*2+sensor_length+ramp_top_length+channel_width+play*2);


    translate([0,-80,0])
    rule(x=321);
}

/** FRAME **/
sim_frame_block();

sim_frame_end_left();
sim_frame_end_door_left();
sim_frame_end_right();


sim_ramp_end_left();


/** COVER **/
//sim_channel_cover();
//sim_frame_end_cover_left();
//sim_frame_end_cover_right();


/** SENSOR **/
//sim_sensor();



/* GATE */
/* sim_gate(); */

/* GATE EXT1 */
/* sim_gate_ext1(); */

/* GATE SCALED */
//translate([0,0,frame_height])
//union() {
//    sim_gate_scaled();
//    sim_gate_bolt(true);
//}

/* sim_gate_bolt(); */

/** RULES **/
/* sim_frame_rules(); */
/* sim_gate_rules(); */
/* sim_gate_ext1_rules(); */
