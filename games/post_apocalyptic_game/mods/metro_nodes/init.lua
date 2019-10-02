minetest.register_node("metro_nodes:node_1", {
description = "metro floor 1 2x2",
	tiles = {
		"default_stone.png"
	},
	drawtype = "nodebox",
	groups = {cracky = 2},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.5, 0.5, 0.5, 1.5}, -- NodeBox1
		}
	}
})

