## Creates a basic install of Ghost for testing

Creates a ghost user and installs Ghost (running on port 2368) for Docker

#### To build:

	docker build -t ghost .

#### To start (example for starting in the background on port 8100):

	docker run -dit -v $(pwd):/var/www/ghost -p 8100:2368 ghost