# Lutris DXVK Update

Compiles from [DXVK Master](https://github.com/doitsujin/dxvk) and makes it available for Lutris so you can get the latest hotfixes without waiting for the next release. 
This simple script was created for personal usage, but uploaded so others can enjoy it. 

### Requirements:

- [git](https://git-scm.com/)
- [wine 3.10](https://www.winehq.org/) or newer
- [Meson](https://mesonbuild.com/) build system (at least version 0.46)
- [Mingw-w64](http://mingw-w64.org/) compiler and headers (at least version 8.0)
- [glslang](https://github.com/KhronosGroup/glslang) compiler

## Usage

Simply run the script when you want the lastest compiled master from [doitsujin](https://github.com/doitsujin/dxvk)
(Remember to make the script executable with "chmod +x script_file")

Open Lutris, configure your game and click the **Runner options** tab, find **DXVK Version** and type "latest" inside the field.
