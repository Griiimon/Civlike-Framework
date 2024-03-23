class_name Diplomacy

const ENEMY_THRESHOLD= -50

var factions: Array[Faction]

var relations:= {}

func _init():
	for faction in factions:
		var relations_row:= {}
		for other_faction in factions:
			if faction != other_faction:
				relations_row[other_faction]= 0
		
		relations[faction]= relations_row

func are_factions_enemies(faction1: Faction, faction2: Faction)-> bool:
	return relations[faction1][faction2] < ENEMY_THRESHOLD
