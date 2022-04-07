module roundcube(size=[1,1,1], center=false, radius=0.25) {
    translate(center ? [-size[0]/2, -size[1]/2, -size[2]/2] : [0,0,0])
    union() {
        for(x=[0:1])
            for(y=[0:1])
                for(z=[0:1])
                    translate([
                                x*size[0] - (radius*(x-1)) - (radius*x),
                                y*size[1] - (radius*(y-1)) - (radius*y),
                                z*size[2] - (radius*(z-1)) - (radius*z)
                            ]) sphere(radius);
        
        
        if (size[2]-(radius*2) > 0)
            for(x=[0:1])
                for(y=[0:1])
                    translate([
                                x*size[0] - (radius*(x-1)) - (radius*x),
                                y*size[1] - (radius*(y-1)) - (radius*y),
                                radius
                            ]) cylinder(size[2]-radius*2, radius, radius);
        
        if (size[1]-(radius*2) > 0)
            for(x=[0:1])
                for(z=[0:1])
                    translate([
                                x*size[0] - (radius*(x-1)) - (radius*x),
                                radius,
                                z*size[2] - (radius*(z-1)) - (radius*z)
                            ]) rotate([-90,0,0]) cylinder(size[1]-radius*2, radius, radius);
        
        if (size[0]-(radius*2) > 0)
            for(y=[0:1])
                for(z=[0:1])
                    translate([
                                radius,
                                y*size[1] - (radius*(y-1)) - (radius*y),
                                z*size[2] - (radius*(z-1)) - (radius*z)
                            ]) rotate([0,90,0]) cylinder(size[0]-radius*2, radius, radius);
        
        translate([0, radius, radius]) cube([size[0], size[1]-radius*2, size[2]-radius*2]);
        translate([radius, 0, radius]) cube([size[0]-radius*2, size[1], size[2]-radius*2]);
        translate([radius, radius, 0]) cube([size[0]-radius*2, size[1]-radius*2, size[2]]);
    }
}
