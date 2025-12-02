.DEFAULT_GOAL := test

.PHONY:fmt vet build test

fmt:
	go fmt ./...

vet: fmt
	go vet ./...

build: vet
	go build

test: build
	go test
