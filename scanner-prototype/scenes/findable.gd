extends Sprite2D

var start_pos : Vector2;
const UNDULATING : int = 3;
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	position = start_pos + Vector2(randf_range(-UNDULATING, UNDULATING), randf_range(-UNDULATING, UNDULATING));
