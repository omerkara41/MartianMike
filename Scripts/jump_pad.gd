extends Area2D

@export var jumPadForce = -500

@onready var jumpPadAnimation = $AnimatedSprite2D

func _on_body_entered(body):
	if body is Player:
		jumpPadAnimation.play("JumpPadAnimation")
		body.jump(jumPadForce)
