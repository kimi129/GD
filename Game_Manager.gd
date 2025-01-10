extends Control

const CONTROL_SCENE_PATH = "res://Stage Select Scene/control.tscn"

# Function to handle hosting the game
func become_host():
	print("Become host pressed")
	MultiplayerManager.become_host()
	_switch_to_game()

# Function to handle joining as player 2
func join_as_player_2():
	print("Join as Player 2")
	MultiplayerManager.join_as_player_2()
	
	_switch_to_game()

# Helper function to change the scene
func _switch_to_game():
	print("Switching to Control Scene at: ", CONTROL_SCENE_PATH)
	var result = get_tree().change_scene_to_file(CONTROL_SCENE_PATH)
	if result == OK:
		print("Scene changed successfully!")
	else:
		print("Error: Could not change scene to: ", CONTROL_SCENE_PATH)
