package main

import (
	"fmt"
	"sync"
)

var counter int

func evenWorker(even <-chan int, mu *sync.Mutex, wg *sync.WaitGroup) {
	defer wg.Done()

	for {
		select {
		case v, ok := <-even:
			if !ok {
				return
			}

			if v%3 == 0 {
				mu.Lock()
				counter++
				mu.Unlock()
			}
		}
	}
}

func oddWorker(odd <-chan int, mu *sync.Mutex, wg *sync.WaitGroup) {
	defer wg.Done()

	for {
		select {
		case v, ok := <-odd:
			if !ok {
				return
			}

			if v%33 == 0 {
				mu.Lock()
				counter--
				mu.Unlock()
			}
		}
	}
}

func main() {
	even := make(chan int)
	odd := make(chan int)

	var mu sync.Mutex
	var wg sync.WaitGroup

	wg.Add(2)

	go evenWorker(even, &mu, &wg)
	go oddWorker(odd, &mu, &wg)

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

	fmt.Println("counter:", counter)
}
