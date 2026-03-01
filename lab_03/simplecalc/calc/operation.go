package calc

import "fmt"

func init() {
	fmt.Println("operation was imported")
}

func Sum(nums ...float64) (sum float64) {
	for _, num := range nums {
		sum += num
	}
	return
}

func Max(nums ...float64) (max float64) {
	max = nums[0]
	for _, num := range nums {
		if num > max {
			max = num
		}
	}
	return
}
func Min(nums ...float64) (min float64) {
	min = nums[0]
	for _, num := range nums {
		if num < min {
			min = num
		}
	}
	return
}
func Divide(a, b float64) (float64, error) {
	if b == 0 {
		return 0, fmt.Errorf("divide by zero")
	}
	return a / b, nil
}
