$fa = 1;
$fs = 0.4;

/* Fix these */
server_thickness = 44.00;

floor_height = 30.00;
floor_width = server_thickness * 2;

overlap_height = 20.00;
stand_depth = 20.00;

module half()
{
    difference() {
        union() {
            cube([stand_depth, server_thickness/2, floor_height]);
            translate([0,server_thickness/2,0]) cube([stand_depth, server_thickness/2, floor_height+overlap_height]);
        }
        translate([-stand_depth/2, server_thickness*1.5, floor_height-overlap_height]) rotate([45,0 ,0]) cube([stand_depth*2, server_thickness*5, server_thickness*5]);
    }
}


translate ([-stand_depth/2,0,0]) union() {
    half();
    mirror([0,1,0]) half();
}

module support() {
    sup_width = server_thickness*2;
    difference () {
        translate([stand_depth/2,-sup_width/2,0]) cube([stand_depth/2, sup_width, floor_height]);
        translate([stand_depth/2, -sup_width, floor_height*0.75]) rotate([0,45,0]) cube([sup_width,sup_width*2,40]);
        translate([0, 0, floor_height*0.75+40/2]) cube([sup_width,sup_width*2, 40], center=true);
    }
}

support();
mirror([1,0,0]) support();
