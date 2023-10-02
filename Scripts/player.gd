extends CharacterBody2D

class_name Player

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -300.0

@onready var animated_sprite = $AnimatedSprite2D 

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		# yer cekimi m/s2 oldugundan yani ivmeli, player zamanla daha hizli dusmeye baslicak.
		# Bunu istemiyorsam += yapmaya gerek yok. "=" de gec. Delta aslinda gerekli degil ama
		# gravity m/s2 ve delta'da saniye oldugundan carpımlari velocity'i veriyor
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		jump(JUMP_VELOCITY)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	
	animation_transitions(direction)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func jump(force):
	velocity.y = force

func animation_transitions(direction):
	# 0 olunca default idle animation'a geri donuyor bunu engellemek icin bunu koyduk
	# -1 left, 1 right, 0 ise hicbir yonu belirtmiyor direction icin
	if direction != 0:
		animated_sprite.flip_h = (direction == -1)
	
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("IdleAnimation")
		else:
			animated_sprite.play("RunAnimation")
	else:
		if velocity.y > 0:
			animated_sprite.play("FallAnimation")
		else:
			animated_sprite.play("JumpAnimation")
