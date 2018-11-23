# Here are some "for instance" examples of leds based on groupings modify this to your needs
dark_gray = [6,7,8,9,14,15,16,30,31,32,33,34,48,49,50,51,63,64,75,76,77,78,79,81,82,83,84,85,86,87]
light_gray = [2,3,4,5,10,11,12,13,17,18,19,20,21,22,23,24,25,26,27,28,29,35,36,37,38,39,40,41,42,43,44,45,46,47,52,53,54,55,56,57,58,59,60,61,62,65,66,67,68,69,70,71,72,73,74,80]
back_light = range(88,120)

registers = [0,0,0,0]

# Now using the "for instance" arrays, putting them into a dict. Again, modify this based on your needs.
# However recommend doing it as a dict so the output is easier to parse, even if you only have one array
all_keys = {"dark gray":dark_gray, "light gray":light_gray, "back light":back_light}

#Loop through all_keys to do the calculation
for key_group_name, key_group_keys in all_keys.iteritems():
    for led in key_group_keys:
        nled = led -1
        id = nled / 32
        element = nled % 32
        value = 2 ** element
        registers[id] = registers[id] + value

    print('%s .id0 = %s, .id1 = %s, .id2 = %s, .id3 = %s,'%(key_group_name, registers[0], registers[1], registers[2], registers[3]))
    registers = [0,0,0,0]

