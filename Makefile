all: update housekeeping post

update:
	sudo apt-get update
	sudo apt-get install python3-pip make tree -y
	python3 -m pip install markdown

housekeeping:
	sed -i '$$d' README.md
	date >> README.md
	
post:
	chmod u+x script.sh
	./script.sh
