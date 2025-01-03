extends Control
class_name InputCatcher
var pressedKeys:Dictionary = {}

@export var manager:Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _notification(what: int) -> void:
	if what == NOTIFICATION_APPLICATION_FOCUS_OUT:
		#print("focused out")
		pressedKeys = {}

func _input(event):
	if event is InputEventKey:
		var code = event.keycode
		#print("keycode : ",code)
		#print("key location : ",event.location)
		var loc:String
		match event.location:
			0:
				loc = ""
			1:
				loc = "Left"
			2:
				loc = "Right"
		var label = OS.get_keycode_string(event.key_label)+loc
		#print("key label : ",label)
		if event.is_pressed():
			pressedKeys[label]=code
			manager.recv_input(pressedKeys)
		elif event.is_released():
#			ICI METTRE TRUC POUR PERDRE QUESTION SI TOUCHE RELACHEE
			pressedKeys.erase(label)
			manager.recv_down_input(pressedKeys)
