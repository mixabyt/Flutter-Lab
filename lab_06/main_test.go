package main

import (
	"testing"
)

func TestToJSON_Primitives(t *testing.T) {
	cases := []struct {
		input    any
		expected string
	}{
		{42, "42"},
		{3.14, "3.14"},
		{true, "true"},
		{"hello", `"hello"`},
	}
	for _, c := range cases {
		got, err := ToJSON(c.input)
		if err != nil {
			t.Errorf("ToJSON(%v) error: %v", c.input, err)
		}
		if got != c.expected {
			t.Errorf("ToJSON(%v) = %q, want %q", c.input, got, c.expected)
		}
	}
}

func TestToJSON_Slice(t *testing.T) {
	got, err := ToJSON([]int{1, 2, 3})
	if err != nil {
		t.Fatal(err)
	}
	expected := "[1,2,3]"
	if got != expected {
		t.Errorf("got %q, want %q", got, expected)
	}
}

func TestToJSON_Struct(t *testing.T) {
	s := Server{
		Host:       "localhost",
		Port:       8080,
		Debug:      true,
		AllowedIPs: []string{"192.168.1.1", "10.0.0.1"},
	}
	got, err := ToJSON(s)
	if err != nil {
		t.Fatal(err)
	}
	expected := `{"host":"localhost","port":8080,"debug":true,"allowed_ips":["192.168.1.1","10.0.0.1"]}`
	if got != expected {
		t.Errorf("got %q, want %q", got, expected)
	}
}

func TestToJSON_Pointer(t *testing.T) {
	s := &Server{Host: "localhost", Port: 80, Debug: false, AllowedIPs: []string{}}
	got, err := ToJSON(s)
	if err != nil {
		t.Fatal(err)
	}
	expected := `{"host":"localhost","port":80,"debug":false,"allowed_ips":[]}`
	if got != expected {
		t.Errorf("got %q, want %q", got, expected)
	}
}

func TestToJSON_Map(t *testing.T) {
	m := map[string]any{"key": "value"}
	got, err := ToJSON(m)
	if err != nil {
		t.Fatal(err)
	}
	expected := `{"key":"value"}`
	if got != expected {
		t.Errorf("got %q, want %q", got, expected)
	}
}
