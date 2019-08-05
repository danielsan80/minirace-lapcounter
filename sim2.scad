
module main_all() {
    include <frame/all.scad>

    /** FRAME **/
    sim_frame_block();

    sim_frame_end_left();
    sim_frame_end_door_left();
    sim_frame_end_right();


    /** COVER **/
    sim_channel_cover();
    sim_frame_end_cover_left();
    sim_frame_end_cover_right();


    /** SENSOR **/
    sim_sensor();

    /* GATE */
    translate([0,0,frame_height])
    union() {
        sim_gate_scaled();
        sim_gate_bolt(true);
    }
}

module backup_all() {
    include <frame/all.scad>

    module backup() {
        /** FRAME **/
        sim_frame_block();

        sim_frame_end_left();
        sim_frame_end_right();


        /** COVER **/
        sim_channel_cover();
        /* sim_frame_end_cover_left();
        sim_frame_end_cover_right(); */


        /** SENSOR **/
        sim_sensor();
    }


    translate([sensor_width_m*8,-play-y_padding_back,0])
    rotate([0,0,180])
    translate([0,play+y_padding_back,0])
    backup();



}



main_all();

backup_all();
