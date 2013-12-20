#!/bin/bash

echo "Hello, "$USER". This script will clone the Zparkl demo project to your machine, and set it up locally."
echo

proj_path="${PWD}/zparkl_demo";

if [ ! -d "${proj_path}" ]; then
	git clone --recursive https://github.com/artminster/zparkl-demo.git zparkl_demo;
	
	virtualenv "${proj_path}/env";
	source "${proj_path}/env/bin/activate";
	sudo pip install -r "${proj_path}/artminster/core/requirements.txt";
	sudo pip install -r "${proj_path}/artminster/contrib/billing/requirements.txt";
	sudo pip install -r "${proj_path}/allauth/requirements.txt";
	sudo pip install -r "${proj_path}/requirements.txt";
	
	echo "Create database and user 'zparkl_demo'"
	psql -U postgres -h localhost -W < "${proj_path}/configs/common/createdb.sql";
	PGPASSWORD='zparkl_demo' psql zparkl_demo -U zparkl_demo < "${proj_path}/db.sql"
	
	cd "${proj_path}/zparkl_demo/media"
	tar xvfz uploads.tgz
fi

echo "The project has been successfully cloned and setup locally. Goodbye :)"
