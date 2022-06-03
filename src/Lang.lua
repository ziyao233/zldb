--[[
	zldb
	File:/src/Lang.lua
	Date:2022.06.03
	By MIT License.
	Copyright (C) 2022 Ziyao.All rights reserved.
]]

local io		= require("io");

local modi18n		= require("i18n");

local init = function(lang)
	local translation = assert(load(lmerge.resource("translation.lua")))();
	modi18n.load(translation);
	if lang
	then
		modi18n.setLocale(lang);
	end
	return;
end

return {
		init		= init,
		translate	= modi18n.translate,
       };
