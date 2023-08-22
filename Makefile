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


all:
	docker-compose -f ./srcs/docker-compose.yml up -d --build

clean:

fclean:

re:

.PHONY: all clean fclean re bonus