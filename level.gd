
# level class to hold objects in a level
extends Node2D

# import constants
var constants = preload("res://constants.gd")

# This class is responsible for creating the level and adding objects to it.

var player : RigidBody2D

func _ready():
  var playerw = 100.0
  var playerh = 100.0
  var image = Image.create(playerw, playerh, false, Image.FORMAT_RGBA8)
  image.fill(Color.RED)
  var tex = ImageTexture.create_from_image(image)

  player = RigidBody2D.new()
  player.scale = Vector2(1.0, 1.0)
  player.position = Vector2(100, 100)
  player.gravity_scale = 1.0  # default is 1.0
  player.mass = 1.0

  # create box collision shape
  var shape = CollisionShape2D.new()
  var box = RectangleShape2D.new()
  box.size = Vector2(playerw, playerh)
  shape.shape = box
  player.add_child(shape)

  # add a red player visual
  var sprite = Sprite2D.new()
  sprite.centered = false
  sprite.texture = tex
  sprite.scale = Vector2(1.0, 1.0)  # I would expect this to be giant but it's small
  sprite.offset = Vector2.ZERO
  player.add_child(sprite)

  # add a platform at 1.0 y position
  var image2 = Image.create(constants.SWIDTH, 100, false, Image.FORMAT_RGBA8)
  image2.fill(Color.RED)
  var tex2 = ImageTexture.create_from_image(image2)

  var platform = StaticBody2D.new()
  platform.position = Vector2(0.0, constants.SHEIGHT - 100)

  # add rectangle collider
  var platform_shape = CollisionShape2D.new()
  var platform_box = RectangleShape2D.new()
  platform_box.size = Vector2(constants.SWIDTH, 100)
  platform_shape.shape = platform_box
  platform.add_child(platform_shape)


  var platform_sprite = Sprite2D.new()
  platform_sprite.centered = false
  platform_sprite.texture = tex2
  platform_sprite.offset = Vector2.ZERO
  platform.add_child(platform_sprite)
  add_child(platform)

  add_child(player)
