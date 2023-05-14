size = 80;

edges = [
    [size/2, 0, 0],
    [size, size/2, 0],
    [size/2, size, 0],
    [0, size/2, 0],
    [size/2, 0, size],
    [size, size/2, size],
    [size/2, size, size],
    [0, size/2, size],
    [0, 0, size/2],
    [size, 0, size/2],
    [size, size, size/2],
    [0, size, size/2],
];

corners = [
    [0, 0, 0],
    [size, 0, 0],
    [size, size, 0],
    [0, size, 0],
    [0, 0, size],
    [size, 0, size],
    [size, size, size],
    [0, size, size],
];

edges_and_corners = concat(edges, corners);

// label the edges
    // We are adjusting the labels by custom offsets and rotations.
    translate(edges[0]+[0, 0, -5]) rotate([90, 0, 0]) text("E0", size=5);
    translate(edges[1]+[0, -3, -5]) rotate([90, 0, 90]) text("E1", size=5);
    translate(edges[2]+[5, 0, -5]) rotate([90, 0, 180]) text("E2", size=5);
    translate(edges[3]+[0, 0, -5]) rotate([90, 0, -90]) text("E3", size=5);
    translate(edges[4]+[0, 0, 2]) rotate([90, 0, 0]) text("E4", size=5);
    translate(edges[5]+[0, -3, 2]) rotate([90, 0, 90]) text("E5", size=5);
    translate(edges[6]+[5, 0, 2]) rotate([90, 0, 180]) text("E6", size=5);
    translate(edges[7]+[0, 3, 2]) rotate([90, 0, -90]) text("E7", size=5);
    translate(edges[8]+[-1, 0, 0]) rotate([0, -90, 90]) text("E8", size=5);
    translate(edges[9]+[5, 0, 0]) rotate([90, -90, 0]) text("E9", size=5);
    translate(edges[10]+[1, 0, 0]) rotate([180, -90, 90]) text("E10", size=5);
    translate(edges[11]+[-1, 0, 0]) rotate([0, -90, 0]) text("E11", size=5);

    // label the corner points
    // We are adjusting the labels by custom offsets and rotations.
    translate(corners[0]+[0, 0, -5]) rotate([90, 0, 0]) text("C12", size=5);
    translate(corners[1]+[0, 0, -5]) rotate([90, 0, 0]) text("C13", size=5);
    translate(corners[2]+[0, 0, -5]) rotate([90, 0, 180]) text("C14", size=5);
    translate(corners[3]+[0, 0, -5]) rotate([90, 0, 180]) text("C15", size=5);
    translate(corners[4]) rotate([90, 0, 0]) text("C16", size=5);
    translate(corners[5]) rotate([90, 0, 0]) text("C17", size=5);
    translate(corners[6]) rotate([90, 0, 180]) text("C18", size=5);
    translate(corners[7]) rotate([90, 0, 180]) text("C19", size=5);

module draw_triangles(indices, vertices, triangle_color=[1, 1, 1, 0.4]) {
  assert(len(indices) % 3 == 0, "indices must have a length that is a multiple of 3");

  for (i = [0:len(indices)/3:1]) {
    triangle(
      vertices[indices[i*3]],
      vertices[indices[i*3+1]],
      vertices[indices[i*3+2]],
      triangle_color
    );
    echo("Draw triangle: ", indices[i], indices[i+1], indices[i+2]);
  }
}

module triangle(p1, p2, p3, triangle_color) {
  color(triangle_color) polyhedron(points=[p1, p2, p3], faces=[[0, 1, 2]]);
}

module create_tetrahedra(tetrahedron_count, tetrahedron_indices, tetrahedron_colors) {
    for (i = [0:tetrahedron_count-1]) {
        vertex_indices = tetrahedron_indices[i];

        echo("**RESULT tetrahedron ", i, " indices: ", vertex_indices);

        tetrahedron_vertices = [
            edges_and_corners[vertex_indices[0]],
            edges_and_corners[vertex_indices[1]],
            edges_and_corners[vertex_indices[2]],
            edges_and_corners[vertex_indices[3]]
        ];

        tetrahedron(tetrahedron_vertices, tetrahedron_colors[i]);
    }
}

module tetrahedron(tetrahedron_vertices, tetrahedron_color) {
    color(tetrahedron_color) polyhedron(points=tetrahedron_vertices, faces=[[0, 1, 2], [0, 2, 3], [0, 3, 1], [1, 2, 3]]);
}