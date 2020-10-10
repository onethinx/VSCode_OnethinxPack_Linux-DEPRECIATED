source [find interface/${PROGRAMMER}.cfg]
transport select swd
source [find target/psoc6.cfg]
if {[info exists ENABLE_CM0] && ${ENABLE_CM0} == 0 } {
    #${TARGET}.cm0 configure -gdb-port disabled
}
if {[info exists ENABLE_CM4] && ${ENABLE_CM4} == 0 } {
   #${TARGET}.cm4 configure -gdb-port disabled
} else {
    ${TARGET}.cm4 configure -rtos auto -rtos-wipe-on-reset-halt 1
}