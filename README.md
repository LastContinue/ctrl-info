# ctrl-info

Personal discoveries for the Massdrop CTRL Keyboard

See https://github.com/LastContinue/ctrl-info/wiki for more detailed information, including FAQs.

https://github.com/LastContinue/ctrl-info/releases has links for drag-and-drop loaders for both Mac and Windows. These can be really useful if you're wanting to flash your board, but have little to no experience with, or desire to use, the command line. They also gather all of the files you need to flash the board so that if you do want to start flashing via the command line later, you'll have everything you need.

https://github.com/LastContinue/ctrl-info/tree/master/scripts has the source files for the drag-and-drop loaders, as well as few other things I've picked up or made that I feel are helpful when it comes to programming these boards (including `bld-ldr.sh`, which is what I used to build and flash my board)

Even thought most of the information and files here were created with the CTRL in mind, most of it works for the ALT as well, you just need change a few lines (usually references to `massdrop/ctrl` and be aware that the LED layout is different)

alt_led_map.png was not made by me, but I saved it here so I could find it easier. Was made by user `famguy07` on Massdrop. Thanks!

### Note about "dated-ness"
As you look through the wiki, etc, you'll probably notice that many of the files haven't been updated in "quite some time". There's a couple of reasons for this:
1. When I got my key-by-key lighting keymap done, I was pretty happy with it "being done". I've pulled QMK down from time to time, since then but I haven't botherd to figure out what's going on with it. 
1. My stuff works (I think... 90% sure). The files and advice here might seem out of date, but for non-Internet connected hardware, being on the latest version of the firmware isn't that big of a deal (unless you're having issues). **Think about it this way: Let's say you buy an IBM Model F or M. It's going to be a great keyboard, however, the firmware on that keyboard is over 30 years old. Does that make it any less great?** If in the future something stops working, then I'll gladly look back into it, but I'm pretty happy with things are currently😄
