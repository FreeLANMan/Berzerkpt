local moved = 0 -- variável q indica se acabou de teleportar
local rnddeco = 0 -- variável da redecoração
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
    minetest.get_player_by_name(name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
    score = 0
end)

minetest.register_on_dieplayer(function(player) 
	local name = player:get_player_name()
    minetest.get_player_by_name(name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
    minetest.get_player_by_name(name):move_to({x=24.0,y=0.5,z=6.0})
    score = 0
end)








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


-- posição referencia inicial 0,0,0 do schematics
-- posição inicial do player:

    minetest.place_schematic({x=0,y=0,z=0}, minetest.get_modpath("schems").."/templeb.mts", 0, true, true)

    minetest.get_player_by_name(name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
end)


-- mecanica do jogo
minetest.register_globalstep(
function(dtime)
	for i, player in pairs(minetest.get_connected_players()) do
		local player_name = player:get_player_name()
        local pos = player:get_pos()

        -- caiu no infinito 
        if pos.y <= -1.0 then
            minetest.get_player_by_name(player_name):set_pos({x=24.0,y=0.5,z=6.0})
        end

        -- ordem de preferencia: casa, templo, casa chique, tumba
        -- teleports
        -- saída da casa
        if pos.x <= 14.0 and pos.x >= 13.0 and pos.z >= 5.8 then --and mapatual == 1 
            -- escolher mapa
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then
                minetest.get_player_by_name(player_name):set_pos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --casa chique
                minetest.get_player_by_name(player_name):set_pos({x=41.0,y=0.5,z=6.0})
            else 
                minetest.get_player_by_name(player_name):set_pos({x=2.0,y=0.5,z=6.0}) --templo
            end   
        end 
        -- saída do templo
        if pos.x >= 11.6 and pos.x <= 12.2 and pos.z >= 5.8 then --and mapatual == 2 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):set_pos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --casa chique
                minetest.get_player_by_name(player_name):set_pos({x=41.0,y=0.5,z=6.0})
            else 
                minetest.get_player_by_name(player_name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
            end  
        end
        -- saída da casa chique
        if pos.x >= 55.0 and pos.z >= 2.8 then --and mapatual == 3 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):set_pos({x=37.0,y=0.5,z=6.0}) --tumba
            elseif mapa == 2 then --templo
                minetest.get_player_by_name(player_name):set_pos({x=2.0,y=0.5,z=6.0})
                --mapatual = 2 
            else 
                minetest.get_player_by_name(player_name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
            end  
        end
        -- saída da tumba
        if pos.x <= 27.5 and pos.x >= 26.8 and pos.z <= 6.0 then --and mapatual == 4 
            moved = 1
            local mapa = math.random(3)
            if mapa == 1 then 
                minetest.get_player_by_name(player_name):set_pos({x=41.0,y=0.5,z=6.0}) --casa chique
              --  mapatual = 1
            elseif mapa == 2 then --templo
                minetest.get_player_by_name(player_name):set_pos({x=2.0,y=0.5,z=6.0})
                --mapatual = 2 
            else 
                minetest.get_player_by_name(player_name):set_pos({x=24.0,y=0.5,z=6.0}) --casa
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

    moved = 0
    end
end
)

