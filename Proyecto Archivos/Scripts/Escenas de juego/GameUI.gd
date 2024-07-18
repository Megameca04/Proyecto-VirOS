extends CanvasLayer

@onready var callable_reset = Callable(get_parent(),"reset_game")
@onready var callable_menu = Callable(get_parent(),"go_to_menu")

func _ready():
	$VenFinJuego.connect("reset_game",callable_reset)
	$VenFinJuego.connect("go_to_menu",callable_menu)
	$VentanaVictoria.connect("reset_game",callable_reset)
	$VentanaVictoria.connect("go_to_menu",callable_menu)

func show_animation(name):
	$AnimationPlayer.play(name)
