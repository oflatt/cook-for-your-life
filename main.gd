extends Node2D

func _ready():
	var vp_size = get_viewport_rect().size
	var scale_factor = vp_size.y  # 1.0 = height

	self.scale = Vector2(scale_factor, scale_factor)

	print("Main is running!")

	var image = Image.create(1, 1, false, Image.FORMAT_RGBA8)
	image.fill(Color.RED)
	var tex = ImageTexture.create_from_image(image)

	var sprite = Sprite2D.new()
	sprite.texture = tex
	sprite.scale = Vector2(0.1, 0.1)  # Size relative to height
	sprite.position = Vector2(0.4, 0.1)
	add_child(sprite)
