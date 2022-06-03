# zldb
# Makefile for zldb
# File:/src/Makefile
# Date:2022.06.03
# By MIT License.
# Copyright(C) 2022 Ziyaa.All rights reserved.

# Tools
LMERGE		:= lmerge
CP		:= cp
CHMOD		:= chmod
REMOVE		:= rm

# Files
SRC		:= zldb.lua
OUTPUT_SCRIPT	:= zldb

# Directories
DIR_INSTALL	:= ${HOME}/.local/bin

default: build

build: $(SRC)
	$(LMERGE) $(SRC) -m zldb.lua -ishb -o $(OUTPUT_SCRIPT)
	$(CHMOD) 777 $(OUTPUT_SCRIPT)

install: build
	$(CP) $(OUTPUT_SCRIPT) $(DIR_INSTALL) 

clean:
	$(REMOVE) $(OUTPUT_SCRIPT)
