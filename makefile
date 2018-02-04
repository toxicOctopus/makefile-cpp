SRC_DIR := src
OBJ_DIR := obj
HEADER_DIR := headers
SRC_FILES := $(wildcard $(SRC_DIR)/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))
CPP17 := -std=gnu++17
TARGET := app.h

COMPILER := g++
all: $(TARGET)

$(TARGET): $(OBJ_FILES)
	$(COMPILER) $(CPP17) $^ -o $@
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(COMPILER) $(CPP17) -c -I $(HEADER_DIR) $< -o $@

clean:
	rm -rf $(TARGET) obj/*.o
