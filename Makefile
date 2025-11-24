##
# Maine - WebAssembly build (root output)

CC = em++
CFLAGS = -Wall -Os -I./lib/raylib/src -s USE_GLFW=3 -s ASYNCIFY
LDFLAGS = -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' -s WASM=1

PROJECT = maine

SRC_DIR = src
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OUT = index.html

RAYLIB_WEB = ./lib/raylib/src/libraylib.web.a

all: $(OUT)

$(OUT): $(SRC)
	$(CC) $(SRC) $(RAYLIB_WEB) $(CFLAGS) $(LDFLAGS) -o $(OUT)

clean:
	rm -f index.html *.js *.wasm
