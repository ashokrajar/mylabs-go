APP_NAME=$(notdir $(shell pwd))

BIN_DIR=bin

MAJOR_VERSION=0
MINOR_VERSION=0
PATCH_VERSION=0

BUILD_METADATA=$(shell git rev-parse --short HEAD)

GIT_BRANCH_NAME := $(shell git rev-parse --abbrev-ref HEAD | cut -f1 -d'/')


git_commit_id := $(BUILD_METADATA)
build_time := $(shell date)
built_by := $(shell whoami)
build_host := $(shell hostname)
go_version := $(shell go version)
go_os := $(shell go env GOOS)
go_arch := $(shell go env GOARCH)

ifeq ($(GIT_BRANCH_NAME), master)
	vsuffix=
else ifeq ($(GIT_BRANCH_NAME), hostfix)
	vsuffix=hf.$(BUILD_METADATA)
else ifeq ($(GIT_BRANCH_NAME), bugfix)
	vsuffix=bug+$(BUILD_METADATA)
else ifeq ($(GIT_BRANCH_NAME), release)
	vsuffix=rc.$(BUILD_METADATA)
else ifeq ($(GIT_BRANCH_NAME), develop)
	vsuffix=next+$(BUILD_METADATA)
else ifeq ($(GIT_BRANCH_NAME), feature)
	vsuffix=feat+$(BUILD_METADATA)
else
	vsuffix=edge+$(BUILD_METADATA)
endif


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
	@go build -ldflags "-X 'main.MajorVersion=$(MAJOR_VERSION)' -X 'main.MinorVersion=$(MINOR_VERSION)' \
		-X 'main.PatchVersion=$(PATCH_VERSION)' -X 'main.VersionSuffix=$(vsuffix)' -X 'main.VCSBranch=$(git_branch)' \
		-X 'main.BuildTime=$(build_time)' -X 'main.VCSCommitID=$(git_commit_id)' \
		-X 'main.BuiltBy=$(built_by)' -X 'main.BuildHost=$(build_host)' -X 'main.GOVersion=$(go_version)'" \
		-o $(BIN_DIR)/$(app_file_name)
	@echo "Binary $(app_file_name) saved in $(BIN_DIR)"

test:
	@go test -v ./...
