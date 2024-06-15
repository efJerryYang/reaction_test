# Define the project name
PROJECT_NAME := reaction_test

# Define the paths
TARGET_DIR := target/release
BIN_DIR := bin
BIN_NAME := $(PROJECT_NAME)

# Default target
all: build

# Build the project in release mode
build: 
	cargo build --release

check_dir:
	@if [ ! -d "$(BIN_DIR)" ]; then \
		echo "Directory $(BIN_DIR) does not exist. Creating..."; \
		mkdir -p $(BIN_DIR); \
	else \
		echo "Directory $(BIN_DIR) already exists. Using it."; \
	fi

# Move the binary to the root directory
install: build check_dir
	mv $(TARGET_DIR)/$(BIN_NAME) $(BIN_DIR)

# Clean the build files
clean:
	cargo clean

# Clean the build files and remove the binary from the root directory
clean-all: clean
	rm -f $(BIN_NAME)

.PHONY: all build install clean clean-all

