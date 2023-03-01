build_dirs += helloworld_m0
build_dirs += helloworld_d0
build_dirs += helloworld_lp

all: $(build_dirs)

$(build_dirs):
	make -C $@ BL_SDK_BASE=$(HOME)/bl_mcu_sdk

clean:
	rm -rf helloworld_m0/build helloworld_d0/build helloworld_lp/build

.PHONY: $(build_dirs)
