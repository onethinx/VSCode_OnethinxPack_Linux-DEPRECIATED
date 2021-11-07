# Onethinx Core Linux dependencies pack

## How to setup Visual Studio Code with the Onethinx Core dependencies pack

## 1. Download prerequisites
- **VS Code**
    - [Download Visual Studio Code](https://code.visualstudio.com/download)
- **Onethinx Dependencies Pack**
    - [Download the Onethinx dependencies pack for Linux](https://github.com/onethinx/VSCode_OnethinxPack_Linux/archive/master.zip)
- **CMake**
    - Install CMake: `sudo apt install cmake`
## 2. Install VS Code & extensions
  - Install VS Code.
  - Install extensions:
    - ARM Support For Visual Studio Code (dan-c-underwood)
    - C/C++ IntelliSense, debugging (microsoft)
    - CMake language support (twxs)
    - CMake Tools (microsoft)
    - Cortex-Debug GDB support (marus25)
    - Power Tools (e.GO Mobile)
    - LinkerScript support for GNU (Zixuan Wang)
    - Open in Application (Fabio Spampinato)
    - Output Colorizer (IBM)
    - Tasks (actboy168)
  - Apply the OpenOCD USB rules by running `yourpath\VSCode_OnethinxPack_Linux/tools_2.0/linux/openocd/udev_rules/install_rules.sh`.
## 3. Install the Onethinx Dependencies Pack
  - Unzip the pack archive to your local harddisk (eg: /Applications/VSCode_OnethinxPack_Windows).
  - Open ~.profile: Terminal >> `cd ~ && sudo nano .profile`
  - Add this to the end of the file (make sure you enter the correct path) and save:
    ```
    # Loading environment variables for the Onethinx Pack
    source /locationOfYour/VSCode_OnethinxPack_macOS/variables.env
    ```
  - Set the correct path in this pack's `variables.env` file.
  - Restart your machine (or log-out and log-in) to reload the environment variables.
## 4. Check
  - If CMake, Make and the compiler is correctly installed by typing the following into your terminal or terminal window of VS Code.
    - `cmake -version`
    - `make -v`
    - `arm-none-eabi-gcc -v`
## 5. Remind
  - After changing the device configuration (or project file structure) to use
    - Clean Reconfigure
    - Clean Rebuild
       in order to build the image properly  
  - To delete the contents of the build folder
    - if you copied the project including build folder from another location / machine
    - when build fails.
