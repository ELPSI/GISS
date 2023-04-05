# GISS (Genshin Impact Server-Switching Tool)

English | [中文](https://github.com/ELPSI/GISS/blob/main/README.md)

A tool of switching game servers of **Genshin Impact** on one computer with operating system of **Windows 10,11**.

## Background
  As we know, Genshin Impact has three game servers:

1. **Sky-Island server** (**official server**, and ID starts with the number **1 or 2**);

2. **World-Tree server** (**bilibili server**, and ID starts with the number **5**);

3. **International server** (including America, Europe, Asia and TW,HK,MO, and ID starts with the number **6, 7, 8 or 9**).

And the the first two servers belong to **mainland Chinese servers**.

As of now, if you fully install **1 server** of the game, it takes about **60 GB** of space on your computer's disk, and if you install **double**, it takes **double**. To avoid this, this tool uses resource packs for file replacement, which greatly reduces the required disk space.

Normally, if you need to switch between the **international server** and one of **mainland Chinese servers**, using this tool will take up less than 2 GB of disk space. If it only involves switching between the Sky-Island server and the World-Tree server, using this tool will take up less than 10 MB of disk space. 

## Install
This is a **batch file** and does not require installation, and only resource packs need to be downloaded and unzipped.

## Download
The resource pack download link is as follows:

[123 cloud](https://www.123pan.com/s/1ym7Vv-Ka6vd.html)(In China, extraction code:GIMS)

[Mega](https://mega.nz/folder/9Z1mVJKC#J7IncDd9njeXiRAje8p3VA)


## Usage
1. In this tool, **Landserver** represents **[1]Sky-Island Server**, **Treeserver** represents **[2]World-Tree Server**, **Seaserver** represents **[3]International Server**.

2. **Download** this tool and **unzip** it to be a folder named **GISS** on your computer.

3. Download resource files to the **GISS** folder as needed: **PCGameSDK.dll** (login plug-in for b server), **CNRes_Vx.x.x.exe** (Sky-Island and Sky-Island server resource compression package) and **SeaRes_Vx.x.x.exe** (International server resource compression package) (where **x.x.x** Indicates the game version number). If it only involves switching between the Sky-Island and the Sky-Island server, you only need to download **PCGameSDK.dll**, otherwise it is best to download all resource files.

4. **Double-click** to run **GISS.bat**.

5. When running this tool for the first time, you need to input the game path in the command prompt window: for example: "E:\Genshin Impact\Genshin Impact game", the program will automatically identify the original server type.

6. You need to **select the server** to be created by inputting a number from **1, 2 or 3**, and press "**Enter**" key to continue(**1: Sky-Island server; 2: World-Tree server; 3: International server**). By the way, if the game server represented by the number which you input already exists or an illegal value is inputted, the program will prompt you to re-input.

7. If it involves switching between one of **mainland Chinese servers** and **International server**, the program will prompt you to put the "**.exe**" file under `GISS` folder and unzip it, then you only need to click "**Extract**" button by default.

8. Then the program will run automatically, and finally you just need to press the "**Enter**" key to exit the command prompt window.

9.  Now you can see a newly created **shortcut** of game on your **computer desktop**, **double click** it and enjoy yourself!

## Notice
1. Please ensure that your game can run normally before using this tool.

2. If you can't connect to the server, maybe you need to use a network tool such as a game accelerator.

3. The resource files used by this tool are all extracted from the **official resource files** of Genshin Impact. Except for `config.ini`, there is **no modification** of the original game resource files, which will not affect the use of the original server. 

4. This tool will **replace the original game files**. If the replacement fails, the game may not run normally. If you mind, please use the **GIMS** tool.
   
5. If the game is installed on a disk with a **non-NTFS format** and the **GIMS** tool cannot be used, this tool can be used instead.
   
6. Since the resource pack has version timeliness, if the game version is updated, you need to wait for the author of this tool to update the resource pack or update and make the resource pack yourself.

## Author
[@elpsi](https://github.com/ELPSI)

## License
[MIT](https://github.com/ELPSI/GISS/blob/main/LICENSE)