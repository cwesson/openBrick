/**
 * @file openBrick/block.scad
 * @author Conlan Wesson <conlan.wesson@gmail.com>
 * @copyright Creative Commons Attribution-NonCommercial-ShareAlike 4.0
 * Generic modules for rendering blocks.
 */

include <dimensions.scad>

/**
 * Renders a 1x1 block.
 * @param height Height of the block.
 * @param studs Set to false to not render studs.
 */
module openBrick_block(height, studs=true){
	block_width = openBrick_block_width;
	block_wall = openBrick_block_wall;
	stud_width = openBrick_stud_width;
	stud_height = openBrick_stud_height;
	hole_width = openBrick_stud_width+(2*openBrick_d);
	d = openBrick_d;

	// Render block
	difference(){
		// The block
		cube([block_width, block_width, height]);
		// The hole
		translate([(block_width-stud_width)/2, (block_width-stud_width)/2, -d]){
			cube([hole_width, hole_width, (height-block_wall)+d]);
		}
	}

	// Render stud
	if(studs){
		translate([block_width/2, block_width/2, height-d]){
			cylinder(h=stud_height+d, d=stud_width, $fn=openBrick_fn);
		}
	}
}

/**
 * Renders an XxY array of blocks.
 * @param x Number of rows.
 * @param y Number of columns.
 * @param height Height of the block.
 * @param studs Set to false to not render studs.
 */
module openBrick_block_array(x, y, height, studs=true){
	assert(x > 0);
	assert(y > 0);

	block_width = openBrick_block_width;
	block_wall = openBrick_block_wall;
	block_gap = openBrick_block_gap;
	d = openBrick_d;

	difference(){
		for(i = [0 : x-1]){
			for(j = [0 : y-1]){
				translate([i*(block_width+block_gap), j*(block_width+block_gap)]){
					openBrick_block(studs=studs, height=height);
					// Fill the gaps
					if(i != 0){
						translate([-(block_gap+d), 0]){
							cube([block_gap+(d*2), block_width, height]);
						}
					}
					if(j != 0){
						translate([0, -(block_gap+d)]){
							cube([block_width, block_gap+(d*2), height]);
						}
					}
					// Corners
					if(i != 0 && j != 0){
						translate([-(block_gap+d), -(block_gap+d)]){
							cube([block_gap+(d*2), block_gap+(d*2), height]);
						}
					}
				}
			}
		}
		
		// Hollow out underside
		translate([block_wall, block_wall, -d]){
			cube([x*(block_width+block_gap)-(2*block_wall), y*(block_width+block_gap)-(2*block_wall), height-block_wall]);
		}
	}
	
	// Render the underside
	peg_width = (block_width+block_gap)-openBrick_stud_width;
	tube_width = sqrt(2)*(block_width+block_gap)-openBrick_stud_width;
	if(x == 1 && y > 1){
		// Pegs for 1xN in X direction
		for(j = [1 : y-1]){
			translate([(block_width/2), (j*(block_width+block_gap))-(block_gap/2)]){
				cylinder(h=height-d, d=peg_width, $fn=openBrick_fn);
			}
		}
	}
	else if(y == 1 && x > 1){
		// Pegs for 1xN in Y direction
		for(i = [1 : x-1]){
			translate([(i*(block_width+block_gap))-(block_gap/2), (block_width/2)]){
				cylinder(h=height-d, d=peg_width, $fn=openBrick_fn);
			}
		}
	}else{
		// Tubes for 2x2 sections
		for(i = [1 : x-1]){
			for(j = [1 : y-1]){
				translate([i*(block_width+block_gap)-(block_gap/2), j*(block_width+block_gap)-(block_gap/2)]){
					difference(){
						cylinder(h=height-d, d=tube_width, $fn=openBrick_fn);
						translate([0, 0, -d]) cylinder(h=height, d=openBrick_stud_width, $fn=openBrick_fn);
					}
				}
			}
		}
	}
}

/**
 * Renders an array of blocks based on the given matrix.
 * For each element in the matrix, if the element is not zero, a block is rendered.
 * @param map Matrix of bricks to render.
 * @param height Height of the block.
 * @param studs Set to false to not render studs.
 */
module openBrick_block_map(map, height, studs=true){
	block_width = openBrick_block_width;
	block_wall = openBrick_block_wall;
	block_gap = openBrick_block_gap;
	d = openBrick_d;


	peg_width = (block_width+block_gap)-(openBrick_stud_width+(2*d));
	tube_width = sqrt(2)*(block_width+block_gap)-(openBrick_stud_width+(2*d));

