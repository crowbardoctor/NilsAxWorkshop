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
			{-0.0625, 0.375, -1.5, 1.0625, 0.5, 0.5}, -- NodeBox1
			{0.125, -0.5, 0, 0.375, 0.25, 0.25}, -- Leg1
			{0.625, -0.5, 0, 0.875, 0.25, 0.25}, -- Leg2
			{0.125, -0.5, -1.25, 0.375, 0.25, -1}, -- Leg3
			{0.625, -0.5, -1.25, 0.875, 0.25, -1}, -- Leg4
			{0.0625, 0.25, -1.375, 0.9375, 0.375, 0.375}, -- NodeBox2
		}
	}
})

