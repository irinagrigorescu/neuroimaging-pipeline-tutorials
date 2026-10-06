# From Voxels to Vertices: Exploring and Checking Cortical Surfaces

[← Back to all tutorials](../README.md)

## Overview

This tutorial introduces cortical surfaces: what they represent, how they
are stored, and why they are useful in neuroimaging. You will explore
surfaces using Connectome Workbench and learn to recognise common
reconstruction errors.

## Before You Start

You will need:

- Connectome Workbench installed.
- The tutorial dataset downloaded.
- A terminal and basic familiarity with navigating directories.

## Contents

0. [What Is a Mesh?](#0-what-is-a-mesh)
1. [What Is a Cortical Surface?](#1-what-is-a-cortical-surface)
2. [Why Use Surfaces?](#2-why-use-surfaces)
3. [How Are Surfaces Represented?](#3-how-are-surfaces-represented)
4. [Exploring Surfaces in Connectome Workbench](#4-exploring-surfaces-in-connectome-workbench)
5. [Checking Surface Quality](#5-checking-surface-quality)
6. [From Individual Surfaces to Group Analysis](#6-from-individual-surfaces-to-group-analysis)
7. [Further Reading](#7-further-reading)

## 0. What Is a Mesh?

A mesh is a digital framework that defines the geometric structure of a 3D object.

![The elements of a mesh](./images/0mesh.png)

Surface meshes: 
* Are composed of 2D polygons.
* They define the boundary of an organ of interest.
* They are generally represented as a closed 2D manifold topologically equivalent to a sphere.

Volume meshes:
* Are composed of 3D polyhedra.
* They fill the entire inside of an object.

In this tutorial we will only be concerned with **triangular surface meshes** that define the **enclosed boundary of the brain**.
And to make it even more clear, I am showing you below what exactly is stored under the hood in one of these surface files.

Specifically, surfaces are made up of:
* VERTICES: N vertices where each vertex has x-/y-/z- coordinates and 
* FACES: M faces where each face is made up of the indices of the nodes that are connected to make up a triangle.

![How our surfaces look like under the hood](./images/1mesh.png)

## 1. What Is a Cortical Surface?

A cortical surface is a 3D representation of a boundary of the cerebral cortex.
Unlike an MRI volume, which represents the brain as a grid of voxels, a surface follows the shape of that boundary using connected triangles.

Two commonly reconstructed cortical boundaries are:
- **White matter** surface: the boundary between cortical grey matter and the underlying white matter.
- **Pial** surface: the outer boundary of the cortex, adjacent to cerebrospinal fluid.

Together, these surfaces describe the cortical ribbon: the layer of cortical grey matter between them.

![Volumetric vs. surface-based representations](./images/0corticalsurface.png)

![Different types of surfaces](./images/1corticalsurfaces.png)

## 2. Why Use Surfaces?

## 3. How Are Surfaces Represented?

## 4. Exploring Surfaces in Connectome Workbench

## 5. Checking Surface Quality

## 6. From Individual Surfaces to Group Analysis

## 7. Further Reading

--- 

## 👥 Authors
*   **Irina Grigorescu** 

*Last Updated: October 2026*
