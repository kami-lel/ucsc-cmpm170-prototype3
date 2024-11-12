extends Window

@export var sprite : Sprite2D; 
@export var main_control : Control;

func _ready() -> void:
	sprite  = get_node("window_texture");
	main_control = get_node("Control");
	sprite.position.x = ProjectSettings.get_setting("display/window/size/viewport_width")/2;
	sprite.position.y = ProjectSettings.get_setting("display/window/size/viewport_height")/2;
	transient = true # Make the window considered as a child of the main window

func clear_control() -> void:
	for child in main_control.get_children():
		if child is not Button:
			continue;
		child.call_deferred("queue_free");
