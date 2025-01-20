package main

import (
	"fmt"
	"math/rand"
	"time"
)

func main() {
	arr := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10}
	for {
		index := rand.Intn(11)
		fmt.Println(arr[index])
		time.Sleep(10 * time.Second)
	}
}
