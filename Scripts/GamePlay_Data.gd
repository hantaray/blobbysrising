extends Node

#### GamePlayData ####


var score_goal_forest_reached = false
var score_goal_street_reached = false
var score_goal_city_reached = false

# levels unlocked
var locked_forest = false
var locked_street = true
var locked_city = true

# movement vars
var enemy_speed_x = -100
var enemy_speed_y = 0

var friend_speed_x = -100
var friend_speed_y = 0

var playerSpeed = 600
var enemyTruckSpeed = 800
var enemyLkwSpeed = 700
var enemyCarSpeed = 800
var bouncyblob_y = -500

# increase speed vars
const speed_increase_just_jump = 100
const speed_increase_lane = 100
const speed_increase_up_down = 100

const increase_speed_every_score = 10
const add_life_every_score = 20

var increase_if_bigger_than = 10
var add_life_if_bigger_than = 20

# perfect collect
var perfect_collect_limit = 5

# level score goals
#var score_goal_forest = 130
#var score_goal_street = 150
#var score_goal_city = 180

var score_goal_forest = 100
var score_goal_street = 100
var score_goal_city = 100

# highscore
var highscore_forest = 0
var highscore_street = 0
var highscore_city = 0

# medals
var medal_goal_1 = 105
var medal_goal_2 = 110
var medal_goal_3 = 115
var medal_goal_4 = 120
var medal_goal_5 = 125
var medal_goal_6 = 130

# save
const FILE_NAME  = "user://savegame.save"
