$fa = 1;
$fs = 0.4;

/* Fix these */
server_thickness = 50.00;

floor_height = 50.00;
floor_width = server_thickness * 2;

overlap_height = 30.00;
stand_depth = 50.00;

module half()
{
    difference() {
        union() {
            cube([stand_depth, server_thickness/2, floor_height]);
            translate([0,server_thickness/2,0]) cube([stand_depth, server_thickness, floor_height+overlap_height]);
        }
        translate([-stand_depth/2, server_thickness*2, overlap_height]) rotate([45,0 ,0]) cube([stand_depth*2, server_thickness*5, server_thickness*5]);
    }
}

half();
mirror([0,1,0]) half();
