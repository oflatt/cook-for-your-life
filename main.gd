extends Node2D

var square
var velocity = Vector2.ZERO

func _ready():
	var vp_size = get_viewport_rect().size
	var scale_factor = vp_size.y
	self.scale = Vector2(scale_factor, scale_factor)

	var image = Image.create(1, 1, false, Image.FORMAT_RGBA8)
	image.fill(Color.RED)
	var tex = ImageTexture.create_from_image(image)

	square = Sprite2D.new()
	square.texture = tex
	square.scale = Vector2(0.1, 0.1)
	square.position = Vector2(0.4, 0.1)
	add_child(square)

func _physics_process(_delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized()

	square.position += velocity * 0.01
