
all: build run

export MGFXC_WINE_PATH = /home/zach/.local/share/wineprefixes/monogame

run:
	cd Build && dotnet run

build:
	rm -rf Build
	mkdir Build
	cd Compiler && dotnet run
	cp -r Runtime/src Build/MonoScratch
	cp -r Runtime/shaders/bin Build/Shaders
	cp Runtime/Runtime.csproj Build/Project.csproj

shaders:
	rm -rf Runtime/shaders/bin
	mkdir Runtime/shaders/bin
	mgfxc Runtime/shaders/src/Sprite.hlsl Runtime/shaders/bin/Sprite.mgfx /Profile:OpenGL
	mgfxc Runtime/shaders/src/PenLine.hlsl Runtime/shaders/bin/PenLine.mgfx /Profile:OpenGL
	make