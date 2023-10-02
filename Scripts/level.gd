extends Node2D

@onready var startPos = $StartPosition

# Called when the node enters the scene tree for the first time.
func _ready():
	# Trap grubu altindaki butun node'lari getir. Array olarak gelicek. Saw ve Spike var suan
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.connect("player_touch_trap", _on_trap_player_touch_trap) # Connect all traps signals

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	game_exit()
	game_restart()

func _on_death_zone_body_entered(body):
	player_restart(body)

func _on_trap_player_touch_trap(body):
	player_restart(body)	
	
func player_restart(body):
	body.global_position =startPos. global_position
	body.velocity = Vector2(0,0)
	
func game_exit():
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()

func game_restart():
	if Input.is_action_just_pressed("Reset"):
		get_tree().reload_current_scene()



