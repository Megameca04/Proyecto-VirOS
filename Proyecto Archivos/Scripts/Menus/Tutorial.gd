extends Node

var animations = {
	0: "Inicio",
	1: "Organizar ventanas",
	2: "Mover archivos",
	3: "Limpiadores",
	4: "Memoria",
	5: "Fin"
}

var atp = 0

func _ready():
	get_tree().paused = true

func _on_button_pressed():
	atp += 1
	if atp > 5:
		ScenesManager.watched_tutorial = true
		ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)
	else:
		$AnimationPlayer.play(animations[atp])

func activate():
	get_tree().paused = false

func show_button_at_move():
	$TextBubble/Button.show()

func show_button_at_clipboard():
	$TextBubble/Button.show()

func _on_button_button_down():
	$TextBubble/SonidoBoton.play()

func _on_saltar_pressed():
	ScenesManager.watched_tutorial = true
	get_tree().paused = false
	ScenesManager.change_scene_to(ScenesManager.Scenes.MAIN_GAME)
