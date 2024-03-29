---
title: 'Generate finite elements by marching cubes'
date: '2023-10-28'
anonymous: "false"
author: 
    - name: Megidd Git
      institution: https://www.nano3dtech.com/
      city: Richmond Hill ON
      country: Canada
      email: megidd.git at gmail
output: pdf_document
abstract: "Generating tetrahedra and hexahedra elements throughout the volume of a 3D model by the marching cubes algorithm"
published: true
bibliography: "delphi"
tags: [finite element, marching cubes, FEA]
---

# Introduction

A novel approach to generate finite elements is presented. The approach takes in 3D models in the STL file format and generates finite elements as the INP file format. The STL file format is used by the 3D content industry to describe the 3D models by their *surface* mesh. The INP file format is used by the engineering industry to describe the 3D models by their *volume* mesh. Any finite element analysis or FEA on a 3D model would need the volume of 3D model to be represented by the finite elements. Converting the representation of a 3D model from surface mesh to volume mesh is a challenge. Available tools and automatic meshers like Gmsh and NetGen aren't using the marching cubes algorithm, as far as we investigated. The tests indicate that the presented approach is fast and accurate even before any optimizations done.

# Result

## 15 first cases

![15 first cases](./15firstcases.svg "15 first cases")

## 15 last cases

![15 last cases](15lastcases.svg "15 last cases")
