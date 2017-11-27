/**
 * @file openBrick/plate.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Modules for rendering plates (1/3 the height of a brick).
 */

include <block.scad>

/**
 * Renders a 1x1 plate.
 * @param studs Set to false to not render studs.
 */
module openBrick_plate(studs=true){
	openBrick_block(height=openBrick_plate_height, studs=studs);
}

/**
 * Renders an XxY array of plates.
 * @param x Number of rows.
 * @param y Number of columns.
 * @param studs Set to false to not render studs.
 */
module openBrick_plate_array(x, y, studs=true){
	openBrick_block_array(x, y, height=openBrick_plate_height, studs=studs);
}

/**
 * Renders an array of plates based on the given matrix.
 * For each element in the matrix, if the element is not zero, a plate is rendered.
 * @param map Matrix of bricks to render.
 * @param studs Set to false to not render studs.
 */
module openBrick_plate_map(map, studs=true){
	openBrick_block_map(map, height=openBrick_plate_height, studs=studs);
}

