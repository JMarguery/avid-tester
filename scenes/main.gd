extends Node2D
class_name questionAsker

enum Modes {CLASSIC,BLANK,SHUFFLE}

@export var inputCatcher:InputCatcher
@export var questionData:QuestionData

@export var questionText:RichTextLabel

@export var inputText:RichTextLabel

@export var questionMode:Modes=Modes.CLASSIC

@export var timerQuestion:Timer

@export var cooldownTimer:Timer

@export var charAppearSpeed:int=50

@export var timerProgress:ProgressBar

@export var pressedKeys:Array=[]

@export var pauseButton:Button

@export var sliderQuestion:VSlider
@export var sliderCD:VSlider

@export var QuestionSliderLabel:Label
@export var CDSliderLabel:Label

@export var blankText:RichTextLabel

@export var titleAnswer:RichTextLabel

var charAppearTic:float=0
var currentQuestion:Dictionary
var currentAnswers:Array=[]
var inWinRoutine:bool = false
var inLoseRoutine:bool = false

#enum Couleur {RED,GREEN,BLUE,ORANGE,GREY,DARKGREY}

var Colors:Dictionary = {
	"RED":Color("fe4c40"),
	"GREEN":Color("5bdc70"),
	"BLUE":Color("0093fe"),
	"ORANGE":Color("ff9800"),
	"GREY":Color("2e3a3c"),
	"DARKGREY":Color("1b2629"),
	"WHITE":Color("ffffff")
	}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	questionData.set_mode(questionMode)
	get_question()
	_on_question_slider_drag_ended(true)
	_on_cooldown_slider_drag_ended(true)

func get_question() -> void:
	currentQuestion=questionData.get_question()
	questionText.text = "[center]"+currentQuestion["name"]
	questionText.visible_characters = 0
	currentAnswers = []
	if currentQuestion.has("clue"):
		questionMode = Modes.BLANK
	else:
		questionMode = Modes.CLASSIC
	for i in currentQuestion.codes:
		currentAnswers.append(i.keys)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if questionText.visible_characters<questionText.get_total_character_count():
		charAppearTic+=charAppearSpeed*delta
		if charAppearTic>=1:
			questionText.visible_characters+=1
			charAppearTic-=1
	elif timerQuestion.is_stopped() and not inLoseRoutine and not inWinRoutine:
		timerQuestion.start(0)
	elif timerQuestion.is_stopped():
		timerProgress.value = (cooldownTimer.time_left/cooldownTimer.wait_time)*100
		if inLoseRoutine:
			timerProgress.modulate = Colors["RED"]
		if inWinRoutine:
			timerProgress.modulate = Colors["GREEN"]
	if not timerQuestion.is_stopped():
		#print((timerQuestion.time_left/timerQuestion.wait_time))
		timerProgress.value = (timerQuestion.time_left/timerQuestion.wait_time)*100
		if timerProgress.value<=25:
			timerProgress.modulate = Colors["RED"]
		elif timerProgress.value<=50:
			timerProgress.modulate = Colors["ORANGE"]
		else:
			timerProgress.modulate = Colors["BLUE"]
	if inLoseRoutine or inWinRoutine:
		if Input.is_action_just_released("Spacebar"):
			force_next_question()
	if questionMode == Modes.BLANK:
		if blankText.visible_characters<questionText.get_total_character_count():
			pass
			##### A FAIRE ##################
#			mettre en place texte à trou
#
#
#
#
#
#

func recv_input(input:Dictionary) -> void:
	pressedKeys = input.keys()
	if inWinRoutine or inLoseRoutine:
		pass
	else:	
		var strInput:String = "[center]"
		for i in pressedKeys.size():
			strInput+=pressedKeys[i]+" + "
		if pressedKeys!=[]:
			strInput=strInput.left(-3)
		inputText.text = strInput
		for answer in currentAnswers:
			if answer == pressedKeys:
				win_routine()

func recv_down_input(input:Dictionary) -> void:
	pressedKeys = input.keys()
	if inWinRoutine or inLoseRoutine:
		pass
	else:	
		var strInput:String = "[center]"
		for i in pressedKeys.size():
			strInput+=pressedKeys[i]+" + "
		if pressedKeys!=[]:
			strInput=strInput.left(-3)
		inputText.text = strInput
		lose_routine()


func win_routine() -> void:
	inWinRoutine=true
	inputText.modulate = Colors["BLUE"]
	timerQuestion.stop()
	cooldownTimer.start(0)
	if questionMode==Modes.CLASSIC:
		titleAnswer.text = "[center]Correct answer :"
		titleAnswer.modulate = Colors["GREEN"]
	
func lose_routine() -> void:
	inLoseRoutine=true
	inputText.modulate = Colors["GREEN"]
	timerQuestion.stop()
	timerProgress.value = 0
	cooldownTimer.start(0)
	inputText.text = "[center]"
	for ar in currentAnswers:
		inputText.text+="["
		for s in ar:
			inputText.text+=s+" + "
		inputText.text=inputText.text.left(-3)
		inputText.text+="],"
	inputText.text = inputText.text.left(-1)
	if questionMode==Modes.CLASSIC:
		titleAnswer.text = "[center]Correct answer :"
		titleAnswer.modulate = Colors["GREEN"]


func _on_question_timer_timeout() -> void:
	timerQuestion.stop()
	lose_routine()


func _on_cool_down_timer_timeout() -> void:
	#print("skibidi")
	inLoseRoutine=false
	inWinRoutine=false
	get_question()
	inputText.modulate = Colors["ORANGE"]
	inputText.text = "[center]"
	if questionMode==Modes.CLASSIC:
		titleAnswer.text = "[center]Your answer :"
		titleAnswer.modulate = Colors["WHITE"]

func force_next_question() -> void:
	inLoseRoutine = false
	inWinRoutine = false
	
	get_question()
	inputText.modulate = Colors["ORANGE"]
	inputText.text = "[center]"


func _on_pause_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		pauseButton.icon = load("res://art/play_icon2.png")
		timerQuestion.paused = true
		cooldownTimer.paused = true
	else:
		pauseButton.icon = load("res://art/play_icon1.png")
		timerQuestion.paused = false
		cooldownTimer.paused = false


func _on_question_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		var val = sliderQuestion.value
		QuestionSliderLabel.text = str(val)+"S"
		timerQuestion.wait_time = val
		if not inWinRoutine or inLoseRoutine:
			timerQuestion.start()
		

func _on_cooldown_slider_drag_ended(value_changed: bool) -> void:
	if value_changed:
		var val = sliderCD.value
		CDSliderLabel.text = str(val)+"S"
		cooldownTimer.wait_time = val
		if inWinRoutine or inLoseRoutine:
			cooldownTimer.start()
