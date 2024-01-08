CXX = g++
CXXFLAGS = -Wall -O2
LDFLAGS = -static-libstdc++
FILES = $(shell find -name '*.cpp')
OBJECTS = $(patsubst %.cpp, %.o, $(notdir $(FILES)))

.PHONY: all clean

all: main clean

main: $(OBJECTS)
	$(CXX) $(LDFLAGS) $(OBJECTS) -o $@

$(OBJECTS): $(FILES)
	$(CXX) $(CXXFLAGS) -c $(FILES)

clean:
	rm -rf $(shell find -name '*.o')