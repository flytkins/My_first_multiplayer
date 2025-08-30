extends Control


func _on_server_pressed() -> void:
	HighLevelNetworkHandler.start_server()


func _on_client_pressed() -> void:
	var ip_address = $VBoxContainer/LineEdit.text
	HighLevelNetworkHandler.start_client(ip_address)
