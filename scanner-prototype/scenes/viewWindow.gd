extends Window

@export var sprite : Sprite2D; 

func _ready() -> void:
	sprite  = get_node("Sprite2D");
	sprite.position.x = ProjectSettings.get_setting("display/window/size/viewport_width")/2;
	sprite.position.y = ProjectSettings.get_setting("display/window/size/viewport_height")/2;
	transient = true # Make the window considered as a child of the main window
