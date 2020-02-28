minetest.register_node("nils_house_blocks:node_1", {
description = "silver brick/silver sandstone",
	tiles = {
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
		}
	}
})

minetest.register_node("nils_house_blocks:node_2", {
description = "glass larger",
	tiles = {"default_glass.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.25, 0.5, 1, 0.25}, -- NodeBox1
		}
	}
})

minetest.register_node("nils_house_blocks:node_3", {
description = "glass larger thin",
	tiles = {"default_glass.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	sunlight_propagates = true,
	is_ground_content = false,
	groups = {cracky = 3,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.0625, 0.5, 1, 0.0625}, -- NodeBox1
		}
	}
})

minetest.register_node("nils_house_blocks:node_4", {
description = "vent",
	mesh = "cylinder.obj",
	tiles = {
		"stainless_steel.png"
	},
	drawtype = "mesh",
	paramtype = "light",
	groups = {choppy = 2,},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.625, -0.375, 0.375, 0.5, 0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.375, -0.625, -0.375, 0.375, 0.5, 0.375}
		}
	}
})

minetest.register_node("nils_house_blocks:node_5", {
	description = "Matbord",
	tiles = {"default_junglewood.png"},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 3,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.0625, 0.375, -1.5, 1.0625, 0.5, 0.5}, -- NodeBox1
			{0.0625, 0.25, -1.375, 0.9375, 0.375, 0.375}, -- NodeBox2
			{0.125, -0.5, 0, 0.375, 0.25, 0.25}, -- Leg1
			{0.625, -0.5, 0, 0.875, 0.25, 0.25}, -- Leg2
			{0.125, -0.5, -1.25, 0.375, 0.25, -1}, -- Leg3
			{0.625, -0.5, -1.25, 0.875, 0.25, -1}, -- Leg4
		}
	}
})

minetest.register_node("nils_house_blocks:node_6", {
description = "wood plank/silver sandstone/obsidian",
	tiles = {
		"default_obsidian.png",
		"default_silver_sandstone_brick.png",
		"default_silver_sandstone.png",
		"default_silver_sandstone.png",
		"default_silver_sandstone.png",
		"default_pine_wood.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {choppy = 2,},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}, -- NodeBox1
		}
	}
})

minetest.register_node("nils_house_blocks:node_7", {
description = "soffbord",
	mesh = "soffbord.obj",
	tiles = {
		"soffbord.png"
	},
	drawtype = "mesh",
	paramtype = "light",
	groups = {choppy = 2,},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.375, -0.625, -0.375, 0.375, 0.5, 0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
		{-0.625, -0.625, -0.5, 1.625, 0.5, 0.375}
		}
	}
})

minetest.register_node("nils_house_blocks:node_8", {
	description = "tv 1",
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
	paramtype2 = "facedir",
	groups = {choppy = 2,},
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, 0.125, 1, 0.25, 0.5}, -- NodeBox9
		}
	}
})
