APP_NAME=$(notdir $(shell pwd))
APP_VERSION=0.0.0
BIN_DIR=bin
GIT_BRANCH_NAME=$(shell git rev-parse --abbrev-ref HEAD)

git_commit_id := $(shell git rev-parse --short HEAD)
build_time := $(shell date)
built_by := $(shell whoami)
build_host := $(shell hostname)
go_version := $(shell go version)
go_os := $(shell go env GOOS)
go_arch := $(shell go env GOARCH)

ifeq ($(go_os), windows)
	app_file_name=$(APP_NAME)_$(go_os)_$(go_arch).exe
else
	app_file_name=$(APP_NAME)_$(go_os)_$(go_arch)
endif

init:
	@mkdir -p $(BIN_DIR)

build: init
	@echo "Building ..."
	@echo $(app_name)
	@go build -ldflags "-X 'main.AppVersion=$(APP_VERSION)' -X 'main.VersionSuffix=$(vsuffix)' \
		-X 'main.VCSBranch=$(GIT_BRANCH_NAME)' -X 'main.BuildTime=$(build_time)' -X 'main.VCSCommitID=$(git_commit_id)' \
		-X 'main.BuiltBy=$(built_by)' -X 'main.BuildHost=$(build_host)' -X 'main.GOVersion=$(go_version)'" \
		-o $(BIN_DIR)/$(app_file_name)
	@echo "Binary $(app_file_name) saved in $(BIN_DIR)"

test:
	@go test -v ./...
