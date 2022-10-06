ifeq ($(OS),Windows_NT)
    PLATFORM = windows
else
    UNAME_S := $(shell uname -s)
    
	ifeq ($(UNAME_S),Linux)
    	PLATFORM = linux
    endif

    ifeq ($(UNAME_S),Darwin)
    	PLATFORM = osx
    endif
endif

ifeq ($(PLATFORM), windows)
all: build

build:
	@.\build-all.bat

run: build
	@.\bin\testbed

clean:
	@del /q .\bin\*
endif

ifeq ($(PLATFORM), linux)
all: build

build:
	@./build-all.sh
	@chmod +x ./bin/testbed

run: build
	@cd bin; ./testbed; cd ..

clean:
	@rm -rf ./bin/*
endif
