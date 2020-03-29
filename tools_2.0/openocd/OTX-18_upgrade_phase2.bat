cd bin
openocd ^
-s "../scripts" ^
-c "bindto 0.0.0.0" ^
-c "source [find interface/kitprog3.cfg]" ^
-c "kitprog3 power_config on 3300" ^
-c "transport select swd" ^
-c "set ENABLE_CM0 1" ^
-c "set ENABLE_ACQUIRE 1" ^
-c "source [find target/psoc6.cfg]" ^
-c "puts stderr {Started by Onethinx Tool}"