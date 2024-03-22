extends World
class_name MyWorld2D

@onready var tilemap = $TileMap


func init():
	super()
	create_tileset()

func render_surface(_surface: WorldSurface):
	for x in _surface.width:
		for y in _surface.height:
			var pos:= Vector2i(x, y)
			tilemap.set_cell(_surface.tiles.readv(pos), pos, 0, Vector2i.ZERO)



func create_tileset():
	var image= Image.create(128, 128, false, Image.FORMAT_RGB8)

	for terrain in GameData.terrains:
		assert(terrain.flat_texture)
		var src: Image= terrain.flat_texture.get_image()
		prints("Image format", src.data.format)
		image.blit_rect(src, Rect2i(Vector2i.ZERO, Vector2.ONE * 128), Vector2i.ZERO)
	
	var atlas_texture= ImageTexture.create_from_image(image)
	var atlas_source= TileSetAtlasSource.new()
	atlas_source.use_texture_padding= false
	atlas_source.texture= atlas_texture
	
	# TODO why 8 ??
	atlas_source.create_tile(Vector2i.ZERO, Vector2i.ONE * 8)
	
	var tile_set: TileSet= tilemap.tile_set
	tile_set.add_source(atlas_source)


