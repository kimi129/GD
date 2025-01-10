extends Sprite2D

@export var player1text:Texture
@export var player2text:Texture
@export var portraitOffset:Vector2 
@export var amountOfRows:int=2

var character=[]
var currentSelected=0
var currentColumnSpot=0
var currentRowSpot=0

@onready var gridContainer=get_parent().get_node("GridContainer")

func _ready():
	for char_name in get_tree().get_nodes_in_group("Characters"):
		character.append(char_name)
	
	texture=player1text

func _process(delta):
	if(Input.is_action_just_pressed("ui_right")):
		currentSelected+=1
		currentColumnSpot+=1
		
		if (currentColumnSpot>gridContainer.columns-1 && currentSelected<character.size()-1):
			position.x-=(currentColumnSpot-1)*portraitOffset.x
			position.y+=portraitOffset.y
			
			currentColumnSpot=0
			currentRowSpot+=1
			
		elif(currentColumnSpot>gridContainer.columns-1 && currentSelected>character.size()-1):
			position.x-=(currentColumnSpot-1)*portraitOffset.x
			position.y-=currentRowSpot*portraitOffset.y
			
			currentColumnSpot=0
			currentRowSpot=0
			currentSelected=0
		else:
			position.x+=portraitOffset.x
		
			
	elif(Input.is_action_just_pressed("ui_left")):
		currentSelected-=1
		currentColumnSpot-=1
		
		if(currentColumnSpot<0 && currentSelected>0):
			position.x+=(gridContainer.columns-1)*portraitOffset.x
			position.y-=(amountOfRows-1)*portraitOffset.y
			
			currentColumnSpot=gridContainer.columns-1
			currentRowSpot-=1
			
		elif(currentColumnSpot<0 && currentSelected<0):
			position.x+=(gridContainer.columns-1)*portraitOffset.x
			position.y+=(amountOfRows-1)*portraitOffset.y
			
			currentColumnSpot=gridContainer.columns-1
			currentRowSpot=amountOfRows-1
			currentSelected=character.size()-1
			
		else:
			position.x-=portraitOffset.x
			

	#elif(Input.is_action_just_pressed("ui_accept")):
		#
		#if(CharacterSelectManager.player==null):
			#CharacterSelectManager.player=CharacterSelectManager.SelectableCharacters[character[currentSelected].name]
			##CharacterSelectManager.player = CharacterSelectManager.SelectableCharacters[character[currentSelected].name]
		#
			#get_tree().change_scene_to_file("res://Stage scenes/Ken's stage.tscn")
		##
	elif(Input.is_action_just_pressed("ui_accept")):
		if CharacterSelectManager.player == null:
			var selected_character_name = character[currentSelected].name
			if CharacterSelectManager.SelectableCharacters.has(selected_character_name):
				CharacterSelectManager.player = CharacterSelectManager.SelectableCharacters[selected_character_name]
				get_tree().change_scene_to_file("res://Stage scenes/Ken's stage.tscn")
		else:
			print("Error: Selected character not found in SelectableCharacters.")
	
