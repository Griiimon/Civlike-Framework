extends Node3D
class_name FlatTile

@onready var mesh_instance: MeshInstance3D= $MeshInstance3D

func set_material(material: StandardMaterial3D):
	mesh_instance.set_surface_override_material(0, material)
