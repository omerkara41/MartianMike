extends ParallaxBackground

@export var scrool_speed = 15
@onready var sprite2d = $ParallaxLayer/Sprite2D 

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	sprite2d.region_rect.position += delta * Vector2(scrool_speed, scrool_speed)
	
