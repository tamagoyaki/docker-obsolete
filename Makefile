# samba's case for example
NAME = samba
DOCKERFILE = $(NAME).dockerfile
IMAGE= $(NAME)-i
CONTAINER = $(NAME)-c
PORT = -p 137:137/udp -p 138:138/udp -p 139:139/tcp -p 445:445/tcp

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
	docker run --name $(CONTAINER) -d -it $(PORT) $(IMAGE)

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
