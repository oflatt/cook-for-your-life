extends Node2D


const Level = preload("res://level.gd")


func _ready():
  var vp_size = get_viewport_rect().size
  var scale_factor = vp_size.y
  self.scale = Vector2(scale_factor, scale_factor)

  # make a level
  add_child(Level.new())
