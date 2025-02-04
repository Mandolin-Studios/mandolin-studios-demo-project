@tool
extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#frame = [0,0,1,1,2,2,3,3,4,5].pick_random()
	#get_parent().scale = Vector2(1.25,1.25) * [1.25,1.5,1.1,1.5,1.25,1.25,2,2].pick_random() * 1.5
	
	if not Engine.is_editor_hint():
		material.set_shader_parameter("enabled", true)
		material.set_shader_parameter("mask_offset", DisplayServer.window_get_size()/2.0 - Vector2(0, region_rect.get_center().y) )
	else:
		material.set_shader_parameter("enabled", false);
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
#	pass
