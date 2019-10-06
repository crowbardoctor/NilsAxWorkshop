minetest.register_node("save_the_world:node_1", {
description = "trottoar 3x2",
	tiles = {
		"default_steel_block.png",
	},
	drawtype = "nodebox",
	groups = {cracky = 2},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -1.5, 1.5, -0.375, 0.5}, -- NodeBox1
		}
	}
})
minetest.register_node("save_the_world:node_4", {
description = "trottoar 3x2",
	tiles = {
		"default_steel_block.png",
	},
	drawtype = "nodebox",
	groups = {cracky = 2},
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			{-1.5, -0.5, -0.500001, 0.5, -0.375, 2.5}, -- NodeBox1
		}
	}
})
minetest.register_node("save_the_world:node_2", {
description = "Car 1",
	tiles = {
		"default_steel_block.png"
	},
	drawtype = "mesh",
	mesh = "Fortnite_car_2.obj",
	groups = {cracky = 2},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.25, -0.1875, -0.500001, 1.25, 0.25, 0.5}, -- NodeBox2
			{0, 0.25, -0.5, 0.75, 0.75, 0.5}, -- NodeBox4
			{-0.3125, 0.375, -0.5, 1.49012e-007, 0.75, 0.5}, -- NodeBox6
			{-0.5625, 0.375, -0.5, -0.3125, 0.625, 0.5}, -- NodeBox9
			{-1.375, -0.25, -0.5, -1.25, -0.125, 0.5}, -- NodeBox7
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-1.25, -0.1875, -0.500001, 1.25, 0.25, 0.5}, -- NodeBox2
			{0, 0.25, -0.5, 0.75, 0.75, 0.5}, -- NodeBox4
			{-0.3125, 0.375, -0.5, 1.49012e-007, 0.75, 0.5}, -- NodeBox6
			{-0.5625, 0.375, -0.5, -0.3125, 0.625, 0.5}, -- NodeBox9
			{-1.375, -0.25, -0.5, -1.25, -0.125, 0.5}, -- NodeBox7
		}
	}
})
minetest.register_node("save_the_world:node_3", {
description = "Car 1 2",
	tiles = {
		"default_steel_block.png"
	},
	drawtype = "mesh",
	mesh = "Fortnite_car_3.obj",
	groups = {cracky = 2},
	paramtype = "light",
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -1.5, 0.500001, 0.375, 0.5}, -- NodeBox2
			{-0.5, -0.3125, 0.5, 0.5, 0.375, 1.5}, -- NodeBox3
			{-0.5, 0.25, 0, 0.5, 1.0625, 0.5}, -- NodeBox4
			{-0.5, 0.375, -0.3125, 0.5, 0.875, 8.9407e-008}, -- NodeBox6
			{-0.5, 0.375, -0.5625, 0.5, 0.625, -0.3125}, -- NodeBox9
		},
	},
	collision_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.375, -1.5, 0.500001, 0.375, 0.5}, -- NodeBox2
			{-0.5, -0.3125, 0.5, 0.5, 0.375, 1.5}, -- NodeBox3
			{-0.5, 0.25, 0, 0.5, 1.0625, 0.5}, -- NodeBox4
			{-0.5, 0.375, -0.3125, 0.5, 0.875, 8.9407e-008}, -- NodeBox6
			{-0.5, 0.375, -0.5625, 0.5, 0.625, -0.3125}, -- NodeBox9
		}
	}
})