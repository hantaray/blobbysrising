extends Area2dFriend


export (int) var rotationSpeed = 5

func _process(delta):
	rotate(rotationSpeed * delta)

func _on_friend_station_sign_body_entered(body):
	friend_collides(body)
	
	




