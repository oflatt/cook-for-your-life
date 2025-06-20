extends Node2D


# made a new child object for the character of the game
func _ready():
  # This function is called when the node is added to the scene.
  # You can use it to initialize your node.
  print("Node is ready!")
  
  # Example of creating a child node
  var child_node = Node2D.new()
  child_node.name = "Character"
  add_child(child_node)
  print("Child node created: ", child_node.name)
