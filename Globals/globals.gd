extends Node

const TopLeftName = "Grid(0,0)"
const TopRightName = "Grid(1,0)"
const BottomLeftName = "Grid(0,1)"
const BottomRightName = "Grid(1,1)"
const TopLeft = 0
const TopRight = 1
const BottomLeft = 2
const BottomRight = 3

const GridSize = 32
const GridCountX = 10
const GridCountY = 10

signal move_player(delta: Vector2i)
