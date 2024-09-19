extends Sprite2D

var speed = 400
var angular_rotation = PI
var is_buttonleft_pressed = false
var is_buttonright_pressed = false
var is_buttondown_pressed = false
var is_buttonup_pressed = false

func _init():
	print("Hello World")

func _ready():
	pass

func move_by_input(delta):
	var direction_x = 0
	var direction_y = 0
	
	if Input.is_action_pressed("ui_left"):
		direction_x = -1
	if Input.is_action_pressed("ui_right"):
		direction_x = 1
	if Input.is_action_pressed("ui_up"):
		direction_y = -1
	if Input.is_action_pressed("ui_down"):
		direction_y = 1
	
	rotation += angular_rotation * direction_x * delta
	rotation += angular_rotation * direction_y * delta
	
	var velocity = Vector2(direction_x, direction_y).rotated(rotation) * speed
	position += velocity * delta

func move_by_buttons(delta):
	var direction_x = 0
	var direction_y = 0
	
	if is_buttonleft_pressed:
		direction_x = -1
	if is_buttonright_pressed:
		direction_x = 1
	if is_buttonup_pressed:
		direction_y = -1
	if is_buttondown_pressed:
		direction_y = 1

	var velocity = Vector2(direction_x, direction_y) * speed
	position += velocity * delta

func _process(delta):
	if is_buttonleft_pressed or is_buttonright_pressed or is_buttondown_pressed or is_buttonup_pressed:
		move_by_buttons(delta)
	else:
		move_by_input(delta)

func _on_button_pressed():
	set_process(not is_processing())

func _on_buttonleft_button_down():
	is_buttonleft_pressed = true

func _on_buttonleft_button_up():
	is_buttonleft_pressed = false

func _on_buttonright_button_down():
	is_buttonright_pressed = true

func _on_buttonright_button_up():
	is_buttonright_pressed = false

func _on_buttonup_button_down():
	is_buttonup_pressed = true

func _on_buttonup_button_up():
	is_buttonup_pressed = false

func _on_buttondown_button_down():
	is_buttondown_pressed = true

func _on_buttondown_button_up():
	is_buttondown_pressed = false
