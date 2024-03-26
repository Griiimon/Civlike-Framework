class_name Diplomacy

const ENEMY_THRESHOLD= -50

static var factions: Array[Faction]

static var relations:= {}

static var player_faction: Faction


static func init_relations():
	for faction in factions:
		var relations_row:= {}
		for other_faction in factions:
			if faction != other_faction:
				relations_row[other_faction]= 0
		
		relations[faction]= relations_row

static func are_factions_enemies(faction1: Faction, faction2: Faction)-> bool:
	return relations[faction1][faction2] < ENEMY_THRESHOLD

static func get_player_faction()-> Faction:
	if not player_faction:
		player_faction= Faction.new("Player")
	return player_faction

static func add_faction(_faction: Faction):
	factions.append(_faction)

static func remove_faction(_faction: Faction):
	factions.erase(_faction)

