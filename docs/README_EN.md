# GISS (Genshin Impact Server-Switching Tool)

English | [中文](../README.md)

A tool of switching game servers of **Genshin Impact** on one computer with operating system of **Windows 10,11**.

## Background
  As we know, Genshin Impact has three game servers:

1. **Sky-Island server** (**official server**, and ID starts with the number **1 or 2**);

2. **World-Tree server** (**bilibili server**, and ID starts with the number **5**);

3. **International server** (including America, Europe, Asia and TW,HK,MO, and ID starts with the number **6, 7, 8 or 9**).

And the the first two servers belong to **mainland Chinese servers**.

## Features
1. **Save disk space**
For players who need to play multiple Genshin Impact servers on one computer, there is no need to fully install each server, but only need to download the corresponding resource files as needed under the premise that the original game can run normally, so as to avoid Insufficient hard disk space on the computer. As of version 3.5 of the game, about **60 GB** of computer disk space is required if you have a full install of **1 server** of the game. If you proceed to another server with a full install of the game, the disk space usage will double. Under normal circumstances, if you need to switch between the International server and the mainland Chinese server, using this tool will take up less than **2 GB** of disk space. If it only involves switching between the **Sky-Island server** and the **World-Tree server** server, using this tool will take up less than **10 MB** of disk space.
  
2. **Applicable to NTFS format and non-NTFS format disks**
Compared with the GIMS tool, this tool adopts the traditional file replacement method and can support disks in NTFS format and non-NTFS format.

## Install
This is a **batch file** and does not require installation, and only resource packs need to be downloaded and unzipped.

## Download
The resource pack download link is as follows:

[123 cloud](https://www.123pan.com/s/1ym7Vv-Ka6vd.html)(In China, extraction code:GIMS)

[Mega](https://mega.nz/folder/9Z1mVJKC#J7IncDd9njeXiRAje8p3VA)


## Usage
1. **Download** this tool and **unzip** it to be a folder named **GISS** on your computer.

2. Download resource files to the **GISS** folder as needed: **PCGameSDK.dll** (login plug-in for b server), **CNRes_Vx.x.x.exe** (Sky-Island and Sky-Island server resource compression package) and **SeaRes_Vx.x.x.exe** (International server resource compression package) (where **x.x.x** Indicates the game version number，e.g., 3.5.0). If it only involves switching between the Sky-Island and the Sky-Island server, you only need to download **PCGameSDK.dll**, otherwise it is best to download all resource files.

3. **Double-click** to run **GISS.bat**.

4. When running this tool for the first time, you need to input the number of game version in the command prompt window: for example: 3.5.0, and press "**Enter**" key to continue.

5. When running this tool for the first time, you need to input the game path in the command prompt window: for example: "E:\Genshin Impact\Genshin Impact game", the program will automatically identify the original server type.

6. Input the number **1, 2 or 3** to select the type of server to switch to, and press "**Enter**" key to continue(**1: Sky-Island server; 2: World-Tree server; 3: International server**). By the way, if the game server represented by the number which you input already exists or an illegal value is inputted, the program will prompt you to re-input.

7. If it involves switching between one of **mainland Chinese servers** and **International server**, the program will prompt you to put the "**.exe**" file under `GISS` folder and unzip it, then you only need to click "**Extract**" button by default.

8. Then the program will run automatically, and finally you just need to press the "**Enter**" key to exit the command prompt window.

9.  Now you can see a newly created **shortcut** of game on your **computer desktop**, **double click** it and enjoy yourself!

10. For other instructions, please read the article on **bilibili** website: https://www.bilibili.com/read/cv22707963

## Notice
1. In this tool, **Landserver** represents **[1]Sky-Island Server**, **Treeserver** represents **[2]World-Tree Server**, **Seaserver** represents **[3]International Server**.

2. Please ensure that your game can run normally before using this tool.

3. If you can't connect to the server, maybe you need to use a network tool such as a game accelerator.

4. The resource files used by this tool are all extracted from the **official resource files** of Genshin Impact. Except for `config.ini`, there is **no modification** of the original game resource files, which will not affect the use of the original server. 

5. This tool will **replace the original game files**. If the replacement fails, the game may not run normally. If you mind, please use the **GIMS** tool.

6.  Since the resource pack has version timeliness, if the game version is updated, you need to wait for the author of this tool to update the resource pack or update and make the resource pack yourself.
7.  If you need to update the game version, please switch back to the original server and use the official launcher to update!!!

## Author
[@elpsi](https://github.com/ELPSI)

## License
[MIT](../LICENSE)