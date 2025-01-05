extends ColorRect
class_name BgShader
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

@export var bgStartColor:Color
@export var textStartColor:Color

@export var bgWinColor:Color
@export var textWinColor:Color

@export var bgLooseColor:Color
@export var textLooseColor:Color

var bgColor:Color
var textColor:Color

var targetBgColor:Color
var targetTextColor:Color

@export var start_spin_speed:float = 0.36
var current_spin_speed:float = 1.0
#var detrans_current_spin_speed:float = 25.0
@export var end_spin_speed:float = 1.0

var is_detransitioning:bool = false
var transition_time:float=0.0
var is_transitioning:bool = false

@export var detransition_duration:float = 5.0

@export var themeBg:Theme

var bgBg:StyleBoxFlat
var textBg:StyleBoxFlat

var random_noise:float

var detransition_time:float = 0.0

var nothingEverHappens:float=0.0

@export var justeUnChiffre:float = 0.0

@export var test_speed:float = 1.0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bgBg = themeBg.get_stylebox("panel","TitlePanel")
	textBg = themeBg.get_stylebox("panel","PanelText")
	pass # Replace with function body.
	#correct_transition()
#func start_transition(start_color:Color,current_color:Color,end_color:Color,duration:float = 1.0):
	#pass

func setup(trans_time:float,detrans_time:float):
	transition_duration = trans_time
	detransition_duration=detrans_time
	
var t
func start_transition(target_color1:Color=end_color1,target_color2:Color=end_color2,target_color3:Color=end_color3):
	if is_detransitioning or is_transitioning:
		material.set("shader_parameter/colour_1",start_color1)
		material.set("shader_parameter/colour_2",start_color2)
		material.set("shader_parameter/colour_3",start_color3)
		bgBg.bg_color=bgStartColor
		textBg.bg_color=textStartColor
	nothingEverHappens = 5.0
	#print(material.get("shader_parameter/spin_speed"))
	is_detransitioning = false
	is_transitioning = true
	end_color1=target_color1
	end_color2=target_color2
	end_color3=target_color3
	random_noise = randf_range(0,0.1)

func end_transition():
	is_transitioning = false
	is_detransitioning = false
	material.set("shader_parameter/colour_1",start_color1)
	material.set("shader_parameter/colour_2",start_color2)
	material.set("shader_parameter/colour_3",start_color3)
func start_detrans():
	is_transitioning=false
	is_detransitioning=true
	material.set("shader_parameter/colour_1",end_color1)
	material.set("shader_parameter/colour_2",end_color2)
	material.set("shader_parameter/colour_3",end_color3)

func wrong_transition():
	targetBgColor=bgLooseColor
	targetTextColor=textLooseColor
	start_transition(Color("ff0000"),Color("e72678"),Color("8f2678"))

func correct_transition():
	targetBgColor=bgWinColor
	targetTextColor=textWinColor
	start_transition(Color("00ff00"),Color('26e778'),Color("265f7a"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_transitioning:
		transition_time+=delta
		var progress = min(transition_time/transition_duration,1.0)
		progress = ease(progress,0.5)
		bgBg.bg_color = bgStartColor.lerp(targetBgColor,progress)
		textBg.bg_color = textStartColor.lerp(targetTextColor,progress)
		current_color1 = start_color1.lerp(end_color1,progress)
		current_color2 = start_color2.lerp(end_color2,progress)
		current_color3 = start_color3.lerp(end_color3,progress)
		
		material.set("shader_parameter/colour_1",current_color1)
		material.set("shader_parameter/colour_2",current_color2)
		material.set("shader_parameter/colour_3",current_color3)
		
		if progress>=1.0:
			start_detrans()
			transition_time=0.
			detransition_time=0.

	elif is_detransitioning:
		detransition_time+=delta
		var progress = min(detransition_time/detransition_duration,1.0)
		progress = ease(progress,0.5)
		current_color1 = end_color1.lerp(start_color1,progress)
		current_color2 = end_color2.lerp(start_color2,progress)
		current_color3 = end_color3.lerp(start_color3,progress)
		bgBg.bg_color = targetBgColor.lerp(bgStartColor,progress)
		textBg.bg_color = targetTextColor.lerp(textStartColor,progress)
		
		material.set("shader_parameter/colour_1",current_color1)
		material.set("shader_parameter/colour_2",current_color2)
		material.set("shader_parameter/colour_3",current_color3)
		#nothingEverHappens-= justeUnChiffre*delta
		#material.set("shader_parameter/spin_speed",nothingEverHappens)
		#current_spin_speed-=delta*((random_noise)/detransition_duration)/1
		if progress>=1.0:
			end_transition()
			detransition_time=0.

	elif current_spin_speed>start_spin_speed:
		pass
