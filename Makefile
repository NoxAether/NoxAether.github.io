##
# Maine - WebAssembly build (root output)

CC = em++
CFLAGS = -Wall -Os -I./lib/raylib/src -s USE_GLFW=3 -s ASYNCIFY
LDFLAGS = -s EXPORTED_RUNTIME_METHODS='["ccall","cwrap"]' -s WASM=1

SRC_DIR = src
SRC = $(wildcard $(SRC_DIR)/*.cpp)
OUT = index.html

RAYLIB_WEB = ./lib/raylib/src/libraylib.web.a
SHELL_HTML = shell.html   # custom HTML template

all: $(OUT)

# Build index.html using a custom shell file
$(OUT): $(SRC) $(SHELL_HTML)
	$(CC) $(SRC) $(RAYLIB_WEB) $(CFLAGS) $(LDFLAGS) --shell-file $(SHELL_HTML) -o $(OUT)

clean:
	rm -f index.html *.js *.wasm
