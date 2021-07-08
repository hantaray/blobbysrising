extends Node

#### GamePlayData ####


var score_goal_subway_reached = false
var score_goal_city_reached = false
var score_goal_redis_reached = false
var score_goal_street_reached = false
var score_goal_peace_reached = false
var score_goal_caring_reached = false

# levels unlocked
var locked_forest = true
var locked_city = true
var locked_redis = false
var locked_street = true
var locked_peace = false
var locked_caring = true

# life
const max_lifes = 8

# blob is hit and invulnarable
var enemy_can_hit = true
const INVULNERABLE_TIME = 1.5

# friend hit animation time
const FRIEND_HIT_ANIMATION_TIME = 1.5

# movement vars
var enemy_speed_x = -100
var enemy_speed_y = 0

var friend_speed_x = -100
var friend_speed_y = 0

const player_start_speed = 900
var playerSpeed = player_start_speed
const enemy_truck_start_speed = 1600
var enemyTruckSpeed = enemy_truck_start_speed
var enemyLkwSpeed = 1050
const enemy_car_start_speed = 1600
var enemyCarSpeed = enemy_car_start_speed

# increase speed vars
const speed_increase_just_jump = 25
const speed_increase_lane = 25
const speed_increase_redis = 25
const speed_increase_up_down = 25

const increase_speed_every_score = 10
const add_life_every_score = 20

var increase_speed_if_bigger_than = 10
var add_life_if_bigger_than = 20

# perfect collect
var perfect_collect_limit = 5

# level score goals
#var score_goal_subway = 250 160
#var score_goal_city = 130 238
#var score_goal_street = 130  277
#var score_goal_redis = 150 195
#
var score_goal_subway = 100
var score_goal_city = 100
var score_goal_street = 100
var score_goal_redis = 100
var score_goal_peace = 100
var score_goal_caring = 100

#var score_goal_subway = 20
#var score_goal_street = 20
#var score_goal_redis = 20
#var score_goal_city = 20

# highscore
var highscore_forest = 0
var highscore_street = 0
var highscore_redis = 0
var highscore_city = 0
var highscore_peace = 0
var highscore_caring = 0

# medals
const medal_add = 25

var medal_goal_1 = 100
var medal_goal_2 = medal_goal_1 + medal_add
var medal_goal_3 = medal_goal_1 + medal_add * 2
var medal_goal_4 = medal_goal_1 + medal_add * 3
var medal_goal_5 = medal_goal_1 + medal_add * 4
var medal_goal_6 = medal_goal_1 + medal_add * 5
var medal_goal_7 = medal_goal_1 + medal_add * 6
var medal_goal_8 = medal_goal_1 + medal_add * 7
var medal_goal_9 = medal_goal_1 + medal_add * 8
var medal_goal_10 = medal_goal_1 + medal_add * 9
var medal_goal_11 = medal_goal_1 + medal_add * 10
var medal_goal_12 = medal_goal_1 + medal_add * 11




