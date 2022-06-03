--[[
	zldb
	File:/src/Conf.lua
	Date:2022.06.03
	By MIT License.
	Copyright (c) 2022 Ziyao.All rights reserved.
]]

--[[
	This file includes a simple configuration reader
	Configuration will be loaded from $(HOME)/.zldb.cfg.lua,which
	is specified by constant variable CONF_CONFIG_PATH
]]

local io		= require("io");
local os		= require("os");

local CONF_CONFIG_PATH <const> = [[/.zldb.cfg.lua]];
local gDefaultCfg <const> = {
				lang		= "C",
				colored_msg	= false,
			    };

local cfg_load = function(path)
	local cfg,err;
	if not path
	then
		path = os.getenv("HOME");
		--[[	maybe non-POSIX systems	]]
		if not path
		then
			print("No configuration found");
			goto exit;
		end
		path = path .. CONF_CONFIG_PATH;
	end

	cfg,err = pcall(dofile,path);
	if not cfg
	then
		print("Error while loading configuration");
		print(err);
		goto exit;
	end
::exit::
	return cfg or gDefaultCfg;
end

return {
		load	= cfg_load,
       };
