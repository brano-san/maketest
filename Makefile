# Names
PROJECT_NAME = maketest
TARGET = main

# Compiler and flags
CXX = g++
CXXFLAGS = -Wall -O2
LDFLAGS = -pthread

# Files
FILES = $(shell find -name '*.cpp')
HEADERS = $(shell find -name '*.h')
OBJECTS = $(patsubst %.cpp, %.o, $(FILES))

# Define targets
.PHONY: all clean

all: $(OBJECTS) $(TARGET) clean

$(TARGET): $(OBJECTS) $(HEADERS)
	$(CXX) $(LDFLAGS) $(OBJECTS) -o $@

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $^ -o $@

# Clean
clean:
	rm -rf $(shell find -name '*.o')

cleanall: clean
	rm -rf $(TARGET) 