-- Timing params:
--   Fixed?: True
--   Pipeline Slices: []
--   Input regs?: False
--   Output regs?: False
library std;
use std.textio.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 118
entity pixel_deo_0CLK_45036e41 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end pixel_deo_0CLK_45036e41;
architecture arch of pixel_deo_0CLK_45036e41 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(3 downto 0) := to_unsigned(0, 4);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(3 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_auto_x : unsigned(0 downto 0);
signal REG_COMB_is_auto_y : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l164_c6_044b]
signal BIN_OP_EQ_uxn_device_h_l164_c6_044b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l164_c6_044b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l164_c2_e2c2]
signal color_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l164_c2_e2c2]
signal y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l164_c2_e2c2]
signal tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l164_c2_e2c2]
signal is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l164_c2_e2c2]
signal ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l164_c2_e2c2]
signal result_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l164_c2_e2c2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l164_c2_e2c2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l164_c2_e2c2_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l164_c2_e2c2]
signal flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l164_c2_e2c2]
signal is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l164_c2_e2c2]
signal flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l164_c2_e2c2]
signal layer_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l164_c2_e2c2]
signal ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l164_c2_e2c2]
signal auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l164_c2_e2c2]
signal x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c11_60dc]
signal BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l170_c7_8350]
signal color_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l170_c7_8350]
signal y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l170_c7_8350]
signal tmp8_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l170_c7_8350]
signal is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l170_c7_8350]
signal ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l170_c7_8350]
signal result_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l170_c7_8350_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l170_c7_8350_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l170_c7_8350_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l170_c7_8350]
signal flip_y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l170_c7_8350]
signal is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l170_c7_8350]
signal flip_x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l170_c7_8350]
signal layer_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l170_c7_8350]
signal ctrl_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l170_c7_8350]
signal auto_advance_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l170_c7_8350]
signal x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_d6bf]
signal BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l173_c7_654a]
signal color_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l173_c7_654a]
signal y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l173_c7_654a]
signal tmp8_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l173_c7_654a]
signal is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l173_c7_654a]
signal ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l173_c7_654a]
signal result_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l173_c7_654a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l173_c7_654a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l173_c7_654a_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l173_c7_654a]
signal flip_y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l173_c7_654a]
signal is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l173_c7_654a]
signal flip_x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l173_c7_654a]
signal layer_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l173_c7_654a]
signal ctrl_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l173_c7_654a]
signal auto_advance_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l173_c7_654a]
signal x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l177_c11_52d7]
signal BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l177_c7_1212]
signal color_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(3 downto 0);

-- y_MUX[uxn_device_h_l177_c7_1212]
signal y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_device_h_l177_c7_1212]
signal tmp8_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l177_c7_1212]
signal is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l177_c7_1212]
signal ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l177_c7_1212]
signal result_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c7_1212_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_1212_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_1212_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l177_c7_1212]
signal flip_y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l177_c7_1212]
signal is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l177_c7_1212]
signal flip_x_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l177_c7_1212]
signal layer_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l177_c7_1212]
signal ctrl_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l177_c7_1212]
signal auto_advance_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_7f50]
signal BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l181_c7_49a2]
signal color_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(3 downto 0);

-- tmp8_MUX[uxn_device_h_l181_c7_49a2]
signal tmp8_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l181_c7_49a2]
signal is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l181_c7_49a2]
signal ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_49a2]
signal result_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_49a2_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_49a2_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_49a2_return_output : device_out_result_t;

-- flip_y_MUX[uxn_device_h_l181_c7_49a2]
signal flip_y_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l181_c7_49a2]
signal is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l181_c7_49a2]
signal flip_x_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l181_c7_49a2]
signal layer_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l181_c7_49a2]
signal ctrl_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l181_c7_49a2]
signal auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);

-- CONST_SR_7[uxn_device_h_l184_c25_f86e]
signal CONST_SR_7_uxn_device_h_l184_c25_f86e_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l185_c21_2891]
signal CONST_SR_6_uxn_device_h_l185_c21_2891_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l185_c21_2891_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l186_c22_ef4e]
signal CONST_SR_5_uxn_device_h_l186_c22_ef4e_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l187_c22_e140]
signal CONST_SR_4_uxn_device_h_l187_c22_e140_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l187_c22_e140_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l188_c10_0b0e]
signal BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_device_h_l190_c22_5377]
signal CONST_SL_8_uxn_device_h_l190_c22_5377_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l190_c22_5377_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l190_c22_11e9]
signal BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output : unsigned(16 downto 0);

-- tmp8_MUX[uxn_device_h_l193_c3_2bc6]
signal tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l193_c3_2bc6]
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l194_c12_f716]
signal MUX_uxn_device_h_l194_c12_f716_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l194_c12_f716_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l194_c12_f716_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l194_c12_f716_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l194_c4_b649]
signal BIN_OP_OR_uxn_device_h_l194_c4_b649_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l194_c4_b649_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l195_c12_aae7]
signal MUX_uxn_device_h_l195_c12_aae7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c12_aae7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l195_c12_aae7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l195_c12_aae7_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l195_c4_5b94]
signal BIN_OP_OR_uxn_device_h_l195_c4_5b94_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l195_c4_5b94_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l200_c11_f607]
signal BIN_OP_EQ_uxn_device_h_l200_c11_f607_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_f607_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l200_c7_219b]
signal is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l200_c7_219b]
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l200_c7_219b]
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l200_c7_219b]
signal result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l200_c7_219b]
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l200_c7_219b]
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l200_c7_219b]
signal result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(15 downto 0);

