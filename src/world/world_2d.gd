extends World
class_name MyWorld2D

@onready var tilemap: TileMap = $TileMap



func init():
	super()
	create_tileset()

func render_surface(_surface: WorldSurface):
	for x in _surface.width:
		for y in _surface.height:
			var pos:= Vector2i(x, y)
			tilemap.set_cell(0, pos, 0, _surface.tiles.readv(pos).atlas_index * Vector2(1, 0))



func create_tileset():
	var image= Image.create(GameData.terrains.size() * 128, 128, false, Image.FORMAT_RGB8)

	var src_rect:= Rect2i(Vector2i.ZERO, Vector2.ONE * 128)
	for i in GameData.terrains.size():
		var terrain: TerrainData= GameData.terrains[i]

		assert(terrain.flat_texture)
		var src: Image= terrain.flat_texture.get_image()

		assert(src.data.format == "RGB8")
		image.blit_rect(src, src_rect, Vector2i(i, 0) * 128)
	
	#image.save_png("res://tileset.png")
	
	var atlas_texture= ImageTexture.create_from_image(image)
	var atlas_source= TileSetAtlasSource.new()
	atlas_source.use_texture_padding= false
	atlas_source.texture= atlas_texture
	atlas_source.texture_region_size= Vector2i.ONE * 128
	
	for i in GameData.terrains.size():
		atlas_source.create_tile(Vector2i(1, 0) * i)
	
	var tile_set: TileSet= tilemap.tile_set
	tile_set.add_source(atlas_source)


