extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var movement = Vector2i(0, 0)
	if Input.is_action_just_pressed("ui_right"):
		movement.x += 1
	if Input.is_action_just_pressed("ui_left"):
		movement.x -= 1
	if Input.is_action_just_pressed("ui_down"):
		movement.y += 1
	if Input.is_action_just_pressed("ui_up"):
		movement.y -= 1

	if movement != Vector2i.ZERO:
		Globals.move_player.emit(movement)
