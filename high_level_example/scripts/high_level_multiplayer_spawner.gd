extends MultiplayerSpawner

@export var network_player: PackedScene # ← Ссылка на сцену игрока

func _ready() -> void:
	multiplayer.peer_connected.connect(spawn_player) # ← ПОДПИСКА НА СОБЫТИЕ
#"Когда кто-то подключается к серверу, вызывай функцию spawn_player"
#Godot автоматически вызовет spawn_player с ID подключившегося игрока

func spawn_player(id: int) -> void:
	if not multiplayer.is_server(): return # чтобы клиент не спавнил игроков

	var player: Node = network_player.instantiate() # ← СОЗДАЕМ КОПИЮ
	player.name = str(id) # ← ИМЯ = ID ИГРОКА

	get_node(spawn_path).call_deferred("add_child", player) # ← БЕЗОПАСНОЕ ДОБАВЛЕНИЕ
