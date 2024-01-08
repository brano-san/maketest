# Names
PROJECT_NAME = maketest

# Compiler and flags
CXX = g++
CXXFLAGS = -O2 -MMD
LDFLAGS = -pthread

# Files
OBJ_PATH = ./tmp/
SOURCES = $(shell find -name '*.cpp')
OBJECTS = $(patsubst %.cpp, %.o, $(SOURCES))
PATH_TO_OBJ = $(addprefix $(OBJ_PATH), $(notdir $(OBJECTS)))
DEPS = ${OBJECTS:.o=.d}

# Define targets
.PHONY: all, clean, cleand, cleanall

all: $(PROJECT_NAME)

$(PROJECT_NAME): $(OBJECTS)
	$(CXX) $(LDFLAGS) $(PATH_TO_OBJ) -o $(PROJECT_NAME)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $(OBJ_PATH)$(notdir $@)

# Clean
clean:
	rm -rf $(shell find -name '*.o')

cleand: clean
	rm -rf $(shell find -name '*.d')

cleanall: cleand
	rm -f $(PROJECT_NAME)
	rm -f $(shell find -name '*.out')
	rm -f $(shell find -name '*.h.gch')

sinclude $(DEPS)