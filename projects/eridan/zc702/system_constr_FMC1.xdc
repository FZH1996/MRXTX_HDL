 
# USING FMC1 SLOT

# AD9361_0
set_property  -dict {PACKAGE_PIN K19  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_p]        ; ## LA00_P_CC
set_property  -dict {PACKAGE_PIN K20  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_n]        ; ## LA00_N_CC

set_property  -dict {PACKAGE_PIN J21  IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_p]                      ; ## LA08_P      
set_property  -dict {PACKAGE_PIN J22  IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_n]                      ; ## LA08_N         

set_property  -dict {PACKAGE_PIN M15  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_p]                    ; ## LA09_P
set_property  -dict {PACKAGE_PIN M16  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_n]                    ; ## LA09_N      

set_property  -dict {PACKAGE_PIN L17  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[0]]                  ; ## LA10_P
set_property  -dict {PACKAGE_PIN M17  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[0]]                  ; ## LA10_N
set_property  -dict {PACKAGE_PIN R20  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[1]]                  ; ## LA11_P
set_property  -dict {PACKAGE_PIN R21  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[1]]                  ; ## LA11_N
set_property  -dict {PACKAGE_PIN N22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[2]]                  ; ## LA12_P
set_property  -dict {PACKAGE_PIN P22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[2]]                  ; ## LA12_N
set_property  -dict {PACKAGE_PIN P16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[3]]                  ; ## LA13_P
set_property  -dict {PACKAGE_PIN R16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[3]]                  ; ## LA13_N
set_property  -dict {PACKAGE_PIN J16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[4]]                  ; ## LA14_P
set_property  -dict {PACKAGE_PIN J17  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[4]]                  ; ## LA14_N
set_property  -dict {PACKAGE_PIN P20  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[5]]                  ; ## LA15_P 
set_property  -dict {PACKAGE_PIN P21  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[5]]                  ; ## LA15_N
#set_property  -dict {PACKAGE_PIN D22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[6]]                  ; ## LA28_P
#set_property  -dict {PACKAGE_PIN C22  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[6]]                  ; ## LA28_N
#set_property  -dict {PACKAGE_PIN A18  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[7]]                  ; ## LA33_P        
#set_property  -dict {PACKAGE_PIN A19  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[7]]                  ; ## LA33_N


set_property  -dict {PACKAGE_PIN D20  IOSTANDARD LVCMOS25} [get_ports gpio_sync]                 ; ## LA18_P_CC (ZC_SYNC_IN)   
set_property  -dict {PACKAGE_PIN C20  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]               ; ## LA18_N_CC (ZC_RESET)   
set_property  -dict {PACKAGE_PIN N15  IOSTANDARD LVCMOS25} [get_ports gpio_enable]               ; ## LA16_P (ZC_ENABLE)        
set_property  -dict {PACKAGE_PIN P15  IOSTANDARD LVCMOS25} [get_ports gpio_txnrx]                ; ## LA16_N (ZC_TXNRX)   

set_property  -dict {PACKAGE_PIN E19  IOSTANDARD LVCMOS25} [get_ports gpio_status[0]]            ; ## LA19_P (ZC_CTRL_OUT0)   
set_property  -dict {PACKAGE_PIN E20  IOSTANDARD LVCMOS25} [get_ports gpio_status[1]]            ; ## LA19_N (ZC_CTRL_OUT1)   
set_property  -dict {PACKAGE_PIN G20  IOSTANDARD LVCMOS25} [get_ports gpio_status[2]]            ; ## LA20_P (ZC_CTRL_OUT2)   
set_property  -dict {PACKAGE_PIN G21  IOSTANDARD LVCMOS25} [get_ports gpio_status[3]]            ; ## LA20_N (ZC_CTRL_OUT3)   
set_property  -dict {PACKAGE_PIN F21  IOSTANDARD LVCMOS25} [get_ports gpio_status[4]]            ; ## LA21_P (ZC_CTRL_OUT4)   
set_property  -dict {PACKAGE_PIN F22  IOSTANDARD LVCMOS25} [get_ports gpio_status[5]]            ; ## LA21_N (ZC_CTRL_OUT5)   
set_property  -dict {PACKAGE_PIN G17  IOSTANDARD LVCMOS25} [get_ports gpio_status[6]]            ; ## LA22_P (ZC_CTRL_OUT6)   
set_property  -dict {PACKAGE_PIN F17  IOSTANDARD LVCMOS25} [get_ports gpio_status[7]]            ; ## LA22_N (ZC_CTRL_OUT7)   
set_property  -dict {PACKAGE_PIN G15  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[0]]               ; ## LA23_P (ZC_CTRL_IN0)   
set_property  -dict {PACKAGE_PIN G16  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[1]]               ; ## LA23_N (ZC_CTRL_IN1)   
set_property  -dict {PACKAGE_PIN A21  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[2]]               ; ## LA24_P (ZC_CTRL_IN2)   
set_property  -dict {PACKAGE_PIN A22  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[3]]               ; ## LA24_N (ZC_CTRL_IN3)   


## SPI
set_property  -dict {PACKAGE_PIN A16   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_miso] ; ## LA31_P (ZC_SPI_DI)       
set_property  -dict {PACKAGE_PIN A17   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_mosi] ; ## LA31_N (ZC_SPI_DO)     
set_property  -dict {PACKAGE_PIN D21   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_clk] ;  ## LA30_N (ZC_SPI_CLK)
set_property  -dict {PACKAGE_PIN B17   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_0] ; ## LA29_N (ZC_SPI_EN_B)
set_property  -dict {PACKAGE_PIN B16   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_1] ; ## LA29_P (ZC_SPI_EN_A)        


   


# clocks
create_clock -name rx_clk_0     -period  5 [get_ports rx_clk_in_0_p]
create_clock -name ad9361_0_clk   -period  5 [get_pins i_system_wrapper/system_i/axi_eridan_0/clk]
#create_clock -name rx_clk_0     -period  4 [get_ports rx_clk_in_0_p]
#create_clock -name ad9361_0_clk   -period  4 [get_pins i_system_wrapper/system_i/axi_ad9361_0/clk]
create_clock -name fmc_dma_clk  -period  6.00 [get_pins i_system_wrapper/system_i/sys_ps7/FCLK_CLK2]

set_clock_groups -asynchronous -group {ad9361_0_clk}
set_clock_groups -asynchronous -group {fmc_dma_clk}
set_clock_groups -asynchronous -group {rx_clk_0}

