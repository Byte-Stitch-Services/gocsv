BUILDPATH=$(CURDIR)
GO=$(shell which go)
GOINSTALL=$(GO) install
GOCLEAN=$(GO) clean

export GOPATH=$(CURDIR)


linters-install:
	@golangci-lint --version > /dev/null 2>&1 || {\
  		echo "Installing linting tools..."; \
  		curl -sfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s v1.41.1; \
  }

lint: linters-install
	golangci-lint run