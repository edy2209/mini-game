extends CharacterBody2D

# Kecepatan gerak (jalan)
var speed : float = 200.0
# Kekuatan lompat
var jump_force : float = -400.0
# Gravitasi manual
var gravity : float = 900.0

# Biar bisa akses AnimatedSprite2D dan AudioStreamPlayer
@onready var sprite = $Sprite2D
@onready var run_sound = $RunSound
@onready var jump_sound = $JumpSound

func _physics_process(delta):
	# Pakai velocity dari CharacterBody2D
	velocity = self.velocity

	# Gerak kiri-kanan
	if Input.is_action_pressed("right"):
		velocity.x = speed
		sprite.flip_h = false
	elif Input.is_action_pressed("left"):
		velocity.x = -speed
		sprite.flip_h = true
	else:
		velocity.x = 0

	# Lompat
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		if jump_sound:  # Cek kalau jump_sound ada
			jump_sound.play()

	# Tambahkan gravitasi terus menerus
	if not is_on_floor():
		velocity.y += gravity * delta

	# Ganti animasi sesuai kondisi + atur suara jalan
	if not is_on_floor():
		sprite.play("jumping")
		if run_sound.playing:
			run_sound.stop()
	elif velocity.x != 0:
		sprite.play("runing")
		if not run_sound.playing:
			run_sound.play()
	else:
		sprite.play("default")
		if run_sound.playing:
			run_sound.stop()

	# Apply ke karakter
	self.velocity = velocity
	move_and_slide()
