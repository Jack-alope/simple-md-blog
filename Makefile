all: update indexraw.html

update:
	sudo apt-get update
	sudo apt-get install python3-pip make tree -y
	python3 -m pip install markdown

indexraw.html: README.md
	python3 -m markdown -x md_in_html -f $(@) $(<)
	
post:
	python3 -m markdown -x md_in_html posts/sample.md >> pages/sample.html

upload: index.html
	ssh down.dsg.cs.tcd.ie "(cd /var/www/witidtm;git pull)"
