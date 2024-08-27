extends Area2D

const LASER_SCENE = preload("res://Scenes/laser.tscn")

@export var speed = 100
@export var fire_delay = 0.2

var can_fire = true
var fire_timer = 0
var space_key_pressing = false

signal ship_destroyed

func fire_laser():
	var laser = LASER_SCENE.instantiate()
	var world = get_tree().current_scene
	world.add_child(laser)
	laser.position = position

func _process(delta):
	if Input.is_action_pressed('move_up'):
		position.y -= speed * delta
	if Input.is_action_pressed('move_down'):
		position.y += speed * delta
	if Input.is_action_pressed("ui_accept"):
		if can_fire:
			fire_laser()
			can_fire = false
			fire_timer = fire_delay
		else:
			fire_timer -= delta
			if fire_timer <= 0:
				can_fire = true
	
func _on_area_entered(area):
	queue_free()
	area.queue_free()
	ship_destroyed.emit()
