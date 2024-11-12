extends Sprite2D

var speed : float = 2;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x -= speed;
	if Input.is_action_pressed("ui_right"):
		position.x += speed;
		
	if Input.is_action_pressed("ui_up"):
		position.y -= speed;
	if Input.is_action_pressed("ui_down"):
		position.y += speed;
	pass
