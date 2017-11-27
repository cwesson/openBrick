/**
 * @file openBrick/brick.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Modules for rendering bricks.
 */

include <block.scad>

/**
 * Renders a 1x1 brick.
 * @param studs Set to false to not render studs.
 */
module openBrick_brick(studs=true){
	openBrick_block(height=openBrick_brick_height, studs=studs);
}

/**
 * Renders an XxY array of bricks.
 * @param x Number of rows.
 * @param y Number of columns.
 * @param studs Set to false to not render studs.
 */
module openBrick_brick_array(x, y, studs=true){
	openBrick_block_array(x, y, height=openBrick_brick_height, studs=studs);
}

/**
 * Renders an array of bricks based on the given matrix.
 * For each element in the matrix, if the element is not zero, a brick is rendered.
 * @param map Matrix of bricks to render.
 * @param studs Set to false to not render studs.
 */
module openBrick_brick_map(map, studs=true){
	openBrick_block_map(map, height=openBrick_brick_height, studs=studs);
}
