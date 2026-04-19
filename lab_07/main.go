package main

import (
	"fmt"
	"strconv"
	"sync"

	"github.com/gofiber/fiber/v3"
	"github.com/mailru/easyjson"
)

var (
	store = NoteList{
		{ID: 1, Title: "Перша нотатка", Content: "Це вміст першої нотатки"},
		{ID: 2, Title: "Друга нотатка", Content: "Це вміст другої нотатки"},
		{ID: 3, Title: "Третя нотатка", Content: "Це вміст третьої нотатки"},
	}
	mu     sync.Mutex
	nextID = 4
)

func main() {
	fmt.Println("terst")
	app := fiber.New()

	app.Get("/notes", getAllNotes)
	app.Get("/notes/:id", getNote)
	app.Post("/notes", createNote)
	app.Put("/notes/:id", updateNote)
	app.Delete("/notes/:id", deleteNote)

	app.Listen(":8100")
}

func getAllNotes(c fiber.Ctx) error {
	mu.Lock()
	defer mu.Unlock()
	data, _ := easyjson.Marshal(store)
	c.Set("Content-Type", "application/json")
	return c.Send(data)
}

func getNote(c fiber.Ctx) error {
	id, err := strconv.Atoi(c.Params("id"))
	if err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "invalid id"})
	}
	mu.Lock()
	defer mu.Unlock()
	for _, n := range store {
		if n.ID == id {
			data, _ := easyjson.Marshal(&n)
			c.Set("Content-Type", "application/json")
			return c.Send(data)
		}
	}
	return c.Status(404).JSON(fiber.Map{"error": "not found"})
}

func createNote(c fiber.Ctx) error {
	var n Note
	if err := easyjson.Unmarshal(c.Body(), &n); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "invalid body"})
	}
	if err := n.Validate(); err != nil {
		return c.Status(422).JSON(fiber.Map{"error": err.Error()})
	}
	mu.Lock()
	n.ID = nextID
	nextID++
	store = append(store, n)
	mu.Unlock()
	data, _ := easyjson.Marshal(&n)
	c.Status(201).Set("Content-Type", "application/json")
	return c.Send(data)
}

func updateNote(c fiber.Ctx) error {
	id, err := strconv.Atoi(c.Params("id"))
	if err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "invalid id"})
	}
	var upd Note
	if err := easyjson.Unmarshal(c.Body(), &upd); err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "invalid body"})
	}
	if err := upd.Validate(); err != nil {
		return c.Status(422).JSON(fiber.Map{"error": err.Error()})
	}
	mu.Lock()
	defer mu.Unlock()
	for i := range store {
		if store[i].ID == id {
			store[i].Title = upd.Title
			store[i].Content = upd.Content
			data, _ := easyjson.Marshal(&store[i])
			c.Set("Content-Type", "application/json")
			return c.Send(data)
		}
	}
	return c.Status(404).JSON(fiber.Map{"error": "not found"})
}

func deleteNote(c fiber.Ctx) error {
	id, err := strconv.Atoi(c.Params("id"))
	if err != nil {
		return c.Status(400).JSON(fiber.Map{"error": "invalid id"})
	}
	mu.Lock()
	defer mu.Unlock()
	for i, n := range store {
		if n.ID == id {
			store = append(store[:i], store[i+1:]...)
			return c.SendStatus(204)
		}
	}
	return c.Status(404).JSON(fiber.Map{"error": "not found"})
}
