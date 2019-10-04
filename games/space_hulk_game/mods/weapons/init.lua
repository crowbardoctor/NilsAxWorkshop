minetest.register_node("weapons:gun", {
	description = "Portalgun",
	range = 6,
	tiles={"storm_bolter.png"},
		selection_box = {
		type = "fixed",
		fixed = {
			{-0.3, -0.5, -0.3, 0.3, -0.1,0.3},
		}
	},
	drawtype="mesh",
	mesh="storm_bolter.obj",
	sunlight_propagates = true,
	paramtype="light",
	})