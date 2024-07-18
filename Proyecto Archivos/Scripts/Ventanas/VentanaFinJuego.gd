extends Control

signal reset_game()
signal go_to_menu()

@onready var buttons = $HBoxContainer

func _ready():
	buttons.hide()

func show_text():
	$AnimationPlayer.play("Show_text")

func _on_menu_principal_pressed():
	go_to_menu.emit()

func _on_reiniciar_pressed():
	reset_game.emit()
