--[[
    
--]]

--local xmap = 0 -- variavel com a posição do último mapa 
local moved = 0 -- variável q indica se acabou de teleportar
local rnddeco = 0 -- variável da redecoração
--local initial_text = "0"
local score

-- desert_sandstone_brick2
minetest.register_node(minetest.get_current_modname()..":desert_sandstone_brick2", {
    description = "desert_sandstone_brick2",
    tiles = {"desert_sandstone_brick2.png"},
    groups = {cracky=1, stone=1},
    drop = minetest.get_current_modname()..":desert_sandstone_brick2",
    legacy_mineral = true,
})

minetest.register_node(minetest.get_current_modname()..":earthbuild_whitewashed_earth2", {
    description = "earthbuild_whitewashed_earth2",
    tiles = {"earthbuild_whitewashed_earth2.png"},
    groups = {cracky=1, stone=1},
    drop = minetest.get_current_modname()..":earthbuild_whitewashed_earth2",
    legacy_mineral = true,
})

-- round colunas
round_trunks.trunks_overrider(minetest.get_current_modname()..":desert_sandstone_brick2")
round_trunks.trunks_overrider(minetest.get_current_modname()..":earthbuild_whitewashed_earth2")




minetest.register_on_respawnplayer(function(player) 
	local name = player:get_player_name()
    --minetest.get_player_by_name(player):setpos({x=24.0,y=0.5,z=6.0}) --casa
    --minetest.get_player_by_name(name):move_to({x=24.0,y=0.5,z=6.0}, continuous=false) --casa
    minetest.get_player_by_name(name):setpos({x=24.0,y=0.5,z=6.0}) --casa
    score = 0
end)

minetest.register_on_dieplayer(function(player) 
	local name = player:get_player_name()
    minetest.get_player_by_name(name):setpos({x=24.0,y=0.5,z=6.0}) --casa
    --minetest.get_player_by_name(player):setpos({x=24.0,y=0.5,z=6.0}) --casa
    minetest.get_player_by_name(name):move_to({x=24.0,y=0.5,z=6.0}) --, continuous=false) --casa
    score = 0
end)








-- player texture
--minetest.register_on_joinplayer(function(player)
--    default.player_set_textures(player, {"player.png"})
--end)


        mobs:spawn({
	        name = "mobs_npc:guard",
	        nodes = {"earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick","group:stone", "group:soil", },
	        neighbors = {"air",}, --"earthbuild:earthbuild_whitewashed_earth","earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick"
	        min_light = 0,
	        interval = 1,
	        chance = 5,
	        active_object_count = 3,
	        min_height = 1,
	        max_height = 3,
	        day_toggle = nil,
        })

        mobs:spawn({
	        name = "mobs_npc:guard2",
	        nodes = {"earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick","group:stone", "group:soil", },
	        neighbors = {"air",}, --"earthbuild:earthbuild_whitewashed_earth","earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick"
	        min_light = 0,
	        interval = 1,
	        chance = 10,
	        active_object_count = 3,
	        min_height = 1,
	        max_height = 3,
	        day_toggle = nil,
        })

        mobs:spawn({
	        name = "mobs_animal:rat",
	        nodes = {"earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick","group:stone", "group:soil", },
	        neighbors = {"air",}, --"earthbuild:earthbuild_whitewashed_earth","earthbuild:mud_brick", "default:desert_sandstone_block", "default:desert_sandstone_brick"
	        min_light = 0,
	        max_light = 8,
	        interval = 1,
	        chance = 10,
	        active_object_count = 2,
	        min_height = 1,
	        max_height = 3,
	        day_toggle = nil,
        })


-- on_joinplayer
minetest.register_on_joinplayer(function(player)

    score = 0
	--minetest.register_on_respawnplayer({x=4,y=-5065,z=-11523})

	--local name = player:get_player_name()
	local name = player:get_player_name()
	--local p = minetest.get_player_privs(name)
	--p['fly'] = false
	--minetest.set_player_privs(name, p)


-- posição referencia inicial 0,0,0 do schematics
-- posição inicial do player:

    minetest.place_schematic({x=0,y=0,z=0}, minetest.get_modpath("schems").."/templeb.mts", 0, true, true)

    --[[
    local my_hud = player:hud_add({
        hud_elem_type = "text",
        position = {x=0.5,y=0.5},
        size = {x=-20,y=-20},
        text = initial_text,
        alignment = {x=0,y=0},
        offset = {x=0,y=0},
    })
--]]

    minetest.get_player_by_name(name):setpos({x=24.0,y=0.5,z=6.0}) --casa
    --local mapatual = 1 -- casa

    --[[local mapa = math.random(3)
    --if mapa == 1 then --templo
        minetest.place_schematic({x=xmap,y=0,z=0}, minetest.get_modpath("schems").."/temple1.mts", 0, true, true)
    --elseif mapa == 2 then --casa
        minetest.place_schematic({x=xmap,y=0,z=0}, minetest.get_modpath("schems").."/temple2.mts", 0, true, true)
    --else -- tumba
        minetest.place_schematic({x=xmap,y=0,z=0}, minetest.get_modpath("schems").."/temple3.mts", 0, true, true) 
    --end--]]

end)


