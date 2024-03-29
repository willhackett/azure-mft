export VERSION := $(or $(CIRCLE_TAG),$(shell git log --pretty=format:'%h' -n 1))

GO_PACKAGES = ./pkg/...

build:
	go build -o ./azmft -ldflags "-X config.Version=$(VERSION)" ./pkg
	chmod +x ./azmft

test:
	golint -set_exit_status ${GO_PACKAGES}
	go vet ${GO_PACKAGES}
	go test ${GO_PACKAGES}
