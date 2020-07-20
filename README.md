# ctrl-info

Personal discoveries for the Massdrop CTRL Keyboard

See https://github.com/LastContinue/ctrl-info/wiki for more detailed information, including FAQs.

https://github.com/LastContinue/ctrl-info/releases has links for drag-and-drop loaders for both Mac and Windows. I wrote these before [QMK Toolbox](https://qmk.fm/toolbox/) started supporting `mdloader`. **These days I recommend using QMK Toolbox**, but these tools can stil be useful if you're wanting to flash your board, but have little to no experience with, or desire to use, the command line. They also gather all of the files you need to flash the board so that if you do want to start flashing via the command line later, you'll have everything you need (however, I may stop updating relases of these at some point in the future, mostly because it's a bit of a pain, and most people who'd still want to use these over QMK Tollbox are going to be geeky enough to figure out how to get stuff from source to work)

https://github.com/LastContinue/ctrl-info/tree/master/scripts has the source files for the drag-and-drop loaders, as well as few other things I've picked up or made that I feel are helpful when it comes to programming these boards (including `bld-ldr.sh`, which is what I used to build and flash my board)

Even thought most of the information and files here were created with the CTRL in mind, most of it works for the ALT as well, you just need change a few lines (usually references to `massdrop/ctrl` and be aware that the LED layout is different)

alt_led_map.png was not made by me, but I saved it here so I could find it easier. Was made by user `famguy07` on Massdrop. Thanks!

### Note about "dated-ness"
As you look through the wiki, etc, you'll probably notice that many of the files haven't been updated in "quite some time". There's a couple of reasons for this:
1. When I got my key-by-key lighting keymap done, I was pretty happy with it "being done". I've pulled QMK down from time to time, since then but I haven't bothered to figure out what's going on with it. I may eventually try to figure it out in the future, and if I do, I'll go on a big updating spree.  
1. My stuff works (I think... 90% sure). The files and advice here might seem out of date, but for non-Internet connected hardware, being on the latest version of the firmware isn't that big of a deal
1. These days I don't really mess with these keyboards unless I'm having problems. I recently had an issue with my CTRL HiPro, so after I fixed that, I went on an updating spree.
