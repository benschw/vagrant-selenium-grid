## install

	vagrant up

thats it: this will boot a selenium grid cluster with 3 firefox nodes running.

Tweak the settings by shelling in and working with the 
[docker-selenium-grid](https://github.com/benschw/docker-selenium-grid) repo:

	vagrant ssh
	cd docker-selenium-grid
	./grid.sh

## test your install

If you want to make sure it works, install 
[protractor](https://github.com/angular/protractor) and run `./test.sh`
 

	npm install -g protractor
	./test.sh


