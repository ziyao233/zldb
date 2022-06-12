--[[
	zldb
	File:/src/Terminal.lua
	Date:2022.06.12
	By MIT License.
	Copyright (c) 2022 Ziyao.All rights reserved.
]]

--[[
	This file contents a simple implementation of human-friendly
	interface on terminal.
]]

--[[
	Operator list:

	Foreground Color
		Black		bk
		Red		rd
		Green		gr
		Yellow		yw
		Blue		bl
		Magenta		ma
		Cyan		cy
		white		wt

	Background Color
		Add 'b' before foreground color operators,such as bbk(Black)

	Set default foreground color cf
	Set default background color cb

	Effects:
		Clean effects	ce
		Bold		bd
		Blink		bi
]]

local gDefaultTerminalType <const> = "std";

local gOperatorCodeList <const> = {
	std = {
			_prefix = "",
	      },
	vt100 = {
			_prefix	= "\x1b[",
			bk	= "30m",
			rd	= "31m",
			gr	= "32m",
			yw	= "33m",
			bl	= "34m",
			ma	= "35m",
			cy	= "36m",
			wt	= "37m",
			cf	= "39m",

			bbk	= "40m",
			brd	= "41m",
			bgr	= "42m",
			byw	= "43m",
			bbl	= "44m",
			bma	= "45m",
			bcy	= "46m",
			bwt	= "47m",
			cb	= "49m",

			bd	= "1m",
			bi	= "5m",
			ce	= "0m",
		},
};

local gOperatorCodeTable = {};

local init = function(termType)
	gOperatorCodeTable = gOperatorCodeList[termType] or
			     gOperatorCodeList[gDefaultTerminalType];
	return;
end

local format = function(s,...)
	-- Back up escape characters
	s = string.gsub(s,"##","\1");	-- imho ASCII '\1' will not be used

	s = string.gsub(s,"#{(%w-)}",function(op)
					return gOperatorCodeTable._prefix ..
					       (gOperatorCodeTable[op] or "");
				      end);

	s = string.gsub(s,"\1","##");	-- Escape
	-- Restore escape characters
	return string.format(s,...);
end

local printf = function(...)
	return io.write(format(...));
end

local printfln = function(...)
	return io.write(format(...) .. "\n");
end

return {
		init		= init,
		format		= format,
		printf		= printf,
		printfln	= printfln,
       };
