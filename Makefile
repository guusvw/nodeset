all: push

REPO ?= kubenode/nodeset-controller

push: _output/nodeset-controller
		docker build -t $(REPO) -f cmd/nodeset-controller/Dockerfile .
		docker push $(REPO)

_output/nodeset-controller:
		mkdir -p _output
		GOOS=linux go build -o _output/nodeset-controller ./cmd/nodeset-controller
