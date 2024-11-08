extends CharacterBody2D




@export_category("Variables")
@export var _speed: float = 200.0
@export var _jump_velocity: float = -300.0
func _physics_process(_delta: float) -> void:
	_vertical_movement(_delta)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * _speed
	else:
		velocity.x = move_toward(velocity.x, 0, _speed)

	move_and_slide()
	
	
func _vertical_movement(_delta: float) -> void:
	# Add the gravity.
	if is_on_floor():
		pass
		
	if not is_on_floor():
		print("Não está no chão!")
		velocity += get_gravity() * _delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = _jump_velocity
