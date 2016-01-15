// ***************************************************************************
// ***************************************************************************
// Copyright 2011(c) Analog Devices, Inc.
// 
// All rights reserved.
// 
// Redistribution and use in source and binary forms, with or without modification,
// are permitted provided that the following conditions are met:
//     - Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
//     - Redistributions in binary form must reproduce the above copyright
//       notice, this list of conditions and the following disclaimer in
//       the documentation and/or other materials provided with the
//       distribution.
//     - Neither the name of Analog Devices, Inc. nor the names of its
//       contributors may be used to endorse or promote products derived
//       from this software without specific prior written permission.
//     - The use of this software may or may not infringe the patent rights
//       of one or more patent holders.  This license does not release you
//       from the requirement that you obtain separate licenses from these
//       patent holders to use this software.
//     - Use of the software either in source or binary form, must be run
//       on or directly connected to an Analog Devices Inc. component.
//    
// THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES,
// INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A
// PARTICULAR PURPOSE ARE DISCLAIMED.
//
// IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, INTELLECTUAL PROPERTY
// RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR 
// BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF 
// THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************
// ***************************************************************************

`timescale 1ns/100ps

module system_top (

  DDR_addr,
  DDR_ba,
  DDR_cas_n,
  DDR_ck_n,
  DDR_ck_p,
  DDR_cke,
  DDR_cs_n,
  DDR_dm,
  DDR_dq,
  DDR_dqs_n,
  DDR_dqs_p,
  DDR_odt,
  DDR_ras_n,
  DDR_reset_n,
  DDR_we_n,

  FIXED_IO_ddr_vrn,
  FIXED_IO_ddr_vrp,
  FIXED_IO_mio,
  FIXED_IO_ps_clk,
  FIXED_IO_ps_porb,
  FIXED_IO_ps_srstb,

  rx_clk_in_0_p,
  rx_clk_in_0_n,

  tx_clk_out_0_p,
  tx_clk_out_0_n,
  tx_frame_out_0_p,
  tx_frame_out_0_n,
  tx_data_out_0_p,
  tx_data_out_0_n,

  gpio_txnrx,
  gpio_enable,
  gpio_resetb,
  gpio_sync,
  gpio_ctl,
  gpio_status,
  
  spi_csn_0,
  spi_csn_1,
  spi_clk,
  spi_mosi,
  spi_miso);

  inout   [14:0]  DDR_addr;
  inout   [ 2:0]  DDR_ba;
  inout           DDR_cas_n;
  inout           DDR_ck_n;
  inout           DDR_ck_p;
  inout           DDR_cke;
  inout           DDR_cs_n;
  inout   [ 3:0]  DDR_dm;
  inout   [31:0]  DDR_dq;
  inout   [ 3:0]  DDR_dqs_n;
  inout   [ 3:0]  DDR_dqs_p;
  inout           DDR_odt;
  inout           DDR_ras_n;
  inout           DDR_reset_n;
  inout           DDR_we_n;

  inout           FIXED_IO_ddr_vrn;
  inout           FIXED_IO_ddr_vrp;
  inout   [53:0]  FIXED_IO_mio;
  inout           FIXED_IO_ps_clk;
  inout           FIXED_IO_ps_porb;
  inout           FIXED_IO_ps_srstb;

  input           rx_clk_in_0_p;
  input           rx_clk_in_0_n;

  output          tx_clk_out_0_p;
  output          tx_clk_out_0_n;
  output          tx_frame_out_0_p;
  output          tx_frame_out_0_n;
  output  [ 5:0]  tx_data_out_0_p;
  output  [ 5:0]  tx_data_out_0_n;

  inout           gpio_txnrx;
  inout           gpio_enable;
  inout           gpio_resetb;
  inout           gpio_sync;
  inout   [ 3:0]  gpio_ctl;
  inout   [ 7:0]  gpio_status;
  
  output          spi_csn_0;
  output          spi_csn_1;
  output          spi_clk;
  inout           spi_mosi;
  inout           spi_miso;

  // internal signals

  wire    [20:0]  gpio_i;
  wire    [20:0]  gpio_o;
  wire    [20:0]  gpio_t;

  // instantiations

  IOBUF i_iobuf_gpio_txnrx (
    .I (gpio_o[3]),
    .O (gpio_i[3]),
    .T (gpio_t[3]),
    .IO (gpio_txnrx));

  IOBUF i_iobuf_gpio_enable (
    .I (gpio_o[2]),
    .O (gpio_i[2]),
    .T (gpio_t[2]),
    .IO (gpio_enable));

  IOBUF i_iobuf_gpio_resetb (
    .I (gpio_o[1]),
    .O (gpio_i[1]),
    .T (gpio_t[1]),
    .IO (gpio_resetb));

  IOBUF i_iobuf_gpio_sync (
    .I (gpio_o[0]),
    .O (gpio_i[0]),
    .T (gpio_t[0]),
    .IO (gpio_sync));

  genvar n;
  generate
  for (n = 0; n <= 3; n = n + 1) begin: g_iobuf_gpio_ctl
  IOBUF i_iobuf_gpio_ctl (
    .I (gpio_o[12+n]),
    .O (gpio_i[12+n]),
    .T (gpio_t[12+n]),
    .IO (gpio_ctl[n]));
  end
  for (n = 0; n <= 7; n = n + 1) begin: g_iobuf_gpio_status
  IOBUF i_iobuf_gpio_status (
    .I (gpio_o[4+n]),
    .O (gpio_i[4+n]),
    .T (gpio_t[4+n]),
    .IO (gpio_status[n]));
  end
  endgenerate

  assign spi_csn_0 = gpio_o[16];
  assign spi_csn_1 = gpio_o[17];
  assign spi_clk   = gpio_o[18];
  
    IOBUF i_iobuf_spi_mosi (
    .I (gpio_o[19]),
    .O (gpio_i[19]),
    .T (gpio_t[19]),
    .IO (spi_mosi));

  IOBUF i_iobuf_spi_miso (
    .I (gpio_o[20]),
    .O (gpio_i[20]),
    .T (gpio_t[20]),
    .IO (spi_miso));
  

  system_wrapper i_system_wrapper (
    .DDR_addr (DDR_addr),
    .DDR_ba (DDR_ba),
    .DDR_cas_n (DDR_cas_n),
    .DDR_ck_n (DDR_ck_n),
    .DDR_ck_p (DDR_ck_p),
    .DDR_cke (DDR_cke),
    .DDR_cs_n (DDR_cs_n),
    .DDR_dm (DDR_dm),
    .DDR_dq (DDR_dq),
    .DDR_dqs_n (DDR_dqs_n),
    .DDR_dqs_p (DDR_dqs_p),
    .DDR_odt (DDR_odt),
    .DDR_ras_n (DDR_ras_n),
    .DDR_reset_n (DDR_reset_n),
    .DDR_we_n (DDR_we_n),
    .FIXED_IO_ddr_vrn (FIXED_IO_ddr_vrn),
    .FIXED_IO_ddr_vrp (FIXED_IO_ddr_vrp),
    .FIXED_IO_mio (FIXED_IO_mio),
    .FIXED_IO_ps_clk (FIXED_IO_ps_clk),
    .FIXED_IO_ps_porb (FIXED_IO_ps_porb),
    .FIXED_IO_ps_srstb (FIXED_IO_ps_srstb),
    .GPIO_I (gpio_i),
    .GPIO_O (gpio_o),
    .GPIO_T (gpio_t),
    .spi_csn_0_i (1'b1),
    .spi_csn_0_o (), //(spi_csn_0),    
    .spi_csn_1_o (), //(spi_csn_1),    
    .spi_miso_i (1'b0), //(spi_miso),
    .spi_mosi_i (1'b0),
    .spi_mosi_o (), //(spi_mosi),
    .spi_sclk_i (1'b0),
    .spi_sclk_o (), //(spi_clk),
    .rx_clk_in_0_n (rx_clk_in_0_n),
    .rx_clk_in_0_p (rx_clk_in_0_p),
    .tx_clk_out_0_n (tx_clk_out_0_n),
    .tx_clk_out_0_p (tx_clk_out_0_p),
    .tx_data_out_0_n (tx_data_out_0_n),
    .tx_data_out_0_p (tx_data_out_0_p),
    .tx_frame_out_0_n (tx_frame_out_0_n),
    .tx_frame_out_0_p (tx_frame_out_0_p));

endmodule

// ***************************************************************************
// ***************************************************************************
