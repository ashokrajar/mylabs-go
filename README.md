# mylabs-go

GoLang CI/CD experimental code repo

| CI/CD System | CI Pipeline | CD Pipeline |
| ------------ | ----------- | ----------- |
| GitHub Actions | ![GitHub CI Actions](https://github.com/ashokrajar/mylabs-go/workflows/CI%20Pipeline/badge.svg?branch=master) | |
| Azure DevOps | ![Azure CI Pipelines](https://dev.azure.com/ashokrajar/testpad/_apis/build/status/ashokrajar.mylabs-go?branchName=master) | |
| Travis | [![Build Status](https://travis-ci.org/ashokrajar/mylabs-go.svg?branch=master)](https://travis-ci.org/ashokrajar/mylabs-go) | |

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
