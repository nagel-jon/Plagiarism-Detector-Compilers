# Compiler options
CC = gcc
CFLAGS = -Wall -Wextra

# Source files
SRCS = main.c utils.c

# Object files
OBJS = $(SRCS:.c=.o)

# Executable
TARGET = plagiarism_detector

# Default target
all: $(TARGET)

# Compile source files into object files
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link object files into executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) $^ -o $@

# Clean rule to delete all executables and object files
clean:
	rm -f $(TARGET) $(OBJS)
