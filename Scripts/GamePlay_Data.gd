extends Node

#### GamePlayData ####


var score_goal_forest_reached = false
var score_goal_city_reached = false
var score_goal_redis_reached = false
var score_goal_street_reached = false
var score_goal_peace_reached = false
var score_goal_caring_reached = false

# levels unlocked
var locked_forest = true
var locked_city = true
var locked_redis = true
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

var playerSpeed = 900
var enemyTruckSpeed = 1600
var enemyLkwSpeed = 1050
var enemyCarSpeed = 1600

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
#var score_goal_forest = 250 160
#var score_goal_city = 130 238
#var score_goal_street = 130  277
#var score_goal_redis = 150 195
#
var score_goal_forest = 100
var score_goal_city = 100
var score_goal_street = 100
var score_goal_redis = 100
var score_goal_peace = 100
var score_goal_caring = 100

#var score_goal_forest = 20
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
var medal_goal_1 = 120
var medal_goal_2 = 140
var medal_goal_3 = 160
var medal_goal_4 = 180
var medal_goal_5 = 200
var medal_goal_6 = 220

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
