extends Control

func _on_Button_pressed():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_Button2_pressed():
	get_tree().quit()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://main.tscn")
	



func _on_button_2_pressed() -> void:
	get_tree().quit()
