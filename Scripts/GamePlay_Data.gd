extends Node

#### GamePlayData ####


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
#var score_goal_forest = 140
#var score_goal_street = 150
#var score_goal_city = 180

var score_goal_forest = 2
var score_goal_street = 2
var score_goal_city = 2

var score_goal_forest_reached = false
var score_goal_street_reached = true
var score_goal_city_reached = false

# highscore
var highscore_forest = 0
var highscore_street = 0
var highscore_city = 0

# levels unlocked
var locked_forest = false
var locked_street = false
var locked_city = true

# medals
var medal_goal_1 = 5
var medal_goal_2 = 10
var medal_goal_3 = 15
var medal_goal_4 = 20
var medal_goal_5 = 25
var medal_goal_6 = 30

# save
const FILE_NAME  = "user://savegame.save"
