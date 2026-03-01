package main

import (
	//"fmt"
	"fmt"
	"log"
	"tralala/calc"
)

// ---------------------------part 2 --------------------------------
type Calculator interface {
	Sum(nums ...float64) float64
	Max(nums ...float64) float64
	Min(nums ...float64) float64
	Divide(a, b float64) (float64, error)
}

type Calc struct {
}

func (c Calc) Sum(nums ...float64) (sum float64) {
	for _, num := range nums {
		sum += num
	}
	return
}

func (c Calc) Max(nums ...float64) (max float64) {
	max = nums[0]
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	return
}

func (c Calc) Min(nums ...float64) (min float64) {
	min = nums[0]
	for _, num := range nums {
		if num < min {
			min = num
		}
	}
	return
}

func (c Calc) Divide(a, b float64) (float64, error) {
	if b == 0.0 {
		return 0.0, fmt.Errorf("divide by zero")
	}
	return a / b, nil
}

//------------------------------------------------------------

func main() {
	//---------------------part 1-------------------------------------
	fmt.Println(calc.Sum(1, 2, 3))
	fmt.Println(calc.Max(1, 2, 3))
	fmt.Println(calc.Min(1, 2, 3))
	res, err := calc.Divide(1, 10)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(res)
	//-----------------------------------------------------------------

	//---------------------------part 2 --------------------------------
	𐌈 := Calc{}
	res, err = 𐌈.Divide(1, 10)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println(res)
	fmt.Println(𐌈.Sum(1, 2, 3))
	fmt.Println(𐌈.Max(1, 2, 3))
	fmt.Println(𐌈.Min(1, 2, 3))
	//------------------------------------------------------------------

}
