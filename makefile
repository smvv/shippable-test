DOCKER ?= docker

# --- Frontend ----------------------------------------------------------------

FRONTEND_NAME ?= tacx/tacx-frontend
FRONTEND_CMD ?= /frontend/src/start.sh
FRONTEND_ADDR ?= 8080

FRONTEND_ARGS ?= \
	-e DEBUG=1 \
	-e SOURCE_RELOAD=1 \
	-v `pwd`/src:/frontend/src:ro \

FRONTEND ?= $(FRONTEND_ARGS) $(FRONTEND_NAME) $(FRONTEND_CMD)

frontend:
	$(DOCKER) build -t $(FRONTEND_NAME) .
	$(DOCKER) run --rm -ti -p $(FRONTEND_ADDR):80 $(FRONTEND)

test: FRONTEND_ARGS += -e SOURCE_TEST=1
test: FRONTEND_ARGS += -p 9018:9018 -p 9019:9019 -p 9100:9100
test: frontend

watch: FRONTEND_ARGS += -e SOURCE_WATCH=1
watch: FRONTEND_ARGS += -p 9018:9018 -p 9019:9019 -p 9100:9100
watch: frontend
