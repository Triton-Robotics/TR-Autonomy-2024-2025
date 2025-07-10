# Serial Terminal

## Introduction

The usb-c port on the Jetson exposes a serial port we can use to gain access to a shell on the Jetson

## Setup

1. Connect your device to the usb-c port on the jetson
2. use a serial terminal client of your preference, this guide uses `minicom`

```bash
sudo apt install minicom

sudo minicom -D /dev/ttyACM0 -b 115200 -c on
# NOTE: if you don't see a prompt to login hit enter and it should pop up

# use ctrl-a x to exit
```

3. Serial terminals do not communicate the size of the client or any dynamic changes to the window size. As such you may see weird text behavior or formatting. Use the `resize` command to resize the serial terminal to the current size of your terminal window

## convenience Features

create a config for the Jetson

```bash
echo -e "pu port             /dev/ttyACM0\npu linewrap         Yes" | sudo tee /etc/minicom/minirc.jetson > /dev/null
```

now you just have to do

```bash
sudo minicom jetson -c on
```
