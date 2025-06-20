extends Node2D


const Level = preload("res://level.gd")


func _ready():
  # make a level
  add_child(Level.new())
