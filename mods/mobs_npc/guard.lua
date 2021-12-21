
local S = mobs.intllib

-- based on Igor by TenPlus1

mobs.guard_drops = {
	"vessels:glass_bottle", "mobs:meat_raw"

}


mobs:register_mob("mobs_npc:guard", {
	--type = "npc",
    type = "monster",
	passive = false,
	damage = 3,
	--attack_type = "shoot",
    attack_type = "dogfight",
	--reach = 7,
	--shoot_offset = 1,
    --shoot_interval = 0.9,
    --arrow = "mobs_npc:arrow",
    --arrow = "mobs_monster:mese_arrow",
	owner_loyal = true,
	pathfinding = true,
    immune_to = {
        {"farming:bread", -5},
        {"default:sword_bronze", 5},
        {"default:sword_steel",5},
    },
	attacks_monsters = false,
	hp_min = 5,
	hp_max = 5,
	armor = 0,
	collisionbox = {-0.35,-1.0,-0.35, 0.35,0.8,0.35},
	visual = "mesh",
	mesh = "mobs_character.b3d",
	textures = {
		{"mobs_guard1.png"}	},
	makes_footstep_sound = true,
	sounds = {},
	walk_velocity = 1,
	run_velocity = 2,
	stepheight = 1.1,
	fear_height = 2,
	jump = true,
	drops = {
	--	{name = "farming:bread", chance = 2}, dont work
	--	{name = "bows:bow_steel", chance = 2}, , dont work
	--	{name = "bows:arrow", chance = 2},
	--	{name = "bows:arrow_fire", chance = 2},

	},
	water_damage = 1,
	lava_damage = 3,
	light_damage = 0,
	--follow = {"mobs:meat_raw", "default:diamond"},
	view_range = 15,
	owner = "",
	--order = "follow",
	animation = {
		speed_normal = 30,
		speed_run = 30,
		stand_start = 0,
		stand_end = 79,
		walk_start = 168,
		walk_end = 187,
		run_start = 168,
		run_end = 187,
		punch_start = 200,
		punch_end = 219
	},

--[[
	on_die = function(self, pos)

        score = score + 2
		--mobs:effect(pos, 20, "tnt_smoke.png", 3, 5, 2, 0.5, nil, false)
		--self.object:remove()
	end,
--]]

	-- right clicking with raw meat will give Igor more health
	on_rightclick = function(self, clicker)

		-- feed to heal npc
		--if mobs:feed_tame(self, clicker, 8, false, true) then return end
		--if mobs:protect(self, clicker) then return end
		--if mobs:capture_mob(self, clicker, nil, 5, 80, false, nil) then return end

		local item = clicker:get_wielded_item()
		local name = clicker:get_player_name()



	end
})

mobs:register_egg("mobs_npc:guard", S("Guard"), "mobs_meat_raw.png", 1)



-- arrow (weapon)
mobs:register_arrow("mobs_npc:arrow", {
    visual = "sprite",
--	visual = "wielditem",
	visual_size = {x = 0.5, y = 0.5},
    textures = {"bows_arrow_wood.png"},
	--textures = {"default_mese_crystal_fragment.png"},
	--textures = {"default:mese_crystal_fragment"},
	velocity = 9,
	rotate = 90,

	hit_player = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_mob = function(self, player)
		player:punch(self.object, 1.0, {
			full_punch_interval = 1.0,
			damage_groups = {fleshy = 2},
		}, nil)
	end,

	hit_node = function(self, pos, node)
	end
})







-- compatibility
mobs:alias_mob("mobs:guard", "mobs_npc:guard")