#var medal_goal_forest_1 = score_goal_subway
#var medal_goal_forest_2 = score_goal_subway + medal_add
#var medal_goal_forest_3 = score_goal_subway + medal_add * 2
#var medal_goal_forest_4 = score_goal_subway + medal_add * 3
#var medal_goal_forest_5 = score_goal_subway + medal_add * 4
#var medal_goal_forest_6 = score_goal_subway + medal_add * 5
#var medal_goal_forest_7 = score_goal_subway + medal_add * 6
#var medal_goal_forest_8 = score_goal_subway + medal_add * 7
#var medal_goal_forest_9 = score_goal_subway + medal_add * 8
#var medal_goal_forest_10 = score_goal_subway + medal_add * 9
#var medal_goal_forest_11 = score_goal_subway + medal_add * 10
#var medal_goal_forest_12 = score_goal_subway + medal_add * 11
#
#var medal_goal_street_1 = score_goal_street
#var medal_goal_street_2 = score_goal_street + medal_add
#var medal_goal_street_3 = score_goal_street + medal_add * 2
#var medal_goal_street_4 = score_goal_street + medal_add * 3
#var medal_goal_street_5 = score_goal_street + medal_add * 4
#var medal_goal_street_6 = score_goal_street + medal_add * 5
#var medal_goal_street_7 = score_goal_street + medal_add * 6
#var medal_goal_street_8 = score_goal_street + medal_add * 7
#var medal_goal_street_9 = score_goal_street + medal_add * 8
#var medal_goal_street_10 = score_goal_street + medal_add * 9
#var medal_goal_street_11 = score_goal_street + medal_add * 10
#var medal_goal_street_12 = score_goal_street + medal_add * 11
#
#var medal_goal_redis_1 = score_goal_redis
#var medal_goal_redis_2 = score_goal_redis + medal_add
#var medal_goal_redis_3 = score_goal_redis + medal_add * 2
#var medal_goal_redis_4 = score_goal_redis + medal_add * 3
#var medal_goal_redis_5 = score_goal_redis + medal_add * 4
#var medal_goal_redis_6 = score_goal_redis + medal_add * 5
#var medal_goal_redis_7 = score_goal_redis + medal_add * 6
#var medal_goal_redis_8 = score_goal_redis + medal_add * 7
#var medal_goal_redis_9 = score_goal_redis + medal_add * 8
#var medal_goal_redis_10 = score_goal_redis + medal_add * 9
#var medal_goal_redis_11 = score_goal_redis + medal_add * 10
#var medal_goal_redis_12 = score_goal_redis + medal_add * 11
#
#var medal_goal_city_1 = score_goal_city
#var medal_goal_city_2 = score_goal_city + medal_add
#var medal_goal_city_3 = score_goal_city + medal_add * 2
#var medal_goal_city_4 = score_goal_city + medal_add * 3
#var medal_goal_city_5 = score_goal_city + medal_add * 4
#var medal_goal_city_6 = score_goal_city + medal_add * 5
#var medal_goal_city_7 = score_goal_city + medal_add * 6
#var medal_goal_city_8 = score_goal_city + medal_add * 7
#var medal_goal_city_9 = score_goal_city + medal_add * 8
#var medal_goal_city_10 = score_goal_city + medal_add * 9
#var medal_goal_city_11 = score_goal_city + medal_add * 10
#var medal_goal_city_12 = score_goal_city + medal_add * 11
#
#var medal_goal_peace_1 = score_goal_peace
#var medal_goal_peace_2 = score_goal_peace + medal_add
#var medal_goal_peace_3 = score_goal_peace + medal_add * 2
#var medal_goal_peace_4 = score_goal_peace + medal_add * 3
#var medal_goal_peace_5 = score_goal_peace + medal_add * 4
#var medal_goal_peace_6 = score_goal_peace + medal_add * 5
#var medal_goal_peace_7 = score_goal_peace + medal_add * 6
#var medal_goal_peace_8 = score_goal_peace + medal_add * 7
#var medal_goal_peace_9 = score_goal_peace + medal_add * 8
#var medal_goal_peace_10 = score_goal_peace + medal_add * 9
#var medal_goal_peace_11 = score_goal_peace + medal_add * 10
#var medal_goal_peace_12 = score_goal_peace + medal_add * 11
#
#var medal_goal_caring_1 = score_goal_caring
#var medal_goal_caring_2 = score_goal_caring + medal_add
#var medal_goal_caring_3 = score_goal_caring + medal_add * 2
#var medal_goal_caring_4 = score_goal_caring + medal_add * 3
#var medal_goal_caring_5 = score_goal_caring + medal_add * 4
#var medal_goal_caring_6 = score_goal_caring + medal_add * 5
#var medal_goal_caring_7 = score_goal_caring + medal_add * 6
#var medal_goal_caring_8 = score_goal_caring + medal_add * 7
#var medal_goal_caring_9 = score_goal_caring + medal_add * 8
#var medal_goal_caring_10 = score_goal_caring + medal_add * 9
#var medal_goal_caring_11 = score_goal_caring + medal_add * 10
#var medal_goal_caring_12 = score_goal_caring + medal_add * 11

## medals
#var medal_goal_1 = 1
#var medal_goal_2 = 2
#var medal_goal_3 = 4
#var medal_goal_4 = 8
#var medal_goal_5 = 16
#var medal_goal_6 = 32

# save
const FILE_NAME  = "user://savegame.save"

# settings
var music = true
