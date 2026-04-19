package main

import "errors"

//go:generate easyjson -all note.go

//easyjson:json
type Note struct {
	ID      int    `json:"id"`
	Title   string `json:"title"`
	Content string `json:"content"`
}

//easyjson:json
type NoteList []Note

func (n *Note) Validate() error {
	if n.Title == "" {
		return errors.New("title is required")
	}
	if len(n.Title) > 100 {
		return errors.New("title must be at most 100 characters")
	}
	if n.Content == "" {
		return errors.New("content is required")
	}
	if len(n.Content) > 1000 {
		return errors.New("content must be at most 1000 characters")
	}
	return nil
}
