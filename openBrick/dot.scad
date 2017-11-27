/**
 * @file openBrick/dot.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Modules for rendering dots.
 */

include <dimensions.scad>

/**
 * Renders a 1x1 dot at the height of a plate.
 * @param studs Set to false to not render studs
 */
module openBrick_dot(h=openBrick_plate_height, studs=true){
	block_width = openBrick_block_width;
	block_wall = openBrick_block_wall;
	block_gap = openBrick_block_gap;
	stud_width = openBrick_stud_width;
	stud_height = openBrick_stud_height;
	d = openBrick_d;
	height = h;

	// Render block
	translate([block_width/2, block_width/2]){
		difference(){
			union(){
				// The collar
				translate([0, 0, stud_height+block_gap]){
					cylinder(h=(height-stud_height)-block_gap, d=block_width, $fn=openBrick_fn);
				}
				// The center
				cylinder(h=height, d=block_width-block_wall, $fn=openBrick_fn);
			}
			// The hole
			translate([0, 0, -d]){
				cylinder(h=(height-block_wall)+d, d=stud_width, $fn=openBrick_fn);
			}
		}
	}

	// Render stud
	if(studs){
		translate([block_width/2, block_width/2, height-d]){
			cylinder(h=stud_height+d, d=stud_width, $fn=openBrick_fn);
		}
	}
}
