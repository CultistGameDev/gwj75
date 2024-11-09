extends Node2D

var TypeOfGrid: int = -1
var PlayerPos: Vector2i = Vector2i(0, 0)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	match self.name:
		Globals.TopLeftName:
			TypeOfGrid = Globals.TopLeft
		Globals.TopRightName:
			TypeOfGrid = Globals.TopRight
			self.position = Vector2i(Globals.GridSize * Globals.GridCountX, 0)
			PlayerPos = Vector2i(Globals.GridCountX - 1, 0)
		Globals.BottomLeftName:
			TypeOfGrid = Globals.BottomLeft
			self.position = Vector2i(0, Globals.GridSize * Globals.GridCountY)
			PlayerPos = Vector2i(0, Globals.GridCountY - 1)
		Globals.BottomRightName:
			TypeOfGrid = Globals.BottomRight
			self.position = Vector2i(Globals.GridSize * Globals.GridCountX, Globals.GridSize * Globals.GridCountY)
			PlayerPos = Vector2i(Globals.GridCountX - 1, Globals.GridCountY - 1)
	$Player.position = PlayerPos * Globals.GridSize
	Globals.move_player.connect(move_player)

	var width = $Player/Sprite2D.get_rect().size.x
	var newScale = Globals.GridSize / width
	$Player.set_scale(Vector2(newScale, newScale))

func move_player(delta: Vector2i) -> void:
	match self.name:
		Globals.TopLeftName:
			TypeOfGrid = Globals.TopLeft
		Globals.TopRightName:
			TypeOfGrid = Globals.TopRight
			delta.x *= -1
		Globals.BottomLeftName:
			TypeOfGrid = Globals.BottomLeft
			delta.y *= -1
		Globals.BottomRightName:
			TypeOfGrid = Globals.BottomRight
			delta *= -1

	if delta != Vector2i.ZERO:
		if PlayerPos.x + delta.x >= 0 and PlayerPos.x + delta.x < Globals.GridCountX:
			PlayerPos.x += delta.x
		if PlayerPos.y + delta.y >= 0 and PlayerPos.y + delta.y < Globals.GridCountY:
			PlayerPos.y += delta.y
		
		$Player.position = PlayerPos * Globals.GridSize

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
