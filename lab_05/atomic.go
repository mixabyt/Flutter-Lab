
package main

import (
	"fmt"
	"sync"
	"sync/atomic"
)

var counter int64

func evenWorker(even <-chan int, wg *sync.WaitGroup) {
	defer wg.Done()

	for {
		select {
		case v, ok := <-even:
			if !ok {
				return
			}
			if v%3 == 0 {
				atomic.AddInt64(&counter, 1)
			}
		}
	}
}

func oddWorker(odd <-chan int, wg *sync.WaitGroup) {
	defer wg.Done()

	for {
		select {
		case v, ok := <-odd:
			if !ok {
				return
			}
			if v%33 == 0 {
				atomic.AddInt64(&counter, -1)
			}
		}
	}
}

func main() {
	even := make(chan int)
	odd := make(chan int)

	var wg sync.WaitGroup

	wg.Add(2)

	go evenWorker(even, &wg)
	go oddWorker(odd, &wg)

	for i := 1; i <= 1000; i++ {
		if i%2 == 0 {
			even <- i
		} else {
			odd <- i
		}
	}

	close(even)
	close(odd)

	wg.Wait()

	fmt.Println("counter:", atomic.LoadInt64(&counter))
}