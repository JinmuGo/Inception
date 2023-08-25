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

MARIADB_DATA_DIR 	:= /home/admin/data/mariadb_data
WORDPRESS_DATA_DIR 	:= /home/admin/data/wordpress_data

all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:
	docker-compose -f ./srcs/docker-compose.yml down

fclean:
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf $(MARIADB_DATA_DIR)/* $(WORDPRESS_DATA_DIR)/*
	docker image rm $(shell docker images -q)

re: fclean
	$(MAKE) all

.PHONY: all clean fclean re bonus