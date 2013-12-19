#!/bin/bash

echo "Hello, "$USER". This script will clone the Zparkl demo project to your machine, and set it up locally."
echo

proj_path="${PWD}/zparkl_demo";

if [ ! -d "${proj_path}" ]; then
	cd zparkl_demo;
	git clone --recursive https://github.com/artminster/zparkl-demo.git;
	
	virtualenv "${proj_path}/env";
	source "${proj_path}/env/bin/activate";
	sudo pip install -r "${proj_path}/artminster/core/requirements.txt";
	sudo pip install -r "${proj_path}/artminster/contrib/billing/requirements.txt";
	sudo pip install -r "${proj_path}/allauth/requirements.txt";
	sudo pip install -r "${proj_path}/requirements.txt";
	
	echo "Create database (use password 'zparkl_demo' for a quick win)"
	
	# Create database 
	createuser -h localhost -S -D -R zparkl_demo;
	createdb -h localhost -U postgres zparkl_demo;
	
	sh "${proj_path}/manage" syncdb --noinput;
	sh "${proj_path}/manage" migrate;
	sh "${proj_path}/manage" loaddata "${proj_path}/initial.json";
fi

echo "The project has been successfully cloned and setup locally. Goodbye :)"
