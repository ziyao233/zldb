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
DEPENDENCY	:= ../dep/i18n.lua
LANG		:= -r ../lang/translation.lua
OUTPUT_SCRIPT	:= zldb

# Module names
NAME_i18n	:= -n ../dep/i18n.lua i18n
NAME_LANG	:= -n ../lang/translation.lua translation.lua
NAME		:= $(NAME_i18n) $(NAME_LANG)

# Directories
DIR_INSTALL	:= ${HOME}/.local/bin

default: build

build: $(SRC)
	$(LMERGE) $(SRC) $(DEPENDENCY) -m zldb.lua -ishb -o $(OUTPUT_SCRIPT) \
		  $(LANG) $(NAME)
	$(CHMOD) 777 $(OUTPUT_SCRIPT)

install: build
	$(CP) $(OUTPUT_SCRIPT) $(DIR_INSTALL) 

clean:
	$(REMOVE) $(OUTPUT_SCRIPT)
