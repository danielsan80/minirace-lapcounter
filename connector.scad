module connector(
    void = false,
    r = 1.5,
    dinstance = 1,
    width = 2,
    height = 3,
    play = 0.2
) {
    $fn=100;
    d = dinstance + r*2;
    w=width;
    h=height;
    d_play = 0;

    function p() = (void) ? play : 0;

    translate([-(d+d_play*2)/2,0,0])
    union() {
        cylinder(r=r+p(),h=h+p());

        translate([d+d_play*2,0,0])
        cylinder(r=r+p(),h=h+p());

        translate([0,-(w+p()*2)/2,0])
        cube([d+d_play*2,w+p()*2, h+p()]);
    }
}
