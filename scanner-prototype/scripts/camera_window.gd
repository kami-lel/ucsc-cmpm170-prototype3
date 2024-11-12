extends Node

@onready var _MainWindow: Window = get_window()
@onready var _SubWindow: Window = $Window
@onready var environ : Node = get_node("Environment");
var selector_button : PackedScene = load("res://scenes/selector_button.tscn");
var scan_shader := load("res://shaders/scan_shader.gdshader");

var test;

func _ready() -> void:
	#_SubWindow.world_2d = _MainWindow.world_2d
	_SubWindow.size.x = _MainWindow.size.x;
	_SubWindow.size.y = _MainWindow.size.y;
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		test = get_viewport().get_texture().get_image();
		_SubWindow.sprite.texture = ImageTexture.create_from_image(test);
		
		# Draw shader on the new window
		var scan_material = ShaderMaterial.new();
		scan_material.shader = scan_shader;
		scan_material.set_shader_parameter("input_texture", _SubWindow.sprite.texture);
		_SubWindow.sprite.material = scan_material;
		
		draw_boxes();

func draw_boxes() -> void:
	_SubWindow.clear_control();
	for child in environ.get_children():
		if child is not Sprite2D:
			continue;
		var button : Button = make_selector(child);
		if child.name == "dude":
			button.pressed.connect(func():
				print_debug(child);
				button.modulate = Color(0.294, 0.737, 0)
				);
		else:
			button.pressed.connect(func():
				print_debug(child);
				button.modulate = Color(0.849, 0.188, 0)
				);

			
		
func make_selector(linked_node : Sprite2D) -> Button:
		var button : Button = selector_button.instantiate();
		button.size = linked_node.texture.get_size() * linked_node.scale;
		_SubWindow.main_control.add_child(button);
		button.position = linked_node.position - button.get_rect().size*.5;
		return button;
		
