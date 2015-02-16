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

watch:
	node node_modules/.bin/grunt watch

reload:
	node node_modules/.bin/grunt delta
