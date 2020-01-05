macro(FIND_DIRECTORIES return_list dir_in)
    FILE(GLOB_RECURSE new_list ${dir_in})
    SET(dir_list "")
    FOREACH(file_path ${new_list})
        GET_FILENAME_COMPONENT(dir_path ${file_path} PATH)
        SET(dir_list ${dir_list} ${dir_path})
    ENDFOREACH()
    LIST(REMOVE_DUPLICATES dir_list)
    SET(${return_list} ${dir_list})
endmacro()

# Find Middleware includes folders
FIND_DIRECTORIES(PDL_MIDDLEWARE ${CY_PDL_DIR}/middleware/*.h)

#${CMAKE_CURRENT_SOURCE_DIR}/design/GeneratedSource
set ( PDL_INCLUDE_DIRS
    ${CY_PDL_DIR}/drivers/include
    ${CY_PDL_DIR}/cmsis/include
    ${CY_PDL_DIR}/devices/include
    ${CY_PDL_DIR}/devices/include/ip
    ${CY_PDL_DIR}/devices/bsp/COMPONENT_MTB/startup
    ${PDL_MIDDLEWARE}
)
#message("PDL include dirs:" ${PDL_INCLUDE_DIRS} )

FILE(GLOB_RECURSE PDL_GEN ${CMAKE_CURRENT_SOURCE_DIR}/design/GeneratedSource/*.c)
FILE(GLOB_RECURSE PDL_DRIVERS ${CY_PDL_DIR}/drivers/source/*.c)
set (PDL_SRCS
    #PDL Drivers
    ${PDL_GEN}
    ${PDL_DRIVERS}
    ${CY_PDL_DIR}/drivers/source/TOOLCHAIN_GCC_ARM/cy_syslib_gcc.S
    #${CY_PDL_DIR}/drivers/peripheral/flash/cy_flash.c
    #${CY_PDL_DIR}/drivers/peripheral/ipc/cy_ipc_config.c
    #${CY_PDL_DIR}/drivers/peripheral/ipc/cy_ipc_drv.c
    #${CY_PDL_DIR}/drivers/peripheral/ipc/cy_ipc_pipe.c
    #${CY_PDL_DIR}/drivers/peripheral/ipc/cy_ipc_sema.c
    #${CY_PDL_DIR}/drivers/peripheral/sysint/cy_sysint.c
    #${CY_PDL_DIR}/drivers/peripheral/syslib/cy_syslib.c
    #${CY_PDL_DIR}/drivers/peripheral/syslib/gcc/cy_syslib_gcc.S
    #${CY_PDL_DIR}/drivers/peripheral/gpio/cy_gpio.c
)
#message(${PDL_SRCS} )
