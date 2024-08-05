# -- go --

go-update:
	go get -u ./...

go-tidy:
	go mod tidy -v

lint:
	golangci-lint --timeout=3m run

test:
	# go clean -testcache
	go test -p 1 -shuffle=on -race ./src/...

test-coverage:
	go test -p 1 -shuffle=on -race -coverprofile=${COVERAGE_FILE} ./src/...

show-coverage:
	go tool cover -html=${COVERAGE_FILE}
