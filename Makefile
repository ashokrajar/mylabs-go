git_branch := $(shell git rev-parse --abbrev-ref HEAD)
git_commit_id := $(shell git rev-parse --short HEAD)
build_time := $(shell date)
built_by := $(shell whoami)
build_host := $(shell hostname)
version_date := $(shell date +"%-m%d%H%M")
go_version := $(shell go version)
go_os := $(shell go env GOOS)
go_arch := $(shell go env GOARCH)

BIN_DIR=bin
APP_NAME=mylabs-go

ifeq ($(git_branch), master)
	vsuffix=
else
	vsuffix=edge+$(version_date)
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
	@go build -ldflags "-X 'main.VersionSuffix=$(vsuffix)' -X 'main.VCSBranch=$(git_branch)' -X 'main.BuildTime=$(build_time)' -X 'main.VCSCommitID=$(git_commit_id)' -X 'main.BuiltBy=$(built_by)' -X 'main.BuildHost=$(build_host)' -X 'main.GOVersion=$(go_version)'" -o $(BIN_DIR)/$(app_file_name)
	@echo "Binary $(APP_NAME) saved in $(BIN_DIR)"

test:
	@go test -v ./...
