package main

import (
	"github.com/bloom42/rz-go"
	"github.com/bloom42/rz-go/log"
)

func main() {
	log.SetLogger(log.With(rz.Fields(
		rz.String("foo", "foo"), rz.String("bar", "bar"),
	)))

	log.Info("info from logger", rz.String("hello", "world"))
}
