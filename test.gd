extends Node2D

var body : RigidBody2D

func _ready():
    # Set up normalized coordinate system
    var vp_size = get_viewport_rect().size
    var scale_factor = vp_size.y
    self.scale = Vector2(scale_factor, scale_factor)

    # Create physics body
    body = RigidBody2D.new()
    body.position = Vector2(0.4, 0.1)
    body.gravity_scale = 1.0  # default is 1.0
    body.mass = 1.0
    add_child(body)

    # Create collision shape (a box)
    var shape = CollisionShape2D.new()
    var box = RectangleShape2D.new()
    box.size = Vector2(0.1, 0.1)
    shape.shape = box
    body.add_child(shape)

    # Add a red square visual
    var image = Image.new()
    image.create(1, 1, false, Image.FORMAT_RGBA8)
    image.fill(Color.RED)
    var tex = ImageTexture.create_from_image(image)

    var sprite = Sprite2D.new()
    sprite.texture = tex
    sprite.scale = Vector2(0.1, 0.1)
    sprite.offset = Vector2.ZERO
    body.add_child(sprite)

    print("Rigid body ready!")
