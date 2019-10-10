-- GENERATED CODE
-- Node Box Editor, version 0.9.0
-- Namespace: test

minetest.register_node("test:node_1", {
	tiles = {
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png",
		"default_wood.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, 0, -0.5, 0.5, 0.1875, 0.5}, -- NodeBox1
			{-0.5, 0.1875, 0.25, 0.5, 1.1875, 0.5}, -- NodeBox2
			{0.1875, -0.5, 0.25, 0.375, 0, 0.5}, -- rear_left_leg
			{-0.375, -0.5, 0.25, -0.1875, 0, 0.5}, -- NodeBox4
			{0.1875, -0.5, -0.5, 0.375, 0, -0.25}, -- front_right_leg
			{-0.375, -0.5, -0.5, -0.1875, 0, -0.25}, -- front_left_leg
		}
	}
})

