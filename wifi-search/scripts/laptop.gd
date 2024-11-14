extends Node2D


func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the control key is pressed
	if Input.is_action_just_pressed("laptop_toggle_visibility"):
		# Toggle visibility of the entire node
		visible = not visible

	# Get the node with the name 'wifi'
	var wifi_position = get_node("/root/game/wifi").position
	var player_position = get_node("/root/game/player").position

	# Calculate the distance between the two positions
	var distance = wifi_position.distance_to(player_position)
	if distance > 200:
		visible = false
