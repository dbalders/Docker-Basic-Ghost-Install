FROM node:6-slim

WORKDIR /var/www/ghost

#Create ghost user
RUN groupadd -g 999 ghost; \
	useradd -r -u 999 -g ghost ghost; \
	usermod -aG sudo ghost; \
	\
#Update and install ghost-cli \
	apt-get update -y; \
	npm install -g ghost-cli@latest; \
	\
#Create ghost folder and correct permissions \
	mkdir /home/ghost; \
	chown -R ghost:ghost . && chown -R ghost:ghost /home/ghost

#Switch to ghost user
USER ghost

#Install ghost
RUN ghost install --local --no-prompt --ip '0.0.0.0'

EXPOSE 2368

CMD node current/index.js