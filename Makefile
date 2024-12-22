# Variables
CC = gcc
CFLAGS = -Wall -Wextra -O2
SRC_DIR = src
BUILD_DIR = build
BIN_DIR = bin
TARGET = $(BIN_DIR)/hash_table

# Fuentes y objetos
SRC_FILES = $(wildcard $(SRC_DIR)/*.c)
OBJ_FILES = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SRC_FILES))

# Regla principal
all: $(TARGET)

# Crear el ejecutable
$(TARGET): $(OBJ_FILES)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@ -lm
	@echo "Compilación completa: Ejecutable guardado en $(TARGET)"

# Compilar los archivos .c en objetos .o
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Limpiar archivos intermedios y binarios
clean:
	@rm -rf $(BUILD_DIR) $(BIN_DIR)
	@echo "Carpetas 'build/' y 'bin/' eliminadas"

# Phony targets
.PHONY: all clean

