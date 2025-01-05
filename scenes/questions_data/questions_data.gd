extends Node2D
class_name QuestionData
@export var manager:Node2D
var shortcutGuess:Dictionary = {
	"shortcuts": [
		{
			"name": "Show or hide the Transport window",
			"codes": [
				{
					"keys": ["CtrlLeft", "Kp 1"]
				}
			]
		},
		{
			"name": "Start and stop playback",
			"codes": [
				{
					"keys": ["Space"]
				}
			]
		},
		{
			"name": "Move the playback cursor to the beginning of the session's timeline",
			"codes": [
				{
					"keys": ["Enter"]
				}
			]
		},
		{
			"name": "Move the playback cursor to the end of the session's timeline",
			"codes": [
				{
					"keys": ["AltLeft", "Enter"]
				}
			]
		},
		{
			"name": "Save your session",
			"codes": [
				{
					"keys": ["CtrlLeft", "S"]
				}
			]
		},
		{
			"name": "Open the Save As dialog box",
			"codes": [
				{
					"keys": ["CtrlLeft", "WindowsLeft", "S"]
				}
			]
		},
		{
			"name": "Cut",
			"codes": [
				{
					"keys": ["CtrlLeft", "X"]
				}
			]
		},
		{
			"name": "Copy",
			"codes": [
				{
					"keys": ["CtrlLeft", "C"]
				}
			]
		},
		{
			"name": "Paste",
			"codes": [
				{
					"keys": ["CtrlLeft", "V"]
				}
			]
		},
		{
			"name": "Clear",
			"codes": [
				{
					"keys": ["CtrlLeft", "B"]
				}
			]
		},
		{
			"name": "Undo",
			"codes": [
				{
					"keys": ["CtrlLeft", "Z"]
				}
			]
		},
		{
			"name": "Redo",
			"codes": [
				{
					"keys": ["ShiftLeft", "CtrlLeft", "Z"]
				}
			]
		},
		{
			"name": "Duplicate",
			"codes": [
				{
					"keys": ["CtrlLeft", "D"]
				}
			]
		},
		{
			"name": "Repeat",
			"codes": [
				{
					"keys": ["AltLeft", "R"]
				}
			]
		},
		{
			"name": "Separate Clip At Selection",
			"codes": [
				{
					"keys": ["CtrlLeft", "E"]
				}
			]
		},
		{
			"name": "Heal Separation",
			"codes": [
				{
					"keys": ["CtrlLeft", "H"]
				}
			]
		},
		{
			"name": "Consolidate Clip",
			"codes": [
				{
					"keys": ["ShiftLeft", "AltLeft", "3"]
				}
			]
		},
		{
			"name": "Nudge later in time",
			"codes": [
				{
					"keys": ["Add"]
				},
				{
					"keys": ["Comma"]
				}
			]
		},
		{
			"name": "Nudge earlier",
			"codes": [
				{
					"keys": ["Minus"]
				},
				{
					"keys": ["Period"]
				}
			]
		},
		{
			"name": "create a new session",
			"codes": [
				{
					"keys": ["CtrlLeft", "N"]
				}
			]
		},
		{
			"name": "Toggle between the Mix and Edit windows",
			"codes": [
				{
					"keys": ["CtrlLeft", "Equal"]
				}
			]
		},
		{
			"name": "Toggle between Narrow Mix view and Normal view",
			"codes": [
				{
					"keys": ["AltLeft", "CtrlLeft", "M"]
				}
			]
		},
		{
			"name": "Create a Fade-in, fade-out, or crossfade",
			"codes": [
				{
					"keys": ["CtrlLeft", "F"]
				}
			]
		},
		{
			"name": "Create a Fade-in from the start of a clip to the Edit cursor position",
			"codes": [
				{
					"keys": ["D"]
				}
			]
		},
		{
			"name": "Create a Fade-out from the end of a clip to the Edit cursor position",
			"codes": [
				{
					"keys": ["G"]
				}
			]
		},
		{
			"name": "Create a crossfade over a selected area",
			"codes": [
				{
					"keys": ["F"]
				}
			]
		},
		{
			"name": "Create Batch Fades",
			"codes": [
				{
					"keys": ["CtrlLeft", "F"]
				}
			]
		},
		{
			"name": "Horizontally Zoom Out",
			"codes": [
				{
					"keys": ["R"]
				}
			]
		},
		{
			"name": "Horizontally Zoom In",
			"codes": [
				{
					"keys": ["T"]
				}
			]
		},
		{
			"name": "Enable or disable Insertion Follows Playback",
			"codes": [
				{
					"keys": ["N"]
				}
			]
		},
		{
			"name": "Scroll the Edit window screen to the Playback cursor, or the beginning of a selected area on the timeline",
			"codes": [
				{
					"keys": ["Left"]
				}
			]
		},
		{
			"name": "Scroll the Edit window screen to the Playback cursor, or the end of a selected area on the timeline",
			"codes": [
				{
					"keys": ["Right"]
				}
			]
		},
		{
			"name": "Shuffle Edit Mode",
			"codes": [
				{
					"keys": ["F1"]
				}
			]
		},
		{
			"name": "Slip Edit Mode",
			"codes": [
				{
					"keys": ["F2"]
				}
			]
		},
		{
			"name": "Spot Edit Mode",
			"codes": [
				{
					"keys": ["F3"]
				}
			]
		},
		{
			"name": "Grid Edit Mode",
			"codes": [
				{
					"keys": ["F4"]
				}
			]
		},
		{
			"name": "Zoomer tool",
			"codes": [
				{
					"keys": ["F5"]
				}
			]
		},
		{
			"name": "Trim tool",
			"codes": [
				{
					"keys": ["F6"]
				}
			]
		},
		{
			"name": "Selector tool",
			"codes": [
				{
					"keys": ["F7"]
				}
			]
		},
		{
			"name": "Grabber tool",
			"codes": [
				{
					"keys": ["F8"]
				}
			]
		},
		{
			"name": "Smart tool",
			"codes": [
				{
					"keys": ["F6", "F7", "F8"]
				}
			]
		},
		{
			"name": "Begin Recording",
			"codes": [
				{
					"keys": ["CtrlLeft", "Space"]
				},
				{
					"keys": ["F12"]
				},
				{
					"keys": ["Kp 3"]
				}
			]
		},
		{
			"name": "Enable or disable Pre-roll and Post roll",
			"codes": [
				{
					"keys": ["CtrlLeft", "K"]
				}
			]
		},
		{
			"name": "Wait for note",
			"codes": [
				{
					"keys": ["F11"]
				}
			]
		},
		{
			"name": "Virtual MIDI board",
			"codes": [
				{
					"keys": ["ShiftLeft", "K"]
				}
			]
		},
		{
			"name": "Open the New Tracks dialog box",
			"codes": [
				{
					"keys": ["ShiftLeft", "CtrlLeft", "N"]
				}
			]
		},
		{
			"name": "Open a new Workspace browser",
			"codes": [
				{
					"keys": ["AltLeft", "I"]
				}
			]
		},
		{
			"name": "Bring all Workspace browsers to the front",
			"codes": [
				{
					"keys": ["AltLeft", "J"]
				}
			]
		},
		{
			"name": "Open the Bounce Mix dialog box",
			"codes": [
				{
					"keys": ["CtrlLeft", "AltLeft", "B"]
				}
			]
		}
	]
}
var blankGuess:Dictionary = {
	"shortcuts": [
		{
			"name": "Move tool clusters laterally along the Edit window toolbar",
			"clue": "Hold the %KEY% key and click and drag the tool cluster to a new location",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		},
		{
			"name": "Select (and deselect) all tracks in your session",
			"clue": "Click any track name while holding the %KEY% key",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Show (or hide) all tracks in your session",
			"clue": "Click any track's Show/Hide icon while holding the %KEY% key",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Advance to the next or previous tracks' Track Name dialog box",
			"clue": "In the Name Tracks dialog box, hold %KEY% and press the %KEY% key or the Left Arrow key",
			"codes": [
				{
					"keys": ["CtrlLeft", "Right"]
				},
				{
					"keys": ["CtrlLeft", "Left"]
				}
			]
		},
		{
			"name": "Change the height of all tracks in your session",
			"clue": "Hold the %KEY% key while changing any track's height",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Change the height of all selected tracks in your session",
			"clue": "Hold the %KEY% + %KEY% key while changing any selected track's height",
			"codes": [
				{
					"keys": ["AltLeft", "ShiftLeft"]
				}
			]
		},
		{
			"name": "Solo or mute all tracks in your session",
			"clue": "Hold the %KEY% key while soloing or muting any track",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Solo or mute all selected tracks in your session",
			"clue": "Hold the %KEY% + %KEY% key while soloing or muting any selected track",
			"codes": [
				{
					"keys": ["AltLeft", "ShiftLeft"]
				}
			]
		},{
			"name": "Force Pro Tools to copy audio files into the Audio Files folder as they are dragged from a file or Workspace browser",
			"clue": "Hold %KEY% while dragging an audio files into a session.",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Toggle through the stereo or mono options of the New Tracks dialog box",
			"clue": "Press and hold the %KEY% key, and press %KEY% keys",
			"codes": [
				{
					"keys": ["CtrlLeft", "Left"]
				},
				{
					"keys": ["CtrlLeft", "Right"]
				}
			]
		},
		{
			"name": "Cycle through the different track types in the New Tracks dialog box",
			"clue": "Press and hold the %KEY% key, and press the %KEY% keys",
			"codes": [
				{
					"keys": ["CtrlLeft", "Up"]
				},
				{
					"keys": ["CtrlLeft", "Down"]
				}
			]
		},
		{
			"name": "Select a track without deselecting the currently selected track(s)",
			"clue": "Hold the %KEY% key and click on the track name (in the Tracks List, Edit window tracks area, or Mix window tracks area)",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		},
		{
			"name": "Select a range of tracks",
			"clue": "Select the first track in a range by clicking the name, then hold the %KEY% key and select the last track in the range",
			"codes": [
				{
					"keys": ["ShiftLeft"]
				}
			]
		},
		{
			"name": "Tap to set tempo",
			"clue": "Highlight the tempo field of the Edit window's MIDI Ctrls or the BPM field of the Tempo Change dialog box, and press the %KEY% key on your keyboard in tempo",
			"codes": [
				{
					"keys": ["T"]
				}
			]
		},
		{
			"name": "Reset your volume to unity (0.0) or your pan to center (0)",
			"clue": "Hold the %KEY% key and click on the volume or pan Ctrl",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Move the Edit insertion to the previous clip boundary (moving right to left)",
			"clue": "Hold the %KEY% key while you press the Tab key",
			"codes": [
				{
					"keys": ["AltLeft", "Tab"]
				}
			]
		},
		{
			"name": "Choose the TCE Trim tool and the Loop Trim tool",
			"clue": "Repeatedly press the %KEY% key.",
			"codes": [
				{
					"keys": ["F6"]
				}
			]
		},
		{
			"name": "Set a pre-roll or post-roll point",
			"clue": "Hold the %KEY% key and click in the tracks area of the Edit window at the point where you want your pre-roll or post roll to be positioned.",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Disable and reset pre-roll or post-roll",
			"clue": "Hold the %KEY% key and click in the first half of the selection to reset and disable pre-roll to zero. Hold the %KEY% key and click in the latter half of the selection to reset and disable pre-roll to zero.",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Move a selection without changing its length",
			"clue": "Hold the %KEY% key and move either the punch in or punch out point.",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Move the playback cursor to the end of the timeline",
			"clue": "Hold the %KEY% key, and press the %KEY% key",
			"codes": [
				{
					"keys": ["AltLeft", "Enter"]
				}
			]
		},
		{
			"name": "Make a selection on the timeline from the playback cursor's position to the beginning of the session's timeline",
			"clue": "Hold the %KEY% key and press the Return key",
			"codes": [
				{
					"keys": ["ShiftLeft"]
				}
			]
		},
		{
			"name": "Make a selection on the timeline from the playback cursor's position to the end of the session's timeline",
			"clue": "Hold the %KEY% + %KEY% keys and press the %KEY% key",
			"codes": [
				{
					"keys": ["ShiftLeft", "AltLeft", "Enter"]
				}
			]
		},
		{
			"name": "Zoom out with the Zoomer tool",
			"clue": "Hold the %KEY% key",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Flip the Pencil tool to become an eraser",
			"clue": "Hold the %KEY% key",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Apply any change made on one track to all tracks",
			"clue": "Hold the %KEY% key while changing one track",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Apply any change made on one track to all selected tracks",
			"clue": "Hold the %KEY% + %KEY% key while changing one selected track",
			"codes": [
				{
					"keys": ["ShiftLeft", "AltLeft"]
				}
			]
		},
		{
			"name": "Reset your volume levels to unity on your main faders (or send faders)",
			"clue": "Hold the %KEY% key and click the fader",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Move the volume fader in fine resolution (.1 dB steps)",
			"clue": "Hold the %KEY% key, while clicking and dragging",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		},
		{
			"name": "Open multiple Output windows",
			"clue": "Hold the %KEY% key as you click on additional Output window buttons",
			"codes": [
				{
					"keys": ["ShiftLeft"]
				}
			]
		},
		{
			"name": "Enable or Disable Solo Safe on a track",
			"clue": "Hold the %KEY% key, and click on the track's Solo button",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		},
		{
			"name": "Make a copy of a plug-in",
			"clue": "Hold the %KEY% key while dragging a it to a new location",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Bypass a plug-in",
			"clue": "Hold the %KEY% key and click the Insert Assignment for the plug-in that you want to bypass",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		},
		{
			"name": "Deactivate a plug-in",
			"clue": "Hold the %KEY% + %KEY% key and click the Insert Assignment for the plug-in that you want to make inactive",
			"codes": [
				{
					"keys": ["CtrlLeft", "WindowsLeft"]
				}
			]
		},
		{
			"name": "Quickly set the send's level to unity",
			"clue": "Hold the %KEY% key and click the fader",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Copy a send while dragging",
			"clue": "Hold the %KEY% key and drag the send to another track",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Change the automation mode of all tracks",
			"clue": "Hold the %KEY% key and change any track's automation mode",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Change the automation mode of all selected tracks",
			"clue": "Hold %KEY% + %KEY% and change any selected track's automation mode",
			"codes": [
				{
					"keys": ["ShiftLeft", "AltLeft"]
				}
			]
		},
		{
			"name": "Delete an existing automation breakpoint",
			"clue": "Hold down the %KEY% key and click it with the Grabber tool (the cursor will be shown as a pointing hand with a minus (-) sign next to it)",
			"codes": [
				{
					"keys": ["AltLeft"]
				}
			]
		},
		{
			"name": "Select a range of parameters in the Plug-in Automation dialog box",
			"clue": "Hold the %KEY% key while selecting",
			"codes": [
				{
					"keys": ["ShiftLeft"]
				}
			]
		},
		{
			"name": "Individually select multiple parameters in the Plug-in Automation dialog box",
			"clue": "Hold the %KEY% key while selecting",
			"codes": [
				{
					"keys": ["CtrlLeft"]
				}
			]
		}
	]
}

var guessArray:Array

enum Modes {CLASSIC,BLANK,SHUFFLE}
@export var mode:Modes = Modes.SHUFFLE
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#set_mode()
	

func set_mode(new_mode:int=mode) -> void:
	mode = new_mode
	match mode:
		Modes.CLASSIC:
			guessArray=shortcutGuess["shortcuts"]
		Modes.BLANK:
			guessArray=blankGuess["shortcuts"]
		Modes.SHUFFLE:
			guessArray=[shortcutGuess["shortcuts"],blankGuess["shortcuts"]]

func get_question() -> Dictionary:
	var question:Dictionary
	match mode:
		Modes.SHUFFLE:
			question = guessArray.pick_random().pick_random()
		_:
			question = guessArray.pick_random()
			#print(question)
	return question


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
