
# USING FMC  - LPC slot (ZC706)

# AD9361_0
set_property -dict {PACKAGE_PIN AE13 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports rx_clk_in_0_p]
set_property -dict {PACKAGE_PIN AF13 IOSTANDARD LVDS_25 DIFF_TERM 1} [get_ports rx_clk_in_0_n]

set_property -dict {PACKAGE_PIN AD14 IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_p]
set_property -dict {PACKAGE_PIN AD13 IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_n]

set_property -dict {PACKAGE_PIN AH14 IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_p]
set_property -dict {PACKAGE_PIN AH13 IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_n]

set_property -dict {PACKAGE_PIN AC14 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[0]}]
set_property -dict {PACKAGE_PIN AC13 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[0]}]
set_property -dict {PACKAGE_PIN AJ16 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[1]}]
set_property -dict {PACKAGE_PIN AK16 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[1]}]
set_property -dict {PACKAGE_PIN AD16 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[2]}]
set_property -dict {PACKAGE_PIN AD15 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[2]}]
set_property -dict {PACKAGE_PIN AH17 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[3]}]
set_property -dict {PACKAGE_PIN AH16 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[3]}]
set_property -dict {PACKAGE_PIN AF18 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[4]}]
set_property -dict {PACKAGE_PIN AF17 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[4]}]
set_property -dict {PACKAGE_PIN AB15 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_p[5]}]
set_property -dict {PACKAGE_PIN AB14 IOSTANDARD LVDS_25} [get_ports {tx_data_out_0_n[5]}]
#set_property  -dict {PACKAGE_PIN AD25  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[6]]                  ; ## LA28_P
#set_property  -dict {PACKAGE_PIN AE26  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[6]]                  ; ## LA28_N
#set_property  -dict {PACKAGE_PIN Y30   IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[7]]                  ; ## LA33_P
#set_property  -dict {PACKAGE_PIN AA30  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[7]]                  ; ## LA33_N


set_property -dict {PACKAGE_PIN AE27 IOSTANDARD LVCMOS25} [get_ports gpio_sync]
set_property -dict {PACKAGE_PIN AF27 IOSTANDARD LVCMOS25} [get_ports gpio_resetb]
set_property -dict {PACKAGE_PIN AE18 IOSTANDARD LVCMOS25} [get_ports gpio_enable]
set_property -dict {PACKAGE_PIN AE17 IOSTANDARD LVCMOS25} [get_ports gpio_txnrx]

set_property -dict {PACKAGE_PIN AH26 IOSTANDARD LVCMOS25} [get_ports {gpio_status[0]}]
set_property -dict {PACKAGE_PIN AH27 IOSTANDARD LVCMOS25} [get_ports {gpio_status[1]}]
set_property -dict {PACKAGE_PIN AG26 IOSTANDARD LVCMOS25} [get_ports {gpio_status[2]}]
set_property -dict {PACKAGE_PIN AG27 IOSTANDARD LVCMOS25} [get_ports {gpio_status[3]}]
set_property -dict {PACKAGE_PIN AH28 IOSTANDARD LVCMOS25} [get_ports {gpio_status[4]}]
set_property -dict {PACKAGE_PIN AH29 IOSTANDARD LVCMOS25} [get_ports {gpio_status[5]}]
set_property -dict {PACKAGE_PIN AK27 IOSTANDARD LVCMOS25} [get_ports {gpio_status[6]}]
set_property -dict {PACKAGE_PIN AK28 IOSTANDARD LVCMOS25} [get_ports {gpio_status[7]}]
set_property -dict {PACKAGE_PIN AJ26 IOSTANDARD LVCMOS25} [get_ports {gpio_ctl[0]}]
set_property -dict {PACKAGE_PIN AK26 IOSTANDARD LVCMOS25} [get_ports {gpio_ctl[1]}]
set_property -dict {PACKAGE_PIN AF30 IOSTANDARD LVCMOS25} [get_ports {gpio_ctl[2]}]
set_property -dict {PACKAGE_PIN AG30 IOSTANDARD LVCMOS25} [get_ports {gpio_ctl[3]}]


## SPI
set_property PACKAGE_PIN AC29 [get_ports spi_miso]
set_property IOSTANDARD LVCMOS25 [get_ports spi_miso]
set_property PULLUP true [get_ports spi_miso]
set_property PACKAGE_PIN AD29 [get_ports spi_mosi]
set_property IOSTANDARD LVCMOS25 [get_ports spi_mosi]
set_property PULLUP true [get_ports spi_mosi]
set_property PACKAGE_PIN AB30 [get_ports spi_clk]
set_property IOSTANDARD LVCMOS25 [get_ports spi_clk]
set_property PULLUP true [get_ports spi_clk]
set_property PACKAGE_PIN AF25 [get_ports spi_csn_0]
set_property IOSTANDARD LVCMOS25 [get_ports spi_csn_0]
set_property PULLUP true [get_ports spi_csn_0]
set_property PACKAGE_PIN AE25 [get_ports spi_csn_1]
set_property IOSTANDARD LVCMOS25 [get_ports spi_csn_1]
set_property PULLUP true [get_ports spi_csn_1]





# clocks
create_clock -period 5.000 -name rx_clk_0 [get_ports rx_clk_in_0_p]
create_clock -period 5.000 -name ad9361_0_clk [get_pins i_system_wrapper/system_i/axi_eridan_0/clk]
#create_clock -name rx_clk_0     -period  4 [get_ports rx_clk_in_0_p]
#create_clock -name ad9361_0_clk   -period  4 [get_pins i_system_wrapper/system_i/axi_ad9361_0/clk]
create_clock -period 4.000 -name fmc_dma_clk [get_pins i_system_wrapper/system_i/sys_ps7/FCLK_CLK2]

set_clock_groups -asynchronous -group ad9361_0_clk
set_clock_groups -asynchronous -group fmc_dma_clk
set_clock_groups -asynchronous -group rx_clk_0


