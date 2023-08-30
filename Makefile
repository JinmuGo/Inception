# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jgo <jgo@student.42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/08/22 14:12:09 by jgo               #+#    #+#              #
#    Updated: 2023/08/22 14:34:42 by jgo              ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DATA_DIR := /home/$(shell whoami)/data
MARIADB_DATA_DIR := $(DATA_DIR)/mariadb_data
WORDPRESS_DATA_DIR := $(DATA_DIR)/wordpress_data

mandatory: $(DATA_DIR) $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR)
	docker-compose -f ./srcs/docker-compose.yml up mariadb wp_php nginx -d --build

bonus all: $(DATA_DIR) $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR)
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean: clean
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf $(MARIADB_DATA_DIR)/* $(WORDPRESS_DATA_DIR)/*
	docker image rm $(shell docker images -q)

re: fclean
	$(MAKE) all

$(DATA_DIR) $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR):
	mkdir -p $@

.PHONY: all clean fclean re $(DATA_DIR) $(MARIADB_DATA_DIR) $(WORDPRESS_DATA_DIR)