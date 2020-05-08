repo=https://github.com/Velythyl/OS-docker-TP-Scala.git
image_tag=my_tag

all: clone 

clone:
	git clone $(repo)

build:
	docker build  . -t $(image_tag)

# a toi de remplir run
run: 
	#essai
	#docker run --mount type=bind,source="$(PWD)/pdfs",target=/pdfs dockerImage --name="$(image_tag)" $(image_tag)
	#essai from scratch perso
	docker run $(image_tag)

clean:
	rm -rf OS-docker-TP-Scala
