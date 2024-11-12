extends Sprite2D

var speed : float = 5;
var limit_left : int = 0;
var limit_right : int = 1200;
var limit_top : int = 0;
var limit_bottom : int = 1500;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	if Input.is_action_pressed("ui_left"):
		position.x = clamp(position.x -speed, limit_left, limit_right);
	if Input.is_action_pressed("ui_right"):
		position.x = clamp(position.x +speed, limit_left, limit_right);
		
	if Input.is_action_pressed("ui_up"):
		position.y = clamp(position.y -speed, limit_top, limit_bottom);
	if Input.is_action_pressed("ui_down"):
		position.y = clamp(position.y +speed, limit_top, limit_bottom);
	pass
