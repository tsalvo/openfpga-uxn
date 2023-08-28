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
-- Submodules: 97
entity screen_deo_phased_0CLK_f52d3c7c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(3 downto 0);
 device_base_address : in unsigned(7 downto 0);
 device_port : in unsigned(7 downto 0);
 return_output : out unsigned(0 downto 0));
end screen_deo_phased_0CLK_f52d3c7c;
architecture arch of screen_deo_phased_0CLK_f52d3c7c is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal draw_ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal is_fill_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_x_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_y_valid : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : unsigned(0 downto 0) := to_unsigned(0, 1);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_draw_ctrl : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_is_fill_mode : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_x_valid : unsigned(0 downto 0);
signal REG_COMB_is_y_valid : unsigned(0 downto 0);
signal REG_COMB_result : unsigned(0 downto 0);

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l174_c6_80c3]
signal BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l175_c7_d569]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l174_c2_e967]
signal is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l174_c2_e967]
signal color_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);

-- is_x_valid_MUX[uxn_device_h_l174_c2_e967]
signal is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);

-- draw_ctrl_MUX[uxn_device_h_l174_c2_e967]
signal draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l174_c2_e967]
signal y_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l174_c2_e967]
signal x_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l174_c2_e967]
signal layer_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l174_c2_e967]
signal auto_advance_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l174_c2_e967]
signal result_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);

-- is_y_valid_MUX[uxn_device_h_l174_c2_e967]
signal is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l175_c11_b660]
signal BIN_OP_EQ_uxn_device_h_l175_c11_b660_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c11_b660_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l176_c7_302a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l175_c7_d569]
signal is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l175_c7_d569]
signal color_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);

-- is_x_valid_MUX[uxn_device_h_l175_c7_d569]
signal is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- draw_ctrl_MUX[uxn_device_h_l175_c7_d569]
signal draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l175_c7_d569]
signal y_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l175_c7_d569]
signal x_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l175_c7_d569]
signal layer_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l175_c7_d569]
signal auto_advance_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l175_c7_d569]
signal result_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- is_y_valid_MUX[uxn_device_h_l175_c7_d569]
signal is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l176_c11_4e56]
signal BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l176_c1_2599]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l176_c7_302a]
signal is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l176_c7_302a]
signal color_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);

-- is_x_valid_MUX[uxn_device_h_l176_c7_302a]
signal is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- draw_ctrl_MUX[uxn_device_h_l176_c7_302a]
signal draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l176_c7_302a]
signal y_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l176_c7_302a]
signal x_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l176_c7_302a]
signal layer_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l176_c7_302a]
signal auto_advance_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l176_c7_302a]
signal result_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- is_y_valid_MUX[uxn_device_h_l176_c7_302a]
signal is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l177_c7_0506]
signal BIN_OP_EQ_uxn_device_h_l177_c7_0506_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c7_0506_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l177_c1_c660]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c8_5e02]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l177_c3_9d7e]
signal is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l177_c3_9d7e]
signal color_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);

-- is_x_valid_MUX[uxn_device_h_l177_c3_9d7e]
signal is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
signal is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);

-- draw_ctrl_MUX[uxn_device_h_l177_c3_9d7e]
signal draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l177_c3_9d7e]
signal y_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l177_c3_9d7e]
signal x_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l177_c3_9d7e]
signal layer_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l177_c3_9d7e]
signal auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l177_c3_9d7e]
signal result_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);

-- is_y_valid_MUX[uxn_device_h_l177_c3_9d7e]
signal is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
signal is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);

-- x_get[uxn_device_h_l179_c8_cb38]
signal x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE : unsigned(0 downto 0);
signal x_get_uxn_device_h_l179_c8_cb38_return_output : unsigned(15 downto 0);

-- y_get[uxn_device_h_l180_c8_b0d3]
signal y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE : unsigned(0 downto 0);
signal y_get_uxn_device_h_l180_c8_b0d3_return_output : unsigned(15 downto 0);

-- BIN_OP_LT[uxn_device_h_l181_c17_bc19]
signal BIN_OP_LT_uxn_device_h_l181_c17_bc19_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l181_c17_bc19_right : unsigned(8 downto 0);
signal BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_device_h_l182_c17_170b]
signal BIN_OP_LT_uxn_device_h_l182_c17_170b_left : unsigned(15 downto 0);
signal BIN_OP_LT_uxn_device_h_l182_c17_170b_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l183_c25_1bc7]
signal BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right : unsigned(3 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output : unsigned(8 downto 0);

-- peek_dev[uxn_device_h_l183_c16_fee4]
signal peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l183_c16_fee4_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l183_c16_fee4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l185_c12_e839]
signal BIN_OP_EQ_uxn_device_h_l185_c12_e839_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c12_e839_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c1_9e6f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c8_f698]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l185_c8_5e02]
signal is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l185_c8_5e02]
signal color_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
signal color_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);

-- draw_ctrl_MUX[uxn_device_h_l185_c8_5e02]
signal draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
signal draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l185_c8_5e02]
signal y_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l185_c8_5e02]
signal x_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l185_c8_5e02]
signal layer_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l185_c8_5e02]
signal auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l185_c8_5e02]
signal result_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l186_c25_d3b3]
signal BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output : unsigned(8 downto 0);

-- peek_dev[uxn_device_h_l186_c16_8add]
signal peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l186_c16_8add_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l186_c16_8add_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l187_c12_1a54]
signal BIN_OP_AND_uxn_device_h_l187_c12_1a54_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l187_c12_1a54_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l188_c19_bb80]
signal BIN_OP_AND_uxn_device_h_l188_c19_bb80_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c19_bb80_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l189_c13_c0ea]
signal BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l189_c13_162b]
signal MUX_uxn_device_h_l189_c13_162b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l189_c13_162b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l189_c13_162b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l189_c13_162b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l193_c1_ec1c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l194_c8_628c]
signal BIN_OP_AND_uxn_device_h_l194_c8_628c_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c8_628c_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l194_c1_417f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l207_c12_f8a4]
signal BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c1_0033]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l207_c8_f698]
signal y_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l207_c8_f698]
signal x_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l207_c8_f698]
signal auto_advance_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(7 downto 0);

-- result_MUX[uxn_device_h_l207_c8_f698]
signal result_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l208_c28_a8ad]
signal BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right : unsigned(2 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output : unsigned(8 downto 0);

-- peek_dev[uxn_device_h_l208_c19_6b9a]
signal peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE : unsigned(0 downto 0);
signal peek_dev_uxn_device_h_l208_c19_6b9a_address : unsigned(7 downto 0);
signal peek_dev_uxn_device_h_l208_c19_6b9a_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l209_c8_a15e]
signal BIN_OP_AND_uxn_device_h_l209_c8_a15e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l209_c8_a15e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l209_c1_1d35]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l209_c4_1ae1]
signal x_MUX_uxn_device_h_l209_c4_1ae1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l209_c4_1ae1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l209_c4_1ae1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l209_c4_1ae1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l210_c5_9c89]
signal BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output : unsigned(16 downto 0);

-- x_set[uxn_device_h_l211_c5_9f85]
signal x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE : unsigned(0 downto 0);
signal x_set_uxn_device_h_l211_c5_9f85_value : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_device_h_l214_c8_9009]
signal BIN_OP_AND_uxn_device_h_l214_c8_9009_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l214_c8_9009_right : unsigned(1 downto 0);
signal BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output : unsigned(7 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_6b3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l214_c4_57e3]
signal y_MUX_uxn_device_h_l214_c4_57e3_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l214_c4_57e3_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l214_c4_57e3_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l214_c4_57e3_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l215_c5_8370]
signal BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output : unsigned(16 downto 0);

-- y_set[uxn_device_h_l216_c5_e8ac]
signal y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE : unsigned(0 downto 0);
signal y_set_uxn_device_h_l216_c5_e8ac_value : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l219_c12_5769]
signal BIN_OP_EQ_uxn_device_h_l219_c12_5769_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l219_c12_5769_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l219_c8_334b]
signal result_MUX_uxn_device_h_l219_c8_334b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l219_c8_334b_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l219_c8_334b_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l219_c8_334b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l223_c11_5eeb]
signal BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l223_c7_bf8c]
signal result_MUX_uxn_device_h_l223_c7_bf8c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l223_c7_bf8c_iftrue : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l223_c7_bf8c_iffalse : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l223_c7_bf8c_return_output : unsigned(0 downto 0);


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l174_c6_80c3
BIN_OP_EQ_uxn_device_h_l174_c6_80c3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left,
BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right,
BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output);

