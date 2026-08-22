# Kote's ISO patcher for Retro Rewind
This allows the user to patch a Mario Kart Wii game back up with the mod-pack "Retro Rewind" for use with USB Loader or Dolphin emulator.

## Instructions for use
1.) Download and unpack the iso-patcher.

2.) Install [Wiimms ISO Tools](http://wit.wiimm.de/). Then restart your PC (Omit this if it is already installed).

3.) Copy the Retro Rewind pack into the iso-patcher directory (only 'RetroRewind6/...' is needed).

4.) Copy a backup of the original "Mario Kart Wii" into this directory. Supported image formats: `.iso`, `.wbfs`, `.wdf`, `.wia`, `.ciso`

5.) Linux and Mac users only: Open a terminal inside the directory and run: `chmod a+x *.sh`

6.) Call one of these scripts to select the output format: (Omit if you want the .wbfs format).

      set-image-type-ISO.sh   : Linux+Mac: Set output format to plain ISO
      set-image-type-WBFS.sh  : Linux+Mac: Set output format to WBFS
      set-image-type-WDF.sh   : Linux+Mac: Set output format to WDF

      set-image-type-ISO.bat  : Windows: Set output format to plain ISO
      set-image-type-WBFS.bat : Windows: Set output format to WBFS
      set-image-type-WDF.bat  : Windows: Set output format to WDF


6.) Call one of these scripts:

      create-rr-pal.sh  : Linux and Mac users, create a PAL version
      create-rr-usa.sh  : Linux and Mac users, create a NTSC/USA version
      create-rr-jpn.sh  : Linux and Mac users, create a NTSC/JAPAN version

      create-rr-pal.bat : Windows users, create a PAL version
      create-rr-usa.bat : Windows users, create a NTSC/USA version
      create-rr-jpn.bat : Windows users, create a NTSC/JAPAN version

The scripts will create a new image of selected type.

7.) You will find the new image in the sub directory `new-image/`.

## Troubleshooting

### "Disable all cheatcodes" error

This can happens if you try to load a patched Retro Rewind .wbfs on USB Loader the normal way, this is because USB Loader uses more RAM than loading it from Riivolution or Retro Rewind channel.

To fix it you must use a Forwarder channel to load the patched .wbfs. I have a collection of forwarder channels for Retro Rewind here: http://bit.ly/3J4auhe

### Forwarder returning to Wii menu

To my understanding how the Wii works in software, has to be started at least once for the Wii to recognize it.
Essentially to fix it you must load the game normally then you can use the forwarder.
If the forwarder keeps returning to Wii menu make sure your USB Loader is set up correctly and is using the same label as you used when you patched the game. Also only Wiiflow supports loading from SD Cards so keep that in mind.

### Errors during operations

Any crashes that occur without a dump like loading to a black screen indicate that something went wrong during the patching process. Contact Kote3767 if there are any issues.

If the game crashes with a code dump, the crash report is saved in the Wii NAND at "shared2/Pulsar/Retrorewind6/crash.pul". To extract it you can use WiiXplorer or FSTOOLBOX and then you can go to Retro Rewind discord server to ask for help.
