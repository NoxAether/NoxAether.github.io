##
# Maine - WebAssembly build

CC = em++
CFLAGS = -Wall -Os -I./lib/raylib/src -s USE_GLFW=3 -s ASYNCIFY
LDFLAGS = -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' -s WASM=1

PROJECT = maine

SRC_DIR = src
BIN_DIR = docs

SRC = $(wildcard $(SRC_DIR)/*.cpp)
OUT = $(BIN_DIR)/$(PROJECT).html

RAYLIB_WEB = ./lib/raylib/src/libraylib.web.a


all: prepare $(OUT)

$(OUT): $(SRC)
	$(CC) $(SRC) $(RAYLIB_WEB) $(CFLAGS) $(LDFLAGS) -o $(OUT)

prepare:
	mkdir -p $(BIN_DIR)

clean:
	rm -f $(BIN_DIR)/*.html $(BIN_DIR)/*.js $(BIN_DIR)/*.wasm
