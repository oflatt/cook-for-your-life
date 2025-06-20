
# level class to hold objects in a level
extends Node2D

# This class is responsible for creating the level and adding objects to it.

var player : RigidBody2D

func _ready():
  # set position to top left
  self.position = Vector2.ZERO

  var image = Image.create(100, 100, false, Image.FORMAT_RGBA8)
  image.fill(Color.RED)
  var tex = ImageTexture.create_from_image(image)

  player = RigidBody2D.new()
  player.scale = Vector2(1.0, 1.0)
  player.position = Vector2(0.4, 0.1)
  player.gravity_scale = 1.0  # default is 1.0
  player.mass = 1.0

  # create box collision shape
  var shape = CollisionShape2D.new()
  var box = RectangleShape2D.new()
  box.size = Vector2(0.1, 0.1)
  shape.shape = box
  player.add_child(shape)

  # add a red player visual
  var sprite = Sprite2D.new()
  sprite.texture = tex
  sprite.scale = Vector2(1.0, 1.0)  # I would expect this to be giant but it's small
  sprite.offset = Vector2.ZERO
  player.add_child(sprite)

  # add a platform at 1.0 y position
  var platform = StaticBody2D.new()
  platform.scale = Vector2(1.0, 1.0)
  platform.position = Vector2(0.5, 1.0)

  var platform_sprite = Sprite2D.new()
  platform_sprite.texture = tex
  platform_sprite.scale = Vector2(1.0, 1.0) 
  platform_sprite.offset = Vector2.ZERO
  platform.add_child(platform_sprite)
  add_child(platform)

  add_child(player)