-- is_auto_y_MUX[uxn_device_h_l200_c7_219b]
signal is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l200_c7_219b]
signal auto_advance_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l207_c34_c53e]
signal BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l207_c44_84a0]
signal BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l207_c21_f51e]
signal MUX_uxn_device_h_l207_c21_f51e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l207_c21_f51e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l207_c21_f51e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l207_c21_f51e_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l208_c31_c8cd]
signal MUX_uxn_device_h_l208_c31_c8cd_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l208_c31_c8cd_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l208_c31_c8cd_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l208_c31_c8cd_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l209_c26_1037]
signal UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l211_c11_facf]
signal BIN_OP_EQ_uxn_device_h_l211_c11_facf_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_facf_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l211_c7_bc16]
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l211_c7_bc16]
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l211_c7_bc16]
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l211_c7_bc16]
signal result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l213_c32_687e]
signal BIN_OP_AND_uxn_device_h_l213_c32_687e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c32_687e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l215_c31_feaa]
signal BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output : unsigned(16 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output : unsigned(0 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_56ba( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_deo_done := ref_toks_4;

      return_output := base;
      return return_output; 
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_027a( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint4_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint1_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,1)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_88f7( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.device_ram_address := ref_toks_1;
      base.u16_addr := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function uint8_0_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(0- i);
      end loop;
return return_output;
end function;

function uint8_1_1( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(1- i);
      end loop;
return return_output;
end function;

function CAST_TO_uint8_t_uint17_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(16 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_device_ram_write := ref_toks_1;
      base.device_ram_address := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.u16_addr := ref_toks_6;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l164_c6_044b
BIN_OP_EQ_uxn_device_h_l164_c6_044b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l164_c6_044b_left,
BIN_OP_EQ_uxn_device_h_l164_c6_044b_right,
BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output);

-- color_MUX_uxn_device_h_l164_c2_e2c2
color_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l164_c2_e2c2_cond,
color_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
color_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
color_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- y_MUX_uxn_device_h_l164_c2_e2c2
y_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l164_c2_e2c2_cond,
y_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
y_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
y_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- tmp8_MUX_uxn_device_h_l164_c2_e2c2
tmp8_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond,
tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- is_auto_x_MUX_uxn_device_h_l164_c2_e2c2
is_auto_x_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond,
is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2
ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond,
ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- result_MUX_uxn_device_h_l164_c2_e2c2
result_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l164_c2_e2c2_cond,
result_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
result_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
result_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- flip_y_MUX_uxn_device_h_l164_c2_e2c2
flip_y_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond,
flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- is_auto_y_MUX_uxn_device_h_l164_c2_e2c2
is_auto_y_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond,
is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- flip_x_MUX_uxn_device_h_l164_c2_e2c2
flip_x_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond,
flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- layer_MUX_uxn_device_h_l164_c2_e2c2
layer_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l164_c2_e2c2_cond,
layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
layer_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- ctrl_MUX_uxn_device_h_l164_c2_e2c2
ctrl_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond,
ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- auto_advance_MUX_uxn_device_h_l164_c2_e2c2
auto_advance_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond,
auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- x_MUX_uxn_device_h_l164_c2_e2c2
x_MUX_uxn_device_h_l164_c2_e2c2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l164_c2_e2c2_cond,
x_MUX_uxn_device_h_l164_c2_e2c2_iftrue,
x_MUX_uxn_device_h_l164_c2_e2c2_iffalse,
x_MUX_uxn_device_h_l164_c2_e2c2_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c11_60dc
BIN_OP_EQ_uxn_device_h_l170_c11_60dc : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left,
BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right,
BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output);

-- color_MUX_uxn_device_h_l170_c7_8350
color_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l170_c7_8350_cond,
color_MUX_uxn_device_h_l170_c7_8350_iftrue,
color_MUX_uxn_device_h_l170_c7_8350_iffalse,
color_MUX_uxn_device_h_l170_c7_8350_return_output);

-- y_MUX_uxn_device_h_l170_c7_8350
y_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l170_c7_8350_cond,
y_MUX_uxn_device_h_l170_c7_8350_iftrue,
y_MUX_uxn_device_h_l170_c7_8350_iffalse,
y_MUX_uxn_device_h_l170_c7_8350_return_output);

-- tmp8_MUX_uxn_device_h_l170_c7_8350
tmp8_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l170_c7_8350_cond,
tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue,
tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse,
tmp8_MUX_uxn_device_h_l170_c7_8350_return_output);

-- is_auto_x_MUX_uxn_device_h_l170_c7_8350
is_auto_x_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond,
is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue,
is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse,
is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output);

-- ctrl_mode_MUX_uxn_device_h_l170_c7_8350
ctrl_mode_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond,
ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue,
ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse,
ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output);

-- result_MUX_uxn_device_h_l170_c7_8350
result_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l170_c7_8350_cond,
result_MUX_uxn_device_h_l170_c7_8350_iftrue,
result_MUX_uxn_device_h_l170_c7_8350_iffalse,
result_MUX_uxn_device_h_l170_c7_8350_return_output);

-- flip_y_MUX_uxn_device_h_l170_c7_8350
flip_y_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l170_c7_8350_cond,
flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue,
flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse,
flip_y_MUX_uxn_device_h_l170_c7_8350_return_output);

-- is_auto_y_MUX_uxn_device_h_l170_c7_8350
is_auto_y_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond,
is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue,
is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse,
is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output);

-- flip_x_MUX_uxn_device_h_l170_c7_8350
flip_x_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l170_c7_8350_cond,
flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue,
flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse,
flip_x_MUX_uxn_device_h_l170_c7_8350_return_output);

-- layer_MUX_uxn_device_h_l170_c7_8350
layer_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l170_c7_8350_cond,
layer_MUX_uxn_device_h_l170_c7_8350_iftrue,
layer_MUX_uxn_device_h_l170_c7_8350_iffalse,
layer_MUX_uxn_device_h_l170_c7_8350_return_output);

-- ctrl_MUX_uxn_device_h_l170_c7_8350
ctrl_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l170_c7_8350_cond,
ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue,
ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse,
ctrl_MUX_uxn_device_h_l170_c7_8350_return_output);

-- auto_advance_MUX_uxn_device_h_l170_c7_8350
auto_advance_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l170_c7_8350_cond,
auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue,
auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse,
auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output);

-- x_MUX_uxn_device_h_l170_c7_8350
x_MUX_uxn_device_h_l170_c7_8350 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l170_c7_8350_cond,
x_MUX_uxn_device_h_l170_c7_8350_iftrue,
x_MUX_uxn_device_h_l170_c7_8350_iffalse,
x_MUX_uxn_device_h_l170_c7_8350_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_d6bf
BIN_OP_EQ_uxn_device_h_l173_c11_d6bf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left,
BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right,
BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output);

-- color_MUX_uxn_device_h_l173_c7_654a
color_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l173_c7_654a_cond,
color_MUX_uxn_device_h_l173_c7_654a_iftrue,
color_MUX_uxn_device_h_l173_c7_654a_iffalse,
color_MUX_uxn_device_h_l173_c7_654a_return_output);

-- y_MUX_uxn_device_h_l173_c7_654a
y_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l173_c7_654a_cond,
y_MUX_uxn_device_h_l173_c7_654a_iftrue,
y_MUX_uxn_device_h_l173_c7_654a_iffalse,
y_MUX_uxn_device_h_l173_c7_654a_return_output);

-- tmp8_MUX_uxn_device_h_l173_c7_654a
tmp8_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l173_c7_654a_cond,
tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue,
tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse,
tmp8_MUX_uxn_device_h_l173_c7_654a_return_output);

-- is_auto_x_MUX_uxn_device_h_l173_c7_654a
is_auto_x_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond,
is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue,
is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse,
is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l173_c7_654a
ctrl_mode_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond,
ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue,
ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse,
ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output);

-- result_MUX_uxn_device_h_l173_c7_654a
result_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l173_c7_654a_cond,
result_MUX_uxn_device_h_l173_c7_654a_iftrue,
result_MUX_uxn_device_h_l173_c7_654a_iffalse,
result_MUX_uxn_device_h_l173_c7_654a_return_output);

-- flip_y_MUX_uxn_device_h_l173_c7_654a
flip_y_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l173_c7_654a_cond,
flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue,
flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse,
flip_y_MUX_uxn_device_h_l173_c7_654a_return_output);

-- is_auto_y_MUX_uxn_device_h_l173_c7_654a
is_auto_y_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond,
is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue,
is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse,
is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output);

