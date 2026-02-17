package main

import "math"

type Shape interface{
    Area() float64
    Perimeter float64
}


type Circle struct {
    Radius float64
}

func (z *Circle) Area() float64 {
    return math.Pi * z.Radius * z.Radius
}

func (z *Circle) Periment() float64 {
    return 2*math.Pi*z.Radius
}

type Rectangle struct {
    Width float64
    Height float64
}

func (z *Rectangle) Area() float64 {
    return z.Width * z.Height
}

func (z *Rectangle) Periment() float64 {
    return 2*z.Width + 2* z.Height
}

type Triangle struct {
    A float64
    B float64
    C float64
}

func (z *Triangle) Area() float64 {
    p := (z.A + z.B + z.C) /2
    return math.Sqrt(p*(p-z.A)*(p-z.B)*(p-z.C))
}

func (z *Triangle) Periment() float64 {
    return z.A + z.B + z.C
}


