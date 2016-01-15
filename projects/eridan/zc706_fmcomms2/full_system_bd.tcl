
################################################################
# This is a generated script based on design: system
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2015.3
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   puts "ERROR: This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source system_script.tcl

# If you do not already have a project created,
# you can create a project using the following command:
#    create_project project_1 myproj -part xc7z045ffg900-2
#    set_property BOARD_PART xilinx.com:zc706:part0:1.0 [current_project]

# CHECKING IF PROJECT EXISTS
if { [get_projects -quiet] eq "" } {
   puts "ERROR: Please open or create a project!"
   return 1
}



# CHANGE DESIGN NAME HERE
set design_name system

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "ERROR: Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      puts "INFO: Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   puts "INFO: Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "ERROR: Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   puts "INFO: Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   puts "INFO: Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

puts "INFO: Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   puts $errMsg
   return $nRet
}

##################################################################
# DESIGN PROCs
##################################################################



# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     puts "ERROR: Unable to find parent cell <$parentCell>!"
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     puts "ERROR: Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports
  set DDR [ create_bd_intf_port -mode Master -vlnv xilinx.com:interface:ddrx_rtl:1.0 DDR ]
  set FIXED_IO [ create_bd_intf_port -mode Master -vlnv xilinx.com:display_processing_system7:fixedio_rtl:1.0 FIXED_IO ]

  # Create ports
  set GPIO_I [ create_bd_port -dir I -from 20 -to 0 GPIO_I ]
  set GPIO_O [ create_bd_port -dir O -from 20 -to 0 GPIO_O ]
  set GPIO_T [ create_bd_port -dir O -from 20 -to 0 GPIO_T ]
  set rx_clk_in_0_n [ create_bd_port -dir I rx_clk_in_0_n ]
  set rx_clk_in_0_p [ create_bd_port -dir I rx_clk_in_0_p ]
  set rx_data_in_0_n [ create_bd_port -dir I -from 5 -to 0 rx_data_in_0_n ]
  set rx_data_in_0_p [ create_bd_port -dir I -from 5 -to 0 rx_data_in_0_p ]
  set rx_frame_in_0_n [ create_bd_port -dir I rx_frame_in_0_n ]
  set rx_frame_in_0_p [ create_bd_port -dir I rx_frame_in_0_p ]
  set spi_csn_0_i [ create_bd_port -dir I spi_csn_0_i ]
  set spi_csn_0_o [ create_bd_port -dir O spi_csn_0_o ]
  set spi_csn_1_o [ create_bd_port -dir O spi_csn_1_o ]
  set spi_miso_i [ create_bd_port -dir I spi_miso_i ]
  set spi_mosi_i [ create_bd_port -dir I spi_mosi_i ]
  set spi_mosi_o [ create_bd_port -dir O spi_mosi_o ]
  set spi_sclk_i [ create_bd_port -dir I spi_sclk_i ]
  set spi_sclk_o [ create_bd_port -dir O spi_sclk_o ]
  set tx_clk_out_0_n [ create_bd_port -dir O tx_clk_out_0_n ]
  set tx_clk_out_0_p [ create_bd_port -dir O tx_clk_out_0_p ]
  set tx_data_out_0_n [ create_bd_port -dir O -from 5 -to 0 tx_data_out_0_n ]
  set tx_data_out_0_p [ create_bd_port -dir O -from 5 -to 0 tx_data_out_0_p ]
  set tx_frame_out_0_n [ create_bd_port -dir O tx_frame_out_0_n ]
  set tx_frame_out_0_p [ create_bd_port -dir O tx_frame_out_0_p ]

  # Create instance: adi2axis_0, and set properties
  set adi2axis_0 [ create_bd_cell -type ip -vlnv Silver-Bullet-Tech:user:adi2axis:1.0 adi2axis_0 ]

  # Create instance: axi_ad9361_0_adc_dma_interconnect, and set properties
  set axi_ad9361_0_adc_dma_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ad9361_0_adc_dma_interconnect ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
