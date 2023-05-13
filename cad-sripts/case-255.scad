// When all 8 corners of the cube have zero or negative values.
// It means the whole cube is on/inside the 3D model.
// In this case, 6 tetrahedra are generated for the whole cube.

include <cube.scad>;
include <tetrahedron.scad>

// Just to be able to visualize the created tetrahedra with respect to the cube.
labeled_cube();

// Generate tetrahedra by playing around with these:

tetrahedron_count = 6;

tetrahedron_indices = [
        [12+0, 12+4, 12+7, 12+6],
        [12+0, 12+3, 12+7, 12+6],
        [12+0, 12+4, 12+5, 12+6],
        [12+0, 12+1, 12+5, 12+6],
        [12+0, 12+3, 12+2, 12+6],
        [12+0, 12+1, 12+2, 12+6],
    ];

tetrahedron_colors = [
    [1, 0, 0, 0.5],  // red
    [0, 1, 0, 0.5],  // green
    [0, 0, 1, 0.5],  // blue
    [1, 1, 0, 0.5],  // yellow
    [1, 0, 1, 0.5],  // magenta
    [0, 1, 1, 0.5]   // cyan
];

create_tetrahedra(
    tetrahedron_count = tetrahedron_count,
    tetrahedron_indices = tetrahedron_indices,
    tetrahedron_colors = tetrahedron_colors
);
