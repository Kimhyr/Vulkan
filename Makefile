SRCD=./Source
OUTD=./Output
OBJD=$(OUTD)/Objects

# External directories
VULKAND=D:/VulkanSDK/1.3.231.1

DIRS=.
SRCS=$(foreach D,$(DIRS),$(wildcard $(SRCD)/$(D)/*.cpp))
OBJS=$(SRCS:.cpp=.obj)
BIN=$(OUTD)/vulkan.exe

CFLGS=-std=c++20 -O3
WFLGS=-Wall -Wextra
IFLGs=-I$(VULKAND)/Include $(foreach D,$(DIRS),-I$(SRCD)/$(D))
LFLGS=-L$(VULKAND)/Lib
FLGS=$(CFLGS) $(WFLGS) $(IFLGS)
CC=clang++

all:$(BIN)

run:$(BIN)
	$(BIN)

$(BIN):$(OBJS)
	$(CC) $^ -o $@ $(FLGS)

$(OBJD)/%.obj:$(SRCD)/%.cpp
	$(CC) -c $^ -o $@ $(FLGS)

clean:$(OUTD)
	$(foreach O,$(OBJS),rm -f $(O))
	mkdir $(foreach D,$(DIRS),$(OBJD)/$(D))

.PHONY:all run clean