CONFIG.S00_HAS_REGSLICE {4} \
 ] $axi_ad9361_0_adc_dma_interconnect

  # Create instance: axi_ad9361_0_dac_dma_interconnect, and set properties
  set axi_ad9361_0_dac_dma_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_ad9361_0_dac_dma_interconnect ]
  set_property -dict [ list \
CONFIG.M00_HAS_REGSLICE {4} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_REGSLICE {4} \
 ] $axi_ad9361_0_dac_dma_interconnect

  # Create instance: axi_cpu_interconnect, and set properties
  set axi_cpu_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_cpu_interconnect ]
  set_property -dict [ list \
CONFIG.NUM_MI {5} \
 ] $axi_cpu_interconnect

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
CONFIG.c_include_s2mm {1} \
CONFIG.c_m_axi_mm2s_data_width {64} \
CONFIG.c_m_axi_s2mm_data_width {64} \
CONFIG.c_m_axis_mm2s_tdata_width {64} \
CONFIG.c_sg_include_stscntrl_strm {0} \
CONFIG.c_sg_length_width {16} \
 ] $axi_dma_0

  # Create instance: axi_eridan_0, and set properties
  set axi_eridan_0 [ create_bd_cell -type ip -vlnv analog.com:user:axi_eridan:1.0 axi_eridan_0 ]

  # Create instance: axi_sg_interconnect, and set properties
  set axi_sg_interconnect [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_sg_interconnect ]
  set_property -dict [ list \
CONFIG.M00_HAS_REGSLICE {4} \
CONFIG.NUM_MI {1} \
CONFIG.NUM_SI {1} \
CONFIG.S00_HAS_REGSLICE {4} \
CONFIG.S01_HAS_REGSLICE {4} \
CONFIG.S02_HAS_REGSLICE {4} \
 ] $axi_sg_interconnect

  # Create instance: axis2adi_0, and set properties
  set axis2adi_0 [ create_bd_cell -type ip -vlnv Silver-Bullet-Tech:user:axis2adi:1.0 axis2adi_0 ]

  # Create instance: axis_adc_interconnect_0, and set properties
  set axis_adc_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_adc_interconnect_0 ]
  set_property -dict [ list \
CONFIG.M00_HAS_REGSLICE {1} \
CONFIG.NUM_MI {1} \
 ] $axis_adc_interconnect_0

  # Create instance: axis_dac_interconnect_0, and set properties
  set axis_dac_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axis_interconnect:2.1 axis_dac_interconnect_0 ]
  set_property -dict [ list \
CONFIG.NUM_MI {1} \
 ] $axis_dac_interconnect_0

  # Create instance: irq_stub0, and set properties
  set irq_stub0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub0 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub0

  # Create instance: irq_stub1, and set properties
  set irq_stub1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub1 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub1

  # Create instance: irq_stub2, and set properties
  set irq_stub2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub2 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub2

  # Create instance: irq_stub3, and set properties
  set irq_stub3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub3 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub3

  # Create instance: irq_stub4, and set properties
  set irq_stub4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub4 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub4

  # Create instance: irq_stub5, and set properties
  set irq_stub5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub5 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub5

  # Create instance: irq_stub6, and set properties
  set irq_stub6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub6 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub6

  # Create instance: irq_stub7, and set properties
  set irq_stub7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub7 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub7

  # Create instance: irq_stub8, and set properties
  set irq_stub8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub8 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub8

  # Create instance: irq_stub9, and set properties
  set irq_stub9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub9 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub9

  # Create instance: irq_stub10, and set properties
  set irq_stub10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub10 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub10

  # Create instance: irq_stub11, and set properties
  set irq_stub11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub11 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub11

  # Create instance: irq_stub12, and set properties
  set irq_stub12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub12 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub12

  # Create instance: irq_stub13, and set properties
  set irq_stub13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 irq_stub13 ]
  set_property -dict [ list \
CONFIG.CONST_VAL {0} \
 ] $irq_stub13

  # Create instance: sys_concat_intc, and set properties
  set sys_concat_intc [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconcat:2.1 sys_concat_intc ]
  set_property -dict [ list \
CONFIG.NUM_PORTS {16} \
 ] $sys_concat_intc

  # Create instance: sys_ps7, and set properties
  set sys_ps7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:processing_system7:5.5 sys_ps7 ]
  set_property -dict [ list \
CONFIG.PCW_APU_PERIPHERAL_FREQMHZ {666.666666} \
CONFIG.PCW_CRYSTAL_PERIPHERAL_FREQMHZ {33.333333} \
CONFIG.PCW_ENET0_ENET0_IO {MIO 16 .. 27} \
CONFIG.PCW_ENET0_GRP_MDIO_ENABLE {1} \
CONFIG.PCW_ENET0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_EN_CLK1_PORT {1} \
CONFIG.PCW_EN_CLK2_PORT {1} \
CONFIG.PCW_EN_RST1_PORT {0} \
CONFIG.PCW_EN_RST2_PORT {0} \
CONFIG.PCW_FPGA0_PERIPHERAL_FREQMHZ {100} \
CONFIG.PCW_FPGA1_PERIPHERAL_FREQMHZ {200} \
CONFIG.PCW_FPGA2_PERIPHERAL_FREQMHZ {250} \
CONFIG.PCW_GPIO_EMIO_GPIO_ENABLE {1} \
CONFIG.PCW_GPIO_EMIO_GPIO_IO {21} \
CONFIG.PCW_GPIO_MIO_GPIO_ENABLE {1} \
CONFIG.PCW_I2C1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_IRQ_F2P_INTR {1} \
CONFIG.PCW_PRESET_BANK0_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_PRESET_BANK1_VOLTAGE {LVCMOS 1.8V} \
CONFIG.PCW_QSPI_GRP_FBCLK_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_IO1_ENABLE {0} \
CONFIG.PCW_QSPI_GRP_SINGLE_SS_ENABLE {1} \
CONFIG.PCW_QSPI_GRP_SS1_ENABLE {0} \
CONFIG.PCW_QSPI_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_ENABLE {1} \
CONFIG.PCW_SD0_GRP_CD_IO {MIO 14} \
CONFIG.PCW_SD0_GRP_WP_ENABLE {1} \
CONFIG.PCW_SD0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SD1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_SD1_SD1_IO {<Select>} \
CONFIG.PCW_SPI0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_SPI1_PERIPHERAL_ENABLE {0} \
CONFIG.PCW_TTC0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UART1_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_UIPARAM_DDR_PARTNO {MT41J256M8 HX-15E} \
CONFIG.PCW_USB0_PERIPHERAL_ENABLE {1} \
CONFIG.PCW_USE_FABRIC_INTERRUPT {1} \
CONFIG.PCW_USE_M_AXI_GP1 {0} \
CONFIG.PCW_USE_S_AXI_GP0 {1} \
CONFIG.PCW_USE_S_AXI_HP0 {1} \
CONFIG.PCW_USE_S_AXI_HP1 {1} \
CONFIG.PCW_USE_S_AXI_HP2 {0} \
CONFIG.PCW_USE_S_AXI_HP3 {0} \
CONFIG.PCW_WDT_PERIPHERAL_ENABLE {0} \
CONFIG.preset {ZC702} \
 ] $sys_ps7

  # Create instance: sys_rstgen, and set properties
  set sys_rstgen [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 sys_rstgen ]
  set_property -dict [ list \
CONFIG.C_EXT_RST_WIDTH {1} \
 ] $sys_rstgen

  # Create instance: util_adc_pack_0, and set properties
  set util_adc_pack_0 [ create_bd_cell -type ip -vlnv analog.com:user:util_adc_pack:1.0 util_adc_pack_0 ]
  set_property -dict [ list \
CONFIG.CHANNELS {4} \
 ] $util_adc_pack_0

  # Create instance: util_dac_unpack_0, and set properties
  set util_dac_unpack_0 [ create_bd_cell -type ip -vlnv analog.com:user:util_dac_unpack:1.0 util_dac_unpack_0 ]
  set_property -dict [ list \
CONFIG.CHANNELS {4} \
 ] $util_dac_unpack_0

  # Create interface connections
  connect_bd_intf_net -intf_net S00_AXIS_1 [get_bd_intf_pins adi2axis_0/M_AXIS] [get_bd_intf_pins axis_adc_interconnect_0/S00_AXIS]
  connect_bd_intf_net -intf_net axi_ad9361_0_adc_dma_interconnect_M00_AXI [get_bd_intf_pins axi_ad9361_0_adc_dma_interconnect/M00_AXI] [get_bd_intf_pins sys_ps7/S_AXI_HP0]
  connect_bd_intf_net -intf_net axi_ad9361_0_dac_dma_interconnect_M00_AXI [get_bd_intf_pins axi_ad9361_0_dac_dma_interconnect/M00_AXI] [get_bd_intf_pins sys_ps7/S_AXI_HP1]
  connect_bd_intf_net -intf_net axi_cpu_interconnect_M00_AXI [get_bd_intf_pins axi_cpu_interconnect/M00_AXI] [get_bd_intf_pins axi_eridan_0/s_axi]
  connect_bd_intf_net -intf_net axi_cpu_interconnect_m03_axi [get_bd_intf_pins adi2axis_0/S_AXI] [get_bd_intf_pins axi_cpu_interconnect/M03_AXI]
  connect_bd_intf_net -intf_net axi_cpu_interconnect_m04_axi [get_bd_intf_pins axi_cpu_interconnect/M04_AXI] [get_bd_intf_pins axi_dma_0/S_AXI_LITE]
  connect_bd_intf_net -intf_net axi_cpu_interconnect_s00_axi [get_bd_intf_pins axi_cpu_interconnect/S00_AXI] [get_bd_intf_pins sys_ps7/M_AXI_GP0]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S] [get_bd_intf_pins axis_dac_interconnect_0/S00_AXIS]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_ad9361_0_dac_dma_interconnect/S00_AXI] [get_bd_intf_pins axi_dma_0/M_AXI_MM2S]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_S2MM [get_bd_intf_pins axi_ad9361_0_adc_dma_interconnect/S00_AXI] [get_bd_intf_pins axi_dma_0/M_AXI_S2MM]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_SG [get_bd_intf_pins axi_dma_0/M_AXI_SG] [get_bd_intf_pins axi_sg_interconnect/S00_AXI]
  connect_bd_intf_net -intf_net axi_sg_interconnect_M00_AXI [get_bd_intf_pins axi_sg_interconnect/M00_AXI] [get_bd_intf_pins sys_ps7/S_AXI_GP0]
  connect_bd_intf_net -intf_net axis_adc_interconnect_0_M00_AXIS [get_bd_intf_pins axi_dma_0/S_AXIS_S2MM] [get_bd_intf_pins axis_adc_interconnect_0/M00_AXIS]
  connect_bd_intf_net -intf_net axis_dac_interconnect_0_M00_AXIS [get_bd_intf_pins axis2adi_0/S_AXIS] [get_bd_intf_pins axis_dac_interconnect_0/M00_AXIS]
  connect_bd_intf_net -intf_net sys_ps7_ddr [get_bd_intf_ports DDR] [get_bd_intf_pins sys_ps7/DDR]
  connect_bd_intf_net -intf_net sys_ps7_fixed_io [get_bd_intf_ports FIXED_IO] [get_bd_intf_pins sys_ps7/FIXED_IO]

  # Create port connections
  connect_bd_net -net GPIO_I_1 [get_bd_ports GPIO_I] [get_bd_pins sys_ps7/GPIO_I]
  connect_bd_net -net axi_ad9361_0_clk [get_bd_pins adi2axis_0/AXIS_ACLK] [get_bd_pins axi_eridan_0/clk] [get_bd_pins axi_eridan_0/l_clk] [get_bd_pins axis2adi_0/AXIS_ACLK] [get_bd_pins axis_adc_interconnect_0/ACLK] [get_bd_pins axis_adc_interconnect_0/S00_AXIS_ACLK] [get_bd_pins axis_dac_interconnect_0/M00_AXIS_ACLK] [get_bd_pins util_adc_pack_0/clk] [get_bd_pins util_dac_unpack_0/clk]
  connect_bd_net -net axi_ad9361_0_dac_data_0 [get_bd_pins axi_eridan_0/dac_data_i0] [get_bd_pins util_dac_unpack_0/dac_data_00]
  connect_bd_net -net axi_ad9361_0_dac_data_1 [get_bd_pins axi_eridan_0/dac_data_q0] [get_bd_pins util_dac_unpack_0/dac_data_01]
  connect_bd_net -net axi_ad9361_0_dac_data_2 [get_bd_pins axi_eridan_0/dac_data_i1] [get_bd_pins util_dac_unpack_0/dac_data_02]
  connect_bd_net -net axi_ad9361_0_dac_data_3 [get_bd_pins axi_eridan_0/dac_data_q1] [get_bd_pins util_dac_unpack_0/dac_data_03]
  connect_bd_net -net axi_ad9361_0_dac_drd [get_bd_pins axis2adi_0/dma_rd] [get_bd_pins util_dac_unpack_0/dma_rd]
  connect_bd_net -net axi_ad9361_0_dac_dunf [get_bd_pins axi_eridan_0/dac_dunf] [get_bd_pins axis2adi_0/dma_unf]
  connect_bd_net -net axi_ad9361_0_rx_clk_in_n [get_bd_ports rx_clk_in_0_n] [get_bd_pins axi_eridan_0/rx_clk_in_n]
  connect_bd_net -net axi_ad9361_0_rx_clk_in_p [get_bd_ports rx_clk_in_0_p] [get_bd_pins axi_eridan_0/rx_clk_in_p]
  connect_bd_net -net axi_ad9361_0_rx_data_in_n [get_bd_ports rx_data_in_0_n] [get_bd_pins axi_eridan_0/rx_data_in_n]
  connect_bd_net -net axi_ad9361_0_rx_data_in_p [get_bd_ports rx_data_in_0_p] [get_bd_pins axi_eridan_0/rx_data_in_p]
  connect_bd_net -net axi_ad9361_0_rx_frame_in_n [get_bd_ports rx_frame_in_0_n] [get_bd_pins axi_eridan_0/rx_frame_in_n]
  connect_bd_net -net axi_ad9361_0_rx_frame_in_p [get_bd_ports rx_frame_in_0_p] [get_bd_pins axi_eridan_0/rx_frame_in_p]
  connect_bd_net -net axi_dma_0_mm2s_introut [get_bd_pins axi_dma_0/mm2s_introut] [get_bd_pins sys_concat_intc/In14]
  connect_bd_net -net axi_dma_0_s2mm_introut [get_bd_pins axi_dma_0/s2mm_introut] [get_bd_pins sys_concat_intc/In15]
  connect_bd_net -net axi_eridan_0_adc_data_i0 [get_bd_pins axi_eridan_0/adc_data_i0] [get_bd_pins util_adc_pack_0/chan_data_0]
  connect_bd_net -net axi_eridan_0_adc_data_i1 [get_bd_pins axi_eridan_0/adc_data_i1] [get_bd_pins util_adc_pack_0/chan_data_2]
  connect_bd_net -net axi_eridan_0_adc_data_q0 [get_bd_pins axi_eridan_0/adc_data_q0] [get_bd_pins util_adc_pack_0/chan_data_1]
  connect_bd_net -net axi_eridan_0_adc_data_q1 [get_bd_pins axi_eridan_0/adc_data_q1] [get_bd_pins util_adc_pack_0/chan_data_3]
  connect_bd_net -net axi_eridan_0_adc_enable_i0 [get_bd_pins axi_eridan_0/adc_enable_i0] [get_bd_pins util_adc_pack_0/chan_enable_0]
  connect_bd_net -net axi_eridan_0_adc_enable_i1 [get_bd_pins axi_eridan_0/adc_enable_i1] [get_bd_pins util_adc_pack_0/chan_enable_2]
  connect_bd_net -net axi_eridan_0_adc_enable_q0 [get_bd_pins axi_eridan_0/adc_enable_q0] [get_bd_pins util_adc_pack_0/chan_enable_1]
  connect_bd_net -net axi_eridan_0_adc_enable_q1 [get_bd_pins axi_eridan_0/adc_enable_q1] [get_bd_pins util_adc_pack_0/chan_enable_3]
  connect_bd_net -net axi_eridan_0_adc_valid_i0 [get_bd_pins axi_eridan_0/adc_valid_i0] [get_bd_pins util_adc_pack_0/chan_valid_0]
  connect_bd_net -net axi_eridan_0_adc_valid_i1 [get_bd_pins axi_eridan_0/adc_valid_i1] [get_bd_pins util_adc_pack_0/chan_valid_2]
  connect_bd_net -net axi_eridan_0_adc_valid_q0 [get_bd_pins axi_eridan_0/adc_valid_q0] [get_bd_pins util_adc_pack_0/chan_valid_1]
  connect_bd_net -net axi_eridan_0_adc_valid_q1 [get_bd_pins axi_eridan_0/adc_valid_q1] [get_bd_pins util_adc_pack_0/chan_valid_3]
  connect_bd_net -net axi_eridan_0_dac_enable_i0 [get_bd_pins axi_eridan_0/dac_enable_i0] [get_bd_pins util_dac_unpack_0/dac_enable_00]
  connect_bd_net -net axi_eridan_0_dac_enable_i1 [get_bd_pins axi_eridan_0/dac_enable_i1] [get_bd_pins util_dac_unpack_0/dac_enable_02]
  connect_bd_net -net axi_eridan_0_dac_enable_q0 [get_bd_pins axi_eridan_0/dac_enable_q0] [get_bd_pins util_dac_unpack_0/dac_enable_01]
  connect_bd_net -net axi_eridan_0_dac_enable_q1 [get_bd_pins axi_eridan_0/dac_enable_q1] [get_bd_pins util_dac_unpack_0/dac_enable_03]
  connect_bd_net -net axi_eridan_0_dac_valid_i0 [get_bd_pins axi_eridan_0/dac_valid_i0] [get_bd_pins util_dac_unpack_0/dac_valid_00]
  connect_bd_net -net axi_eridan_0_dac_valid_i1 [get_bd_pins axi_eridan_0/dac_valid_i1] [get_bd_pins util_dac_unpack_0/dac_valid_02]
  connect_bd_net -net axi_eridan_0_dac_valid_q0 [get_bd_pins axi_eridan_0/dac_valid_q0] [get_bd_pins util_dac_unpack_0/dac_valid_01]
  connect_bd_net -net axi_eridan_0_dac_valid_q1 [get_bd_pins axi_eridan_0/dac_valid_q1] [get_bd_pins util_dac_unpack_0/dac_valid_03]
  connect_bd_net -net axi_eridan_0_tx_clk_out_n [get_bd_ports tx_clk_out_0_n] [get_bd_pins axi_eridan_0/tx_clk_out_n]
  connect_bd_net -net axi_eridan_0_tx_clk_out_p [get_bd_ports tx_clk_out_0_p] [get_bd_pins axi_eridan_0/tx_clk_out_p]
  connect_bd_net -net axi_eridan_0_tx_data_out_n [get_bd_ports tx_data_out_0_n] [get_bd_pins axi_eridan_0/tx_data_out_n]
  connect_bd_net -net axi_eridan_0_tx_data_out_p [get_bd_ports tx_data_out_0_p] [get_bd_pins axi_eridan_0/tx_data_out_p]
  connect_bd_net -net axi_eridan_0_tx_frame_out_n [get_bd_ports tx_frame_out_0_n] [get_bd_pins axi_eridan_0/tx_frame_out_n]
  connect_bd_net -net axi_eridan_0_tx_frame_out_p [get_bd_ports tx_frame_out_0_p] [get_bd_pins axi_eridan_0/tx_frame_out_p]
  connect_bd_net -net fifo_data_0 [get_bd_pins axis2adi_0/dma_data] [get_bd_pins util_dac_unpack_0/dma_data]
  connect_bd_net -net fifo_valid_0 [get_bd_pins axis2adi_0/dma_valid] [get_bd_pins util_dac_unpack_0/fifo_valid]
  connect_bd_net -net irq_stub0_dout [get_bd_pins irq_stub0/dout] [get_bd_pins sys_concat_intc/In0]
  connect_bd_net -net irq_stub10_dout [get_bd_pins irq_stub10/dout] [get_bd_pins sys_concat_intc/In10]
  connect_bd_net -net irq_stub11_dout [get_bd_pins irq_stub11/dout] [get_bd_pins sys_concat_intc/In11]
  connect_bd_net -net irq_stub12_dout [get_bd_pins irq_stub12/dout] [get_bd_pins sys_concat_intc/In12]
  connect_bd_net -net irq_stub13_dout [get_bd_pins irq_stub13/dout] [get_bd_pins sys_concat_intc/In13]
  connect_bd_net -net irq_stub1_dout [get_bd_pins irq_stub1/dout] [get_bd_pins sys_concat_intc/In1]
  connect_bd_net -net irq_stub2_dout [get_bd_pins irq_stub2/dout] [get_bd_pins sys_concat_intc/In2]
  connect_bd_net -net irq_stub3_dout [get_bd_pins irq_stub3/dout] [get_bd_pins sys_concat_intc/In3]
  connect_bd_net -net irq_stub4_dout [get_bd_pins irq_stub4/dout] [get_bd_pins sys_concat_intc/In4]
  connect_bd_net -net irq_stub5_dout [get_bd_pins irq_stub5/dout] [get_bd_pins sys_concat_intc/In5]
  connect_bd_net -net irq_stub6_dout [get_bd_pins irq_stub6/dout] [get_bd_pins sys_concat_intc/In6]
  connect_bd_net -net irq_stub7_dout [get_bd_pins irq_stub7/dout] [get_bd_pins sys_concat_intc/In7]
  connect_bd_net -net irq_stub8_dout [get_bd_pins irq_stub8/dout] [get_bd_pins sys_concat_intc/In8]
  connect_bd_net -net irq_stub9_dout [get_bd_pins irq_stub9/dout] [get_bd_pins sys_concat_intc/In9]
  connect_bd_net -net spi_csn_0_i_1 [get_bd_ports spi_csn_0_i] [get_bd_pins sys_ps7/SPI0_SS_I]
  connect_bd_net -net spi_miso_i_1 [get_bd_ports spi_miso_i] [get_bd_pins sys_ps7/SPI0_MISO_I]
  connect_bd_net -net spi_mosi_i_1 [get_bd_ports spi_mosi_i] [get_bd_pins sys_ps7/SPI0_MOSI_I]
  connect_bd_net -net spi_sclk_i_1 [get_bd_ports spi_sclk_i] [get_bd_pins sys_ps7/SPI0_SCLK_I]
  connect_bd_net -net sys_100m_clk [get_bd_pins adi2axis_0/S_AXI_ACLK] [get_bd_pins axi_cpu_interconnect/ACLK] [get_bd_pins axi_cpu_interconnect/M00_ACLK] [get_bd_pins axi_cpu_interconnect/M01_ACLK] [get_bd_pins axi_cpu_interconnect/M02_ACLK] [get_bd_pins axi_cpu_interconnect/M03_ACLK] [get_bd_pins axi_cpu_interconnect/M04_ACLK] [get_bd_pins axi_cpu_interconnect/S00_ACLK] [get_bd_pins axi_dma_0/m_axi_sg_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_eridan_0/s_axi_aclk] [get_bd_pins axi_sg_interconnect/ACLK] [get_bd_pins axi_sg_interconnect/M00_ACLK] [get_bd_pins axi_sg_interconnect/S00_ACLK] [get_bd_pins sys_ps7/FCLK_CLK0] [get_bd_pins sys_ps7/M_AXI_GP0_ACLK] [get_bd_pins sys_ps7/S_AXI_GP0_ACLK] [get_bd_pins sys_rstgen/slowest_sync_clk]
  connect_bd_net -net sys_100m_resetn [get_bd_pins adi2axis_0/AXIS_ARESETN] [get_bd_pins adi2axis_0/S_AXI_ARESETN] [get_bd_pins axi_ad9361_0_adc_dma_interconnect/ARESETN] [get_bd_pins axi_ad9361_0_adc_dma_interconnect/M00_ARESETN] [get_bd_pins axi_ad9361_0_adc_dma_interconnect/S00_ARESETN] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/ARESETN] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/M00_ARESETN] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/S00_ARESETN] [get_bd_pins axi_cpu_interconnect/ARESETN] [get_bd_pins axi_cpu_interconnect/M00_ARESETN] [get_bd_pins axi_cpu_interconnect/M01_ARESETN] [get_bd_pins axi_cpu_interconnect/M02_ARESETN] [get_bd_pins axi_cpu_interconnect/M03_ARESETN] [get_bd_pins axi_cpu_interconnect/M04_ARESETN] [get_bd_pins axi_cpu_interconnect/S00_ARESETN] [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_eridan_0/s_axi_aresetn] [get_bd_pins axi_sg_interconnect/ARESETN] [get_bd_pins axi_sg_interconnect/M00_ARESETN] [get_bd_pins axi_sg_interconnect/S00_ARESETN] [get_bd_pins axis2adi_0/AXIS_ARESETN] [get_bd_pins axis_adc_interconnect_0/ARESETN] [get_bd_pins axis_adc_interconnect_0/M00_AXIS_ARESETN] [get_bd_pins axis_adc_interconnect_0/S00_AXIS_ARESETN] [get_bd_pins axis_dac_interconnect_0/ARESETN] [get_bd_pins axis_dac_interconnect_0/M00_AXIS_ARESETN] [get_bd_pins axis_dac_interconnect_0/S00_AXIS_ARESETN] [get_bd_pins sys_rstgen/peripheral_aresetn]
  connect_bd_net -net sys_aux_reset [get_bd_pins sys_ps7/FCLK_RESET0_N] [get_bd_pins sys_rstgen/ext_reset_in]
  connect_bd_net -net sys_concat_intc_dout [get_bd_pins sys_concat_intc/dout] [get_bd_pins sys_ps7/IRQ_F2P]
  connect_bd_net -net sys_fmc_dma_clk [get_bd_pins axi_ad9361_0_adc_dma_interconnect/ACLK] [get_bd_pins axi_ad9361_0_adc_dma_interconnect/M00_ACLK] [get_bd_pins axi_ad9361_0_adc_dma_interconnect/S00_ACLK] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/ACLK] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/M00_ACLK] [get_bd_pins axi_ad9361_0_dac_dma_interconnect/S00_ACLK] [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/m_axi_s2mm_aclk] [get_bd_pins axis_adc_interconnect_0/M00_AXIS_ACLK] [get_bd_pins axis_dac_interconnect_0/ACLK] [get_bd_pins axis_dac_interconnect_0/S00_AXIS_ACLK] [get_bd_pins sys_ps7/FCLK_CLK2] [get_bd_pins sys_ps7/S_AXI_HP0_ACLK] [get_bd_pins sys_ps7/S_AXI_HP1_ACLK]
  connect_bd_net -net sys_ps7_FCLK_CLK1 [get_bd_pins axi_eridan_0/delay_clk] [get_bd_pins sys_ps7/FCLK_CLK1]
  connect_bd_net -net sys_ps7_GPIO_O [get_bd_ports GPIO_O] [get_bd_pins sys_ps7/GPIO_O]
  connect_bd_net -net sys_ps7_GPIO_T [get_bd_ports GPIO_T] [get_bd_pins sys_ps7/GPIO_T]
  connect_bd_net -net sys_ps7_SPI0_MOSI_O [get_bd_ports spi_mosi_o] [get_bd_pins sys_ps7/SPI0_MOSI_O]
  connect_bd_net -net sys_ps7_SPI0_SCLK_O [get_bd_ports spi_sclk_o] [get_bd_pins sys_ps7/SPI0_SCLK_O]
  connect_bd_net -net sys_ps7_SPI0_SS1_O [get_bd_ports spi_csn_1_o] [get_bd_pins sys_ps7/SPI0_SS1_O]
  connect_bd_net -net sys_ps7_SPI0_SS_O [get_bd_ports spi_csn_0_o] [get_bd_pins sys_ps7/SPI0_SS_O]
  connect_bd_net -net util_adc_pack_0_ddata [get_bd_pins adi2axis_0/ddata] [get_bd_pins util_adc_pack_0/ddata]
  connect_bd_net -net util_adc_pack_0_dsync [get_bd_pins adi2axis_0/dsync] [get_bd_pins util_adc_pack_0/dsync]
  connect_bd_net -net util_adc_pack_0_dvalid [get_bd_pins adi2axis_0/dvalid] [get_bd_pins util_adc_pack_0/dvalid]

  # Create address segments
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs sys_ps7/S_AXI_GP0/GP0_DDR_LOWOCM] SEG_sys_ps7_GP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x400000 -offset 0xE0000000 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs sys_ps7/S_AXI_GP0/GP0_IOP] SEG_sys_ps7_GP0_IOP
  create_bd_addr_seg -range 0x40000000 -offset 0x40000000 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs sys_ps7/S_AXI_GP0/GP0_M_AXI_GP0] SEG_sys_ps7_GP0_M_AXI_GP0
  create_bd_addr_seg -range 0x1000000 -offset 0xFC000000 [get_bd_addr_spaces axi_dma_0/Data_SG] [get_bd_addr_segs sys_ps7/S_AXI_GP0/GP0_QSPI_LINEAR] SEG_sys_ps7_GP0_QSPI_LINEAR
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_S2MM] [get_bd_addr_segs sys_ps7/S_AXI_HP0/HP0_DDR_LOWOCM] SEG_sys_ps7_HP0_DDR_LOWOCM
  create_bd_addr_seg -range 0x40000000 -offset 0x0 [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs sys_ps7/S_AXI_HP1/HP1_DDR_LOWOCM] SEG_sys_ps7_HP1_DDR_LOWOCM
  create_bd_addr_seg -range 0x10000 -offset 0x43C00000 [get_bd_addr_spaces sys_ps7/Data] [get_bd_addr_segs axi_eridan_0/s_axi/axi_lite] SEG_axi_eridan_0_axi_lite
  create_bd_addr_seg -range 0x1000 -offset 0x52000000 [get_bd_addr_spaces sys_ps7/Data] [get_bd_addr_segs adi2axis_0/S_AXI/reg0] SEG_data_ad9361_0_adi2axis
  create_bd_addr_seg -range 0x10000 -offset 0x52100000 [get_bd_addr_spaces sys_ps7/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] SEG_data_ad9361_0_dma

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   guistr: "# # String gsaved with Nlview 6.5.5  2015-06-26 bk=1.3371 VDI=38 GEI=35 GUI=JA:1.6
#  -string -flagsOSRD
preplace port spi_mosi_i -pg 1 -y 240 -defaultsOSRD
preplace port rx_frame_in_0_n -pg 1 -y 160 -defaultsOSRD
preplace port DDR -pg 1 -y 60 -defaultsOSRD
preplace port rx_clk_in_0_n -pg 1 -y 80 -defaultsOSRD
preplace port rx_frame_in_0_p -pg 1 -y 180 -defaultsOSRD
preplace port rx_clk_in_0_p -pg 1 -y 100 -defaultsOSRD
preplace port spi_sclk_o -pg 1 -y 200 -defaultsOSRD
preplace port tx_frame_out_0_n -pg 1 -y 300 -defaultsOSRD
preplace port spi_csn_0_i -pg 1 -y 200 -defaultsOSRD
preplace port spi_mosi_o -pg 1 -y 180 -defaultsOSRD
preplace port spi_miso_i -pg 1 -y 220 -defaultsOSRD
preplace port tx_frame_out_0_p -pg 1 -y 320 -defaultsOSRD
preplace port tx_clk_out_0_n -pg 1 -y 220 -defaultsOSRD
preplace port tx_clk_out_0_p -pg 1 -y 240 -defaultsOSRD
preplace port FIXED_IO -pg 1 -y 80 -defaultsOSRD
preplace port spi_csn_1_o -pg 1 -y 160 -defaultsOSRD
preplace port spi_csn_0_o -pg 1 -y 140 -defaultsOSRD
preplace port spi_sclk_i -pg 1 -y 260 -defaultsOSRD
preplace portBus GPIO_T -pg 1 -y 120 -defaultsOSRD
preplace portBus tx_data_out_0_n -pg 1 -y 260 -defaultsOSRD
preplace portBus GPIO_I -pg 1 -y 60 -defaultsOSRD
preplace portBus rx_data_in_0_n -pg 1 -y 120 -defaultsOSRD
preplace portBus tx_data_out_0_p -pg 1 -y 280 -defaultsOSRD
preplace portBus rx_data_in_0_p -pg 1 -y 140 -defaultsOSRD
preplace portBus GPIO_O -pg 1 -y 100 -defaultsOSRD
preplace inst axis_adc_interconnect_0 -pg 1 -lvl 3 -y 2040 -defaultsOSRD
preplace inst axi_ad9361_0_adc_dma_interconnect -pg 1 -lvl 4 -y 570 -defaultsOSRD
preplace inst axis_dac_interconnect_0 -pg 1 -lvl 3 -y 2490 -defaultsOSRD
preplace inst axi_dma_0 -pg 1 -lvl 4 -y 2440 -defaultsOSRD
preplace inst axis2adi_0 -pg 1 -lvl 2 -y 130 -defaultsOSRD
preplace inst irq_stub10 -pg 1 -lvl 2 -y 2100 -defaultsOSRD
preplace inst axi_eridan_0 -pg 1 -lvl 3 -y 390 -defaultsOSRD
preplace inst adi2axis_0 -pg 1 -lvl 4 -y 160 -defaultsOSRD
preplace inst irq_stub11 -pg 1 -lvl 2 -y 2180 -defaultsOSRD
preplace inst irq_stub0 -pg 1 -lvl 2 -y 240 -defaultsOSRD
preplace inst sys_concat_intc -pg 1 -lvl 1 -y 260 -defaultsOSRD
preplace inst irq_stub1 -pg 1 -lvl 2 -y 380 -defaultsOSRD
preplace inst irq_stub12 -pg 1 -lvl 2 -y 2280 -defaultsOSRD
preplace inst irq_stub2 -pg 1 -lvl 2 -y 540 -defaultsOSRD
preplace inst irq_stub13 -pg 1 -lvl 2 -y 2400 -defaultsOSRD
preplace inst irq_stub3 -pg 1 -lvl 2 -y 620 -defaultsOSRD
preplace inst sys_rstgen -pg 1 -lvl 2 -y 2590 -defaultsOSRD
preplace inst irq_stub4 -pg 1 -lvl 2 -y 1439 -defaultsOSRD
preplace inst axi_sg_interconnect -pg 1 -lvl 3 -y 1670 -defaultsOSRD
preplace inst irq_stub5 -pg 1 -lvl 2 -y 1569 -defaultsOSRD
preplace inst axi_ad9361_0_dac_dma_interconnect -pg 1 -lvl 4 -y 790 -defaultsOSRD
preplace inst irq_stub6 -pg 1 -lvl 2 -y 1669 -defaultsOSRD
preplace inst sys_ps7 -pg 1 -lvl 1 -y 1070 -defaultsOSRD
preplace inst irq_stub7 -pg 1 -lvl 2 -y 1769 -defaultsOSRD
preplace inst axi_cpu_interconnect -pg 1 -lvl 4 -y 1670 -defaultsOSRD
preplace inst util_dac_unpack_0 -pg 1 -lvl 4 -y 2760 -defaultsOSRD
preplace inst util_adc_pack_0 -pg 1 -lvl 4 -y 1290 -defaultsOSRD
preplace inst irq_stub8 -pg 1 -lvl 2 -y 1899 -defaultsOSRD
preplace inst irq_stub9 -pg 1 -lvl 2 -y 2019 -defaultsOSRD
preplace netloc axi_eridan_0_dac_enable_i1 1 3 1 2200
preplace netloc spi_mosi_i_1 1 0 2 NJ 560 940
preplace netloc axi_ad9361_0_adc_dma_interconnect_M00_AXI 1 0 5 420 510 NJ 10 NJ 10 NJ 10 2950
preplace netloc sys_ps7_GPIO_O 1 1 8 N 890 NJ 890 NJ 910 NJ 910 NJ 910 NJ 910 NJ 910 NJ
preplace netloc axi_eridan_0_dac_valid_i0 1 3 1 2260
preplace netloc axi_dma_0_mm2s_introut 1 0 5 360 1720 NJ 1720 NJ 1920 NJ 1920 2900
preplace netloc irq_stub8_dout 1 0 3 270 1830 NJ 1830 1480
preplace netloc axi_eridan_0_adc_data_i0 1 3 1 2460
preplace netloc sys_ps7_FCLK_CLK1 1 1 2 1010 330 NJ
preplace netloc irq_stub9_dout 1 0 3 230 1950 NJ 1950 1500
preplace netloc axi_eridan_0_adc_data_i1 1 3 1 2380
preplace netloc axi_ad9361_0_rx_clk_in_n 1 0 3 NJ 20 NJ 30 1510
preplace netloc sys_100m_clk 1 0 4 410 1370 970 1250 1600 770 2420
preplace netloc axi_eridan_0_dac_valid_i1 1 3 1 2180
preplace netloc sys_ps7_ddr 1 1 8 N 930 NJ 930 NJ 930 NJ 930 NJ 930 NJ 930 NJ 930 NJ
preplace netloc axi_eridan_0_tx_data_out_n 1 3 6 2500 320 NJ 260 NJ 260 NJ 260 NJ 260 NJ
preplace netloc axi_ad9361_0_rx_clk_in_p 1 0 3 NJ 10 NJ 40 1620
preplace netloc sys_ps7_GPIO_T 1 1 8 N 910 NJ 910 NJ 350 NJ 120 NJ 120 NJ 120 NJ 120 NJ
preplace netloc axi_eridan_0_tx_data_out_p 1 3 6 2520 300 NJ 280 NJ 280 NJ 280 NJ 280 NJ
preplace netloc axi_eridan_0_tx_clk_out_n 1 3 6 2410 290 NJ 220 NJ 220 NJ 220 NJ 220 NJ
preplace netloc axi_ad9361_0_dac_dma_interconnect_M00_AXI 1 0 5 390 490 NJ 20 NJ 20 NJ 20 2940
preplace netloc sys_100m_resetn 1 1 3 1060 680 1580 780 2440
preplace netloc fifo_data_0 1 2 2 1560 30 NJ
preplace netloc axi_eridan_0_dac_valid_q0 1 3 1 2210
preplace netloc axi_eridan_0_tx_clk_out_p 1 3 6 2530 310 NJ 240 NJ 240 NJ 240 NJ 240 NJ
preplace netloc axis_dac_interconnect_0_M00_AXIS 1 1 3 1030 1390 NJ 1390 2130
preplace netloc axi_dma_0_M_AXI_SG 1 2 3 1670 1470 NJ 1470 2930
preplace netloc axi_eridan_0_dac_enable_q0 1 3 1 2240
preplace netloc axi_eridan_0_dac_valid_q1 1 3 1 2160
preplace netloc axi_eridan_0_dac_enable_q1 1 3 1 2170
preplace netloc axi_ad9361_0_dac_drd 1 1 4 1040 1490 NJ 1460 NJ 1460 3010
preplace netloc irq_stub1_dout 1 0 3 320 480 NJ 480 1490
preplace netloc sys_ps7_fixed_io 1 1 8 N 950 NJ 950 NJ 30 NJ 30 NJ 30 NJ 30 NJ 30 NJ
preplace netloc sys_ps7_SPI0_SS1_O 1 1 8 1020 1100 NJ 1100 NJ 1100 NJ 1100 NJ 1100 NJ 1100 NJ 1100 NJ
preplace netloc axi_cpu_interconnect_s00_axi 1 1 3 NJ 1170 NJ 1170 2250
preplace netloc axi_dma_0_M_AXIS_MM2S 1 2 3 1670 2320 NJ 2320 2890
preplace netloc spi_sclk_i_1 1 0 2 NJ 570 930
preplace netloc irq_stub7_dout 1 0 3 310 1500 NJ 1500 1510
preplace netloc irq_stub4_dout 1 0 3 350 690 NJ 690 1480
preplace netloc axi_cpu_interconnect_m04_axi 1 3 2 2570 1930 2910
preplace netloc sys_ps7_SPI0_MOSI_O 1 1 8 990 1040 NJ 1040 NJ 360 NJ 180 NJ 180 NJ 180 NJ 180 NJ
preplace netloc irq_stub6_dout 1 0 3 280 1520 NJ 1520 1490
preplace netloc axi_dma_0_M_AXI_MM2S 1 3 2 2570 920 2960
preplace netloc irq_stub13_dout 1 0 3 300 1850 NJ 1850 1510
preplace netloc irq_stub2_dout 1 0 3 390 470 NJ 470 1480
preplace netloc axi_eridan_0_adc_data_q0 1 3 1 2400
preplace netloc axi_dma_0_M_AXI_S2MM 1 3 2 2570 450 2990
preplace netloc axi_eridan_0_adc_data_q1 1 3 1 2330
preplace netloc axi_cpu_interconnect_M00_AXI 1 2 3 1640 1090 NJ 1090 2890
preplace netloc axi_cpu_interconnect_m03_axi 1 3 2 2550 370 3000
preplace netloc util_adc_pack_0_dsync 1 3 2 2570 390 2920
preplace netloc util_adc_pack_0_ddata 1 3 2 2560 380 2910
preplace netloc axis_adc_interconnect_0_M00_AXIS 1 3 1 2190
preplace netloc axi_sg_interconnect_M00_AXI 1 0 4 380 1380 NJ 1380 NJ 1380 2140
preplace netloc irq_stub3_dout 1 0 3 340 670 NJ 670 1480
preplace netloc spi_csn_0_i_1 1 0 2 NJ 520 980
preplace netloc axi_ad9361_0_dac_dunf 1 2 1 1560
preplace netloc fifo_valid_0 1 2 2 1570 760 NJ
preplace netloc sys_concat_intc_dout 1 0 2 400 580 960
preplace netloc irq_stub12_dout 1 0 3 290 1840 NJ 1840 1520
preplace netloc sys_aux_reset 1 1 1 930
preplace netloc axi_eridan_0_tx_frame_out_n 1 3 6 2510 340 NJ 340 NJ 340 NJ 340 NJ 340 NJ
preplace netloc irq_stub10_dout 1 0 3 240 1960 NJ 1960 1490
preplace netloc axi_eridan_0_adc_valid_i0 1 3 1 2480
preplace netloc axi_eridan_0_tx_frame_out_p 1 3 6 2430 330 NJ 330 NJ 330 NJ 330 NJ 330 NJ
preplace netloc axi_eridan_0_adc_valid_i1 1 3 1 2390
preplace netloc irq_stub11_dout 1 0 3 250 1970 NJ 1970 1480
preplace netloc sys_fmc_dma_clk 1 0 4 420 1360 940 1360 1560 1360 2470
preplace netloc util_adc_pack_0_dvalid 1 3 2 2540 410 2900
preplace netloc irq_stub0_dout 1 0 3 330 460 NJ 460 1510
preplace netloc axi_ad9361_0_dac_data_0 1 2 3 1620 1860 NJ 1870 2950
preplace netloc axi_ad9361_0_dac_data_1 1 2 3 1610 1910 NJ 1910 2940
preplace netloc axi_ad9361_0_rx_data_in_n 1 0 3 NJ 30 NJ 300 N
preplace netloc irq_stub5_dout 1 0 3 260 1620 NJ 1620 1480
preplace netloc axi_eridan_0_adc_enable_i0 1 3 1 2490
preplace netloc axi_ad9361_0_dac_data_2 1 2 3 1650 1880 NJ 1880 2980
preplace netloc axi_ad9361_0_clk 1 1 3 1050 320 1540 750 2290
preplace netloc axi_eridan_0_adc_enable_i1 1 3 1 2300
preplace netloc axi_ad9361_0_dac_data_3 1 2 3 1660 1890 NJ 1890 2970
preplace netloc axi_ad9361_0_rx_data_in_p 1 0 3 NJ 40 NJ 310 1620
preplace netloc spi_miso_i_1 1 0 2 NJ 550 970
preplace netloc axi_ad9361_0_rx_frame_in_n 1 0 3 NJ 60 NJ 290 1540
preplace netloc sys_ps7_SPI0_SS_O 1 1 8 N 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ 1110 NJ
preplace netloc sys_ps7_SPI0_SCLK_O 1 1 8 N 1010 NJ 1010 NJ 1010 NJ 1010 NJ 1010 NJ 1010 NJ 1010 NJ
preplace netloc axi_eridan_0_adc_valid_q0 1 3 1 2410
preplace netloc axi_eridan_0_adc_enable_q0 1 3 1 2450
preplace netloc axi_dma_0_s2mm_introut 1 0 5 370 1820 NJ 1820 NJ 1820 NJ 1900 2920
preplace netloc axi_eridan_0_adc_valid_q1 1 3 1 2350
preplace netloc axi_ad9361_0_rx_frame_in_p 1 0 3 NJ 50 NJ 50 1610
preplace netloc axi_eridan_0_adc_enable_q1 1 3 1 2360
preplace netloc S00_AXIS_1 1 2 3 1630 1050 NJ 1050 2930
preplace netloc axi_eridan_0_dac_enable_i0 1 3 1 2270
preplace netloc GPIO_I_1 1 0 2 NJ 500 950
levelinfo -pg 1 160 710 1320 1970 2730 3080 3150 3200 3310 3460 -top 0 -bot 2910
",
}

  # Restore current instance
  current_bd_instance $oldCurInst

  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


