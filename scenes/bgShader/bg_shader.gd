extends ColorRect

@export var start_color1:Color
@export var start_color2:Color
@export var start_color3:Color

@export var end_color1:Color
@export var end_color2:Color
@export var end_color3:Color

var current_color1:Color
var current_color2:Color
var current_color3:Color
@export var transition_duration:float = 1.0


@export var start_spin_speed:float = 1.0
var current_spin_speed:float = 1.0
var detrans_current_spin_speed:float = 50.0
@export var end_spin_speed:float = 50.0

var is_detransitioning:bool = false
var transition_time:float=0.0
var is_transitioning:bool = false

@export var detransition_duration:float = 1.0

var detransition_time:float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	start_transition()
#func start_transition(start_color:Color,current_color:Color,end_color:Color,duration:float = 1.0):
	#pass

func start_transition(target_color1:Color=end_color1,target_color2:Color=end_color2,target_color3:Color=end_color3):
	is_transitioning = true
	end_color1=target_color1
	end_color2=target_color2
	end_color3=target_color3
	print("start trans")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_transitioning:
		transition_time+=delta
		var progress = min(transition_time/transition_duration,1.0)
		progress = ease(progress,0.5)
		
		current_color1 = start_color1.lerp(end_color1,progress)
		current_color2 = start_color2.lerp(end_color2,progress)
		current_color3 = start_color3.lerp(end_color3,progress)
		
		current_spin_speed+=delta*(end_spin_speed/transition_duration)
		print("spin speed ^ = ",current_spin_speed)
		
		if progress>=1.0:
			is_transitioning=false
			is_detransitioning=true
			print("start detrans")
			current_color1 = end_color1
			current_color2 = end_color2
			current_color3 = end_color3
			transition_time=0.
			detransition_time=0.
			current_spin_speed=detrans_current_spin_speed
		material.set("shader_parameter/colour_1",current_color1)
		material.set("shader_parameter/colour_2",current_color2)
		material.set("shader_parameter/colour_3",current_color3)
		material.set("shader_parameter/spin_speed",current_spin_speed)
	elif is_detransitioning:
		detransition_time+=delta
		var progress = min(detransition_time/detransition_duration,1.0)
		progress = ease(progress,0.5)
		current_color1 = end_color1.lerp(start_color1,progress)
		current_color2 = end_color2.lerp(start_color2,progress)
		current_color3 = end_color3.lerp(start_color3,progress)
		material.set("shader_parameter/colour_1",current_color1)
		material.set("shader_parameter/colour_2",current_color2)
		material.set("shader_parameter/colour_3",current_color3)
		#self.material.shader.shader_parameter.colour_1 = current_color1
		current_spin_speed-=delta*((end_spin_speed-start_spin_speed)/detransition_duration)
		print("spin speed V = ",current_spin_speed)
		if progress>=1.0:
			is_detransitioning=false
			detransition_time=0.
			print("stop detrans")
			current_spin_speed=start_spin_speed
			#current_spin_speed = 50.0
		material.set("shader_parameter/spin_speed",current_spin_speed)
