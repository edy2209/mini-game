extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "CharacterBody2D":  # Samain persis seperti output print
		print("Kamu Menang!")
