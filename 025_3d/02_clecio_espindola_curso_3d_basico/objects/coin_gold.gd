extends Area3D


func _on_body_entered(body: Node3D) -> void:
	if body is CharacterBody3D: # o ideal aqui é colocar o player
		$Collision.disabled = true
		$AnimationPlayer.play('collect')


func _on_animation_player_animation_finished(anim_name:  StringName) -> void:
	if anim_name == 'collect':
		queue_free()
