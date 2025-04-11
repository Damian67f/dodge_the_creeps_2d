extends RigidBody2D


func _ready() -> void:
	var mob_tipes = Array($AnimatedSprite2D.sprite_frames.get_animation_names())
	$AnimatedSprite2D.animation = mob_tipes.pick_random()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
