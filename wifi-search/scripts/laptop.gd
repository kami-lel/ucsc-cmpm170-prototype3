extends Node2D

var key_count: int = 0
const TOTAL_KEY: float = 200.0

func _ready():
	visible = false
	key_count = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Check if the control key is pressed
	if Input.is_action_just_pressed("laptop_toggle_visibility"):
		# ToggProgressBarle visibility of the entire node
		visible = not visible

	if visible:
		# Get the node with the name 'wifi'
		var wifi_position = get_node("/root/game/wifi").position
		var player_position = get_node("/root/game/player").position

		# Calculate the distance between the two positions
		var distance = wifi_position.distance_to(player_position)
		if distance > 150:
			visible = false


		$strength.value = Game.wifi_strength
		$progress.value = key_count / TOTAL_KEY


func _input(event):
	if visible and event is InputEventKey and event.pressed:
		# Increment the count for every key press event
		key_count += 1
