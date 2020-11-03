MDCMD=python3 -m markdown
# make sure -f is last
MDOPTS=-f

all: update indexraw.html

update:
	sudo apt-get update
	sudo apt-get install python3-pip make tree -y
	python3 -m pip install markdown

indexraw.html: README.md
	$(MDCMD) -x md_in_html $(MDOPTS) $(@) $(<)

upload: index.html
	ssh down.dsg.cs.tcd.ie "(cd /var/www/witidtm;git pull)"
