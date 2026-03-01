package main

import (
	"fmt"
	"log"
	"math"
)

//## Частина 2.  Вивчення основ синтаксису
//
//Завдання. Написати програму для виводу на екран результату
//розрахунку  функцій виду $y = f(x)$   залежно від значення випадкового параметру $x$
//та з урахуванням умов, коли має виконуватися розрахунок **Функції 1** або **Функції 2**
//
//Необхідно реалізувати вирішення завдання із застосуванням конструкцій `if … else` та `switch … case` .

func f1(x float64) (y float64) {
	y = 19*x - 0.5*(x*x)
	return
}

func f2(x float64) (y float64) {
	y = 12*x - (math.Pow(x, 4) + 1)
	return
}

func main() {
	fmt.Print("Enter a x: ")
	var x float64
	_, err := fmt.Scan(&x)
	if err != nil {
		log.Fatal(err)
	}

	switch {
	case x < 20:
		fmt.Println(f1(x))
	default:
		fmt.Println(f1(x))

	}

	if x < 20 {
		fmt.Println(f2(x))
	} else {
		fmt.Println(f1(x))
	}
}
