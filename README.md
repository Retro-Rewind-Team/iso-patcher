# iso-patcher
Kote's ISO patcher for Retro Rewind
This will allows the user to patch Mario Kart Wii game back up to add the mod-pack "Retro Rewind" for use on USB Loader or Dolphin emulator.

Prerequisite are to have Wiimm ISO Tools installed before use and to suply the pack "Retro Rewind" and a copy of Mario Kart Wii as ISO or WBFS format.

Instructions for use 

Windows

1.) Install wit and szs tools: (Omit this step if you have it installed already)
https://wit.wiimm.de 
https://szs.wiimm.de 
Restart Computer

2.) Copy a backup of the original "Mario Kart Wii" in this directory.
    Supported image formats: iso, wbfs, wdf, wia, ciso

3.) Click on create-rr-xxx.bat xxx=region of the game

4.) Wait until process complete

5.) You found the new image in the sub directory 'new-image'

For Linux and MAC
1.) Install wit tools: http://wit.wiimm.de/  Then restart (Omit this if it is installed)

2.) Copy the Retro Rewind pack into this directory (only 'RetroRewind6/...' is needed).

3.) Copy a backup of the original "Mario Kart Wii" in this directory.
    Supported image formats: iso, wbfs, wdf, wia, ciso

4.) Linux and Mac users only: Execute: chmod a+x *.sh

5.) Call one of these scripts to select the output format: (Omit if you want the .wbfs format)

      set-image-type-ISO.sh   : Linux+Mac: Set output format to plain ISO
      set-image-type-WBFS.sh  : Linux+Mac: Set output format to WBFS
      set-image-type-WDF.sh   : Linux+Mac: Set output format to WDF

6.) Call one of these scripts:

      create-rr-pal.sh  : Linux and Mac users, create a PAL version
      create-rr-usa.sh  : Linux and Mac users, create a NTSC/USA version
      create-rr-jpn.sh  : Linux and Mac users, create a NTSC/JAPAN version

    The scripts will create a new image of selected type.

7.) You will find the new image in the sub directory 'new-image'.

Troubleshooting

"Disable all cheatcodes" error.
This can happens if you try to load a patched Retro Rewind wbfs on USB Loader the normal way, this is because USB Loader uses more RAM than loading it from Riivolution or Retro Rewind channel.

To fix it you must use a Forwarder channel to load the patched wbfs. I have a collection of forwarder channels for Retro Rewind here: http://bit.ly/3J4auhe

Forwarder returning to Wii menu.
To my understanding how the Wii works in software, the game must be played at least once so the Wii recognizes what is trying to play.
Essentially to fix it you must load the game normally then you can use the forwarder.
If the forwarder keeps returning to Wii menu make sure your USB Loader is set up correctly and using the same label as you used when you patched the game. Also only Wiiflow supports loading from SD Cards so keep that in mind.

Errors during operations
Any crashes that occurs without a dump like loading to a blackscreen seems that something went wrong during the patching process. Contact Kote3767 if there are any issues.

If the game crashes with a code dump, the crash report is saved in the Wii nand at "shared2/Pulsar/Retrorewind6/crash.pul"
To extract it you can use WiiXplorer or FSTOOLBOX and then you can go to Retro Rewind discord server to ask.
