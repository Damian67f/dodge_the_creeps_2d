extends Area2D
@export var Spedd:int
var velocity:Vector2 = Vector2.ZERO
var screen_size
signal hit

func _ready() -> void:
	screen_size = get_viewport_rect().size
	hide()
	
func _process(delta) -> void:
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
		
	velocity = velocity.normalized() * Spedd
	
	
	if velocity.length() > 0:
		position += velocity * delta
		position = position.clamp(Vector2.ZERO,screen_size)
		$AnimatedSprite2D.play()
	else: $AnimatedSprite2D.stop()
		
	if velocity.x > 0:	
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_v = false
		$AnimatedSprite2D.flip_h = false
	elif  velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
		
	if velocity.y > 0:
		$AnimatedSprite2D.animation = "up"
		$AnimatedSprite2D.flip_v = true
	elif velocity.y < 0:
		$AnimatedSprite2D.flip_v = false
		
	
func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled",true)
	

func  Star(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
	
	
