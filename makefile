all: build

build:
	@./build-all.sh
	@chmod +x ./bin/testbed

run: build
	@cd bin; ./testbed; cd ..