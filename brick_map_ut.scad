/**
 * @file brick_ut.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Brick unit tests.
 */

include <openBrick/brick.scad>

translate([0, 0]) openBrick_brick_map(
	[[1,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([35, 0]) openBrick_brick_map(
	[[0,1,0],
	 [1,1,1],
	 [1,0,1],
	 [0,1,1]]
);

translate([0, 30]) openBrick_brick_map(
	[[0,1,0],
	 [1,1,1],
	 [1,1,1],
	 [0,1,1]]
);

translate([35, 30]) openBrick_brick_map(
	[[1,1,0],
	 [1,0,1],
	 [1,1,1],
	 [0,1,1]]
);

translate([0, 60]) openBrick_brick_map(
	[[0,1,0],
	 [1,1,0],
	 [1,1,1],
	 [0,1,0]]
);

translate([40, 60]) openBrick_brick_map(
	[[1,0],
	 [1,0],
	 [1,0]]
);
translate([40, 70]) openBrick_brick_map(
	[[0,1,0],
	 [0,1,0],
	 [0,1,0]]
);
translate([40, 80]) openBrick_brick_map(
	[[0,1],
	 [0,1],
	 [0,1]]
);

translate([0, 90]) openBrick_brick_map(
	[[1,1,1],
	 [0,0,0],
	 [0,0,0]]
);
translate([10, 90]) openBrick_brick_map(
	[[0,0,0],
	 [1,1,1],
	 [0,0,0],
	 [0,0,0]]
);
translate([5, 90]) openBrick_brick_map(
	[[0,0,0],
	 [0,0,0],
	 [0,0,0],
	 [1,1,1]]
);
