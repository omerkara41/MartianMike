extends Node2D

signal player_touch_trap

func _on_area_2d_body_entered(body):
	if body is Player:
		player_touch_trap.emit(body)
