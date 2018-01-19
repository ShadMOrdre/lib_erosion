
lib_erosion = {}

-- internationalization boilerplate
local MP = minetest.get_modpath(minetest.get_current_modname())
local S, NS = dofile(MP.."/intllib.lua")

lib_erosion.path = minetest.get_modpath(minetest.get_current_modname())


minetest.register_chatcommand("biomes_get", {
    params = "",
	description = S("List all biomes."),
	_doc_items_longdesc = S("List all biomes as registered with minetest.registered_biomes"),
	_doc_items_usagehelp = S("Type /biomes_get in the console."),
    func = function(name)
        local list_biomes = "REGISTERED BIOMES:\n"
 
		for biome_name, biome_def in pairs(minetest.registered_biomes) do
			list_biomes = list_biomes .. "\t" .. biome_name .. "\n"
		end

        minetest.chat_send_player(name, S(list_biomes))

	end

})

	
minetest.register_chatcommand("decorations_get", {
    params = "",
	description = S("List all decorations."),
	_doc_items_longdesc = S("List all decorations as registered with minetest.registered_decorations"),
	_doc_items_usagehelp = S("Type /decorations_get in the console."),
     func = function(name)
	
		local list_decorations = ""

		for _, deco_def in pairs(minetest.registered_decorations) do
		
			--list_decorations = list_decorations .. "\t" .. dump(deco_def, " ") .. "\n"
			
			minetest.chat_send_player(name, S("Start Decorations List"))
			dump(deco_def, " ")
			minetest.chat_send_player(name, S("End Decorations List"))
			
			-- if deco_def.deco_type ~= "schematic" then
			
				-- list_decorations = list_decorations .. "\t" .. tostring(deco_def.decoration) .. "\n"
			-- end
		end

        --minetest.chat_send_player(name, S(list_decorations))

	end
})


dofile(lib_erosion.path .. "/lib_seedling.lua")