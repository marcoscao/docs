Arduino-mk
----------------------------------

make show_boards
make
make upload


Needed included:
    <Arduino.h>                 // uint8_t, String, ...

    <SPI.h>
    <SD.h>

Libraries:

    ARDUINO_LIBS = 




Arduino Monitor - Debug
--------------------------------------------

sudo apt-get install busybox
busybox microcom -t 9600 /dev/ttyACM0

-t xxxxxx : timeout ( disconnect busybox while no print output for a while )

