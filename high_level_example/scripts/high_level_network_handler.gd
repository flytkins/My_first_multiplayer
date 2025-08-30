extends Node

const IP_ADDRESS: String = "localhost"
const PORT: int = 42069

var peer: ENetMultiplayerPeer #создаем переменную

func start_server() -> void:
	peer = ENetMultiplayerPeer.new() #инициализируем объект
	var result = peer.create_server(PORT) #объект создает сервер с помощью метода класса
	
	if result == 0:
		print("Server is created on port ", PORT)
	else:
		print("Server error return: ", result)
		return
		
	multiplayer.multiplayer_peer = peer #отдаем наш объект в руки годо в виде его свойства
	await get_tree().process_frame  # Ждем один кадр для инициализации
	spawn_server_player()


func start_client(ip_address: String) -> void:
	peer = ENetMultiplayerPeer.new()
	var result
	if ip_address == "":
		result = peer.create_client(IP_ADDRESS, PORT)
	else:
		result = peer.create_client(ip_address, PORT)
	
	if result == 0:
		print("Server is created: OK")
	else:
		print("Server error return: ", result)
		return
		
	multiplayer.multiplayer_peer = peer
	
	
func spawn_server_player():
	# Получаем спавнер и спавним серверного игрока
	var spawner = get_tree().get_first_node_in_group("spawner")
	if spawner:
		spawner.spawn_player(1)  # 1 = ID сервера
	else:
		print("Ошибка: не найден спавнер!")
	
	
