@tool
class_name GridmapGaeaRenderer
extends GaeaRenderer3D


@export var grid_map: GridMap
## Draws only cells with an empty neighbor.
@export var only_draw_visible_cells: bool = true


func _draw_area(area: AABB) -> void:
	for x in range(area.position.x, area.end.x + 1):
		for y in range(area.position.y, area.end.y + 1):
			for z in range(area.position.z, area.end.z + 1):
				var cell := Vector3i(x, y, z)
				if not generator.grid.has_cell(cell):
					grid_map.set_cell_item(cell, -1)
					continue

				if only_draw_visible_cells and not generator.grid.has_empty_neighbor(cell):
					continue

				var tile_info = generator.grid.get_value(cell)
				if not (tile_info is GridmapTileInfo):
					continue

				grid_map.set_cell_item(cell, tile_info.index)


func _draw() -> void:
	grid_map.clear()
	super._draw()
