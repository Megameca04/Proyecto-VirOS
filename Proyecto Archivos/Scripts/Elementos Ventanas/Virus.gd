extends MarginContainer

signal cloned()

const SKINS = {
	1: "res://Sprites/Iconos/virus.png",
	
}

enum TIERS {
	LOW,
	MEDIUM,
	HIGH
}

const CloningPos = {
	0: 0.5,
	1: 0.66,
	2: 0.8
}

var tier := 0

func _ready():
	$TextureRect.texture = load("res://Sprites/Iconos/virus"+str(tier+1)+".png")
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
				if randf() < 0.25:
					nueva_instancia.tier = 1
			1:
				if randf() < 0.1:
					nueva_instancia.tier = 1
			
		add_sibling(nueva_instancia)
		cloned.emit()

