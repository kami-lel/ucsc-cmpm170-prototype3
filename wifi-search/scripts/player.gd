extends Node2D

@export var move_speed =300

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# update player position
	position += Input.get_vector('ui_left', 'ui_right', 'ui_up', 'ui_down') * move_speed * delta
