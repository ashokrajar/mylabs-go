/*
Copyright © 2020 Ashok Raja <ashokraja.r@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/
package main

import (
	"fmt"
	"os"
)

var AppVersion string

var VCSBranch string
var VCSCommitID string
var BuildTime string
var BuildHost string
var BuiltBy string
var GOVersion string

// Version will return version string
func Version() string {
	return AppVersion
}

// HelloHome will return hello home string
func HelloHome() string {
	return "Hello Home !!"
}

// The mylabs-go command
func main() {

	args := os.Args

	if len(args) > 1 {
		if args[1] == "version" {
			fmt.Println(Version())
		} else if args[1] == "build-info" {
			fmt.Printf("Version       : %s\n", Version())
			fmt.Printf("Git Branch    : %s\n", VCSBranch)
			fmt.Printf("Git Commit ID : %s\n", VCSCommitID)
			fmt.Printf("Build Time    : %s\n", BuildTime)
			fmt.Printf("Built By      : %s\n", BuiltBy)
			fmt.Printf("Build Host    : %s\n", BuildHost)
			fmt.Printf("GO Version    : %s\n", GOVersion)
		} else {
			fmt.Println("Error : Invalid command argument")
		}
	} else {
		fmt.Println(HelloHome())
	}
}
