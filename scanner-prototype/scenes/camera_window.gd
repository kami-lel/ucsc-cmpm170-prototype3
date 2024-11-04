extends Node

@onready var _MainWindow: Window = get_window()
@onready var _SubWindow: Window = $Window

var test;

func _ready() -> void:
	#_SubWindow.world_2d = _MainWindow.world_2d
	_SubWindow.size.x = _MainWindow.size.x;
	_SubWindow.size.y = _MainWindow.size.y;
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		test = get_viewport().get_texture().get_image();
		_SubWindow.sprite.texture = ImageTexture.create_from_image(test);
		pass
