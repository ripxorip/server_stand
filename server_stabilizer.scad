$fa = 1;
$fs = 0.4;
$fn = 160;

tot_width = 120.00;
server_thickness = 42.00;

overlap_height = 30.00;
thickness = 5.00;
extra_height = thickness;

rr = 4;

module half()
{
    difference () {

        difference () {
            cube ([tot_width/2, thickness, overlap_height+extra_height]);
            translate([-server_thickness/2, -thickness/2, -overlap_height]) cube ([server_thickness, thickness*2, overlap_height*2]);
        }

        translate([server_thickness/2+rr+thickness, 1.5*thickness, thickness+rr]) rotate ([90, 0, 0])
        hull () {
            ww = tot_width/2-server_thickness/2-2*rr-2*thickness;
            hh = overlap_height+extra_height-2*rr-2*thickness;
          translate([0,0,0]) cylinder(r=rr,h=thickness*2);
          translate([ww,0,0]) cylinder(r=rr,h=thickness*2);
          translate([ww,hh,0]) cylinder(r=rr,h=thickness*2);
          translate([0,hh,0]) cylinder(r=rr,h=thickness*2);
        }
    }

}

half();
mirror([1, 0, 0]) half();
