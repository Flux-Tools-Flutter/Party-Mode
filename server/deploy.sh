#!/bin/bash

##########################################################
#
# you need to have the host configured in .ssh/config
# sample
#
# Host party-mode-api
#     HostName <ip or domain>
#     User root
#     IdentityFile ~/.ssh/<pemfile>
#
##########################################################


# SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# cat << EndOfMessage
#  ____            _                   _   _
# |  _ \  ___  ___| |_ _ __ _   _  ___| |_(_)_ __   __ _
# | | | |/ _ \/ __| __| '__| | | |/ __| __| | '_ \ / _` |
# | |_| |  __/\__ \ |_| |  | |_| | (__| |_| | | | | (_| |
# |____/ \___||___/\__|_|   \__,_|\___|\__|_|_| |_|\__, |
#                                                  |___/
#             _   _
#   __ _  ___| |_(_) ___  _ __
#  / _` |/ __| __| |/ _ \| '_ \
# | (_| | (__| |_| | (_) | | | |
#  \__,_|\___|\__|_|\___/|_| |_|
# EndOfMessage

echo "IF9fX18gICAgICAgICAgICBfICAgICAgICAgICAgICAgICAgIF8gICBfCnwgIF8gXCAgX19fICBfX198IHxfIF8gX18gXyAgIF8gIF9fX3wgfF8oXylfIF9fICAgX18gXwp8IHwgfCB8LyBfIFwvIF9ffCBfX3wgJ19ffCB8IHwgfC8gX198IF9ffCB8ICdfIFwgLyBfYCB8CnwgfF98IHwgIF9fL1xfXyBcIHxffCB8ICB8IHxffCB8IChfX3wgfF98IHwgfCB8IHwgKF98IHwKfF9fX18vIFxfX198fF9fXy9cX198X3wgICBcX18sX3xcX19ffFxfX3xffF98IHxffFxfXywgfAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfF9fXy8KICAgICAgICAgICAgXyAgIF8KICBfXyBfICBfX198IHxfKF8pIF9fXyAgXyBfXwogLyBfYCB8LyBfX3wgX198IHwvIF8gXHwgJ18gXAp8IChffCB8IChfX3wgfF98IHwgKF8pIHwgfCB8IHwKIFxfXyxffFxfX198XF9ffF98XF9fXy98X3wgfF98" | base64 -D
echo
echo

read -p "Are you sure you want to continue? y/n" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then

echo "creating bundle"
echo "${SCRIPTPATH}"

# takes env variables from /env
# and build an .env file for each service
./generate_envs.sh env/main.prod.env .prod.env

# tar -czvf bundle.tar.gz --exclude 'node_modules' ./web-app ./api ./database ./nginx ./docker-compose.* ./rebuild-run-prod.sh
tar -czvf bundle.tar.gz --exclude 'node_modules' ./api ./docker-compose.* ./rebuild-run-prod.sh

# scp bundle.tar.gz xxx-aws:~/bundle.tar.gz
rsync -r -v --progress ./bundle.tar.gz party-mode:~/bundle.tar.gz

ssh party-mode << EOF
cd ~
mkdir -p app/ && tar -xzvf bundle.tar.gz -C app/
cd app
./rebuild-run-prod.sh
EOF
exit 0

fi

exit 1
