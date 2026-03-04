extends CharacterBody2D
























































@export var speed = 150
const rotation_speed = 3.5

var rotation_direction = 0
var is_flipped = false



func get_input():
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	if(direction.x>0 and is_flipped==false): 
		$"SharkSprite(Sprite2D)".flip_h=true
		is_flipped = true
	elif(direction.x<0 and is_flipped):
		$"SharkSprite(Sprite2D)".flip_h=false
		is_flipped = false















const CONST_SPRINT = 600

var is_boosting = false
var can_boost = true

func coral_rush() -> void:
	if(Input.is_action_pressed("boost") and $BoostProgress.value==100):
		print("it happened")
		$BoostProgress.value=0
		speed<<=1
		$GoldRush.start()
		
func boost_forward() -> void:
	if(can_boost == true):
		can_boost=false
		$DoubleTap.start()
		speed<<=6
		
		
		
func _physics_process(delta) -> void:
	get_input()
	coral_rush()
	#boost_forward()
	move_and_slide()


















#NOTE we are using a rotation absed movement
#speed NOTE must be negative


func _on_gold_rush_timeout() -> void:
	speed>>=1


func _on_double_tap_timeout() -> void:
	speed>>=1
