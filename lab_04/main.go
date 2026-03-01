package main

import "fmt"

// Stage 1
func generate() <-chan int {
	out := make(chan int)

	go func() {
		defer close(out)
		for i := 1; i <= 100; i++ {
			out <- i
		}
	}()

	return out
}

// Stage 2
func filterEven(in <-chan int) <-chan int {
	out := make(chan int, 10)

	go func() {
		defer close(out)
		for num := range in {
			if num%2 == 0 {
				out <- num
			}
		}
	}()

	return out
}

// Stage 3
func square(in <-chan int) <-chan int {
	out := make(chan int)

	go func() {
		defer close(out)
		for num := range in {
			out <- num * num
		}
	}()

	return out
}

// Stage 4
func sum(in <-chan int) int {
	total := 0
	for num := range in {
		total += num
	}
	return total
}

func main() {
	nums := generate()
	evens := filterEven(nums)
	squares := square(evens)
	result := sum(squares)

	fmt.Println("Sum:", result)
}