-- flip_x_MUX_uxn_device_h_l173_c7_654a
flip_x_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l173_c7_654a_cond,
flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue,
flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse,
flip_x_MUX_uxn_device_h_l173_c7_654a_return_output);

-- layer_MUX_uxn_device_h_l173_c7_654a
layer_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l173_c7_654a_cond,
layer_MUX_uxn_device_h_l173_c7_654a_iftrue,
layer_MUX_uxn_device_h_l173_c7_654a_iffalse,
layer_MUX_uxn_device_h_l173_c7_654a_return_output);

-- ctrl_MUX_uxn_device_h_l173_c7_654a
ctrl_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l173_c7_654a_cond,
ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue,
ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse,
ctrl_MUX_uxn_device_h_l173_c7_654a_return_output);

-- auto_advance_MUX_uxn_device_h_l173_c7_654a
auto_advance_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l173_c7_654a_cond,
auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue,
auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse,
auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output);

-- x_MUX_uxn_device_h_l173_c7_654a
x_MUX_uxn_device_h_l173_c7_654a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l173_c7_654a_cond,
x_MUX_uxn_device_h_l173_c7_654a_iftrue,
x_MUX_uxn_device_h_l173_c7_654a_iffalse,
x_MUX_uxn_device_h_l173_c7_654a_return_output);

-- BIN_OP_EQ_uxn_device_h_l177_c11_52d7
BIN_OP_EQ_uxn_device_h_l177_c11_52d7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left,
BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right,
BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output);

-- color_MUX_uxn_device_h_l177_c7_1212
color_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l177_c7_1212_cond,
color_MUX_uxn_device_h_l177_c7_1212_iftrue,
color_MUX_uxn_device_h_l177_c7_1212_iffalse,
color_MUX_uxn_device_h_l177_c7_1212_return_output);

-- y_MUX_uxn_device_h_l177_c7_1212
y_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c7_1212_cond,
y_MUX_uxn_device_h_l177_c7_1212_iftrue,
y_MUX_uxn_device_h_l177_c7_1212_iffalse,
y_MUX_uxn_device_h_l177_c7_1212_return_output);

-- tmp8_MUX_uxn_device_h_l177_c7_1212
tmp8_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l177_c7_1212_cond,
tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue,
tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse,
tmp8_MUX_uxn_device_h_l177_c7_1212_return_output);

-- is_auto_x_MUX_uxn_device_h_l177_c7_1212
is_auto_x_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond,
is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue,
is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse,
is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output);

-- ctrl_mode_MUX_uxn_device_h_l177_c7_1212
ctrl_mode_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond,
ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue,
ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse,
ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output);

-- result_MUX_uxn_device_h_l177_c7_1212
result_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l177_c7_1212_cond,
result_MUX_uxn_device_h_l177_c7_1212_iftrue,
result_MUX_uxn_device_h_l177_c7_1212_iffalse,
result_MUX_uxn_device_h_l177_c7_1212_return_output);

-- flip_y_MUX_uxn_device_h_l177_c7_1212
flip_y_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l177_c7_1212_cond,
flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue,
flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse,
flip_y_MUX_uxn_device_h_l177_c7_1212_return_output);

-- is_auto_y_MUX_uxn_device_h_l177_c7_1212
is_auto_y_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond,
is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue,
is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse,
is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output);

-- flip_x_MUX_uxn_device_h_l177_c7_1212
flip_x_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l177_c7_1212_cond,
flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue,
flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse,
flip_x_MUX_uxn_device_h_l177_c7_1212_return_output);

-- layer_MUX_uxn_device_h_l177_c7_1212
layer_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l177_c7_1212_cond,
layer_MUX_uxn_device_h_l177_c7_1212_iftrue,
layer_MUX_uxn_device_h_l177_c7_1212_iffalse,
layer_MUX_uxn_device_h_l177_c7_1212_return_output);

-- ctrl_MUX_uxn_device_h_l177_c7_1212
ctrl_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l177_c7_1212_cond,
ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue,
ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse,
ctrl_MUX_uxn_device_h_l177_c7_1212_return_output);

-- auto_advance_MUX_uxn_device_h_l177_c7_1212
auto_advance_MUX_uxn_device_h_l177_c7_1212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l177_c7_1212_cond,
auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue,
auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse,
auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_7f50
BIN_OP_EQ_uxn_device_h_l181_c11_7f50 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left,
BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right,
BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output);

-- color_MUX_uxn_device_h_l181_c7_49a2
color_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l181_c7_49a2_cond,
color_MUX_uxn_device_h_l181_c7_49a2_iftrue,
color_MUX_uxn_device_h_l181_c7_49a2_iffalse,
color_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- tmp8_MUX_uxn_device_h_l181_c7_49a2
tmp8_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l181_c7_49a2_cond,
tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue,
tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse,
tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- is_auto_x_MUX_uxn_device_h_l181_c7_49a2
is_auto_x_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond,
is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue,
is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse,
is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- ctrl_mode_MUX_uxn_device_h_l181_c7_49a2
ctrl_mode_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond,
ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue,
ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse,
ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- result_MUX_uxn_device_h_l181_c7_49a2
result_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_49a2_cond,
result_MUX_uxn_device_h_l181_c7_49a2_iftrue,
result_MUX_uxn_device_h_l181_c7_49a2_iffalse,
result_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- flip_y_MUX_uxn_device_h_l181_c7_49a2
flip_y_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l181_c7_49a2_cond,
flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue,
flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse,
flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- is_auto_y_MUX_uxn_device_h_l181_c7_49a2
is_auto_y_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond,
is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue,
is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse,
is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- flip_x_MUX_uxn_device_h_l181_c7_49a2
flip_x_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l181_c7_49a2_cond,
flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue,
flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse,
flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- layer_MUX_uxn_device_h_l181_c7_49a2
layer_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l181_c7_49a2_cond,
layer_MUX_uxn_device_h_l181_c7_49a2_iftrue,
layer_MUX_uxn_device_h_l181_c7_49a2_iffalse,
layer_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- ctrl_MUX_uxn_device_h_l181_c7_49a2
ctrl_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l181_c7_49a2_cond,
ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue,
ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse,
ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- auto_advance_MUX_uxn_device_h_l181_c7_49a2
auto_advance_MUX_uxn_device_h_l181_c7_49a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond,
auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue,
auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse,
auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output);

-- CONST_SR_7_uxn_device_h_l184_c25_f86e
CONST_SR_7_uxn_device_h_l184_c25_f86e : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l184_c25_f86e_x,
CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output);

-- CONST_SR_6_uxn_device_h_l185_c21_2891
CONST_SR_6_uxn_device_h_l185_c21_2891 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l185_c21_2891_x,
CONST_SR_6_uxn_device_h_l185_c21_2891_return_output);

-- CONST_SR_5_uxn_device_h_l186_c22_ef4e
CONST_SR_5_uxn_device_h_l186_c22_ef4e : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l186_c22_ef4e_x,
CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output);

