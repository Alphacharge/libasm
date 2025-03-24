NAME	:=	libasm.a

###			###			COMPILER		###			###
CC		:=	"cc"
CFLAGS	:=	-Wall -Wextra -Werror -fPIE

###			###			SOURCES			###			###
SRC		:=	ft_strlen.asm ft_strcpy.asm ft_strcmp.asm
SRC		+=	ft_strdup.asm

VPATH	:= src/

###			###			OBJECTS			###			###
OBJ_D	:=	./obj
SRCOBJ	:=	$(patsubst %.asm,$(OBJ_D)/%.o,$(SRC))

###			###			COLORS			###			###
RED = \033[1;31m
GREEN = \033[1;32m
YELL = \033[1;33m
BLUE = \033[1;34m
WHITE = \033[0m

###			###			RULES			###			###
all: $(OBJ_D)
	@$(MAKE) -j $(NAME)

$(NAME): $(SRCOBJ)
	@ar -rcs $(NAME) $^
	@ranlib $(NAME)
	@echo "$(RED)--->$(BLUE)Libasm is compiled.$(WHITE)"

$(OBJ_D)/%.o: %.asm message
	@nasm -f elf64 -o $@ $<

message:
	@echo "$(BLUE)--->$(GREEN)Compiling asm Files .....$(WHITE)"

$(OBJ_D):
	@mkdir $@

clean:
	@echo "$(YELL)--->$(RED)Cleaning Objects .....$(WHITE)"
	@/bin/rm -rf $(OBJ_D) libft.h.gch

fclean: clean
	@if [ -f "$(NAME)" ]; then \
		/bin/rm -f $(NAME); \
		echo "$(GREEN)--->$(YELL)Cleaning Lib .....$(WHITE)";else \
		echo "No $(NAME) to remove."; \
	fi;

re: fclean all

test: all
	@$(CC) $(CFLAGS) -c main.c -o obj/main.o
	@$(CC) $(CFLAGS) obj/main.o $(NAME) -o test

.PHONY: all clean fclean re

.INTERMEDIATE: message