-- is_fill_mode_MUX_uxn_device_h_l174_c2_e967
is_fill_mode_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond,
is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue,
is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse,
is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output);

-- color_MUX_uxn_device_h_l174_c2_e967
color_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l174_c2_e967_cond,
color_MUX_uxn_device_h_l174_c2_e967_iftrue,
color_MUX_uxn_device_h_l174_c2_e967_iffalse,
color_MUX_uxn_device_h_l174_c2_e967_return_output);

-- is_x_valid_MUX_uxn_device_h_l174_c2_e967
is_x_valid_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond,
is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue,
is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse,
is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output);

-- draw_ctrl_MUX_uxn_device_h_l174_c2_e967
draw_ctrl_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond,
draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue,
draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse,
draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output);

-- y_MUX_uxn_device_h_l174_c2_e967
y_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l174_c2_e967_cond,
y_MUX_uxn_device_h_l174_c2_e967_iftrue,
y_MUX_uxn_device_h_l174_c2_e967_iffalse,
y_MUX_uxn_device_h_l174_c2_e967_return_output);

-- x_MUX_uxn_device_h_l174_c2_e967
x_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l174_c2_e967_cond,
x_MUX_uxn_device_h_l174_c2_e967_iftrue,
x_MUX_uxn_device_h_l174_c2_e967_iffalse,
x_MUX_uxn_device_h_l174_c2_e967_return_output);

-- layer_MUX_uxn_device_h_l174_c2_e967
layer_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l174_c2_e967_cond,
layer_MUX_uxn_device_h_l174_c2_e967_iftrue,
layer_MUX_uxn_device_h_l174_c2_e967_iffalse,
layer_MUX_uxn_device_h_l174_c2_e967_return_output);

-- auto_advance_MUX_uxn_device_h_l174_c2_e967
auto_advance_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l174_c2_e967_cond,
auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue,
auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse,
auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output);

-- result_MUX_uxn_device_h_l174_c2_e967
result_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l174_c2_e967_cond,
result_MUX_uxn_device_h_l174_c2_e967_iftrue,
result_MUX_uxn_device_h_l174_c2_e967_iffalse,
result_MUX_uxn_device_h_l174_c2_e967_return_output);

-- is_y_valid_MUX_uxn_device_h_l174_c2_e967
is_y_valid_MUX_uxn_device_h_l174_c2_e967 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond,
is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue,
is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse,
is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output);

-- BIN_OP_EQ_uxn_device_h_l175_c11_b660
BIN_OP_EQ_uxn_device_h_l175_c11_b660 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l175_c11_b660_left,
BIN_OP_EQ_uxn_device_h_l175_c11_b660_right,
BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output);

-- is_fill_mode_MUX_uxn_device_h_l175_c7_d569
is_fill_mode_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond,
is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue,
is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse,
is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output);

-- color_MUX_uxn_device_h_l175_c7_d569
color_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l175_c7_d569_cond,
color_MUX_uxn_device_h_l175_c7_d569_iftrue,
color_MUX_uxn_device_h_l175_c7_d569_iffalse,
color_MUX_uxn_device_h_l175_c7_d569_return_output);

-- is_x_valid_MUX_uxn_device_h_l175_c7_d569
is_x_valid_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond,
is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue,
is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse,
is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output);

-- draw_ctrl_MUX_uxn_device_h_l175_c7_d569
draw_ctrl_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond,
draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue,
draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse,
draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output);

-- y_MUX_uxn_device_h_l175_c7_d569
y_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l175_c7_d569_cond,
y_MUX_uxn_device_h_l175_c7_d569_iftrue,
y_MUX_uxn_device_h_l175_c7_d569_iffalse,
y_MUX_uxn_device_h_l175_c7_d569_return_output);

-- x_MUX_uxn_device_h_l175_c7_d569
x_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c7_d569_cond,
x_MUX_uxn_device_h_l175_c7_d569_iftrue,
x_MUX_uxn_device_h_l175_c7_d569_iffalse,
x_MUX_uxn_device_h_l175_c7_d569_return_output);

-- layer_MUX_uxn_device_h_l175_c7_d569
layer_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l175_c7_d569_cond,
layer_MUX_uxn_device_h_l175_c7_d569_iftrue,
layer_MUX_uxn_device_h_l175_c7_d569_iffalse,
layer_MUX_uxn_device_h_l175_c7_d569_return_output);

-- auto_advance_MUX_uxn_device_h_l175_c7_d569
auto_advance_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l175_c7_d569_cond,
auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue,
auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse,
auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output);

-- result_MUX_uxn_device_h_l175_c7_d569
result_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l175_c7_d569_cond,
result_MUX_uxn_device_h_l175_c7_d569_iftrue,
result_MUX_uxn_device_h_l175_c7_d569_iffalse,
result_MUX_uxn_device_h_l175_c7_d569_return_output);

-- is_y_valid_MUX_uxn_device_h_l175_c7_d569
is_y_valid_MUX_uxn_device_h_l175_c7_d569 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond,
is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue,
is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse,
is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output);

-- BIN_OP_EQ_uxn_device_h_l176_c11_4e56
BIN_OP_EQ_uxn_device_h_l176_c11_4e56 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left,
BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right,
BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output);

-- is_fill_mode_MUX_uxn_device_h_l176_c7_302a
is_fill_mode_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond,
is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue,
is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse,
is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output);

-- color_MUX_uxn_device_h_l176_c7_302a
color_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l176_c7_302a_cond,
color_MUX_uxn_device_h_l176_c7_302a_iftrue,
color_MUX_uxn_device_h_l176_c7_302a_iffalse,
color_MUX_uxn_device_h_l176_c7_302a_return_output);

-- is_x_valid_MUX_uxn_device_h_l176_c7_302a
is_x_valid_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond,
is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue,
is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse,
is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output);

-- draw_ctrl_MUX_uxn_device_h_l176_c7_302a
draw_ctrl_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond,
draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue,
draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse,
draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output);

-- y_MUX_uxn_device_h_l176_c7_302a
y_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l176_c7_302a_cond,
y_MUX_uxn_device_h_l176_c7_302a_iftrue,
y_MUX_uxn_device_h_l176_c7_302a_iffalse,
y_MUX_uxn_device_h_l176_c7_302a_return_output);

-- x_MUX_uxn_device_h_l176_c7_302a
x_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l176_c7_302a_cond,
x_MUX_uxn_device_h_l176_c7_302a_iftrue,
x_MUX_uxn_device_h_l176_c7_302a_iffalse,
x_MUX_uxn_device_h_l176_c7_302a_return_output);

-- layer_MUX_uxn_device_h_l176_c7_302a
layer_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l176_c7_302a_cond,
layer_MUX_uxn_device_h_l176_c7_302a_iftrue,
layer_MUX_uxn_device_h_l176_c7_302a_iffalse,
layer_MUX_uxn_device_h_l176_c7_302a_return_output);

-- auto_advance_MUX_uxn_device_h_l176_c7_302a
auto_advance_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l176_c7_302a_cond,
auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue,
auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse,
auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output);

-- result_MUX_uxn_device_h_l176_c7_302a
result_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l176_c7_302a_cond,
result_MUX_uxn_device_h_l176_c7_302a_iftrue,
result_MUX_uxn_device_h_l176_c7_302a_iffalse,
result_MUX_uxn_device_h_l176_c7_302a_return_output);

-- is_y_valid_MUX_uxn_device_h_l176_c7_302a
is_y_valid_MUX_uxn_device_h_l176_c7_302a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond,
is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue,
is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse,
is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output);

