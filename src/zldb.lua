#!/usr/bin/env lua
--[[
	zldb
	File:/src/zldb.lua
	Date:2022.06.03
	By MIT License.
	Copyright (c) 2022 Ziyao.All rights reserved.
]]

local io		= require("io");

local modConf		= require("Conf");
local modLang		= require("Lang");

local gzldb = {
			conf = modConf.load(),
	      };

modLang.init(gzldb.conf.lang);

print(modLang.translate("Hello"));
