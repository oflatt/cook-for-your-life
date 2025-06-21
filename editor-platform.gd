@tool
extends Sprite2D

func _ready():
  setup()

func setup():
  var playerw = 100.0
  var playerh = 100.0
  var image = Image.create(playerw, playerh, false, Image.FORMAT_RGBA8)
  image.fill(Color.RED)
  var tex = ImageTexture.create_from_image(image)

  self.texture = tex