-- BIN_OP_EQ_uxn_device_h_l177_c7_0506
BIN_OP_EQ_uxn_device_h_l177_c7_0506 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l177_c7_0506_left,
BIN_OP_EQ_uxn_device_h_l177_c7_0506_right,
BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e
is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond,
is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- color_MUX_uxn_device_h_l177_c3_9d7e
color_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l177_c3_9d7e_cond,
color_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
color_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
color_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- is_x_valid_MUX_uxn_device_h_l177_c3_9d7e
is_x_valid_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond,
is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e
draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond,
draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- y_MUX_uxn_device_h_l177_c3_9d7e
y_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c3_9d7e_cond,
y_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
y_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
y_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- x_MUX_uxn_device_h_l177_c3_9d7e
x_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l177_c3_9d7e_cond,
x_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
x_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
x_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- layer_MUX_uxn_device_h_l177_c3_9d7e
layer_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l177_c3_9d7e_cond,
layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
layer_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- auto_advance_MUX_uxn_device_h_l177_c3_9d7e
auto_advance_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond,
auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- result_MUX_uxn_device_h_l177_c3_9d7e
result_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l177_c3_9d7e_cond,
result_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
result_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
result_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- is_y_valid_MUX_uxn_device_h_l177_c3_9d7e
is_y_valid_MUX_uxn_device_h_l177_c3_9d7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond,
is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue,
is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse,
is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output);

-- x_get_uxn_device_h_l179_c8_cb38
x_get_uxn_device_h_l179_c8_cb38 : entity work.x_get_0CLK_72b31180 port map (
clk,
x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE,
x_get_uxn_device_h_l179_c8_cb38_return_output);

-- y_get_uxn_device_h_l180_c8_b0d3
y_get_uxn_device_h_l180_c8_b0d3 : entity work.y_get_0CLK_72b31180 port map (
clk,
y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE,
y_get_uxn_device_h_l180_c8_b0d3_return_output);

-- BIN_OP_LT_uxn_device_h_l181_c17_bc19
BIN_OP_LT_uxn_device_h_l181_c17_bc19 : entity work.BIN_OP_LT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l181_c17_bc19_left,
BIN_OP_LT_uxn_device_h_l181_c17_bc19_right,
BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output);

-- BIN_OP_LT_uxn_device_h_l182_c17_170b
BIN_OP_LT_uxn_device_h_l182_c17_170b : entity work.BIN_OP_LT_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_device_h_l182_c17_170b_left,
BIN_OP_LT_uxn_device_h_l182_c17_170b_right,
BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output);

-- BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7
BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7 : entity work.BIN_OP_PLUS_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left,
BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right,
BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output);

-- peek_dev_uxn_device_h_l183_c16_fee4
peek_dev_uxn_device_h_l183_c16_fee4 : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE,
peek_dev_uxn_device_h_l183_c16_fee4_address,
peek_dev_uxn_device_h_l183_c16_fee4_return_output);

-- BIN_OP_EQ_uxn_device_h_l185_c12_e839
BIN_OP_EQ_uxn_device_h_l185_c12_e839 : entity work.BIN_OP_EQ_uint4_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l185_c12_e839_left,
BIN_OP_EQ_uxn_device_h_l185_c12_e839_right,
BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output);

-- is_fill_mode_MUX_uxn_device_h_l185_c8_5e02
is_fill_mode_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond,
is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue,
is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse,
is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- color_MUX_uxn_device_h_l185_c8_5e02
color_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l185_c8_5e02_cond,
color_MUX_uxn_device_h_l185_c8_5e02_iftrue,
color_MUX_uxn_device_h_l185_c8_5e02_iffalse,
color_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- draw_ctrl_MUX_uxn_device_h_l185_c8_5e02
draw_ctrl_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond,
draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue,
draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse,
draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- y_MUX_uxn_device_h_l185_c8_5e02
y_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l185_c8_5e02_cond,
y_MUX_uxn_device_h_l185_c8_5e02_iftrue,
y_MUX_uxn_device_h_l185_c8_5e02_iffalse,
y_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- x_MUX_uxn_device_h_l185_c8_5e02
x_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l185_c8_5e02_cond,
x_MUX_uxn_device_h_l185_c8_5e02_iftrue,
x_MUX_uxn_device_h_l185_c8_5e02_iffalse,
x_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- layer_MUX_uxn_device_h_l185_c8_5e02
layer_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l185_c8_5e02_cond,
layer_MUX_uxn_device_h_l185_c8_5e02_iftrue,
layer_MUX_uxn_device_h_l185_c8_5e02_iffalse,
layer_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- auto_advance_MUX_uxn_device_h_l185_c8_5e02
auto_advance_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond,
auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue,
auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse,
auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- result_MUX_uxn_device_h_l185_c8_5e02
result_MUX_uxn_device_h_l185_c8_5e02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l185_c8_5e02_cond,
result_MUX_uxn_device_h_l185_c8_5e02_iftrue,
result_MUX_uxn_device_h_l185_c8_5e02_iffalse,
result_MUX_uxn_device_h_l185_c8_5e02_return_output);

-- BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3
BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3 : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left,
BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right,
BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output);

-- peek_dev_uxn_device_h_l186_c16_8add
peek_dev_uxn_device_h_l186_c16_8add : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE,
peek_dev_uxn_device_h_l186_c16_8add_address,
peek_dev_uxn_device_h_l186_c16_8add_return_output);

-- BIN_OP_AND_uxn_device_h_l187_c12_1a54
BIN_OP_AND_uxn_device_h_l187_c12_1a54 : entity work.BIN_OP_AND_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l187_c12_1a54_left,
BIN_OP_AND_uxn_device_h_l187_c12_1a54_right,
BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output);

-- BIN_OP_AND_uxn_device_h_l188_c19_bb80
BIN_OP_AND_uxn_device_h_l188_c19_bb80 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l188_c19_bb80_left,
BIN_OP_AND_uxn_device_h_l188_c19_bb80_right,
BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output);

-- BIN_OP_AND_uxn_device_h_l189_c13_c0ea
BIN_OP_AND_uxn_device_h_l189_c13_c0ea : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left,
BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right,
BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output);

-- MUX_uxn_device_h_l189_c13_162b
MUX_uxn_device_h_l189_c13_162b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l189_c13_162b_cond,
MUX_uxn_device_h_l189_c13_162b_iftrue,
MUX_uxn_device_h_l189_c13_162b_iffalse,
MUX_uxn_device_h_l189_c13_162b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output);

-- BIN_OP_AND_uxn_device_h_l194_c8_628c
BIN_OP_AND_uxn_device_h_l194_c8_628c : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l194_c8_628c_left,
BIN_OP_AND_uxn_device_h_l194_c8_628c_right,
BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output);

-- BIN_OP_EQ_uxn_device_h_l207_c12_f8a4
BIN_OP_EQ_uxn_device_h_l207_c12_f8a4 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left,
BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right,
BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output);

-- y_MUX_uxn_device_h_l207_c8_f698
y_MUX_uxn_device_h_l207_c8_f698 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l207_c8_f698_cond,
y_MUX_uxn_device_h_l207_c8_f698_iftrue,
y_MUX_uxn_device_h_l207_c8_f698_iffalse,
y_MUX_uxn_device_h_l207_c8_f698_return_output);

-- x_MUX_uxn_device_h_l207_c8_f698
x_MUX_uxn_device_h_l207_c8_f698 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l207_c8_f698_cond,
x_MUX_uxn_device_h_l207_c8_f698_iftrue,
x_MUX_uxn_device_h_l207_c8_f698_iffalse,
x_MUX_uxn_device_h_l207_c8_f698_return_output);

-- auto_advance_MUX_uxn_device_h_l207_c8_f698
auto_advance_MUX_uxn_device_h_l207_c8_f698 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l207_c8_f698_cond,
auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue,
auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse,
auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output);

-- result_MUX_uxn_device_h_l207_c8_f698
result_MUX_uxn_device_h_l207_c8_f698 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l207_c8_f698_cond,
result_MUX_uxn_device_h_l207_c8_f698_iftrue,
result_MUX_uxn_device_h_l207_c8_f698_iffalse,
result_MUX_uxn_device_h_l207_c8_f698_return_output);

-- BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad
BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad : entity work.BIN_OP_PLUS_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left,
BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right,
BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output);

-- peek_dev_uxn_device_h_l208_c19_6b9a
peek_dev_uxn_device_h_l208_c19_6b9a : entity work.peek_dev_0CLK_7bf2eff3 port map (
clk,
peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE,
peek_dev_uxn_device_h_l208_c19_6b9a_address,
peek_dev_uxn_device_h_l208_c19_6b9a_return_output);

