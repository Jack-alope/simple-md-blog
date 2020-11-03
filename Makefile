all: update post

update:
	sudo apt-get update
	sudo apt-get install python3-pip make tree -y
	python3 -m pip install markdown

post:
	chmod u+x script.sh
	./script.sh
