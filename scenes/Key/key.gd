extends Button
class_name Key

@export var value:String
var possibleValues:Array=[]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if value !=null:
		possibleValues.append(value)
	possibleValues.append(text)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
