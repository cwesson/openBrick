/**
 * @file quick_test.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Quick test for printer testing.
 */

include <openBrick/brick.scad>
include <openBrick/plate.scad>

openBrick_brick_array(2, 4);

translate([20, 0]) openBrick_plate_array(2, 4);
