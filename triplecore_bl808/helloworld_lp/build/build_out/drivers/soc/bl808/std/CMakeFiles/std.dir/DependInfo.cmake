
# Consider dependencies only in project.
set(CMAKE_DEPENDS_IN_PROJECT_ONLY OFF)

# The set of languages for which implicit dependencies are needed:
set(CMAKE_DEPENDS_LANGUAGES
  "ASM"
  )
# The set of files for implicit dependencies of each language:
set(CMAKE_DEPENDS_CHECK_ASM
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/riscv_fpu.S" "/home/cjacker/work/opensource-toolchain-bouffalo-lab/triplecore_bl808/helloworld_lp/build/build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/riscv_fpu.S.obj"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/start.S" "/home/cjacker/work/opensource-toolchain-bouffalo-lab/triplecore_bl808/helloworld_lp/build/build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/start.S.obj"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/vector.S" "/home/cjacker/work/opensource-toolchain-bouffalo-lab/triplecore_bl808/helloworld_lp/build/build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/vector.S.obj"
  )
set(CMAKE_ASM_COMPILER_ID "GNU")

# Preprocessor definitions for this target.
set(CMAKE_TARGET_DEFINITIONS_ASM
  "ARCH_RISCV"
  "BFLB_TIMESTAMP_TIMEZONE=8"
  "BFLB_USE_HAL_DRIVER"
  "BL808"
  "CONFIG_IRQ_NUM=80"
  "CONFIG_LOG_LEVEL=3"
  "CONFIG_PSRAM"
  "CONFIG_TLSF"
  "CPU_LP"
  )

# The include file search paths:
set(CMAKE_ASM_TARGET_INCLUDE_PATH
  "/home/cjacker/bl_mcu_sdk/bsp/board/bl808dk/."
  "/home/cjacker/bl_mcu_sdk/components/libc/newlib/."
  "/home/cjacker/bl_mcu_sdk/components/libc/."
  "/home/cjacker/bl_mcu_sdk/components/mm/."
  "/home/cjacker/bl_mcu_sdk/components/mm/tlsf/."
  "/home/cjacker/bl_mcu_sdk/components/utils/log"
  "/home/cjacker/bl_mcu_sdk/components/utils/ring_buffer"
  "/home/cjacker/bl_mcu_sdk/components/utils/bflb_block_pool"
  "/home/cjacker/bl_mcu_sdk/components/utils/bflb_timestamp"
  "/home/cjacker/bl_mcu_sdk/components/utils/getopt"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/include"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/include/arch"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/include/arch/risc-v/t-head"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/include/arch/risc-v/t-head/Core/Include"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/config/bl808"
  "/home/cjacker/bl_mcu_sdk/drivers/lhal/src/flash"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/include"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/include/hardware"
  )

# The set of dependency files which are needed:
set(CMAKE_DEPENDS_DEPENDENCY_FILES
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/port/bl808_clock.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/port/bl808_clock.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/port/bl808_clock.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_aon.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_aon.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_aon.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_clock.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_clock.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_clock.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_common.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_common.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_common.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_ef_cfg.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_ef_cfg.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_ef_cfg.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_glb.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_glb.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_glb.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_glb_gpio.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_glb_gpio.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_glb_gpio.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_hbn.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_hbn.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_hbn.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_l1c.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_l1c.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_l1c.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_pds.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_pds.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_pds.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_psram_uhs.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_psram_uhs.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_psram_uhs.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_sdh.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_sdh.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_sdh.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_tzc_sec.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_tzc_sec.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_tzc_sec.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/src/bl808_uhs_phy.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_uhs_phy.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/src/bl808_uhs_phy.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/interrupt.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/interrupt.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/interrupt.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/start_load.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/start_load.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/start_load.c.obj.d"
  "/home/cjacker/bl_mcu_sdk/drivers/soc/bl808/std/startup/lp/system_bl808.c" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/system_bl808.c.obj" "gcc" "build_out/drivers/soc/bl808/std/CMakeFiles/std.dir/startup/lp/system_bl808.c.obj.d"
  )

# Targets to which this target links.
set(CMAKE_TARGET_LINKED_INFO_FILES
  )

# Fortran module output directory.
set(CMAKE_Fortran_TARGET_MODULE_DIR "")
