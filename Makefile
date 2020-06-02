TEMPLATE_NAME ?= wktadmin/janus-webrtc-gateway-docker

build:
	@docker build -t $(TEMPLATE_NAME) .

build-nocache:
	@docker build --no-cache -t $(TEMPLATE_NAME) .

bash:
	@docker run --net=host -v /home/ubuntu:/ubuntu --name="janus" -it -t $(TEMPLATE_NAME) /bin/bash

attach:
	@docker exec -it janus /bin/bash

run:
	@docker run --net=host --name="janus" -it -t $(TEMPLATE_NAME)

run-mac:
	@docker run -p 30080:30080 -p 8088:8088 -p 8188:8188 --name="janus" -it -t $(TEMPLATE_NAME)

run-hide:
	@docker run --net=host --name="janus" -it -t $(TEMPLATE_NAME) >> /dev/null
