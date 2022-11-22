# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker_miracle.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: irodrigo <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/11/22 13:17:41 by irodrigo          #+#    #+#              #
#    Updated: 2022/11/22 13:25:56 by irodrigo         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/env bash

echo "we are going to deactivate older initialization scripts in docker"

# this script moves older docker initialization elements and relaunch process
cd ~
cd library
cd Group\ Containers/
mv group.com.docker group.com.backup.docker
echo .
echo .
# Ensure USER variabe is set
[ -z "${USER}" ] && export USER=$(whoami)

################################################################################

# Config
docker_destination="/goinfre/$USER/docker" #=> Select docker destination (goinfre is a good choice)

################################################################################

# Colors
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
reset=$'\033[0;39m'

# Uninstall docker, docker-compose and docker-machine if they are installed with brew
brew uninstall -f docker docker-compose docker-machine &>/dev/null ;:

# Check if Docker is installed with MSC and open MSC if not
if [ ! -d "/Applications/Docker.app" ] && [ ! -d "~/Applications/Docker.app" ]; then
	echo "${blue}Please install ${cyan}Docker for Mac ${blue}from the MSC (Managed Software Center)${reset}"
	open -a "Managed Software Center"
	read -n1 -p "${blue}Press RETURN when you have successfully installed ${cyan}Docker for Mac${blue}...${reset}"
	echo ""
fi

# Kill Docker if started, so it doesn't create files during the process
pkill Docker

# Ask to reset destination if it already exists
if [ -d "$docker_destination" ]; then
	read -n1 -p "${blue}Folder ${cyan}$docker_destination${blue} already exists, do you want to reset it? [y/${cyan}N${blue}]${reset} " input
	echo ""
	if [ -n "$input" ] && [ "$input" = "y" ]; then
		rm -rf "$docker_destination"/{com.docker.{docker,helper},.docker} &>/dev/null ;:
	fi
fi

# Unlinks all symlinks, if they are
unlink ~/Library/Containers/com.docker.docker &>/dev/null ;:
unlink ~/Library/Containers/com.docker.helper &>/dev/null ;:
unlink ~/.docker &>/dev/null ;:

# Delete directories if they were not symlinks
rm -rf ~/Library/Containers/com.docker.{docker,helper} ~/.docker &>/dev/null ;:

# Create destination directories in case they don't already exist
mkdir -p "$docker_destination"/{com.docker.{docker,helper},.docker}

# Make symlinks
ln -sf "$docker_destination"/com.docker.docker ~/Library/Containers/com.docker.docker
ln -sf "$docker_destination"/com.docker.helper ~/Library/Containers/com.docker.helper
ln -sf "$docker_destination"/.docker ~/.docker

# Start Docker for Mac
open -g -a Docker

echo "${cyan}Docker${blue} is now starting! Please report any bug to: ${cyan}aguiot--${reset}"
echo "after this relaunch your docker application and wait to install"

