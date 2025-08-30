extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_host_pressed() -> void:
	HighLevelNetworkHandler.start_server()
	get_tree().change_scene_to_file("res://high_level_example/scenes/high_level_example.tscn")


func _on_button_join_pressed() -> void:
	var ip_address = $VBoxContainer/LineEdit.text
	HighLevelNetworkHandler.start_client(ip_address)
	get_tree().change_scene_to_file("res://high_level_example/scenes/high_level_example.tscn")


func _on_button_exit_pressed() -> void:
	get_tree().quit()