-- CONST_SR_4_uxn_device_h_l187_c22_e140
CONST_SR_4_uxn_device_h_l187_c22_e140 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l187_c22_e140_x,
CONST_SR_4_uxn_device_h_l187_c22_e140_return_output);

-- BIN_OP_AND_uxn_device_h_l188_c10_0b0e
BIN_OP_AND_uxn_device_h_l188_c10_0b0e : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left,
BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right,
BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output);

-- CONST_SL_8_uxn_device_h_l190_c22_5377
CONST_SL_8_uxn_device_h_l190_c22_5377 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l190_c22_5377_x,
CONST_SL_8_uxn_device_h_l190_c22_5377_return_output);

-- BIN_OP_PLUS_uxn_device_h_l190_c22_11e9
BIN_OP_PLUS_uxn_device_h_l190_c22_11e9 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left,
BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right,
BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output);

-- tmp8_MUX_uxn_device_h_l193_c3_2bc6
tmp8_MUX_uxn_device_h_l193_c3_2bc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond,
tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue,
tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse,
tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6
result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond,
result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output);

-- MUX_uxn_device_h_l194_c12_f716
MUX_uxn_device_h_l194_c12_f716 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l194_c12_f716_cond,
MUX_uxn_device_h_l194_c12_f716_iftrue,
MUX_uxn_device_h_l194_c12_f716_iffalse,
MUX_uxn_device_h_l194_c12_f716_return_output);

-- BIN_OP_OR_uxn_device_h_l194_c4_b649
BIN_OP_OR_uxn_device_h_l194_c4_b649 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l194_c4_b649_left,
BIN_OP_OR_uxn_device_h_l194_c4_b649_right,
BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output);

-- MUX_uxn_device_h_l195_c12_aae7
MUX_uxn_device_h_l195_c12_aae7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l195_c12_aae7_cond,
MUX_uxn_device_h_l195_c12_aae7_iftrue,
MUX_uxn_device_h_l195_c12_aae7_iffalse,
MUX_uxn_device_h_l195_c12_aae7_return_output);

-- BIN_OP_OR_uxn_device_h_l195_c4_5b94
BIN_OP_OR_uxn_device_h_l195_c4_5b94 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l195_c4_5b94_left,
BIN_OP_OR_uxn_device_h_l195_c4_5b94_right,
BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output);

-- BIN_OP_EQ_uxn_device_h_l200_c11_f607
BIN_OP_EQ_uxn_device_h_l200_c11_f607 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l200_c11_f607_left,
BIN_OP_EQ_uxn_device_h_l200_c11_f607_right,
BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output);

-- is_auto_x_MUX_uxn_device_h_l200_c7_219b
is_auto_x_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond,
is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue,
is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse,
is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l200_c7_219b
result_device_ram_address_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond,
result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_u8_value_MUX_uxn_device_h_l200_c7_219b
result_u8_value_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond,
result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l200_c7_219b
result_is_vram_write_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond,
result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l200_c7_219b
result_is_deo_done_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond,
result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output);

-- result_u16_addr_MUX_uxn_device_h_l200_c7_219b
result_u16_addr_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond,
result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue,
result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse,
result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output);

-- is_auto_y_MUX_uxn_device_h_l200_c7_219b
is_auto_y_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond,
is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue,
is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse,
is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output);

-- auto_advance_MUX_uxn_device_h_l200_c7_219b
auto_advance_MUX_uxn_device_h_l200_c7_219b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l200_c7_219b_cond,
auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue,
auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse,
auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l207_c34_c53e
BIN_OP_PLUS_uxn_device_h_l207_c34_c53e : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left,
BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right,
BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l207_c44_84a0
BIN_OP_PLUS_uxn_device_h_l207_c44_84a0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left,
BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right,
BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output);

-- MUX_uxn_device_h_l207_c21_f51e
MUX_uxn_device_h_l207_c21_f51e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l207_c21_f51e_cond,
MUX_uxn_device_h_l207_c21_f51e_iftrue,
MUX_uxn_device_h_l207_c21_f51e_iffalse,
MUX_uxn_device_h_l207_c21_f51e_return_output);

-- MUX_uxn_device_h_l208_c31_c8cd
MUX_uxn_device_h_l208_c31_c8cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l208_c31_c8cd_cond,
MUX_uxn_device_h_l208_c31_c8cd_iftrue,
MUX_uxn_device_h_l208_c31_c8cd_iffalse,
MUX_uxn_device_h_l208_c31_c8cd_return_output);

-- UNARY_OP_NOT_uxn_device_h_l209_c26_1037
UNARY_OP_NOT_uxn_device_h_l209_c26_1037 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr,
UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output);

-- BIN_OP_EQ_uxn_device_h_l211_c11_facf
BIN_OP_EQ_uxn_device_h_l211_c11_facf : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l211_c11_facf_left,
BIN_OP_EQ_uxn_device_h_l211_c11_facf_right,
BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16
result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond,
result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue,
result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse,
result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16
result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond,
result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue,
result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse,
result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output);

-- result_u8_value_MUX_uxn_device_h_l211_c7_bc16
result_u8_value_MUX_uxn_device_h_l211_c7_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond,
result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue,
result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse,
result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output);

