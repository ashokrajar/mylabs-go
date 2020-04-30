# mylabs-go ![GitHub go.mod Go version](https://img.shields.io/github/go-mod/go-version/ashokrajar/mylabs-go?color=success) ![GitHub](https://img.shields.io/github/license/ashokrajar/mylabs-go?color=blue) [![Go Report Card](https://goreportcard.com/badge/github.com/ashokrajar/mylabs-go)](https://goreportcard.com/report/github.com/ashokrajar/mylabs-go)

GoLang CI/CD experimental code repo

| CI/CD System | CI Pipeline | CD Pipeline | Code Coverage |
| ------------ | ----------- | ----------- | ------------- |
| GitHub Actions | ![GitHub CI Actions](https://github.com/ashokrajar/mylabs-go/workflows/CI%20Pipeline/badge.svg?branch=master) | | |
| Azure DevOps | ![Azure CI Pipelines](https://dev.azure.com/ashokrajar/testpad/_apis/build/status/ashokrajar.mylabs-go?branchName=master) | | ![Azure DevOps coverage](https://img.shields.io/azure-devops/coverage/ashokrajar/testpad/3?style=plastic) |
| Travis CI | [![Build Status](https://travis-ci.org/ashokrajar/mylabs-go.svg?branch=master)](https://travis-ci.org/ashokrajar/mylabs-go) | | |

## Why does this repo exists

This repo is a lab rat for my code experiments for full E2E(End to End) CI/CD integrations.
Which covers these,

* Code Quality Gates
* Unit Tests
* Vulnerability tests (Using [ShiftLeft](https://www.shiftleft.io))
* Build Binary
* Release [Cooking..]

### Covered Samples & Examples
* Azure Pipelines
  * Multi branch trigger
  * Multiple platform support with parallel build
* GitHub Actions

#### Road Map
* Travis CI
* Semaphore
* More TBD
* Windows Support
