package main

import (
	"fmt"
	"reflect"
)

// .Tag.Get("json")
func ToJSON(v any) (string, error) {
	json := ""
	switch v.(type) {
	case int, int8, int16, int32, int64, uint, uint8, uint16, uint32, uint64, float32, float64, bool:
		json += fmt.Sprint(v)
		return json, nil
	case string:
		json += fmt.Sprintf("\"%s\"", v)
	default:
		vType := reflect.ValueOf(v)
		switch vType.Kind() {
		case reflect.Struct:
			json += "{"
			for i := 0; i < vType.NumField(); i++ {
				field := vType.Field(i)
				fieldType := vType.Type().Field(i).Tag.Get("json")
				json += fmt.Sprintf("\"%s\":", fieldType)
				str, err := ToJSON(field.Interface())
				if err != nil {
					return "", err
				}
				json += str
				if i != vType.NumField()-1 {
					json += ","
				}
			}
			json += "}"
		case reflect.Slice, reflect.Array:
			json += "["
			for i := 0; i < vType.Len(); i++ {
				element := vType.Index(i)
				str, err := ToJSON(element.Interface())
				if err != nil {
					return "", err
				}
				if i != vType.Len()-1 {
					str += ","
				}
				json += str
			}
			json += "]"
		case reflect.Map:
			json += "{"
			comma := vType.Len()
			for _, key := range vType.MapKeys() {
				json += fmt.Sprintf("\"%s\":", key.String())
				element := vType.MapIndex(key)
				str, err := ToJSON(element.Interface())
				if err != nil {
					return "", err
				}

				json += str
				if comma != 1 {
					json += ","
				}
				comma--
			}
			json += "}"
		case reflect.Pointer, reflect.Interface:
			str, err := ToJSON(vType.Elem().Interface())
			if err != nil {
				return "", err
			}
			json += str
		default:
			return "", fmt.Errorf("unsupported type: %v", vType.Kind())
		}

	}
	return json, nil
}

type Server struct {
	Host       string   `json:"host"`
	Port       int      `json:"port"`
	Debug      bool     `json:"debug"`
	AllowedIPs []string `json:"allowed_ips"`
}

func main() {

	server := &Server{
		Host:  "localhost",
		Port:  8080,
		Debug: true,
		AllowedIPs: []string{
			"192.168.1.1",
			"10.0.0.1",
		},
	}
	s, err := ToJSON(server)
	if err != nil {
		fmt.Println(err)
	}
	fmt.Println(s)
}
