# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ixu <ixu@student.hive.fi>                  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/01/12 15:32:27 by ixu               #+#    #+#              #
#    Updated: 2024/01/14 23:56:32 by ixu              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Name of the program
NAME := pipex

# Compiler and flags
CC := cc
CFLAGS := -Wall -Wextra -Werror

# Color scheme
COLOR_BLUE := \033[0;34m
COLOR_WHITE := \033[0;37m
COLOR_BRIGHT_WHITE := \033[0;97m
COLOR_END := \033[0m

# Directory locations
SRCS_DIR := srcs/
SRCS_BONUS_DIR := srcs_bonus/
OBJS_DIR := objs/
LIBFT_DIR := libft/

# Source file names for mandatory and bonus parts
SRCS := pipex.c \
		utils.c \
		parsing.c \
		free.c

SRCS_BONUS := pipex_bonus.c \
				utils_bonus.c \
				files_bonus.c \
				parsing_bonus.c \
				error_bonus.c \
				free_bonus.c

# Object files including paths
OBJS := $(addprefix $(OBJS_DIR), $(SRCS:.c=.o))
OBJS_BONUS := $(addprefix $(OBJS_DIR), $(SRCS_BONUS:.c=.o))

LIBFT := $(LIBFT_DIR)libft.a

all: $(NAME)

$(NAME): $(OBJS_DIR) $(OBJS) .base
	@$(MAKE) -s -C $(LIBFT_DIR)
	@$(CC) -o $(NAME) $(OBJS) -L$(LIBFT_DIR) -lft
	@echo "$(COLOR_BRIGHT_WHITE)$(NAME) created (for mandatory part)$(COLOR_END)"

.base:
	@rm -f .bonus
	@touch .base

bonus: .bonus

.bonus: $(OBJS_DIR) $(OBJS_BONUS)
	@$(MAKE) -s -C $(LIBFT_DIR)
	@$(CC) -o $(NAME) $(OBJS_BONUS) -L$(LIBFT_DIR) -lft
	@rm -f .base
	@touch .bonus
	@echo "$(COLOR_BRIGHT_WHITE)$(NAME) created (for bonus part)$(COLOR_END)"

$(OBJS_DIR):
	@mkdir -p $(OBJS_DIR)
	@echo "$(COLOR_WHITE)$(OBJS_DIR) directory created$(COLOR_END)"

$(OBJS_DIR)%.o: $(SRCS_DIR)%.c
	@$(CC) $(CFLAGS) -c $< -o $@

$(OBJS_DIR)%.o: $(SRCS_BONUS_DIR)%.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@rm -fr $(OBJS_DIR)
	@$(MAKE) -s -C $(LIBFT_DIR) fclean
	@rm -f .bonus
	@rm -f .base
	@echo "$(COLOR_BLUE)$(OBJS_DIR) directory and object files removed$(COLOR_END)"
	@echo "$(COLOR_BLUE)$(LIBFT) and libft object files removed$(COLOR_END)"
 
fclean: clean
	@rm -f $(NAME)
	@echo "$(COLOR_BLUE)$(NAME) removed$(COLOR_END)"

re: fclean all