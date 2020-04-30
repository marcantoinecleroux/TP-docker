repo=https://github.com/Velythyl/OS-docker-TP-Scala.git
image_tag=my_tag

all: clone 

clone:
	git clone $(repo)

build:
	docker build  . -t $(image_tag)

# a toi de remplir run
run: 
	docker run --rm -it -v $(PWD):/projects -w /pdfs dockerImage bash

clean:
	rm -rf OS-docker-TP-Scala
