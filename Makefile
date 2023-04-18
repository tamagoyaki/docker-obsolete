# django's case for example
NAME = django
DOCKERFILE = apache.dockerfile
IMAGE= $(NAME)-i
CONTAINER = $(NAME)-c
PORT = -p 80:80/tcp

help:
	@echo ''
	@echo '  USAGE'
	@echo ''
	@echo '    make $(IMAGE) - create an image'
	@echo '    make $(CONTAINER) - create a container'
	@echo '    make status -  status of container'
	@echo '    make start  -  start a container'
	@echo '    make stop   -  stop a container'
	@echo '    make bash   -  connect to bash on container'
	@echo '    make attach -  attach to main process on container'
	@echo ''

# build
$(IMAGE):
	docker build -f $(DOCKERFILE)  -t $(IMAGE) .

# run
$(CONTAINER):
	docker run --name $(CONTAINER) -it -d $(PORT) $(IMAGE)

# play with container
start:
	docker start $(CONTAINER)
stop:
	docker stop $(CONTAINER)
status:
	docker ps -a
attach:
	docker attach $(CONTAINER)
bash:
	docker exec -it $(CONTAINER) /bin/bash