-- mecanica do jogo
minetest.register_globalstep(
function(dtime)
    --local player = minetest.get_player_by_name(name)  
    --local name = player:get_player_name()
    --local player = minetest.get_player_by_name(name)
    --minetest.chat_send_all("Hello World!!!!!")
    --if player:get_player_name() then
	for i, player in pairs(minetest.get_connected_players()) do
		local player_name = player:get_player_name()
        local pos = player:get_pos()
        --local pos = minetest.get_player_by_name(get_pos())
        --minetest.chat_send_all("Hello World!")

        -- caiu no infinito 
        if pos.y <= -1.0 then
            minetest.get_player_by_name(player_name):setpos({x=24.0,y=0.5,z=6.0})
        end

        -- ordem de preferencia: casa, templo, casa chique, tumba
        -- teleports
        -- saída da casa
        if pos.x <= 14.0 and pos.x >= 13.0 and pos.z >= 5.8 then --and mapatual == 1 
            -- escolher mapa
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then
                minetest.get_player_by_name(player_name):setpos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --casa chique
                minetest.get_player_by_name(player_name):setpos({x=41.0,y=0.5,z=6.0})
            else 
                minetest.get_player_by_name(player_name):setpos({x=2.0,y=0.5,z=6.0}) --templo
            end   
        end 
        -- saída do templo
        if pos.x >= 11.6 and pos.x <= 12.2 and pos.z >= 5.8 then --and mapatual == 2 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):setpos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --casa chique
                minetest.get_player_by_name(player_name):setpos({x=41.0,y=0.5,z=6.0})
            else 
                minetest.get_player_by_name(player_name):setpos({x=24.0,y=0.5,z=6.0}) --casa
            end  
        end
        -- saída da casa chique
        if pos.x >= 55.0 and pos.z >= 2.8 then --and mapatual == 3 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):setpos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --templo
                minetest.get_player_by_name(player_name):setpos({x=2.0,y=0.5,z=6.0})
                --mapatual = 2 
            else 
                minetest.get_player_by_name(player_name):setpos({x=24.0,y=0.5,z=6.0}) --casa
            end  
        end
        -- saída da tumba
        if pos.x <= 27.5 and pos.x >= 26.8 and pos.z <= 6.0 then --and mapatual == 4 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):setpos({x=41.0,y=0.5,z=6.0}) --casa chique
              --  mapatual = 1
            elseif mapa == 2 then --templo
                minetest.get_player_by_name(player_name):setpos({x=2.0,y=0.5,z=6.0})
                --mapatual = 2 
            else 
                minetest.get_player_by_name(player_name):setpos({x=24.0,y=0.5,z=6.0}) --casa
                --mapatual = 3
            end  
        end
        
        



        
        -- drops 
        if moved == 1 then
            score = score + 1
            minetest.chat_send_all("Score: "..score)
            


        minetest.add_item({x=18.0,y=0.5,z=1.0}, ItemStack({ -- house
				name = "farming:bread",
				count = 1
			}))
        --[[ minetest.add_item({x=5.0,y=0.5,z=11.0}, ItemStack({ -- temple
				name = "bows:arrow",
				count = 5
			}))
        minetest.add_item({x=43.0,y=0.5,z=3.0}, ItemStack({ -- house chique
				name = "bows:bow_bronze",
				count = 1
			})) --]]
        minetest.add_item({x=47.0,y=0.5,z=1.0}, ItemStack({ -- house chique
				name = "farming:bread",
				count = 1
			}))



            -- redecorando
            rnddeco = math.random(9)
            -- casa
            if rnddeco == 1 then
                minetest.set_node({x=17.0,y=1.0,z=6.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 2 then
                minetest.set_node({x=17.0,y=1.0,z=6.0},{name="air"})
            elseif rnddeco == 3 then
                minetest.set_node({x=17.0,y=1.0,z=6.0},{name="earthbuild:basket"})
            elseif rnddeco == 4 then
                minetest.set_node({x=20.0,y=1.0,z=8.0},{name="earthbuild:basket"})
            elseif rnddeco == 5 then
                minetest.set_node({x=20.0,y=1.0,z=8.0},{name="air"})
            elseif rnddeco == 6 then
                minetest.set_node({x=20.0,y=1.0,z=8.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 7 then
                minetest.set_node({x=17.0,y=1.0,z=3.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 8 then
                minetest.set_node({x=17.0,y=1.0,z=3.0},{name="air"})
            elseif rnddeco == 9 then
                minetest.set_node({x=17.0,y=1.0,z=3.0},{name="earthbuild:mud_brick"})
            end

            -- templo
            if rnddeco == 1 then
                minetest.set_node({x=11.0,y=1.0,z=3.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 2 then
                minetest.set_node({x=11.0,y=1.0,z=3.0},{name="air"})
            elseif rnddeco == 3 then
                minetest.set_node({x=11.0,y=1.0,z=3.0},{name="earthbuild:basket"})
            elseif rnddeco == 4 then
                minetest.set_node({x=9.0,y=1.0,z=4.0},{name="air"})
                minetest.set_node({x=9.0,y=1.0,z=5.0},{name="air"})
                minetest.set_node({x=9.0,y=2.0,z=4.0},{name="air"})
                minetest.set_node({x=9.0,y=2.0,z=5.0},{name="air"})
                minetest.set_node({x=9.0,y=1.0,z=7.0},{name="air"})
                minetest.set_node({x=9.0,y=1.0,z=8.0},{name="air"})
                minetest.set_node({x=9.0,y=2.0,z=7.0},{name="air"})
                minetest.set_node({x=9.0,y=2.0,z=8.0},{name="air"})
            elseif rnddeco == 5 then
                minetest.set_node({x=9.0,y=1.0,z=4.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=1.0,z=5.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=2.0,z=4.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=2.0,z=5.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=1.0,z=7.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=1.0,z=8.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=2.0,z=7.0},{name="default:desert_sandstone_brick"})
                minetest.set_node({x=9.0,y=2.0,z=8.0},{name="default:desert_sandstone_brick"})
            elseif rnddeco == 9 then
                minetest.add_item({x=32.0,y=1.0,z=3.0}, ItemStack({ -- tumba 1/5
				        name = "default:sword_bronze",
				        count = 1
			        }))
            end

            -- casa chique
            if rnddeco == 1 then
                minetest.set_node({x=51.0,y=2.0,z=9.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 2 then
                minetest.set_node({x=51.0,y=2.0,z=9.0},{name="air"})
            else
                minetest.set_node({x=51.0,y=2.0,z=9.0},{name="earthbuild:basket"})
            end
            -- tumba
            if rnddeco == 1 then
                minetest.set_node({x=33.0,y=1.0,z=8.0},{name="air"})
            elseif rnddeco == 2 then
                minetest.set_node({x=33.0,y=1.0,z=8.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 3 then
                minetest.set_node({x=33.0,y=1.0,z=8.0},{name="earthbuild:basket"})
            elseif rnddeco == 4 then
                minetest.set_node({x=28.0,y=1.0,z=10.0},{name="air"})
            elseif rnddeco == 5 then
                minetest.set_node({x=28.0,y=1.0,z=10.0},{name="earthbuild:storage_pot"})
            elseif rnddeco == 6 then
                minetest.set_node({x=28.0,y=1.0,z=10.0},{name="earthbuild:basket"})
            elseif rnddeco == 7 then
                minetest.set_node({x=28.0,y=2.0,z=5.0},{name="default:desert_sandstone_brick"})
            elseif rnddeco == 8 then
                minetest.set_node({x=28.0,y=2.0,z=5.0},{name="air"})
            elseif rnddeco == 9 then
                minetest.add_item({x=32.0,y=1.0,z=3.0}, ItemStack({ -- tumba
				        name = "default:sword_bronze",
				        count = 1
			        }))
            end
        end






        -- guards
--[[        minetest.add_item({x=15.0,y=0.5,z=8.0}, ItemStack({ -- house
				name = "mobs_npc:guard",
				count = 1
			})) --]]



















    moved = 0
    end
end
)



--disabled_settings = !creative_mode



--[[
mobs:spawn({
	name = "mobs_npc:npc",
	nodes = {"default:brick"},
	neighbors = {"default:grass_3"},
	min_light = 10,
	chance = 10000,
	active_object_count = 1,
	min_height = 0,
	day_toggle = true,
})
--]]








--[[
-- bots
mobs.register_mob(minetest.get_current_modname()..":guard",{
    type="monster",
    hp_min=10,
    hp_max=50,
    attack_players=true,
    attack_type="shoot",
})

--[[
mobs:add_mob(pos, {
		name = minetest.get_current_modname()..":guard",
		child = true,
		--owner = "singleplayer",
		--nametag = "Bessy",
		--ignore_count = true -- ignores mob count per map area
})



--[[
-- bots
aliveai.create_bot({
	name="guard",
	team="guards",
	texture="default_dirt.png",
	type="monster",
	talking=0,
	attack_players=1,
	attacking=1,
	building=0,
	hp=10,
	name_color="",
	spawn_on={"default:desert_sandstone"},
	start_with_items={["bows:arrow"]=99,["bows:bow_bronze"]=1},
})
--]]

