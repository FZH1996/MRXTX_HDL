 
# USING FMC2 SLOT

# AD9361_0
set_property  -dict {PACKAGE_PIN Y19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_p]        ; ## LA00_P_CC
set_property  -dict {PACKAGE_PIN AA19 IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_n]        ; ## LA00_N_CC

set_property  -dict {PACKAGE_PIN AA17 IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_p]                      ; ## LA08_P      
set_property  -dict {PACKAGE_PIN AB17 IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_n]                      ; ## LA08_N         

set_property  -dict {PACKAGE_PIN U15  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_p]                    ; ## LA09_P
set_property  -dict {PACKAGE_PIN U16  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_n]                    ; ## LA09_N      

set_property  -dict {PACKAGE_PIN Y20  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[0]]                  ; ## LA10_P
set_property  -dict {PACKAGE_PIN Y21  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[0]]                  ; ## LA10_N
set_property  -dict {PACKAGE_PIN Y14  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[1]]                  ; ## LA11_P
set_property  -dict {PACKAGE_PIN AA14 IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[1]]                  ; ## LA11_N
set_property  -dict {PACKAGE_PIN W15  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[2]]                  ; ## LA12_P
set_property  -dict {PACKAGE_PIN Y15  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[2]]                  ; ## LA12_N
set_property  -dict {PACKAGE_PIN V22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[3]]                  ; ## LA13_P
set_property  -dict {PACKAGE_PIN W22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[3]]                  ; ## LA13_N
set_property  -dict {PACKAGE_PIN T22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[4]]                  ; ## LA14_P
set_property  -dict {PACKAGE_PIN U22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[4]]                  ; ## LA14_N
set_property  -dict {PACKAGE_PIN Y13  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[5]]                  ; ## LA15_P 
set_property  -dict {PACKAGE_PIN AA13 IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[5]]                  ; ## LA15_N
#set_property  -dict {PACKAGE_PIN AB5  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[6]]                  ; ## LA28_P
#set_property  -dict {PACKAGE_PIN AB4  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[6]]                  ; ## LA28_N
#set_property  -dict {PACKAGE_PIN Y11  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[7]]                  ; ## LA33_P        
#set_property  -dict {PACKAGE_PIN Y10  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[7]]                  ; ## LA33_N


set_property  -dict {PACKAGE_PIN AA9  IOSTANDARD LVCMOS25} [get_ports gpio_sync]         ; ## LA18_P_CC (ZC_SYNC_IN)   
set_property  -dict {PACKAGE_PIN AA8  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]       ; ## LA18_N_CC (ZC_RESET)   
set_property  -dict {PACKAGE_PIN AB14 IOSTANDARD LVCMOS25} [get_ports gpio_enable]       ; ## LA16_P (ZC_ENABLE)        
set_property  -dict {PACKAGE_PIN AB15 IOSTANDARD LVCMOS25} [get_ports gpio_txnrx]        ; ## LA16_N (ZC_TXNRX)   

set_property  -dict {PACKAGE_PIN R6   IOSTANDARD LVCMOS25} [get_ports gpio_status[0]]    ; ## LA19_P (ZC_CTRL_OUT0)   
set_property  -dict {PACKAGE_PIN T6   IOSTANDARD LVCMOS25} [get_ports gpio_status[1]]    ; ## LA19_N (ZC_CTRL_OUT1)   
set_property  -dict {PACKAGE_PIN T4   IOSTANDARD LVCMOS25} [get_ports gpio_status[2]]    ; ## LA20_P (ZC_CTRL_OUT2)   
set_property  -dict {PACKAGE_PIN U4   IOSTANDARD LVCMOS25} [get_ports gpio_status[3]]    ; ## LA20_N (ZC_CTRL_OUT3)   
set_property  -dict {PACKAGE_PIN V5   IOSTANDARD LVCMOS25} [get_ports gpio_status[4]]    ; ## LA21_P (ZC_CTRL_OUT4)   
set_property  -dict {PACKAGE_PIN V4   IOSTANDARD LVCMOS25} [get_ports gpio_status[5]]    ; ## LA21_N (ZC_CTRL_OUT5)   
set_property  -dict {PACKAGE_PIN U10  IOSTANDARD LVCMOS25} [get_ports gpio_status[6]]    ; ## LA22_P (ZC_CTRL_OUT6)   
set_property  -dict {PACKAGE_PIN U9   IOSTANDARD LVCMOS25} [get_ports gpio_status[7]]    ; ## LA22_N (ZC_CTRL_OUT7)   
set_property  -dict {PACKAGE_PIN V12  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[0]]       ; ## LA23_P (ZC_CTRL_IN0)   
set_property  -dict {PACKAGE_PIN W12  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[1]]       ; ## LA23_N (ZC_CTRL_IN1)   
set_property  -dict {PACKAGE_PIN U6   IOSTANDARD LVCMOS25} [get_ports gpio_ctl[2]]       ; ## LA24_P (ZC_CTRL_IN2)   
set_property  -dict {PACKAGE_PIN U5   IOSTANDARD LVCMOS25} [get_ports gpio_ctl[3]]       ; ## LA24_N (ZC_CTRL_IN3)   



## SPI
set_property  -dict {PACKAGE_PIN AB10 IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_miso] ; ## LA31_P (ZC_SPI_DI)       
set_property  -dict {PACKAGE_PIN AB9  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_mosi] ; ## LA31_N (ZC_SPI_DO)     
set_property  -dict {PACKAGE_PIN AB6  IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_clk] ;  ## LA30_N (ZC_SPI_CLK)
set_property  -dict {PACKAGE_PIN AB11 IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_0] ; ## LA29_N (ZC_SPI_EN_B)
set_property  -dict {PACKAGE_PIN AA11 IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_1] ; ## LA29_P (ZC_SPI_EN_A)        


   


# clocks
create_clock -name rx_clk_0     -period  4 [get_ports rx_clk_in_0_p]
create_clock -name ad9361_0_clk   -period  4 [get_pins i_system_wrapper/system_i/axi_eridan_0/clk]
#create_clock -name rx_clk_0     -period  4 [get_ports rx_clk_in_0_p]
#create_clock -name ad9361_0_clk   -period  4 [get_pins i_system_wrapper/system_i/axi_ad9361_0/clk]
create_clock -name fmc_dma_clk  -period  4.00 [get_pins i_system_wrapper/system_i/sys_ps7/FCLK_CLK2]

set_clock_groups -asynchronous -group {ad9361_0_clk}
set_clock_groups -asynchronous -group {fmc_dma_clk}
set_clock_groups -asynchronous -group {rx_clk_0}

