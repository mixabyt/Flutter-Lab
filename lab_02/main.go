package main

import (
	"fmt"
	"math"
	"math/rand/v2"
)

// --------------------------PART 2-------------------------------------
type Shape interface {
	Area() float64
	Perimeter() float64
}

type Circle struct {
	Radius float64
}

func NewCircle(r float64) *Circle {
	if r <= 0 {
		panic("radius must be > 0")
	}
	return &Circle{Radius: r}
}

func (z *Circle) Area() float64 {
	return math.Pi * z.Radius * z.Radius
}

func (z *Circle) Perimeter() float64 {
	return 2 * math.Pi * z.Radius
}

type Rectangle struct {
	Width  float64
	Height float64
}

func NewRectangle(w, h float64) *Rectangle {
	if w <= 0 || h <= 0 {
		panic("width and height must be > 0")
	}
	return &Rectangle{Width: w, Height: h}
}

func (z *Rectangle) Area() float64 {
	return z.Width * z.Height
}

func (z *Rectangle) Perimeter() float64 {
	return 2*z.Width + 2*z.Height
}

type Triangle struct {
	A float64
	B float64
	C float64
}

func NewTriangle(a, b, c float64) *Triangle {
	if a <= 0 || b <= 0 || c <= 0 {
		panic("triangle sides must be > 0")
	}

	if a+b <= c || a+c <= b || b+c <= a {
		panic("triangle cannot exist")
	}

	return &Triangle{A: a, B: b, C: c}
}

func (z *Triangle) Area() float64 {
	p := (z.A + z.B + z.C) / 2
	return math.Sqrt(p * (p - z.A) * (p - z.B) * (p - z.C))
}

func (z *Triangle) Perimeter() float64 {
	return z.A + z.B + z.C
}

//---------------------------------------------------------------------

// ---------------------------Part 1------------------------------------
func main() {
	const arrLen = 10
	var a [arrLen]int
	b := make([]int, arrLen)
	result := make([]int, arrLen)
	for i := range arrLen {
		a[i] = i + 1
		b[i] = rand.IntN(arrLen)
		result[i] = a[i] + b[i]
	}
	fmt.Println(result)
}

//----------------------------------------------------------------------
