extends Node

#### GamePlayData ####


var score_goal_subway_reached = false
var score_goal_city_reached = false
var score_goal_redis_reached = false
var score_goal_street_reached = false
var score_goal_peace_reached = false
var score_goal_caring_reached = false

# levels unlocked
var locked_subway = true
var locked_city = true
var locked_redis = true
var locked_street = true
var locked_peace = false
var locked_caring = true

# life
const max_lifes = 8

# blob is hit and invulnarable
var enemy_can_hit = true
const INVULNERABLE_TIME = 1

# friend hit animation time
const FRIEND_HIT_ANIMATION_TIME = 1

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
var score_goal_subway = 110
var score_goal_city = 110
var score_goal_street = 100
var score_goal_redis = 120
var score_goal_peace = 120
var score_goal_caring = 100

#var score_goal_subway = 20
#var score_goal_city = 20
#var score_goal_street = 20
#var score_goal_redis = 20
#var score_goal_peace = 20
#var score_goal_caring = 20

# highscore
var highscore_subway = 0
var highscore_street = 0
var highscore_redis = 0
var highscore_city = 0
var highscore_peace = 0
var highscore_caring = 0



# medals
const medal_add = 50

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


# save
const FILE_NAME  = "user://savegame.save"

# settings
var sound = true
var music = true

var show_manual = true