	for(i = [0 : len(map)-1]){
		for(j = [0 : len(map[i])-1]){
			if(map[i][j] > 0){
				difference(){
					translate([i*(block_width+block_gap), j*(block_width+block_gap)]){ union(){
						cell_h = height*map[i][j]+(map[i][j]-1)*block_gap;
						openBrick_block(studs=studs, height=height*map[i][j]+(map[i][j]-1)*block_gap);
						// Fill the gaps
						if(i > 0 && map[i-1][j]){
							h = min(map[i][j], map[i-1][j]);
							translate([-(block_gap+d), 0]){
								cube([block_gap+(d*2), block_width, height*h+(h-1)*block_gap]);
							}
						}
						if(j > 0 && map[i][j-1]){
							h = min(map[i][j], map[i][j-1]);
							translate([0, -(block_gap+d)]){
								cube([block_width, block_gap+(d*2), height*h+(h-1)*block_gap]);
							}
						}
						// Corners
						if(i > 0 && j > 0 && map[i-1][j] && map[i][j-1] && map[i-1][j-1]){
							h = min(map[i][j], map[i-1][j], map[i][j-1], map[i-1][j-1]);
							translate([-(block_gap+d), -(block_gap+d)]){
								cube([block_gap+(d*2), block_gap+(d*2), height*h+(h-1)*block_gap]);
							}
						}
					}}
					
					// Hollow out underside
					union(){
						if(i+1 < len(map) && map[i+1][j] > 0){
							translate([i*(block_width+block_gap)+2*block_wall, j*(block_width+block_gap)+block_wall, -block_wall]){
								cube([block_width, block_width-(2*block_wall), height]);
							}
						}
						if(i > 0 && map[i-1][j] > 0){
							translate([i*(block_width+block_gap)-2*block_wall, j*(block_width+block_gap)+block_wall, -block_wall]){
								cube([block_width, block_width-(2*block_wall), height]);
							}
						}
						if(j+1 < len(map[i]) && map[i][j+1] > 0){
							translate([i*(block_width+block_gap)+block_wall, j*(block_width+block_gap)+2*block_wall, -block_wall]){
								cube([block_width-(2*block_wall), block_width, height]);
							}
						}
						if(j > 0 && map[i][j-1] > 0){
							translate([i*(block_width+block_gap)+block_wall, j*(block_width+block_gap)-2*block_wall, -block_wall]){
								cube([block_width-(2*block_wall), block_width, height]);
							}
						}
						if(i+1 < len(map)   && j+1 < len(map[i]) && j+1 < len(map[i+1]) &&
							map[i+1][j] > 0 && map[i][j+1] > 0   && map[i+1][j+1] > 0){
							translate([(i+0.5)*(block_width+block_gap), (j+0.5)*(block_width+block_gap), -block_wall]){
								cube([block_width, block_width, height]);
							}
						}
						if(i > 0            && j+1 < len(map[i]) && j+1 < len(map[i-1]) &&
							map[i-1][j] > 0 && map[i][j+1] > 0   && map[i-1][j+1] > 0){
							translate([(i-0.5)*(block_width+block_gap), (j+0.5)*(block_width+block_gap), -block_wall]){
								cube([block_width, block_width, height]);
							}
						}
						if(i+1 < len(map)   && j > 0             &&
							map[i+1][j] > 0 && map[i][j-1] > 0   && map[i+1][j-1] > 0){
							translate([(i+0.5)*(block_width+block_gap), (j-0.5)*(block_width+block_gap), -block_wall]){
								cube([block_width, block_width, height]);
							}
						}
						if(i > 0            && j > 0             &&
							map[i-1][j] > 0 && map[i][j-1] > 0   && map[i-1][j-1] > 0){
							translate([(i-0.5)*(block_width+block_gap), (j-0.5)*(block_width+block_gap), -block_wall]){
								cube([block_width, block_width, height]);
							}
						}
					}
				}

				// Render the underside
				if(i+1 < len(map)   && j+1 < len(map[i]) && j+1 < len(map[i+1]) &&
					map[i+1][j] > 0 && map[i][j+1] > 0   && map[i+1][j+1] > 0){
					// Tubes for 2x2 sections
					translate([(i+1)*(block_width+block_gap)-(block_gap/2), (j+1)*(block_width+block_gap)-(block_gap/2)]){
						difference(){
							cylinder(h=height, d=tube_width, $fn=openBrick_fn);
							translate([0, 0, -d]) cylinder(h=height, d=openBrick_stud_width+d, $fn=openBrick_fn);
						}
					}
				}else{
					// Pegs for 1xN in X direction
					if(i+1 < len(map) && map[i+1][j] > 0 && !(j > 0 && map[i][j-1] > 0 && map[i+1][j-1] > 0)){
						translate([((i+1)*(block_width+block_gap))-(block_gap/2), ((j+0.5)*(block_width+block_gap))-(block_gap/2)]){
							cylinder(h=height, d=peg_width, $fn=openBrick_fn);
						}
					}
					// Pegs for 1xN in Y direction
					if(j+1 < len(map[i]) && map[i][j+1] > 0 && !(i > 0 && map[i-1][j] > 0 && j+1 < len(map[i-1]) && map[i-1][j+1] > 0)){
						translate([((i+0.5)*(block_width+block_gap))-(block_gap/2), ((j+1)*(block_width+block_gap))-(block_gap/2)]){
							cylinder(h=height, d=peg_width, $fn=openBrick_fn);
						}
					}
				}
			}
		}
	}
}
