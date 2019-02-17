# ctrl-info

Personal discoveries for the Massdrop CTRL Keyboard

See https://github.com/LastContinue/ctrl-info/wiki for more detailed information, including FAQs.

https://github.com/LastContinue/ctrl-info/releases has links for drag-and-drop loaders for both Mac and Windows. These can be really useful if you're wanting to flash your board, but have little to no experience with, or desire to use, the command line. They also gather all of the files you need to flash the board so that if you do want to start flashing via the command line later, you'll have everything you need.

https://github.com/LastContinue/ctrl-info/tree/master/scripts has the source files for the drag-and-drop loaders, as well as few other things I've picked up or made that I feel are helpful when it comes to programming these boards (including `bld-ldr.sh`, which is what I used to build and flash my board)

Even thought most of the information and files here were created with the CTRL in mind, most of it works for the ALT as well, you just need change a few lines (usually references to `massdrop/ctrl` and be aware that the LED layout is different)

alt_led_map.png was not made by me, but I saved it here so I could find it easier. Was made by user `famguy07` on Massdrop. Thanks!
