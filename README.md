# TLDR;
This is the configuration of my Ferris Sweep LP keyboard.
i am using it under linux and macos with the us-international layout.

# Modifications

* added F-keys
* re-arranged cursor keys
* swapped space and enter
* moved 0
* add layer with one-key german umlauts, hold enter and press a u o s


# local build

```
git clone https://github.com/zmkfirmware/zmk.git
git checkout v0.3-branch
bash start.sh
```
## inside

```
west init -l app/
west update # takes a very long time, run again when strange git errors appear
cd app

rm -rf build && \
west build -d build/left  -b nice_nano -S studio-rpc-usb-uart -- -DSHIELD=cradio_left  -DZMK_CONFIG=/workspaces/zmk-config/config -DCONFIG_ZMK_STUDIO=y && \
west build -d build/right -b nice_nano -S studio-rpc-usb-uart -- -DSHIELD=cradio_right -DZMK_CONFIG=/workspaces/zmk-config/config -DCONFIG_ZMK_STUDIO=y && \
west build -d build/reset -b nice_nano -- -DSHIELD=settings_reset

cp zmk/app/build/left/zephyr/zmk.uf2 left.uf2
cp zmk/app/build/right/zephyr/zmk.uf2 right.uf2
cp zmk/app/build/reset/zephyr/zmk.uf2 reset.uf2

rm -rf build;

# enter DFU using bootloader key or double tap RESET button
cp zmk/app/build/cl_studio/zephyr/zmk.uf2 /Volumes/NICENANO/
cp zmk/app/build/cl_studio/zephyr/zmk.uf2 right.uf2
```


cp zmk/app/build/cl_studio/zephyr/zmk.uf2 reset.uf2

# clean zmk 

rm -rf optional/ .west/ modules
git clean -d -x -f
git status
