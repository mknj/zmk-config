rm -rf build && \
west build -d build/left  -b nice_nano -S studio-rpc-usb-uart -- -DSHIELD=cradio_left  -DZMK_CONFIG=/workspaces/zmk-config/config -DCONFIG_ZMK_STUDIO=y && \
west build -d build/right -b nice_nano -S studio-rpc-usb-uart -- -DSHIELD=cradio_right -DZMK_CONFIG=/workspaces/zmk-config/config -DCONFIG_ZMK_STUDIO=y && \
west build -d build/reset -b nice_nano -- -DSHIELD=settings_reset

cp build/left/zephyr/zmk.uf2 /workspaces/zmk-config/left.uf2
cp build/right/zephyr/zmk.uf2 /workspaces/zmk-config/right.uf2
cp build/reset/zephyr/zmk.uf2 /workspaces/zmk-config/reset.uf2
