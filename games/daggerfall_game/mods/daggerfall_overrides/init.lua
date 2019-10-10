minetest.register_node("daggerfall_overrides:dfurnace", {
description = ("Furnace2"),
	tiles = {
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"default_stone.png",
		"furnace-1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.125, 0.5}, -- NodeBox1
		}
	}
})