-- BIN_OP_AND_uxn_device_h_l209_c8_a15e
BIN_OP_AND_uxn_device_h_l209_c8_a15e : entity work.BIN_OP_AND_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l209_c8_a15e_left,
BIN_OP_AND_uxn_device_h_l209_c8_a15e_right,
BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output);

-- x_MUX_uxn_device_h_l209_c4_1ae1
x_MUX_uxn_device_h_l209_c4_1ae1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l209_c4_1ae1_cond,
x_MUX_uxn_device_h_l209_c4_1ae1_iftrue,
x_MUX_uxn_device_h_l209_c4_1ae1_iffalse,
x_MUX_uxn_device_h_l209_c4_1ae1_return_output);

-- BIN_OP_PLUS_uxn_device_h_l210_c5_9c89
BIN_OP_PLUS_uxn_device_h_l210_c5_9c89 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left,
BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right,
BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output);

-- x_set_uxn_device_h_l211_c5_9f85
x_set_uxn_device_h_l211_c5_9f85 : entity work.x_set_0CLK_de264c78 port map (
x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE,
x_set_uxn_device_h_l211_c5_9f85_value);

-- BIN_OP_AND_uxn_device_h_l214_c8_9009
BIN_OP_AND_uxn_device_h_l214_c8_9009 : entity work.BIN_OP_AND_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l214_c8_9009_left,
BIN_OP_AND_uxn_device_h_l214_c8_9009_right,
BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output);

-- y_MUX_uxn_device_h_l214_c4_57e3
y_MUX_uxn_device_h_l214_c4_57e3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l214_c4_57e3_cond,
y_MUX_uxn_device_h_l214_c4_57e3_iftrue,
y_MUX_uxn_device_h_l214_c4_57e3_iffalse,
y_MUX_uxn_device_h_l214_c4_57e3_return_output);

-- BIN_OP_PLUS_uxn_device_h_l215_c5_8370
BIN_OP_PLUS_uxn_device_h_l215_c5_8370 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left,
BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right,
BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output);

-- y_set_uxn_device_h_l216_c5_e8ac
y_set_uxn_device_h_l216_c5_e8ac : entity work.y_set_0CLK_de264c78 port map (
y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE,
y_set_uxn_device_h_l216_c5_e8ac_value);

-- BIN_OP_EQ_uxn_device_h_l219_c12_5769
BIN_OP_EQ_uxn_device_h_l219_c12_5769 : entity work.BIN_OP_EQ_uint4_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l219_c12_5769_left,
BIN_OP_EQ_uxn_device_h_l219_c12_5769_right,
BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output);

-- result_MUX_uxn_device_h_l219_c8_334b
result_MUX_uxn_device_h_l219_c8_334b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l219_c8_334b_cond,
result_MUX_uxn_device_h_l219_c8_334b_iftrue,
result_MUX_uxn_device_h_l219_c8_334b_iffalse,
result_MUX_uxn_device_h_l219_c8_334b_return_output);

-- BIN_OP_EQ_uxn_device_h_l223_c11_5eeb
BIN_OP_EQ_uxn_device_h_l223_c11_5eeb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left,
BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right,
BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output);

-- result_MUX_uxn_device_h_l223_c7_bf8c
result_MUX_uxn_device_h_l223_c7_bf8c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l223_c7_bf8c_cond,
result_MUX_uxn_device_h_l223_c7_bf8c_iftrue,
result_MUX_uxn_device_h_l223_c7_bf8c_iffalse,
result_MUX_uxn_device_h_l223_c7_bf8c_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 device_base_address,
 device_port,
 -- Registers
 x,
 y,
 draw_ctrl,
 color,
 auto_advance,
 is_fill_mode,
 layer,
 is_x_valid,
 is_y_valid,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output,
 is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output,
 color_MUX_uxn_device_h_l174_c2_e967_return_output,
 is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output,
 draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output,
 y_MUX_uxn_device_h_l174_c2_e967_return_output,
 x_MUX_uxn_device_h_l174_c2_e967_return_output,
 layer_MUX_uxn_device_h_l174_c2_e967_return_output,
 auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output,
 result_MUX_uxn_device_h_l174_c2_e967_return_output,
 is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output,
 BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output,
 is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output,
 color_MUX_uxn_device_h_l175_c7_d569_return_output,
 is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output,
 draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output,
 y_MUX_uxn_device_h_l175_c7_d569_return_output,
 x_MUX_uxn_device_h_l175_c7_d569_return_output,
 layer_MUX_uxn_device_h_l175_c7_d569_return_output,
 auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output,
 result_MUX_uxn_device_h_l175_c7_d569_return_output,
 is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output,
 BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output,
 is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output,
 color_MUX_uxn_device_h_l176_c7_302a_return_output,
 is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output,
 draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output,
 y_MUX_uxn_device_h_l176_c7_302a_return_output,
 x_MUX_uxn_device_h_l176_c7_302a_return_output,
 layer_MUX_uxn_device_h_l176_c7_302a_return_output,
 auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output,
 result_MUX_uxn_device_h_l176_c7_302a_return_output,
 is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output,
 BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output,
 is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 color_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 y_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 x_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 layer_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 result_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output,
 x_get_uxn_device_h_l179_c8_cb38_return_output,
 y_get_uxn_device_h_l180_c8_b0d3_return_output,
 BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output,
 BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output,
 BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output,
 peek_dev_uxn_device_h_l183_c16_fee4_return_output,
 BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output,
 is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output,
 color_MUX_uxn_device_h_l185_c8_5e02_return_output,
 draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output,
 y_MUX_uxn_device_h_l185_c8_5e02_return_output,
 x_MUX_uxn_device_h_l185_c8_5e02_return_output,
 layer_MUX_uxn_device_h_l185_c8_5e02_return_output,
 auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output,
 result_MUX_uxn_device_h_l185_c8_5e02_return_output,
 BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output,
 peek_dev_uxn_device_h_l186_c16_8add_return_output,
 BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output,
 BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output,
 BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output,
 MUX_uxn_device_h_l189_c13_162b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output,
 BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output,
 BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output,
 y_MUX_uxn_device_h_l207_c8_f698_return_output,
 x_MUX_uxn_device_h_l207_c8_f698_return_output,
 auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output,
 result_MUX_uxn_device_h_l207_c8_f698_return_output,
 BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output,
 peek_dev_uxn_device_h_l208_c19_6b9a_return_output,
 BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output,
 x_MUX_uxn_device_h_l209_c4_1ae1_return_output,
 BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output,
 BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output,
 y_MUX_uxn_device_h_l214_c4_57e3_return_output,
 BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output,
 BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output,
 result_MUX_uxn_device_h_l219_c8_334b_return_output,
 BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output,
 result_MUX_uxn_device_h_l223_c7_bf8c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : unsigned(0 downto 0);
 variable VAR_phase : unsigned(3 downto 0);
 variable VAR_device_base_address : unsigned(7 downto 0);
 variable VAR_device_port : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l223_c7_bf8c_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l185_c8_5e02_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond : unsigned(0 downto 0);
 variable VAR_x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_x_get_uxn_device_h_l179_c8_cb38_return_output : unsigned(15 downto 0);
 variable VAR_y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_y_get_uxn_device_h_l180_c8_b0d3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l183_c16_fee4_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output : unsigned(8 downto 0);
 variable VAR_peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l183_c16_fee4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_uxn_device_h_l188_c4_8b0d : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
 variable VAR_color_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
 variable VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l185_c8_5e02_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l185_c8_5e02_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l207_c8_f698_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l185_c8_5e02_cond : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l186_c16_8add_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output : unsigned(8 downto 0);
 variable VAR_peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l189_c13_162b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l189_c13_162b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l189_c13_162b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l189_c13_162b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_uxn_device_h_l194_c5_61f6 : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l214_c4_57e3_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l209_c4_1ae1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l207_c8_f698_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l207_c8_f698_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l219_c8_334b_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l207_c8_f698_cond : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l208_c19_6b9a_address : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output : unsigned(8 downto 0);
 variable VAR_peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_peek_dev_uxn_device_h_l208_c19_6b9a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c4_1ae1_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iftrue : unsigned(15 downto 0);
 variable VAR_x_uxn_device_h_l210_c5_aac5 : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l209_c4_1ae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output : unsigned(16 downto 0);
 variable VAR_x_set_uxn_device_h_l211_c5_9f85_value : unsigned(15 downto 0);
 variable VAR_x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c4_57e3_interm_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l214_c4_57e3_iftrue : unsigned(15 downto 0);
 variable VAR_y_uxn_device_h_l215_c5_36aa : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l214_c4_57e3_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l214_c4_57e3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output : unsigned(16 downto 0);
 variable VAR_y_set_uxn_device_h_l216_c5_e8ac_value : unsigned(15 downto 0);
 variable VAR_y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l219_c8_334b_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l219_c8_334b_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l219_c8_334b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iftrue : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iffalse : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l223_c7_bf8c_cond : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_draw_ctrl : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_is_fill_mode : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_x_valid : unsigned(0 downto 0);
