package main

import (
	"testing"
)

func Test_helloHome(t *testing.T) {
	tests := []struct {
		name string
		want string
	}{
		{
			name: "func HelloHome",
			want: "Hello Home !!",
		},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := HelloHome(); got != tt.want {
				t.Errorf("HelloHome() = %v, want %v", got, tt.want)
			}
		})
	}
}
