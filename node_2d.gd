extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player.connect("hide_object", hide_object)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hide_object(body: Node2D):
	body.hide()
	pass
