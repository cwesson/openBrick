/**
 * @file brick_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Brick unit tests.
 */

include <openBrick/brick.scad>

openBrick_brick();

translate([0, 15]) openBrick_brick_array(1, 4);

translate([20, 35]) openBrick_brick_array(4, 1);

translate([20, 0]) openBrick_brick_array(2, 4);

translate([50, 0]) openBrick_brick_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([0, 65]) openBrick_brick_array(1, 4, studs=false);

translate([20, 85]) openBrick_brick_array(4, 1, studs=false);

translate([0, 50]) openBrick_brick(studs=false);

translate([20, 50]) openBrick_brick_array(2, 4, studs=false);

translate([50, 50]) openBrick_brick_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]],
	studs=false
);
