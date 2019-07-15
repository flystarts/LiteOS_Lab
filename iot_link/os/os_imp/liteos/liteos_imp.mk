################################################################################
# this is used for compile the iotlink
################################################################################

#we will add more arch here,now only support the armv7-m
cfg_arch_cpu_type=armv7-m

ifeq ($(cfg_arch_cpu_type), armv7-m)
arch_src =  \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv7-m/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv7-m/gcc/*.c}
C_SOURCES += $(arch_src)

ASM_SOURCES_S += ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv7-m/gcc/los_startup.S}

arch_inc = -I $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv7-m
C_INCLUDES += $(arch_inc)

else ifeq ($(cfg_arch_cpu_type), armv6-m)
arch_src =  \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv6-m/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv6-m/gcc/*.c}
C_SOURCES += $(arch_src)

arch_inc = -I $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/armv6-m
C_INCLUDES += $(arch_inc)
else
    
endif

arch_common_src = ${wildcard $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/src/*.c} 
        C_SOURCES += $(arch_common_src)
arch_common_inc = -I $(iot_link_root)/os/os_imp/liteos/arch/arm/arm-m/include \
			      -I $(iot_link_root)/os/os_imp/liteos/arch/arm/common/cmsis
        C_INCLUDES += $(arch_common_inc)
                         
util_src = $(iot_link_root)/os/os_imp/liteos/utils/rbtree.c
        C_SOURCES += $(util_src)

liteos_kernel_src =  \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/core/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/ipc/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/mem/heap/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/mem/membox/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/mem/common/los_slab.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/mem/common/los_slabmem.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/mem/common/los_memcheck.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/misc/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/base/om/*.c} \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/extended/tickless/*.c}
        C_SOURCES += $(liteos_kernel_src)
liteos_kernel_inc = \
		-I $(iot_link_root)/os/os_imp/liteos	\
        -I $(iot_link_root)/os/os_imp/liteos/include \
        -I $(iot_link_root)/os/os_imp/liteos/base/include \
        -I $(iot_link_root)/os/os_imp/liteos/extended/include
        C_INCLUDES += $(liteos_kernel_inc)        
        
cmsis_src =  \
        ${wildcard $(iot_link_root)/os/os_imp/liteos/cmsis/*.c}
        C_SOURCES += $(cmsis_src)
        
cmsis_inc = -I $(iot_link_root)/os/os_imp/liteos/cmsis
        C_INCLUDES += $(cmsis_inc)
        


#liteos_imp_src  = ${wildcard $(iot_link_root)/os/os_imp/liteos/*.c}
#C_SOURCES += $(liteos_imp_src)
#		
#liteos_imp_inc = -I $(iot_link_root)/os/os_imp/liteos
#C_INCLUDES += $(liteos_imp_inc)


C_DEFS += -D CONFIG_LITEOS_ENABLE=1
