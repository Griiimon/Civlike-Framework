extends World
class_name MyWorld2D

const TILEMAP_LAYER_MAIN_SURFACE= 0
const TILEMAP_LAYER_GRID= 1

const TILESET_SOURCE_GRID= 0

@onready var tilemap: TileMap = $TileMap
@onready var camera: Camera2D = $Camera2D



func init():
	super()
	create_tileset()

func _ready():
	$SubViewport.world_2d= get_viewport().world_2d

func render_surface(_surface: WorldSurface):
	for x in _surface.width:
		for y in _surface.height:
			var tile:= Vector2i(x, y)
			tilemap.set_cell(TILEMAP_LAYER_MAIN_SURFACE, tile, _surface.tileset_source, _surface.tiles.readv(tile).atlas_index * Vector2(1, 0))
			tilemap.set_cell(TILEMAP_LAYER_GRID, tile, TILESET_SOURCE_GRID, Vector2i.ZERO)



func create_tileset():
	var image= Image.create(GameData.terrains.size() * 128, 128, false, Image.FORMAT_RGB8)

	var src_rect:= Rect2i(Vector2i.ZERO, Vector2.ONE * 128)
	for i in GameData.terrains.size():
		var terrain: TerrainData= GameData.terrains[i]

		assert(terrain.flat_texture)
		var src: Image= terrain.flat_texture.get_image()

		assert(src.data.format == "RGB8")
		image.blit_rect(src, src_rect, Vector2i(i, 0) * 128)
	
	image.save_png("res://tileset.png")
	
	var atlas_texture= ImageTexture.create_from_image(image)
	var atlas_source= TileSetAtlasSource.new()
	atlas_source.use_texture_padding= false
	atlas_source.texture= atlas_texture
	atlas_source.texture_region_size= Vector2i.ONE * 128
	
	for i in GameData.terrains.size():
		atlas_source.create_tile(Vector2i(1, 0) * i)
	
	var tile_set: TileSet= tilemap.tile_set
	tile_set.add_source(atlas_source)


func focus_camera_on_unit(_unit: MapUnitStack):
	var unit2d: MapUnitStack2D= _unit
	
	camera.position= unit2d.get_position()
	


func _on_unit_selected(_unit: MapUnitStack):
	focus_camera_on_unit(_unit)
	
