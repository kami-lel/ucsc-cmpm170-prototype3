extends Node2D

# Time duration in seconds for the node to completely shrink
const SHRINK_DURATION = 5.0

# Target scale (scale at end of shrinking)
const TARGET_SCALE = Vector2(0.1, 0.1)

# initial scale
var starting_scale : Vector2

# elapsed time
var elapsed_time : float = 0.0


func _ready():
	# Initialize the starting scale as the current scale
	starting_scale = scale
	# Reset elapsed time
	elapsed_time = 0.0

	position = Vector2(randf_range(-200, 500), randf_range(-200, 200))



func _process(delta: float):

	if elapsed_time < SHRINK_DURATION:
		# Increase elapsed time by the delta time
		elapsed_time += delta

		# Calculate the interpolation factor (0.0 to 1.0)
		var t := elapsed_time / SHRINK_DURATION

		scale = starting_scale.lerp(TARGET_SCALE, t)

	else:
		# Reset elapsed time for the next cycle
		elapsed_time = 0.0
		position = Vector2(randf_range(-200, 500), randf_range(-200, 200))
