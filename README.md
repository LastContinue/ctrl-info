# ctrl-info
Personal discoveries for Massdrop CTRL Keyboard

## Offical Docs
* This is the discussion on Massdrop. Gets "how do I?" pretty quickly, but the original post has good information. [https://www.massdrop.com/talk/9382/how-to-configure-your-ctrl-keyboard]
* Program you need to upload bin into your board home [https://github.com/Massdrop/mdloader/releases/tag/0.0.1]
* Graphical Configuratator for keymaps (Not bad at all, but somewhat limited outside of keymapping, at least for the time being) [https://www.massdrop.com/mechanical-keyboards/configurator]
* Offically QMK docs (lots here about keyconfigs and overall "this is possible" features, but not much about LEDs for the particular board) [https://docs.qmk.fm/#/]

## Intresting finds
* If you're using `capslock` as `ctrl`, becuase of the size of the key and the fact it's un-stablized, it can wear into the anodization on the board. I don't see this as a quality control issue, just something to be aware of. Might be worth putting some vinyl or adhesive backed felt on the board around where the `capslock` key hits the plate
* The color of the capslock key is dicted by code found [here](https://github.com/qmk/qmk_firmware/blob/30680c6eb396a2bb06928afd69edae9908ac84fb/tmk_core/protocol/arm_atsam/led_matrix.c#L421). As you can see it looks for the key's color and changes it based on some logic. Originally found this information on [Reddit](https://www.reddit.com/r/olkb/comments/9c104l/customizing_rgb_on_massdrops_ctrl/) but it took me staring at the code for awhile to figure out "what's going on here"
* You can set your own `led_programs.c` for each keymap. You can also set a `config_led.h` for each keymap if you want to control things such as brightness, caps lock key light, etc. Be advised if you do this, and you want to keep ontop of updates from Massdrop or QMK, you might need to do some copy-paste to get the newest features, etc. 
* Speaking of capslocks key (in terms of "which one lights up?") that it controlled via [this line](https://github.com/LastContinue/qmk_firmware/blob/master/keyboards/massdrop/ctrl/config_led.h#L186) . The number is mapped above. There seems to be logic in that larger numbers are farther down the board, but once they his a certain point, they go back up the F key row. I got really lucky screwiing around with this until I hit the number I wanted. I may post an actual map in the future. `255` means "not used".
* When removing all of the switches from the board, the supplied tool can become hard to use due to fatique. There's a way to wedge it inbetween the jaws of a pair of Tongue-and-groove pliers (you know, the ones that start with "channel" and end in....something or other 😉 ) and that makes re-switching a board _much_ easier. Will get a picture of this sooner than later. I might even see if I can find a 3d printed tool for this.
* Even though the LED's are RGB, there seems to be only a few recognizable colors it can do. I tried making some pale blues, and they just ended up looking white (although switches and keycaps will probably play a huge part in this)

## Lights
I'm going to make an entire page(s) this topic, but I want to see just how much the lighting tool from Massdrop will cover, and how flexible it is before I spend a lot of time on this.  
FAQ (that I know the anser to right now):

**"How can I change the default light pattern?"**  
(https://github.com/qmk/qmk_firmware/blob/master/keyboards/massdrop/ctrl/led_programs.c#L106)
Reorder that array around. The top is the "default". You'll get errors when building if you messed it up, so it will somewhat guide you on what you did wrong. Should go without saying you can remove/add maps from that array as well. 

**"What do variables on the light patterns mean?"**  
hs = horizontal start.   
he = horizontal end.  
rs = red start (0-255. Can do hex too apparently ??? I have not tried, but I came across it in the MD thread)  
re = red end  
gs = green start  
gs = green end  
bs = blue start  
be = blue end  
ef = effect (there's a few to chose from, but you gotta spelunk pretty far into QMK to find them. There's some folks in the MD thread that have some interesting effects via video if you want to ctrl-f around looking for them)  

Each row of this allows you to specify a part of the board to apply the color to. The  `teal->salmon` in the code is a great way to see that in action. It's three sections. Teal, tealish, and Salmon.   

The start and end are for effects.

**"How can I set the caps lock color?"**  
See my answer about this in the "Interting finds" section above.

**"Can I change the key color and side color independently?"**  
Technically via QMK, I'm sure this is possible, however, I haven't seen it simply demonstraited yet. We'll see what Massdrop's tool can do.

**How can I set default brightness?**  
[This Line inside of config_led.h](https://github.com/qmk/qmk_firmware/blob/master/keyboards/massdrop/ctrl/config_led.h#L34) See my note about overriding that on a map-by-map basis

## Switches
Any MX switch will fix into the board. So far I've tried
* Cherry MX
* Gateron (both Offical and Zeal; black bottom and clear)
* Kailh MX Clones
* Kailh Boxs (I can't say on whether the box stems stress out the keycaps or not) 

The most important thing is to make sure you have the pins straight, the housing 100% clamped together, and that there's nothing obstructing the plate (I couldn't figure out why my spacebar was gumming up until I took out the switch to discover there was a dog hair between the switch housing and the top plate).

Also, if you're clipping 5 pins down to 3 pins, just get something [like this tool](http://a.co/d/1bV6Ukt) . Don't mess with a hobby knife or rotary tool. (That's really outside the scope of this, but needs to be said)

## Helpful Gists 
All of these assume you are running Mac/Linux. Both of these are handy if you don't want to have to use a second keyboard
* Automate loading bin onto board [ctrl-ldr.sh](https://gist.github.com/LastContinue/65dc6e6dcd8181dc6c82ed351b7525ad)
* Automate building bin, then loading bin onto board [ctrl-bld-ldr.sh](https://gist.github.com/LastContinue/ad5a526033e8965563e407d8f0b1b09e)

## Meta
### My config

I use the "lascontinue" map from (https://github.com/LastContinue/qmk_firmware/tree/master/keyboards/massdrop/ctrl)
`ctrl-bld-ldr.sh lastcontinue` using the above gist will build it. Will work on getting a keyboard layout diagram in-case people are _that_ curious

("correct" Mac layout with left ctrl and caps swapped, right side modifiers in more proper right order, default brightness cut down to 1/4, and "print screen" and "insert" mapped to actual Mac screenshot commands. Also left ctrl alternates color for caps lock as it is now the caps lock key)

### Todo:
I want to get pictures and more detailed "how I figured this out" style documentation. I'm by not means a QMK expert, but based on many of the comments from the Massdrop thread above, there's lots of curious about people and anything no matter how mundane it might be to you, could be the piece of information somebody else has been looking for for months. 
