extends RigidBody2D
class_name GamePlayer, "res://Images/Car/Car.png"

const SPEED := 60_000
const ROTATION_SPEED := 6_000
const MAX_SPEED := 50

var driving := false

onready var level: GameLevel = get_parent()
onready var wheels := get_tree().get_nodes_in_group("wheel")

func _physics_process(delta: float) -> void:
	driving = false

	if Input.is_action_pressed("ui_right"):
			driving = true
			apply_torque_impulse(-ROTATION_SPEED * delta * 60)

			for _wheel in wheels:
				var wheel: RigidBody2D = _wheel

				if wheel.angular_velocity < MAX_SPEED:
					wheel.apply_torque_impulse(SPEED * delta * 60)

	if Input.is_action_pressed("ui_left"):
			driving = true
			apply_torque_impulse(ROTATION_SPEED * delta * 60)

			for _wheel in wheels:
				var wheel: RigidBody2D = _wheel

				if wheel.angular_velocity > -MAX_SPEED:
					wheel.apply_torque_impulse(-SPEED * delta * 60)

	if driving:
		$EngineSfx.pitch_scale = lerp($EngineSfx.pitch_scale, 2, 2 * delta)
	else:
		$EngineSfx.pitch_scale = lerp($EngineSfx.pitch_scale, 1, 2 * delta)

