extends Node

var start_color: Color
var current_color: Color
var target_color: Color
var transition_duration: float = 1.0  # Durée en secondes
var transition_time: float = 0.0
var is_transitioning: bool = false

func _ready():
	# Initialisation des couleurs
	start_color = Color.WHITE
	current_color = start_color
	target_color = Color.BLACK

func start_transition(new_target_color: Color, duration: float = 1.0):
	# Démarre une nouvelle transition
	start_color = current_color
	target_color = new_target_color
	transition_duration = duration
	transition_time = 0.0
	is_transitioning = true

func _process(delta):
	if is_transitioning:
		# Met à jour le temps de transition
		transition_time += delta
		
		# Calcule la progression (entre 0 et 1)
		var progress = min(transition_time / transition_duration, 1.0)
		
		# Utilise une fonction d'interpolation pour une transition plus fluide
		progress = ease(progress, 0.5)  # Vous pouvez ajuster la valeur d'ease pour changer la courbe
		
		# Interpole entre les couleurs
		current_color = start_color.lerp(target_color, progress)
		
		# Vérifie si la transition est terminée
		if progress >= 1.0:
			is_transitioning = false
			current_color = target_color

# Exemple d'utilisation
func example_usage():
	# Transition vers le rouge en 2 secondes
	start_transition(Color.RED, 2.0)
	
	# Pour obtenir la couleur actuelle dans un autre script :
	# var color = $ColorTransition.current_color
