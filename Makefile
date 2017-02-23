NAME    = awesome
CC      = gcc
CFLAGS  = -std=c99 -O2 -Wall
FILES   = main
DIR_SRC = ./src
DIR_OBJ = ./obj
DIR_BIN = ./bin
OBJ     = $(patsubst %, $(DIR_OBJ)/%.o, $(FILES))

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

build: $(OBJ)
	$(CC) $(CFLAGS) -o $(DIR_BIN)/$(NAME) $(OBJ)

.PHONY:

clean:
	rm -vf $(DIR_BIN)/$(NAME) $(OBJ)

install:
	cp -f $(DIR_BIN)/$(NAME) /usr/local/bin/
    if [ echo ${PATH} | grep -q ":/usr/local/bin" ]; then PATH=${PATH}:/usr/local/bin; fi

uninstall:
	rm -f /usr/local/bin/$(NAME)
