extends CanvasLayer

@onready var callable_reset = Callable(get_parent(),"reset_game")
@onready var callable_menu = Callable(get_parent(),"go_to_menu")
@onready var callable_hp = Callable(get_parent(),"hide_pause")
@onready var callable_sp = Callable(get_parent(),"show_pause")

func _ready():
	$VenFinJuego.connect("reset_game",callable_reset)
	$VenFinJuego.connect("go_to_menu",callable_menu)
	$VentanaVictoria.connect("reset_game",callable_reset)
	$VentanaVictoria.connect("go_to_menu",callable_menu)
	$VentanaPausa.connect("reset_game",callable_reset)
	$VentanaPausa.connect("go_to_menu",callable_menu)
	$VentanaPausa.connect("continue_game",callable_hp)
	$Pausa.connect("pressed",callable_sp)

func show_animation(name):
	$AnimationPlayer.play(name)



func _on_pausa_button_down():
	$AudioStreamPlayer.play()
