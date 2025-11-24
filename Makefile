##
# Maine - WebAssembly build (root output) using default HTML

CC = em++
CFLAGS = -Wall -Os -I./lib/raylib/src -s USE_GLFW=3 -s ASYNCIFY
LDFLAGS = -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' -s WASM=1

SRC_DIR = src
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OUT_JS = index.js
OUT_WASM = index.wasm

RAYLIB_WEB = ./lib/raylib/src/libraylib.web.a

all: $(OUT_JS) $(OUT_WASM)

# Build only JS + WASM; do not touch index.html
$(OUT_JS) $(OUT_WASM): $(SRC)
	$(CC) $(SRC) $(RAYLIB_WEB) $(CFLAGS) $(LDFLAGS) -o $(OUT_JS)

clean:
	rm -f $(OUT_JS) $(OUT_WASM)
