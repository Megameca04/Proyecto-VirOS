extends Control

signal cloned()

enum TIERS {
	LOW,
	MEDIUM,
	HIGH
}

const CloningPos = {
	0: 0.3,
	1: 0.4,
	2: 0.5
}

var tier := 0

const NAMES = {
	0:"ILOVEYOU",
	1:"Sasser",
	2 :"Byte Bandit",
	3:"Creeper",
	4:"mydoom",
	5:"xafecopy",
	6:"Anna Kournikova",
	7:"Netwky"}

func _ready():
	$Label.text = "[center]"+NAMES[randi_range(0,7)]
	$MarginContainer/TextureRect.texture = load("res://Sprites/Iconos/virus"+str(tier+1)+".png")
	$Timer.start()
	cloned.connect(get_parent().get_parent().get_parent().get_parent().aud_clon)

func _on_timer_timeout():
	var can_clone = false
	
	if randf() < CloningPos[tier]:
		can_clone = true
	
	if can_clone:
		var nueva_instancia = Singletons.VIRUS.instantiate()
		match tier:
			0:
				if randf() < 0.4:
					nueva_instancia.tier = 1
			1:
				if randf() < 0.25:
					nueva_instancia.tier = 1
			
		add_sibling(nueva_instancia)
		cloned.emit()