variable REG_VAR_is_y_valid : unsigned(0 downto 0);
variable REG_VAR_result : unsigned(0 downto 0);
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_draw_ctrl := draw_ctrl;
  REG_VAR_color := color;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_is_fill_mode := is_fill_mode;
  REG_VAR_layer := layer;
  REG_VAR_is_x_valid := is_x_valid;
  REG_VAR_is_y_valid := is_y_valid;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right := to_unsigned(2, 2);
     VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_right := to_unsigned(240, 8);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right := to_unsigned(15, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l219_c8_334b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_right := to_unsigned(0, 1);
     VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_right := to_unsigned(2, 2);
     VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_right := to_unsigned(320, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l189_c13_162b_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l189_c13_162b_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l174_c2_e967_iftrue := to_unsigned(1, 1);
     VAR_result_MUX_uxn_device_h_l175_c7_d569_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right := to_unsigned(6, 3);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_device_base_address := device_base_address;
     VAR_device_port := device_port;

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l174_c2_e967_iftrue := color;
     VAR_color_MUX_uxn_device_h_l175_c7_d569_iftrue := color;
     VAR_color_MUX_uxn_device_h_l176_c7_302a_iffalse := color;
     VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iftrue := color;
     VAR_color_MUX_uxn_device_h_l185_c8_5e02_iffalse := color;
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left := VAR_device_base_address;
     VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left := VAR_device_base_address;
     VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left := VAR_device_base_address;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left := VAR_device_port;
     VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue := draw_ctrl;
     VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue := draw_ctrl;
     VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse := draw_ctrl;
     VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse := draw_ctrl;
     VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse := is_fill_mode;
     VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_left := is_x_valid;
     VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue := is_x_valid;
     VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue := is_x_valid;
     VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse := is_x_valid;
     VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse := is_x_valid;
     VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_right := is_y_valid;
     VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue := is_y_valid;
     VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue := is_y_valid;
     VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse := is_y_valid;
     VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse := is_y_valid;
     VAR_layer_MUX_uxn_device_h_l174_c2_e967_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l175_c7_d569_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l176_c7_302a_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_left := VAR_phase;
     VAR_result_MUX_uxn_device_h_l185_c8_5e02_iftrue := result;
     VAR_result_MUX_uxn_device_h_l207_c8_f698_iftrue := result;
     VAR_result_MUX_uxn_device_h_l219_c8_334b_iffalse := result;
     VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iffalse := result;
     VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left := x;
     VAR_x_MUX_uxn_device_h_l174_c2_e967_iftrue := x;
     VAR_x_MUX_uxn_device_h_l175_c7_d569_iftrue := x;
     VAR_x_MUX_uxn_device_h_l176_c7_302a_iffalse := x;
     VAR_x_MUX_uxn_device_h_l185_c8_5e02_iftrue := x;
     VAR_x_MUX_uxn_device_h_l207_c8_f698_iffalse := x;
     VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iffalse := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left := y;
     VAR_y_MUX_uxn_device_h_l174_c2_e967_iftrue := y;
     VAR_y_MUX_uxn_device_h_l175_c7_d569_iftrue := y;
     VAR_y_MUX_uxn_device_h_l176_c7_302a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l185_c8_5e02_iftrue := y;
     VAR_y_MUX_uxn_device_h_l207_c8_f698_iffalse := y;
     VAR_y_MUX_uxn_device_h_l214_c4_57e3_iffalse := y;
     -- BIN_OP_EQ[uxn_device_h_l223_c11_5eeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left <= VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_left;
     BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right <= VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output := BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l175_c11_b660] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l175_c11_b660_left <= VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_left;
     BIN_OP_EQ_uxn_device_h_l175_c11_b660_right <= VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output := BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l186_c25_d3b3] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left <= VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_left;
     BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right <= VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output := BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l207_c12_f8a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_left;
     BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output := BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l183_c25_1bc7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_left;
     BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output := BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l176_c11_4e56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left <= VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_left;
     BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right <= VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output := BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;

     -- BIN_OP_AND[uxn_device_h_l194_c8_628c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l194_c8_628c_left <= VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_left;
     BIN_OP_AND_uxn_device_h_l194_c8_628c_right <= VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output := BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l177_c7_0506] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l177_c7_0506_left <= VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_left;
     BIN_OP_EQ_uxn_device_h_l177_c7_0506_right <= VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output := BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l215_c5_8370] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_left;
     BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right <= VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output := BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l210_c5_9c89] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left <= VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_left;
     BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right <= VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output := BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output;

     -- BIN_OP_EQ[uxn_device_h_l185_c12_e839] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l185_c12_e839_left <= VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_left;
     BIN_OP_EQ_uxn_device_h_l185_c12_e839_right <= VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output := BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;

     -- BIN_OP_EQ[uxn_device_h_l219_c12_5769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l219_c12_5769_left <= VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_left;
     BIN_OP_EQ_uxn_device_h_l219_c12_5769_right <= VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output := BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l208_c28_a8ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left <= VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_left;
     BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right <= VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output := BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c6_80c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_left;
     BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output := BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond := VAR_BIN_OP_AND_uxn_device_h_l194_c8_628c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_color_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_layer_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_result_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_x_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_y_MUX_uxn_device_h_l174_c2_e967_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c6_80c3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_color_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_layer_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_result_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_x_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_y_MUX_uxn_device_h_l175_c7_d569_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c11_b660_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_color_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_layer_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_result_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_x_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_y_MUX_uxn_device_h_l176_c7_302a_cond := VAR_BIN_OP_EQ_uxn_device_h_l176_c11_4e56_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_color_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_result_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_x_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_y_MUX_uxn_device_h_l177_c3_9d7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c7_0506_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_color_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_layer_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_result_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_x_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_y_MUX_uxn_device_h_l185_c8_5e02_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c12_e839_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;
     VAR_result_MUX_uxn_device_h_l207_c8_f698_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;
     VAR_x_MUX_uxn_device_h_l207_c8_f698_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;
     VAR_y_MUX_uxn_device_h_l207_c8_f698_cond := VAR_BIN_OP_EQ_uxn_device_h_l207_c12_f8a4_return_output;
     VAR_result_MUX_uxn_device_h_l219_c8_334b_cond := VAR_BIN_OP_EQ_uxn_device_h_l219_c12_5769_return_output;
     VAR_result_MUX_uxn_device_h_l223_c7_bf8c_cond := VAR_BIN_OP_EQ_uxn_device_h_l223_c11_5eeb_return_output;
     VAR_peek_dev_uxn_device_h_l183_c16_fee4_address := resize(VAR_BIN_OP_PLUS_uxn_device_h_l183_c25_1bc7_return_output, 8);
     VAR_peek_dev_uxn_device_h_l186_c16_8add_address := resize(VAR_BIN_OP_PLUS_uxn_device_h_l186_c25_d3b3_return_output, 8);
     VAR_peek_dev_uxn_device_h_l208_c19_6b9a_address := resize(VAR_BIN_OP_PLUS_uxn_device_h_l208_c28_a8ad_return_output, 8);
     VAR_x_uxn_device_h_l210_c5_aac5 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l210_c5_9c89_return_output, 16);
     VAR_y_uxn_device_h_l215_c5_36aa := resize(VAR_BIN_OP_PLUS_uxn_device_h_l215_c5_8370_return_output, 16);
     VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iftrue := VAR_x_uxn_device_h_l210_c5_aac5;
     VAR_x_set_uxn_device_h_l211_c5_9f85_value := VAR_x_uxn_device_h_l210_c5_aac5;
     VAR_y_MUX_uxn_device_h_l214_c4_57e3_iftrue := VAR_y_uxn_device_h_l215_c5_36aa;
     VAR_y_set_uxn_device_h_l216_c5_e8ac_value := VAR_y_uxn_device_h_l215_c5_36aa;
     -- result_MUX[uxn_device_h_l223_c7_bf8c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l223_c7_bf8c_cond <= VAR_result_MUX_uxn_device_h_l223_c7_bf8c_cond;
     result_MUX_uxn_device_h_l223_c7_bf8c_iftrue <= VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iftrue;
     result_MUX_uxn_device_h_l223_c7_bf8c_iffalse <= VAR_result_MUX_uxn_device_h_l223_c7_bf8c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l223_c7_bf8c_return_output := result_MUX_uxn_device_h_l223_c7_bf8c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- result_MUX[uxn_device_h_l219_c8_334b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l219_c8_334b_cond <= VAR_result_MUX_uxn_device_h_l219_c8_334b_cond;
     result_MUX_uxn_device_h_l219_c8_334b_iftrue <= VAR_result_MUX_uxn_device_h_l219_c8_334b_iftrue;
     result_MUX_uxn_device_h_l219_c8_334b_iffalse <= VAR_result_MUX_uxn_device_h_l219_c8_334b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l219_c8_334b_return_output := result_MUX_uxn_device_h_l219_c8_334b_return_output;

     -- Submodule level 2
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_result_MUX_uxn_device_h_l207_c8_f698_iffalse := VAR_result_MUX_uxn_device_h_l219_c8_334b_return_output;
     VAR_result_MUX_uxn_device_h_l176_c7_302a_iffalse := VAR_result_MUX_uxn_device_h_l223_c7_bf8c_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- result_MUX[uxn_device_h_l207_c8_f698] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l207_c8_f698_cond <= VAR_result_MUX_uxn_device_h_l207_c8_f698_cond;
     result_MUX_uxn_device_h_l207_c8_f698_iftrue <= VAR_result_MUX_uxn_device_h_l207_c8_f698_iftrue;
     result_MUX_uxn_device_h_l207_c8_f698_iffalse <= VAR_result_MUX_uxn_device_h_l207_c8_f698_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l207_c8_f698_return_output := result_MUX_uxn_device_h_l207_c8_f698_return_output;

     -- Submodule level 3
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_result_MUX_uxn_device_h_l185_c8_5e02_iffalse := VAR_result_MUX_uxn_device_h_l207_c8_f698_return_output;
     -- result_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_result_MUX_uxn_device_h_l185_c8_5e02_cond;
     result_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_result_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     result_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_result_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l185_c8_5e02_return_output := result_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l176_c1_2599] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l176_c1_2599_return_output;
     VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_result_MUX_uxn_device_h_l185_c8_5e02_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l177_c1_c660] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output;

     -- result_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_result_MUX_uxn_device_h_l177_c3_9d7e_cond;
     result_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     result_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_result_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l177_c3_9d7e_return_output := result_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output;
     VAR_x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output;
     VAR_y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l177_c1_c660_return_output;
     VAR_result_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_result_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c8_f698] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output;

     -- peek_dev[uxn_device_h_l183_c16_fee4] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l183_c16_fee4_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l183_c16_fee4_address <= VAR_peek_dev_uxn_device_h_l183_c16_fee4_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l183_c16_fee4_return_output := peek_dev_uxn_device_h_l183_c16_fee4_return_output;

     -- result_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_result_MUX_uxn_device_h_l176_c7_302a_cond;
     result_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_result_MUX_uxn_device_h_l176_c7_302a_iftrue;
     result_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_result_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l176_c7_302a_return_output := result_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- x_get[uxn_device_h_l179_c8_cb38] LATENCY=0
     -- Clock enable
     x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE <= VAR_x_get_uxn_device_h_l179_c8_cb38_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_x_get_uxn_device_h_l179_c8_cb38_return_output := x_get_uxn_device_h_l179_c8_cb38_return_output;

     -- y_get[uxn_device_h_l180_c8_b0d3] LATENCY=0
     -- Clock enable
     y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE <= VAR_y_get_uxn_device_h_l180_c8_b0d3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs
     VAR_y_get_uxn_device_h_l180_c8_b0d3_return_output := y_get_uxn_device_h_l180_c8_b0d3_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l185_c1_9e6f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output;

     -- Submodule level 6
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c8_f698_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output;
     VAR_peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l185_c1_9e6f_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue := VAR_peek_dev_uxn_device_h_l183_c16_fee4_return_output;
     VAR_result_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_result_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_left := VAR_x_get_uxn_device_h_l179_c8_cb38_return_output;
     VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iftrue := VAR_x_get_uxn_device_h_l179_c8_cb38_return_output;
     VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_left := VAR_y_get_uxn_device_h_l180_c8_b0d3_return_output;
     VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iftrue := VAR_y_get_uxn_device_h_l180_c8_b0d3_return_output;
     -- peek_dev[uxn_device_h_l186_c16_8add] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l186_c16_8add_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l186_c16_8add_address <= VAR_peek_dev_uxn_device_h_l186_c16_8add_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output := peek_dev_uxn_device_h_l186_c16_8add_return_output;

     -- BIN_OP_LT[uxn_device_h_l182_c17_170b] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l182_c17_170b_left <= VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_left;
     BIN_OP_LT_uxn_device_h_l182_c17_170b_right <= VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output := BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output;

     -- BIN_OP_LT[uxn_device_h_l181_c17_bc19] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_device_h_l181_c17_bc19_left <= VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_left;
     BIN_OP_LT_uxn_device_h_l181_c17_bc19_right <= VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output := BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l207_c1_0033] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output;

     -- result_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_result_MUX_uxn_device_h_l175_c7_d569_cond;
     result_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_result_MUX_uxn_device_h_l175_c7_d569_iftrue;
     result_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_result_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l175_c7_d569_return_output := result_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- Submodule level 7
     VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue := VAR_BIN_OP_LT_uxn_device_h_l181_c17_bc19_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue := VAR_BIN_OP_LT_uxn_device_h_l182_c17_170b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output;
     VAR_peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l207_c1_0033_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_left := VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_left := VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left := VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue := VAR_peek_dev_uxn_device_h_l186_c16_8add_return_output;
     VAR_result_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_result_MUX_uxn_device_h_l175_c7_d569_return_output;
     -- result_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_result_MUX_uxn_device_h_l174_c2_e967_cond;
     result_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_result_MUX_uxn_device_h_l174_c2_e967_iftrue;
     result_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_result_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l174_c2_e967_return_output := result_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- BIN_OP_AND[uxn_device_h_l188_c19_bb80] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l188_c19_bb80_left <= VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_left;
     BIN_OP_AND_uxn_device_h_l188_c19_bb80_right <= VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output := BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output;

     -- BIN_OP_AND[uxn_device_h_l189_c13_c0ea] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left <= VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_left;
     BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right <= VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output := BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output;

     -- peek_dev[uxn_device_h_l208_c19_6b9a] LATENCY=0
     -- Clock enable
     peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE <= VAR_peek_dev_uxn_device_h_l208_c19_6b9a_CLOCK_ENABLE;
     -- Inputs
     peek_dev_uxn_device_h_l208_c19_6b9a_address <= VAR_peek_dev_uxn_device_h_l208_c19_6b9a_address;
     -- Outputs
     VAR_peek_dev_uxn_device_h_l208_c19_6b9a_return_output := peek_dev_uxn_device_h_l208_c19_6b9a_return_output;

     -- BIN_OP_AND[uxn_device_h_l187_c12_1a54] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l187_c12_1a54_left <= VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_left;
     BIN_OP_AND_uxn_device_h_l187_c12_1a54_right <= VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output := BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output;

     -- is_y_valid_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_cond;
     is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output := is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- is_x_valid_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_cond;
     is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output := is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- draw_ctrl_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_cond;
     draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output := draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- Submodule level 8
     VAR_color_MUX_uxn_device_h_l185_c8_5e02_iftrue := VAR_BIN_OP_AND_uxn_device_h_l187_c12_1a54_return_output;
     VAR_is_fill_mode_uxn_device_h_l188_c4_8b0d := resize(VAR_BIN_OP_AND_uxn_device_h_l188_c19_bb80_return_output, 1);
     VAR_MUX_uxn_device_h_l189_c13_162b_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l189_c13_c0ea_return_output, 1);
     VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_draw_ctrl_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_is_x_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_is_y_valid_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_left := VAR_peek_dev_uxn_device_h_l208_c19_6b9a_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_left := VAR_peek_dev_uxn_device_h_l208_c19_6b9a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue := VAR_peek_dev_uxn_device_h_l208_c19_6b9a_return_output;
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond := VAR_is_fill_mode_uxn_device_h_l188_c4_8b0d;
     VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue := VAR_is_fill_mode_uxn_device_h_l188_c4_8b0d;
     -- color_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_color_MUX_uxn_device_h_l185_c8_5e02_cond;
     color_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_color_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     color_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_color_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l185_c8_5e02_return_output := color_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- MUX[uxn_device_h_l189_c13_162b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l189_c13_162b_cond <= VAR_MUX_uxn_device_h_l189_c13_162b_cond;
     MUX_uxn_device_h_l189_c13_162b_iftrue <= VAR_MUX_uxn_device_h_l189_c13_162b_iftrue;
     MUX_uxn_device_h_l189_c13_162b_iffalse <= VAR_MUX_uxn_device_h_l189_c13_162b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l189_c13_162b_return_output := MUX_uxn_device_h_l189_c13_162b_return_output;

     -- auto_advance_MUX[uxn_device_h_l207_c8_f698] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l207_c8_f698_cond <= VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_cond;
     auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iftrue;
     auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output := auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output;

     -- draw_ctrl_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_cond;
     draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output := draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- BIN_OP_AND[uxn_device_h_l209_c8_a15e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l209_c8_a15e_left <= VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_left;
     BIN_OP_AND_uxn_device_h_l209_c8_a15e_right <= VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output := BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output;

     -- is_x_valid_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_cond;
     is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iftrue;
     is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output := is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_cond;
     is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output := is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- is_y_valid_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_cond;
     is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iftrue;
     is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output := is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- BIN_OP_AND[uxn_device_h_l214_c8_9009] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l214_c8_9009_left <= VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_left;
     BIN_OP_AND_uxn_device_h_l214_c8_9009_right <= VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output := BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l193_c1_ec1c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output;

     -- Submodule level 9
     VAR_MUX_uxn_device_h_l209_c4_1ae1_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l209_c8_a15e_return_output, 1);
     VAR_MUX_uxn_device_h_l214_c4_57e3_interm_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l214_c8_9009_return_output, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l193_c1_ec1c_return_output;
     VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iftrue := VAR_MUX_uxn_device_h_l189_c13_162b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse := VAR_auto_advance_MUX_uxn_device_h_l207_c8_f698_return_output;
     VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_color_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_draw_ctrl_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_is_x_valid_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_is_y_valid_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond := VAR_MUX_uxn_device_h_l209_c4_1ae1_interm_cond;
     VAR_x_MUX_uxn_device_h_l209_c4_1ae1_cond := VAR_MUX_uxn_device_h_l209_c4_1ae1_interm_cond;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond := VAR_MUX_uxn_device_h_l214_c4_57e3_interm_cond;
     VAR_y_MUX_uxn_device_h_l214_c4_57e3_cond := VAR_MUX_uxn_device_h_l214_c4_57e3_interm_cond;
     -- is_fill_mode_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_cond;
     is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output := is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- y_MUX[uxn_device_h_l214_c4_57e3] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l214_c4_57e3_cond <= VAR_y_MUX_uxn_device_h_l214_c4_57e3_cond;
     y_MUX_uxn_device_h_l214_c4_57e3_iftrue <= VAR_y_MUX_uxn_device_h_l214_c4_57e3_iftrue;
     y_MUX_uxn_device_h_l214_c4_57e3_iffalse <= VAR_y_MUX_uxn_device_h_l214_c4_57e3_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l214_c4_57e3_return_output := y_MUX_uxn_device_h_l214_c4_57e3_return_output;

     -- draw_ctrl_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_cond;
     draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iftrue;
     draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output := draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- x_MUX[uxn_device_h_l209_c4_1ae1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l209_c4_1ae1_cond <= VAR_x_MUX_uxn_device_h_l209_c4_1ae1_cond;
     x_MUX_uxn_device_h_l209_c4_1ae1_iftrue <= VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iftrue;
     x_MUX_uxn_device_h_l209_c4_1ae1_iffalse <= VAR_x_MUX_uxn_device_h_l209_c4_1ae1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l209_c4_1ae1_return_output := x_MUX_uxn_device_h_l209_c4_1ae1_return_output;

     -- is_x_valid_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_cond;
     is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iftrue;
     is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output := is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- is_y_valid_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_cond;
     is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iftrue;
     is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output := is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- color_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_color_MUX_uxn_device_h_l177_c3_9d7e_cond;
     color_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     color_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_color_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l177_c3_9d7e_return_output := color_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- layer_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_layer_MUX_uxn_device_h_l185_c8_5e02_cond;
     layer_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     layer_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_layer_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l185_c8_5e02_return_output := layer_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l214_c1_6b3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l194_c1_417f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l209_c1_1d35] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output;

     -- auto_advance_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_cond;
     auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output := auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- Submodule level 10
     VAR_TRUE_CLOCK_ENABLE_uxn_device_h_l194_c5_61f6 := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l194_c1_417f_return_output;
     VAR_x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l209_c1_1d35_return_output;
     VAR_y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l214_c1_6b3c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_color_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_color_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_draw_ctrl_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_is_x_valid_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_is_y_valid_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_layer_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_x_MUX_uxn_device_h_l207_c8_f698_iftrue := VAR_x_MUX_uxn_device_h_l209_c4_1ae1_return_output;
     VAR_y_MUX_uxn_device_h_l207_c8_f698_iftrue := VAR_y_MUX_uxn_device_h_l214_c4_57e3_return_output;
     -- x_MUX[uxn_device_h_l207_c8_f698] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l207_c8_f698_cond <= VAR_x_MUX_uxn_device_h_l207_c8_f698_cond;
     x_MUX_uxn_device_h_l207_c8_f698_iftrue <= VAR_x_MUX_uxn_device_h_l207_c8_f698_iftrue;
     x_MUX_uxn_device_h_l207_c8_f698_iffalse <= VAR_x_MUX_uxn_device_h_l207_c8_f698_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l207_c8_f698_return_output := x_MUX_uxn_device_h_l207_c8_f698_return_output;

     -- is_y_valid_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_cond;
     is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iftrue;
     is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output := is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- y_set[uxn_device_h_l216_c5_e8ac] LATENCY=0
     -- Clock enable
     y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE <= VAR_y_set_uxn_device_h_l216_c5_e8ac_CLOCK_ENABLE;
     -- Inputs
     y_set_uxn_device_h_l216_c5_e8ac_value <= VAR_y_set_uxn_device_h_l216_c5_e8ac_value;
     -- Outputs

     -- auto_advance_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_cond;
     auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output := auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- x_set[uxn_device_h_l211_c5_9f85] LATENCY=0
     -- Clock enable
     x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE <= VAR_x_set_uxn_device_h_l211_c5_9f85_CLOCK_ENABLE;
     -- Inputs
     x_set_uxn_device_h_l211_c5_9f85_value <= VAR_x_set_uxn_device_h_l211_c5_9f85_value;
     -- Outputs

     -- y_MUX[uxn_device_h_l207_c8_f698] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l207_c8_f698_cond <= VAR_y_MUX_uxn_device_h_l207_c8_f698_cond;
     y_MUX_uxn_device_h_l207_c8_f698_iftrue <= VAR_y_MUX_uxn_device_h_l207_c8_f698_iftrue;
     y_MUX_uxn_device_h_l207_c8_f698_iffalse <= VAR_y_MUX_uxn_device_h_l207_c8_f698_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l207_c8_f698_return_output := y_MUX_uxn_device_h_l207_c8_f698_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_cond;
     is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iftrue;
     is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output := is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- draw_ctrl_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_cond;
     draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iftrue;
     draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output := draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- layer_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_cond;
     layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_return_output := layer_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- color_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_color_MUX_uxn_device_h_l176_c7_302a_cond;
     color_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_color_MUX_uxn_device_h_l176_c7_302a_iftrue;
     color_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_color_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l176_c7_302a_return_output := color_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- is_x_valid_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_cond;
     is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iftrue;
     is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output := is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- Submodule level 11
     VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_auto_advance_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_color_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_color_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_draw_ctrl_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l176_c7_302a_return_output;
     REG_VAR_is_x_valid := VAR_is_x_valid_MUX_uxn_device_h_l174_c2_e967_return_output;
     REG_VAR_is_y_valid := VAR_is_y_valid_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_layer_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_layer_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_x_MUX_uxn_device_h_l185_c8_5e02_iffalse := VAR_x_MUX_uxn_device_h_l207_c8_f698_return_output;
     VAR_y_MUX_uxn_device_h_l185_c8_5e02_iffalse := VAR_y_MUX_uxn_device_h_l207_c8_f698_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_cond;
     is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iftrue;
     is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output := is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- color_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_color_MUX_uxn_device_h_l175_c7_d569_cond;
     color_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_color_MUX_uxn_device_h_l175_c7_d569_iftrue;
     color_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_color_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l175_c7_d569_return_output := color_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- draw_ctrl_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_cond;
     draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iftrue;
     draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output := draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- layer_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_layer_MUX_uxn_device_h_l176_c7_302a_cond;
     layer_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_layer_MUX_uxn_device_h_l176_c7_302a_iftrue;
     layer_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_layer_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l176_c7_302a_return_output := layer_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- auto_advance_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_cond;
     auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iftrue;
     auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output := auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- y_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_y_MUX_uxn_device_h_l185_c8_5e02_cond;
     y_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_y_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     y_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_y_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l185_c8_5e02_return_output := y_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- x_MUX[uxn_device_h_l185_c8_5e02] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l185_c8_5e02_cond <= VAR_x_MUX_uxn_device_h_l185_c8_5e02_cond;
     x_MUX_uxn_device_h_l185_c8_5e02_iftrue <= VAR_x_MUX_uxn_device_h_l185_c8_5e02_iftrue;
     x_MUX_uxn_device_h_l185_c8_5e02_iffalse <= VAR_x_MUX_uxn_device_h_l185_c8_5e02_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l185_c8_5e02_return_output := x_MUX_uxn_device_h_l185_c8_5e02_return_output;

     -- Submodule level 12
     VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_auto_advance_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_color_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_color_MUX_uxn_device_h_l175_c7_d569_return_output;
     REG_VAR_draw_ctrl := VAR_draw_ctrl_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_layer_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_layer_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_x_MUX_uxn_device_h_l185_c8_5e02_return_output;
     VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iffalse := VAR_y_MUX_uxn_device_h_l185_c8_5e02_return_output;
     -- x_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_x_MUX_uxn_device_h_l177_c3_9d7e_cond;
     x_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     x_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_x_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l177_c3_9d7e_return_output := x_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- layer_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_layer_MUX_uxn_device_h_l175_c7_d569_cond;
     layer_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_layer_MUX_uxn_device_h_l175_c7_d569_iftrue;
     layer_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_layer_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l175_c7_d569_return_output := layer_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- y_MUX[uxn_device_h_l177_c3_9d7e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c3_9d7e_cond <= VAR_y_MUX_uxn_device_h_l177_c3_9d7e_cond;
     y_MUX_uxn_device_h_l177_c3_9d7e_iftrue <= VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iftrue;
     y_MUX_uxn_device_h_l177_c3_9d7e_iffalse <= VAR_y_MUX_uxn_device_h_l177_c3_9d7e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c3_9d7e_return_output := y_MUX_uxn_device_h_l177_c3_9d7e_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_cond;
     is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iftrue;
     is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output := is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- color_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_color_MUX_uxn_device_h_l174_c2_e967_cond;
     color_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_color_MUX_uxn_device_h_l174_c2_e967_iftrue;
     color_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_color_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l174_c2_e967_return_output := color_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- auto_advance_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_cond;
     auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iftrue;
     auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output := auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- Submodule level 13
     VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_auto_advance_MUX_uxn_device_h_l175_c7_d569_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l174_c2_e967_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_layer_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_layer_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_x_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_x_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     VAR_y_MUX_uxn_device_h_l176_c7_302a_iftrue := VAR_y_MUX_uxn_device_h_l177_c3_9d7e_return_output;
     -- auto_advance_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_cond;
     auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iftrue;
     auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output := auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- x_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_x_MUX_uxn_device_h_l176_c7_302a_cond;
     x_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_x_MUX_uxn_device_h_l176_c7_302a_iftrue;
     x_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_x_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l176_c7_302a_return_output := x_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- layer_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_layer_MUX_uxn_device_h_l174_c2_e967_cond;
     layer_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_layer_MUX_uxn_device_h_l174_c2_e967_iftrue;
     layer_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_layer_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l174_c2_e967_return_output := layer_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- y_MUX[uxn_device_h_l176_c7_302a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l176_c7_302a_cond <= VAR_y_MUX_uxn_device_h_l176_c7_302a_cond;
     y_MUX_uxn_device_h_l176_c7_302a_iftrue <= VAR_y_MUX_uxn_device_h_l176_c7_302a_iftrue;
     y_MUX_uxn_device_h_l176_c7_302a_iffalse <= VAR_y_MUX_uxn_device_h_l176_c7_302a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l176_c7_302a_return_output := y_MUX_uxn_device_h_l176_c7_302a_return_output;

     -- Submodule level 14
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l174_c2_e967_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l174_c2_e967_return_output;
     VAR_x_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_x_MUX_uxn_device_h_l176_c7_302a_return_output;
     VAR_y_MUX_uxn_device_h_l175_c7_d569_iffalse := VAR_y_MUX_uxn_device_h_l176_c7_302a_return_output;
     -- x_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_x_MUX_uxn_device_h_l175_c7_d569_cond;
     x_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_x_MUX_uxn_device_h_l175_c7_d569_iftrue;
     x_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_x_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c7_d569_return_output := x_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- y_MUX[uxn_device_h_l175_c7_d569] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l175_c7_d569_cond <= VAR_y_MUX_uxn_device_h_l175_c7_d569_cond;
     y_MUX_uxn_device_h_l175_c7_d569_iftrue <= VAR_y_MUX_uxn_device_h_l175_c7_d569_iftrue;
     y_MUX_uxn_device_h_l175_c7_d569_iffalse <= VAR_y_MUX_uxn_device_h_l175_c7_d569_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l175_c7_d569_return_output := y_MUX_uxn_device_h_l175_c7_d569_return_output;

     -- Submodule level 15
     VAR_x_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_x_MUX_uxn_device_h_l175_c7_d569_return_output;
     VAR_y_MUX_uxn_device_h_l174_c2_e967_iffalse := VAR_y_MUX_uxn_device_h_l175_c7_d569_return_output;
     -- y_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_y_MUX_uxn_device_h_l174_c2_e967_cond;
     y_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_y_MUX_uxn_device_h_l174_c2_e967_iftrue;
     y_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_y_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l174_c2_e967_return_output := y_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- x_MUX[uxn_device_h_l174_c2_e967] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l174_c2_e967_cond <= VAR_x_MUX_uxn_device_h_l174_c2_e967_cond;
     x_MUX_uxn_device_h_l174_c2_e967_iftrue <= VAR_x_MUX_uxn_device_h_l174_c2_e967_iftrue;
     x_MUX_uxn_device_h_l174_c2_e967_iffalse <= VAR_x_MUX_uxn_device_h_l174_c2_e967_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l174_c2_e967_return_output := x_MUX_uxn_device_h_l174_c2_e967_return_output;

     -- Submodule level 16
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l174_c2_e967_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l174_c2_e967_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_draw_ctrl <= REG_VAR_draw_ctrl;
REG_COMB_color <= REG_VAR_color;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_is_fill_mode <= REG_VAR_is_fill_mode;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_x_valid <= REG_VAR_is_x_valid;
REG_COMB_is_y_valid <= REG_VAR_is_y_valid;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     draw_ctrl <= REG_COMB_draw_ctrl;
     color <= REG_COMB_color;
     auto_advance <= REG_COMB_auto_advance;
     is_fill_mode <= REG_COMB_is_fill_mode;
     layer <= REG_COMB_layer;
     is_x_valid <= REG_COMB_is_x_valid;
     is_y_valid <= REG_COMB_is_y_valid;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
