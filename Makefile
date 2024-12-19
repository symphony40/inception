# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vejurick <vejurick@student.42prague.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/12/16 20:48:05 by vejurick          #+#    #+#              #
#    Updated: 2024/12/19 13:45:44 by vejurick         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all : up

up : 
	docker compose -f ./srcs/docker-compose.yml up --build

down : 
	docker compose -f ./srcs/docker-compose.yml down

stop : 
	docker compose -f ./srcs/docker-compose.yml stop

start : 
	docker compose -f ./srcs/docker-compose.yml start

status : 
	docker ps