-- BIN_OP_AND_uxn_device_h_l213_c32_687e
BIN_OP_AND_uxn_device_h_l213_c32_687e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l213_c32_687e_left,
BIN_OP_AND_uxn_device_h_l213_c32_687e_right,
BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l215_c31_feaa
BIN_OP_PLUS_uxn_device_h_l215_c31_feaa : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left,
BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right,
BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 previous_ram_read,
 -- Registers
 x,
 y,
 ctrl,
 auto_advance,
 tmp8,
 color,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_auto_x,
 is_auto_y,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output,
 color_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 y_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 result_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 layer_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 x_MUX_uxn_device_h_l164_c2_e2c2_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output,
 color_MUX_uxn_device_h_l170_c7_8350_return_output,
 y_MUX_uxn_device_h_l170_c7_8350_return_output,
 tmp8_MUX_uxn_device_h_l170_c7_8350_return_output,
 is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output,
 ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output,
 result_MUX_uxn_device_h_l170_c7_8350_return_output,
 flip_y_MUX_uxn_device_h_l170_c7_8350_return_output,
 is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output,
 flip_x_MUX_uxn_device_h_l170_c7_8350_return_output,
 layer_MUX_uxn_device_h_l170_c7_8350_return_output,
 ctrl_MUX_uxn_device_h_l170_c7_8350_return_output,
 auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output,
 x_MUX_uxn_device_h_l170_c7_8350_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output,
 color_MUX_uxn_device_h_l173_c7_654a_return_output,
 y_MUX_uxn_device_h_l173_c7_654a_return_output,
 tmp8_MUX_uxn_device_h_l173_c7_654a_return_output,
 is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output,
 ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output,
 result_MUX_uxn_device_h_l173_c7_654a_return_output,
 flip_y_MUX_uxn_device_h_l173_c7_654a_return_output,
 is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output,
 flip_x_MUX_uxn_device_h_l173_c7_654a_return_output,
 layer_MUX_uxn_device_h_l173_c7_654a_return_output,
 ctrl_MUX_uxn_device_h_l173_c7_654a_return_output,
 auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output,
 x_MUX_uxn_device_h_l173_c7_654a_return_output,
 BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output,
 color_MUX_uxn_device_h_l177_c7_1212_return_output,
 y_MUX_uxn_device_h_l177_c7_1212_return_output,
 tmp8_MUX_uxn_device_h_l177_c7_1212_return_output,
 is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output,
 ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output,
 result_MUX_uxn_device_h_l177_c7_1212_return_output,
 flip_y_MUX_uxn_device_h_l177_c7_1212_return_output,
 is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output,
 flip_x_MUX_uxn_device_h_l177_c7_1212_return_output,
 layer_MUX_uxn_device_h_l177_c7_1212_return_output,
 ctrl_MUX_uxn_device_h_l177_c7_1212_return_output,
 auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output,
 color_MUX_uxn_device_h_l181_c7_49a2_return_output,
 tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output,
 is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output,
 ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output,
 result_MUX_uxn_device_h_l181_c7_49a2_return_output,
 flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output,
 is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output,
 flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output,
 layer_MUX_uxn_device_h_l181_c7_49a2_return_output,
 ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output,
 auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output,
 CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output,
 CONST_SR_6_uxn_device_h_l185_c21_2891_return_output,
 CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output,
 CONST_SR_4_uxn_device_h_l187_c22_e140_return_output,
 BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output,
 CONST_SL_8_uxn_device_h_l190_c22_5377_return_output,
 BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output,
 tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output,
 MUX_uxn_device_h_l194_c12_f716_return_output,
 BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output,
 MUX_uxn_device_h_l195_c12_aae7_return_output,
 BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output,
 BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output,
 is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output,
 result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output,
 is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output,
 auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output,
 BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output,
 BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output,
 MUX_uxn_device_h_l207_c21_f51e_return_output,
 MUX_uxn_device_h_l208_c31_c8cd_return_output,
 UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output,
 BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output,
 result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output,
 result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output,
 result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output,
 BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output,
 BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_e2c2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_8350_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_e2c2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_8350_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_e2c2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l164_c2_e2c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l170_c7_8350_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_8350_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_8350_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_654a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_8350_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_8350_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_654a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l170_c7_8350_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l173_c7_654a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_654a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_654a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_1212_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_654a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_654a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l173_c7_654a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c7_1212_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_1212_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_1212_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_49a2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_49a2_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_49a2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_49a2_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l181_c7_49a2_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_cadd_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_e83d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_6657_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_2755_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dc53_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l188_c3_c754 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output : unsigned(3 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l189_c3_318b : unsigned(7 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l190_c3_3a8b : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output : unsigned(16 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_f716_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_f716_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_f716_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l194_c12_f716_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_aae7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_aae7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_aae7_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c12_aae7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l205_c3_1f71 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_219b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l203_c15_3840_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f51e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f51e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f51e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l207_c21_f51e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_c8cd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_c8cd_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_c8cd_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l208_c31_c8cd_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_f5dd_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_7f3d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l193_l211_DUPLICATE_f3b3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(3 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_auto_x : unsigned(0 downto 0);
variable REG_VAR_is_auto_y : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_color := color;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_auto_x := is_auto_x;
  REG_VAR_is_auto_y := is_auto_y;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l189_c3_318b := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_right := to_unsigned(5, 12);
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l194_c12_f716_iffalse := to_unsigned(16, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l195_c12_aae7_iftrue := to_unsigned(4, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right := to_unsigned(2, 12);
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l195_c12_aae7_iffalse := to_unsigned(0, 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue := to_unsigned(43, 8);
     VAR_result_u16_addr_uxn_device_h_l205_c3_1f71 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_result_u16_addr_uxn_device_h_l205_c3_1f71;
     VAR_MUX_uxn_device_h_l208_c31_c8cd_iffalse := to_unsigned(43, 8);
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_right := to_unsigned(6, 12);
     VAR_MUX_uxn_device_h_l194_c12_f716_iftrue := to_unsigned(24, 8);
     VAR_MUX_uxn_device_h_l208_c31_c8cd_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_right := to_unsigned(0, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right := to_unsigned(1, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right := to_unsigned(3, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right := to_unsigned(4, 12);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_device_port := device_port;
     VAR_phase := phase;
     VAR_previous_device_ram_read := previous_device_ram_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iftrue := color;
     VAR_color_MUX_uxn_device_h_l170_c7_8350_iftrue := color;
     VAR_color_MUX_uxn_device_h_l173_c7_654a_iftrue := color;
     VAR_color_MUX_uxn_device_h_l177_c7_1212_iftrue := color;
     VAR_color_MUX_uxn_device_h_l181_c7_49a2_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse := flip_y;
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_right := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_left := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse := is_auto_y;
     VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l170_c7_8350_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l173_c7_654a_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l177_c7_1212_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_left := VAR_phase;
     VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse := tmp8;
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left := x;
     VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l170_c7_8350_iftrue := x;
     VAR_x_MUX_uxn_device_h_l173_c7_654a_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left := y;
     VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_x := y;
     VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l170_c7_8350_iftrue := y;
     VAR_y_MUX_uxn_device_h_l173_c7_654a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l177_c7_1212_iffalse := y;
     -- CONST_SR_4[uxn_device_h_l187_c22_e140] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l187_c22_e140_x <= VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_return_output := CONST_SR_4_uxn_device_h_l187_c22_e140_return_output;

     -- BIN_OP_AND[uxn_device_h_l213_c32_687e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l213_c32_687e_left <= VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_left;
     BIN_OP_AND_uxn_device_h_l213_c32_687e_right <= VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output := BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output;

     -- uint8_1_1[uxn_device_h_l203_c15_3840] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l203_c15_3840_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l207_c34_c53e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_left;
     BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output := BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l193_l211_DUPLICATE_f3b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l193_l211_DUPLICATE_f3b3_return_output := result.is_deo_done;

     -- CONST_SR_5[uxn_device_h_l186_c22_ef4e] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l186_c22_ef4e_x <= VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output := CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l211_c7_bc16] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_bc16_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l164_c6_044b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l164_c6_044b_left <= VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_left;
     BIN_OP_EQ_uxn_device_h_l164_c6_044b_right <= VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output := BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l164_c2_e2c2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_e2c2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(41, 8),
     to_unsigned(0, 1));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l177_c7_1212] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_1212_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l173_c7_654a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_654a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- BIN_OP_EQ[uxn_device_h_l200_c11_f607] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l200_c11_f607_left <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_left;
     BIN_OP_EQ_uxn_device_h_l200_c11_f607_right <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output := BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;

     -- BIN_OP_EQ[uxn_device_h_l170_c11_60dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_left;
     BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output := BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;

     -- CONST_SR_7[uxn_device_h_l184_c25_f86e] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l184_c25_f86e_x <= VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output := CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output;

     -- CONST_SR_6[uxn_device_h_l185_c21_2891] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l185_c21_2891_x <= VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_return_output := CONST_SR_6_uxn_device_h_l185_c21_2891_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l215_c31_feaa] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_left;
     BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output := BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_7f3d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_7f3d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l173_c11_d6bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l177_c11_52d7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_left;
     BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output := BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l211_c11_facf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l211_c11_facf_left <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_left;
     BIN_OP_EQ_uxn_device_h_l211_c11_facf_right <= VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output := BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l211_c7_bc16] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_bc16_return_output := result.u8_value;

     -- uint8_0_0[uxn_device_h_l202_c15_a9d3] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l170_c7_8350] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_8350_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- CONST_SL_8[uxn_device_h_l190_c22_5377] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l190_c22_5377_x <= VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_return_output := CONST_SL_8_uxn_device_h_l190_c22_5377_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l200_c7_219b] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_219b_return_output := result.u16_addr;

     -- BIN_OP_PLUS[uxn_device_h_l207_c44_84a0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_left;
     BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output := BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l183_c11_cadd] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_cadd_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l211_c7_bc16] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_bc16_return_output := result.device_ram_address;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l200_c7_219b] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_219b_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_7f50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue := VAR_BIN_OP_AND_uxn_device_h_l213_c32_687e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_color_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_result_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_x_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_y_MUX_uxn_device_h_l164_c2_e2c2_cond := VAR_BIN_OP_EQ_uxn_device_h_l164_c6_044b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_color_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_layer_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_result_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_x_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_y_MUX_uxn_device_h_l170_c7_8350_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c11_60dc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_color_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_layer_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_result_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_x_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_y_MUX_uxn_device_h_l173_c7_654a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_d6bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_1212_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_52d7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7f50_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_f607_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_device_h_l211_c11_facf_return_output;
     VAR_MUX_uxn_device_h_l207_c21_f51e_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l207_c34_c53e_return_output, 8);
     VAR_MUX_uxn_device_h_l207_c21_f51e_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l207_c44_84a0_return_output, 8);
     VAR_x_MUX_uxn_device_h_l173_c7_654a_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_7f3d_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_1212_iftrue := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l178_l174_DUPLICATE_7f3d_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left := VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_cadd_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l183_c11_cadd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l193_l211_DUPLICATE_f3b3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l193_l211_DUPLICATE_f3b3_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left := VAR_CONST_SL_8_uxn_device_h_l190_c22_5377_return_output;
     VAR_result_MUX_uxn_device_h_l170_c7_8350_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l170_c7_8350_return_output;
     VAR_result_MUX_uxn_device_h_l173_c7_654a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l173_c7_654a_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_1212_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_1212_return_output;
     VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l164_c2_e2c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l211_c7_bc16_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l211_c7_bc16_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l200_c7_219b_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l200_c7_219b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l211_c7_bc16_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left := VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output;
     VAR_MUX_uxn_device_h_l207_c21_f51e_cond := VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output;
     VAR_MUX_uxn_device_h_l208_c31_c8cd_cond := VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_uint8_0_0_uxn_device_h_l202_c15_a9d3_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right := VAR_uint8_1_1_uxn_device_h_l203_c15_3840_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_uint8_1_1_uxn_device_h_l203_c15_3840_return_output;
     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l215_c21_f5dd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_f5dd_return_output := CAST_TO_uint8_t_uint17_t(
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c31_feaa_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l211_c7_bc16] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_cond;
     result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output := result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l184_c15_e83d] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_e83d_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l184_c25_f86e_return_output);

     -- MUX[uxn_device_h_l207_c21_f51e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l207_c21_f51e_cond <= VAR_MUX_uxn_device_h_l207_c21_f51e_cond;
     MUX_uxn_device_h_l207_c21_f51e_iftrue <= VAR_MUX_uxn_device_h_l207_c21_f51e_iftrue;
     MUX_uxn_device_h_l207_c21_f51e_iffalse <= VAR_MUX_uxn_device_h_l207_c21_f51e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l207_c21_f51e_return_output := MUX_uxn_device_h_l207_c21_f51e_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l186_c12_2755] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_2755_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l186_c22_ef4e_return_output);

     -- ctrl_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_cond;
     ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output := ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_cond;
     result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output := result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- y_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_y_MUX_uxn_device_h_l177_c7_1212_cond;
     y_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_y_MUX_uxn_device_h_l177_c7_1212_iftrue;
     y_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_y_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c7_1212_return_output := y_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- is_auto_x_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_cond;
     is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iftrue;
     is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output := is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l211_c7_bc16] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_cond;
     result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output := result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l187_c12_dc53] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dc53_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l187_c22_e140_return_output);

     -- color_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_color_MUX_uxn_device_h_l181_c7_49a2_cond;
     color_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_color_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     color_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_color_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l181_c7_49a2_return_output := color_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l211_c7_bc16] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output := result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l185_c11_6657] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_6657_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l185_c21_2891_return_output);

     -- auto_advance_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_cond;
     auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iftrue;
     auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output := auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_cond;
     result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output := result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- x_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_x_MUX_uxn_device_h_l173_c7_654a_cond;
     x_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_x_MUX_uxn_device_h_l173_c7_654a_iftrue;
     x_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_x_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l173_c7_654a_return_output := x_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- BIN_OP_AND[uxn_device_h_l188_c10_0b0e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left <= VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_left;
     BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right <= VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output := BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output;

     -- is_auto_y_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_cond;
     is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iftrue;
     is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output := is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l190_c22_11e9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_left;
     BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output := BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output;

     -- MUX[uxn_device_h_l208_c31_c8cd] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l208_c31_c8cd_cond <= VAR_MUX_uxn_device_h_l208_c31_c8cd_cond;
     MUX_uxn_device_h_l208_c31_c8cd_iftrue <= VAR_MUX_uxn_device_h_l208_c31_c8cd_iftrue;
     MUX_uxn_device_h_l208_c31_c8cd_iffalse <= VAR_MUX_uxn_device_h_l208_c31_c8cd_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l208_c31_c8cd_return_output := MUX_uxn_device_h_l208_c31_c8cd_return_output;

     -- Submodule level 2
     VAR_tmp8_uxn_device_h_l188_c3_c754 := resize(VAR_BIN_OP_AND_uxn_device_h_l188_c10_0b0e_return_output, 8);
     VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l209_l206_DUPLICATE_0c90_return_output;
     VAR_result_u16_addr_uxn_device_h_l190_c3_3a8b := resize(VAR_BIN_OP_PLUS_uxn_device_h_l190_c22_11e9_return_output, 16);
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_e83d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_e83d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l184_c15_e83d_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_6657_return_output;
     VAR_MUX_uxn_device_h_l195_c12_aae7_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_2755_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l186_c12_2755_return_output;
     VAR_MUX_uxn_device_h_l194_c12_f716_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dc53_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l187_c12_dc53_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l215_c21_f5dd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_MUX_uxn_device_h_l207_c21_f51e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_MUX_uxn_device_h_l208_c31_c8cd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l200_c7_219b_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_color_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_ctrl_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l200_c7_219b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l200_c7_219b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l211_c7_bc16_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l211_c7_bc16_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l211_c7_bc16_return_output;
     VAR_x_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_x_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_y_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_y_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_left := VAR_tmp8_uxn_device_h_l188_c3_c754;
     VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse := VAR_tmp8_uxn_device_h_l188_c3_c754;
     -- auto_advance_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_cond;
     auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output := auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- is_auto_y_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_cond;
     is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output := is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_cond;
     ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output := ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- x_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_x_MUX_uxn_device_h_l170_c7_8350_cond;
     x_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_x_MUX_uxn_device_h_l170_c7_8350_iftrue;
     x_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_x_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l170_c7_8350_return_output := x_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- ctrl_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_cond;
     ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iftrue;
     ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_return_output := ctrl_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- flip_y_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_cond;
     flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output := flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l193_c3_2bc6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_cond;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output := result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output;

     -- MUX[uxn_device_h_l195_c12_aae7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l195_c12_aae7_cond <= VAR_MUX_uxn_device_h_l195_c12_aae7_cond;
     MUX_uxn_device_h_l195_c12_aae7_iftrue <= VAR_MUX_uxn_device_h_l195_c12_aae7_iftrue;
     MUX_uxn_device_h_l195_c12_aae7_iffalse <= VAR_MUX_uxn_device_h_l195_c12_aae7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l195_c12_aae7_return_output := MUX_uxn_device_h_l195_c12_aae7_return_output;

     -- flip_x_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_cond;
     flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output := flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output := result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l209_c26_1037] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output := UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output;

     -- MUX[uxn_device_h_l194_c12_f716] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l194_c12_f716_cond <= VAR_MUX_uxn_device_h_l194_c12_f716_cond;
     MUX_uxn_device_h_l194_c12_f716_iftrue <= VAR_MUX_uxn_device_h_l194_c12_f716_iftrue;
     MUX_uxn_device_h_l194_c12_f716_iffalse <= VAR_MUX_uxn_device_h_l194_c12_f716_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l194_c12_f716_return_output := MUX_uxn_device_h_l194_c12_f716_return_output;

     -- y_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_y_MUX_uxn_device_h_l173_c7_654a_cond;
     y_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_y_MUX_uxn_device_h_l173_c7_654a_iftrue;
     y_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_y_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l173_c7_654a_return_output := y_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_cond;
     result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output := result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- is_auto_x_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_cond;
     is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output := is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- color_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_color_MUX_uxn_device_h_l177_c7_1212_cond;
     color_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_color_MUX_uxn_device_h_l177_c7_1212_iftrue;
     color_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_color_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l177_c7_1212_return_output := color_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- layer_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_layer_MUX_uxn_device_h_l181_c7_49a2_cond;
     layer_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     layer_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_layer_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l181_c7_49a2_return_output := layer_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l211_c7_bc16] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_cond;
     result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iftrue;
     result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output := result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output;

     -- Submodule level 3
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_right := VAR_MUX_uxn_device_h_l194_c12_f716_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_right := VAR_MUX_uxn_device_h_l195_c12_aae7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l209_c26_1037_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_auto_advance_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_color_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_color_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_ctrl_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_flip_x_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_flip_y_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_layer_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l211_c7_bc16_return_output;
     VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_x_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_y_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_y_MUX_uxn_device_h_l173_c7_654a_return_output;
     -- is_auto_x_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_cond;
     is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iftrue;
     is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output := is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- layer_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_layer_MUX_uxn_device_h_l177_c7_1212_cond;
     layer_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_layer_MUX_uxn_device_h_l177_c7_1212_iftrue;
     layer_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_layer_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l177_c7_1212_return_output := layer_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- BIN_OP_OR[uxn_device_h_l194_c4_b649] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l194_c4_b649_left <= VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_left;
     BIN_OP_OR_uxn_device_h_l194_c4_b649_right <= VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output := BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output;

     -- color_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_color_MUX_uxn_device_h_l173_c7_654a_cond;
     color_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_color_MUX_uxn_device_h_l173_c7_654a_iftrue;
     color_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_color_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l173_c7_654a_return_output := color_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- x_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_x_MUX_uxn_device_h_l164_c2_e2c2_cond;
     x_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     x_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l164_c2_e2c2_return_output := x_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- ctrl_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_cond;
     ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iftrue;
     ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_return_output := ctrl_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_cond;
     result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output := result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- flip_x_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_cond;
     flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iftrue;
     flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_return_output := flip_x_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- flip_y_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_cond;
     flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iftrue;
     flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_return_output := flip_y_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- auto_advance_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_cond;
     auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iftrue;
     auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output := auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- result_u8_value_MUX[uxn_device_h_l200_c7_219b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_cond;
     result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iftrue;
     result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output := result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output;

     -- is_auto_y_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_cond;
     is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iftrue;
     is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output := is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_cond;
     ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iftrue;
     ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output := ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- y_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_y_MUX_uxn_device_h_l170_c7_8350_cond;
     y_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_y_MUX_uxn_device_h_l170_c7_8350_iftrue;
     y_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_y_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l170_c7_8350_return_output := y_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_left := VAR_BIN_OP_OR_uxn_device_h_l194_c4_b649_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_color_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_color_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_ctrl_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_flip_x_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_flip_y_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_layer_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_layer_MUX_uxn_device_h_l177_c7_1212_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_y_MUX_uxn_device_h_l170_c7_8350_return_output;
     -- layer_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_layer_MUX_uxn_device_h_l173_c7_654a_cond;
     layer_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_layer_MUX_uxn_device_h_l173_c7_654a_iftrue;
     layer_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_layer_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l173_c7_654a_return_output := layer_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- flip_x_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_cond;
     flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iftrue;
     flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_return_output := flip_x_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- is_auto_x_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_cond;
     is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iftrue;
     is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output := is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- is_auto_y_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_cond;
     is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iftrue;
     is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output := is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- ctrl_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_cond;
     ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iftrue;
     ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_return_output := ctrl_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- flip_y_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_cond;
     flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iftrue;
     flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_return_output := flip_y_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f[uxn_device_h_l181_c7_49a2] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l181_c7_49a2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l200_c7_219b_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l200_c7_219b_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l200_c7_219b_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l200_c7_219b_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l200_c7_219b_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l200_c7_219b_return_output);

     -- y_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_y_MUX_uxn_device_h_l164_c2_e2c2_cond;
     y_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     y_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l164_c2_e2c2_return_output := y_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- color_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_color_MUX_uxn_device_h_l170_c7_8350_cond;
     color_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_color_MUX_uxn_device_h_l170_c7_8350_iftrue;
     color_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_color_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l170_c7_8350_return_output := color_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_cond;
     ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output := ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- auto_advance_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_cond;
     auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iftrue;
     auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output := auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- BIN_OP_OR[uxn_device_h_l195_c4_5b94] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l195_c4_5b94_left <= VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_left;
     BIN_OP_OR_uxn_device_h_l195_c4_5b94_right <= VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output := BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output;

     -- Submodule level 5
     VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue := VAR_BIN_OP_OR_uxn_device_h_l195_c4_5b94_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_auto_advance_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_color_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_ctrl_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_flip_x_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_flip_y_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_layer_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_layer_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_49a2_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_7b4f_uxn_device_h_l181_c7_49a2_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     -- ctrl_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_cond;
     ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output := ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- auto_advance_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_cond;
     auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iftrue;
     auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output := auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- layer_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_layer_MUX_uxn_device_h_l170_c7_8350_cond;
     layer_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_layer_MUX_uxn_device_h_l170_c7_8350_iftrue;
     layer_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_layer_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l170_c7_8350_return_output := layer_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- flip_y_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_cond;
     flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iftrue;
     flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_return_output := flip_y_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- is_auto_x_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_cond;
     is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iftrue;
     is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output := is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- flip_x_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_cond;
     flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iftrue;
     flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_return_output := flip_x_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- is_auto_y_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_cond;
     is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iftrue;
     is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output := is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_cond;
     ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iftrue;
     ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output := ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- tmp8_MUX[uxn_device_h_l193_c3_2bc6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond <= VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_cond;
     tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iftrue;
     tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output := tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output;

     -- color_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_color_MUX_uxn_device_h_l164_c2_e2c2_cond;
     color_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     color_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_color_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l164_c2_e2c2_return_output := color_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- Submodule level 6
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l170_c7_8350_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_flip_x_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_flip_y_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_layer_MUX_uxn_device_h_l170_c7_8350_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output;
     -- tmp8_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_cond;
     tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output := tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- is_auto_x_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_cond;
     is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output := is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- is_auto_y_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_cond;
     is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output := is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- flip_y_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_cond;
     flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output := flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- flip_x_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_cond;
     flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output := flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- layer_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_cond;
     layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_return_output := layer_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7[uxn_device_h_l181_c7_49a2] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_49a2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_88f7(
     result,
     VAR_result_device_ram_address_uxn_device_h_l189_c3_318b,
     VAR_result_u16_addr_uxn_device_h_l190_c3_3a8b,
     VAR_CAST_TO_uint1_t_uxn_device_h_l185_c11_6657_return_output,
     to_unsigned(1, 1),
     VAR_result_is_deo_done_MUX_uxn_device_h_l193_c3_2bc6_return_output,
     VAR_tmp8_MUX_uxn_device_h_l193_c3_2bc6_return_output);

     -- auto_advance_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_cond;
     auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output := auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_cond;
     ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output := ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- Submodule level 7
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_49a2_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_88f7_uxn_device_h_l181_c7_49a2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_tmp8_MUX_uxn_device_h_l181_c7_49a2_return_output;
     -- tmp8_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_cond;
     tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iftrue;
     tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_return_output := tmp8_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- result_MUX[uxn_device_h_l181_c7_49a2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_49a2_cond <= VAR_result_MUX_uxn_device_h_l181_c7_49a2_cond;
     result_MUX_uxn_device_h_l181_c7_49a2_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_49a2_iftrue;
     result_MUX_uxn_device_h_l181_c7_49a2_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_49a2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_49a2_return_output := result_MUX_uxn_device_h_l181_c7_49a2_return_output;

     -- Submodule level 8
     VAR_result_MUX_uxn_device_h_l177_c7_1212_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_49a2_return_output;
     VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_tmp8_MUX_uxn_device_h_l177_c7_1212_return_output;
     -- tmp8_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_cond;
     tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iftrue;
     tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_return_output := tmp8_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- result_MUX[uxn_device_h_l177_c7_1212] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l177_c7_1212_cond <= VAR_result_MUX_uxn_device_h_l177_c7_1212_cond;
     result_MUX_uxn_device_h_l177_c7_1212_iftrue <= VAR_result_MUX_uxn_device_h_l177_c7_1212_iftrue;
     result_MUX_uxn_device_h_l177_c7_1212_iffalse <= VAR_result_MUX_uxn_device_h_l177_c7_1212_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l177_c7_1212_return_output := result_MUX_uxn_device_h_l177_c7_1212_return_output;

     -- Submodule level 9
     VAR_result_MUX_uxn_device_h_l173_c7_654a_iffalse := VAR_result_MUX_uxn_device_h_l177_c7_1212_return_output;
     VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_tmp8_MUX_uxn_device_h_l173_c7_654a_return_output;
     -- tmp8_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_cond;
     tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iftrue;
     tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_return_output := tmp8_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- result_MUX[uxn_device_h_l173_c7_654a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l173_c7_654a_cond <= VAR_result_MUX_uxn_device_h_l173_c7_654a_cond;
     result_MUX_uxn_device_h_l173_c7_654a_iftrue <= VAR_result_MUX_uxn_device_h_l173_c7_654a_iftrue;
     result_MUX_uxn_device_h_l173_c7_654a_iffalse <= VAR_result_MUX_uxn_device_h_l173_c7_654a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l173_c7_654a_return_output := result_MUX_uxn_device_h_l173_c7_654a_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l170_c7_8350_iffalse := VAR_result_MUX_uxn_device_h_l173_c7_654a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_tmp8_MUX_uxn_device_h_l170_c7_8350_return_output;
     -- tmp8_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_cond;
     tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output := tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- result_MUX[uxn_device_h_l170_c7_8350] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l170_c7_8350_cond <= VAR_result_MUX_uxn_device_h_l170_c7_8350_cond;
     result_MUX_uxn_device_h_l170_c7_8350_iftrue <= VAR_result_MUX_uxn_device_h_l170_c7_8350_iftrue;
     result_MUX_uxn_device_h_l170_c7_8350_iffalse <= VAR_result_MUX_uxn_device_h_l170_c7_8350_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l170_c7_8350_return_output := result_MUX_uxn_device_h_l170_c7_8350_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iffalse := VAR_result_MUX_uxn_device_h_l170_c7_8350_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     -- result_MUX[uxn_device_h_l164_c2_e2c2] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l164_c2_e2c2_cond <= VAR_result_MUX_uxn_device_h_l164_c2_e2c2_cond;
     result_MUX_uxn_device_h_l164_c2_e2c2_iftrue <= VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iftrue;
     result_MUX_uxn_device_h_l164_c2_e2c2_iffalse <= VAR_result_MUX_uxn_device_h_l164_c2_e2c2_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l164_c2_e2c2_return_output := result_MUX_uxn_device_h_l164_c2_e2c2_return_output;

     -- Submodule level 12
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l164_c2_e2c2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_ctrl <= REG_VAR_ctrl;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_color <= REG_VAR_color;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_auto_x <= REG_VAR_is_auto_x;
REG_COMB_is_auto_y <= REG_VAR_is_auto_y;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     ctrl <= REG_COMB_ctrl;
     auto_advance <= REG_COMB_auto_advance;
     tmp8 <= REG_COMB_tmp8;
     color <= REG_COMB_color;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_auto_x <= REG_COMB_is_auto_x;
     is_auto_y <= REG_COMB_is_auto_y;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
