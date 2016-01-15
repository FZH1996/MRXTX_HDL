 
# USING FMC  - LPC slot (ZC706)
# pins remapped to work with FMCOMMS2 board

# AD9361_0
set_property  -dict {PACKAGE_PIN AE13  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_p]        ; ## LA00_P_CC
set_property  -dict {PACKAGE_PIN AF13  IOSTANDARD LVDS_25 DIFF_TERM TRUE} [get_ports rx_clk_in_0_n]        ; ## LA00_N_CC

set_property  -dict {PACKAGE_PIN AD14  IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_p]                      ; ## LA08_P      
set_property  -dict {PACKAGE_PIN AD13  IOSTANDARD LVDS_25} [get_ports tx_clk_out_0_n]                      ; ## LA08_N         

set_property  -dict {PACKAGE_PIN AH14  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_p]                    ; ## LA09_P
set_property  -dict {PACKAGE_PIN AH13  IOSTANDARD LVDS_25} [get_ports tx_frame_out_0_n]                    ; ## LA09_N      

set_property  -dict {PACKAGE_PIN AJ16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[0]]                  ; ## LA11_P
set_property  -dict {PACKAGE_PIN AK16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[0]]                  ; ## LA11_N
set_property  -dict {PACKAGE_PIN AD16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[1]]                  ; ## LA12_P
set_property  -dict {PACKAGE_PIN AD15  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[1]]                  ; ## LA12_N
set_property  -dict {PACKAGE_PIN AH17  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[2]]                  ; ## LA13_P
set_property  -dict {PACKAGE_PIN AH16  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[2]]                  ; ## LA13_N
set_property  -dict {PACKAGE_PIN AC14  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[3]]                  ; ## LA10_P
set_property  -dict {PACKAGE_PIN AC13  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[3]]                  ; ## LA10_N
set_property  -dict {PACKAGE_PIN AF18  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[4]]                  ; ## LA14_P
set_property  -dict {PACKAGE_PIN AF17  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[4]]                  ; ## LA14_N
set_property  -dict {PACKAGE_PIN AB15  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[5]]                  ; ## LA15_P 
set_property  -dict {PACKAGE_PIN AB14  IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[5]]                  ; ## LA15_N

#set_property  -dict {PACKAGE_PIN   IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[6]]                  ; ## 
#set_property  -dict {PACKAGE_PIN   IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[6]]                  ; ## 
#set_property  -dict {PACKAGE_PIN    IOSTANDARD LVDS_25} [get_ports tx_data_out_0_p[7]]                  ; ##         
#set_property  -dict {PACKAGE_PIN   IOSTANDARD LVDS_25} [get_ports tx_data_out_0_n[7]]                  ; ## 


set_property  -dict {PACKAGE_PIN Y26  IOSTANDARD LVCMOS25} [get_ports gpio_sync]                 ; ## LA32_P (SYNC not used)  
set_property  -dict {PACKAGE_PIN AD25  IOSTANDARD LVCMOS25} [get_ports gpio_resetb]               ; ## LA28_P (ZC_RESET)   
set_property  -dict {PACKAGE_PIN AE18  IOSTANDARD LVCMOS25} [get_ports gpio_enable]               ; ## LA16_P (ZC_ENABLE)        
set_property  -dict {PACKAGE_PIN AE17  IOSTANDARD LVCMOS25} [get_ports gpio_txnrx]                ; ## LA16_N (ZC_TXNRX)   

set_property  -dict {PACKAGE_PIN AG26  IOSTANDARD LVCMOS25} [get_ports gpio_status[0]]            ; ## LA20_P (ZC_CTRL_OUT0)   
set_property  -dict {PACKAGE_PIN AG27  IOSTANDARD LVCMOS25} [get_ports gpio_status[1]]            ; ## LA20_N (ZC_CTRL_OUT1)   
set_property  -dict {PACKAGE_PIN AH28  IOSTANDARD LVCMOS25} [get_ports gpio_status[2]]            ; ## LA21_P (ZC_CTRL_OUT2)   
set_property  -dict {PACKAGE_PIN AH29  IOSTANDARD LVCMOS25} [get_ports gpio_status[3]]            ; ## LA21_N (ZC_CTRL_OUT3)   
set_property  -dict {PACKAGE_PIN AK27  IOSTANDARD LVCMOS25} [get_ports gpio_status[4]]            ; ## LA22_P (ZC_CTRL_OUT4)   
set_property  -dict {PACKAGE_PIN AK28  IOSTANDARD LVCMOS25} [get_ports gpio_status[5]]            ; ## LA22_N (ZC_CTRL_OUT5)   
set_property  -dict {PACKAGE_PIN AJ26  IOSTANDARD LVCMOS25} [get_ports gpio_status[6]]            ; ## LA23_P (ZC_CTRL_OUT6)   
set_property  -dict {PACKAGE_PIN AK26  IOSTANDARD LVCMOS25} [get_ports gpio_status[7]]            ; ## LA23_N (ZC_CTRL_OUT7)   
set_property  -dict {PACKAGE_PIN AF30  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[0]]               ; ## LA24_P (ZC_CTRL_IN0)   
set_property  -dict {PACKAGE_PIN AG30  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[1]]               ; ## LA24_N (ZC_CTRL_IN1)   
set_property  -dict {PACKAGE_PIN AF29  IOSTANDARD LVCMOS25} [get_ports gpio_ctl[2]]               ; ## LA25_P (ZC_CTRL_IN2)   
set_property  -dict {PACKAGE_PIN AG29 IOSTANDARD LVCMOS25} [get_ports gpio_ctl[3]]               ; ## LA25_N (ZC_CTRL_IN3)   


## SPI
set_property  -dict {PACKAGE_PIN AJ28   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_miso] ;  ## LA27_P (ZC_SPI_DI)       
set_property  -dict {PACKAGE_PIN AJ29   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_mosi] ;  ## LA27_N (ZC_SPI_DO)     
set_property  -dict {PACKAGE_PIN AK30   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_clk] ;   ## LA26_N (ZC_SPI_CLK)
set_property  -dict {PACKAGE_PIN AJ30   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_0] ; ## LA26_P (ZC_SPI_EN_B)
set_property  -dict {PACKAGE_PIN Y27   IOSTANDARD LVCMOS25  PULLTYPE PULLUP} [get_ports spi_csn_1] ; ## LA32_N (ZC_SPI_EN_A not used)        


   


# clocks
create_clock -name rx_clk_0     -period  5 [get_ports rx_clk_in_0_p]
create_clock -name ad9361_0_clk   -period  5 [get_pins i_system_wrapper/system_i/axi_eridan_0/clk]
#create_clock -name rx_clk_0     -period  4 [get_ports rx_clk_in_0_p]
#create_clock -name ad9361_0_clk   -period  4 [get_pins i_system_wrapper/system_i/axi_ad9361_0/clk]
create_clock -name fmc_dma_clk  -period  4.00 [get_pins i_system_wrapper/system_i/sys_ps7/FCLK_CLK2]

set_clock_groups -asynchronous -group {ad9361_0_clk}
set_clock_groups -asynchronous -group {fmc_dma_clk}
set_clock_groups -asynchronous -group {rx_clk_0}

