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
-- Submodules: 207
entity pixel_deo_0CLK_324ea393 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end pixel_deo_0CLK_324ea393;
architecture arch of pixel_deo_0CLK_324ea393 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal x : unsigned(7 downto 0) := to_unsigned(0, 8);
signal y : unsigned(7 downto 0) := to_unsigned(0, 8);
signal ctrl : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8b : unsigned(7 downto 0) := to_unsigned(0, 8);
signal phase4 : unsigned(3 downto 0) := to_unsigned(0, 4);
signal color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal ctrl_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal flip_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_x : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_auto_y : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_x_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal is_y_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
u16_addr => to_unsigned(0, 16),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_x : unsigned(7 downto 0);
signal REG_COMB_y : unsigned(7 downto 0);
signal REG_COMB_ctrl : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_tmp8b : unsigned(7 downto 0);
signal REG_COMB_phase4 : unsigned(3 downto 0);
signal REG_COMB_color : unsigned(1 downto 0);
signal REG_COMB_ctrl_mode : unsigned(0 downto 0);
signal REG_COMB_flip_x : unsigned(0 downto 0);
signal REG_COMB_flip_y : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_is_auto_x : unsigned(0 downto 0);
signal REG_COMB_is_auto_y : unsigned(0 downto 0);
signal REG_COMB_is_x_in_bounds : unsigned(0 downto 0);
signal REG_COMB_is_y_in_bounds : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l172_c6_bb45]
signal BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l172_c2_330c]
signal flip_y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l172_c2_330c]
signal ctrl_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l172_c2_330c]
signal ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l172_c2_330c]
signal layer_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l172_c2_330c]
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l172_c2_330c]
signal x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l172_c2_330c]
signal auto_advance_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l172_c2_330c]
signal is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l172_c2_330c]
signal tmp8_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l172_c2_330c]
signal flip_x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l172_c2_330c]
signal tmp8b_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l172_c2_330c]
signal color_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l172_c2_330c]
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l172_c2_330c]
signal result_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l172_c2_330c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l172_c2_330c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l172_c2_330c_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l172_c2_330c]
signal y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l172_c2_330c]
signal is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_5abe]
signal BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l178_c7_2dca]
signal flip_y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l178_c7_2dca]
signal ctrl_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l178_c7_2dca]
signal ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l178_c7_2dca]
signal layer_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l178_c7_2dca]
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l178_c7_2dca]
signal x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l178_c7_2dca]
signal auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l178_c7_2dca]
signal is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l178_c7_2dca]
signal tmp8_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l178_c7_2dca]
signal flip_x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l178_c7_2dca]
signal tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l178_c7_2dca]
signal color_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l178_c7_2dca]
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l178_c7_2dca]
signal result_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l178_c7_2dca_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l178_c7_2dca_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l178_c7_2dca_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l178_c7_2dca]
signal y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l178_c7_2dca]
signal is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_3228]
signal BIN_OP_EQ_uxn_device_h_l181_c11_3228_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_3228_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l181_c7_0c00]
signal flip_y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l181_c7_0c00]
signal ctrl_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l181_c7_0c00]
signal ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l181_c7_0c00]
signal layer_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l181_c7_0c00]
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l181_c7_0c00]
signal x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l181_c7_0c00]
signal auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l181_c7_0c00]
signal is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l181_c7_0c00]
signal tmp8_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l181_c7_0c00]
signal flip_x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l181_c7_0c00]
signal tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l181_c7_0c00]
signal color_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l181_c7_0c00]
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_0c00]
signal result_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_0c00_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_0c00_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_0c00_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l181_c7_0c00]
signal y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l181_c7_0c00]
signal is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l185_c20_012b]
signal BIN_OP_EQ_uxn_device_h_l185_c20_012b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c20_012b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l185_c20_99d2]
signal MUX_uxn_device_h_l185_c20_99d2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_99d2_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_99d2_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_99d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l187_c11_cc8e]
signal BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l187_c7_308d]
signal flip_y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l187_c7_308d]
signal ctrl_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l187_c7_308d]
signal ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l187_c7_308d]
signal layer_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l187_c7_308d]
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l187_c7_308d]
signal x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l187_c7_308d]
signal auto_advance_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l187_c7_308d]
signal is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l187_c7_308d]
signal tmp8_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l187_c7_308d]
signal flip_x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l187_c7_308d]
signal tmp8b_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l187_c7_308d]
signal color_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l187_c7_308d]
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l187_c7_308d]
signal result_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l187_c7_308d_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l187_c7_308d_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l187_c7_308d_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l187_c7_308d]
signal y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l187_c7_308d]
signal is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c3_34a0]
signal BIN_OP_OR_uxn_device_h_l189_c3_34a0_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c3_34a0_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l191_c11_fd61]
signal BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l191_c7_8e4f]
signal flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l191_c7_8e4f]
signal ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l191_c7_8e4f]
signal ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l191_c7_8e4f]
signal layer_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l191_c7_8e4f]
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l191_c7_8e4f]
signal auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l191_c7_8e4f]
signal is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l191_c7_8e4f]
signal tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l191_c7_8e4f]
signal flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l191_c7_8e4f]
signal tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l191_c7_8e4f]
signal color_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l191_c7_8e4f]
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l191_c7_8e4f]
signal result_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l191_c7_8e4f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_8e4f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_8e4f_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l191_c7_8e4f]
signal y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l191_c7_8e4f]
signal is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c20_1130]
signal BIN_OP_EQ_uxn_device_h_l195_c20_1130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c20_1130_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l195_c20_4960]
signal MUX_uxn_device_h_l195_c20_4960_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_4960_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_4960_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_4960_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l197_c11_9ec7]
signal BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l197_c7_1cf7]
signal flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l197_c7_1cf7]
signal ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l197_c7_1cf7]
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l197_c7_1cf7]
signal layer_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l197_c7_1cf7]
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l197_c7_1cf7]
signal auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l197_c7_1cf7]
signal is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l197_c7_1cf7]
signal tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l197_c7_1cf7]
signal flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l197_c7_1cf7]
signal tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l197_c7_1cf7]
signal color_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l197_c7_1cf7]
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l197_c7_1cf7]
signal result_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l197_c7_1cf7_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l197_c7_1cf7_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l197_c7_1cf7_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l197_c7_1cf7]
signal y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l197_c7_1cf7]
signal is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l198_c3_5077]
signal BIN_OP_OR_uxn_device_h_l198_c3_5077_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l198_c3_5077_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l201_c11_1c4d]
signal BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l201_c7_32af]
signal flip_y_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l201_c7_32af]
signal ctrl_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l201_c7_32af]
signal ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l201_c7_32af]
signal layer_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l201_c7_32af]
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l201_c7_32af]
signal auto_advance_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l201_c7_32af]
signal is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l201_c7_32af]
signal tmp8_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l201_c7_32af]
signal flip_x_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l201_c7_32af]
signal tmp8b_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l201_c7_32af]
signal color_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(1 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l201_c7_32af]
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l201_c7_32af]
signal result_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l201_c7_32af_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c7_32af_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c7_32af_return_output : device_out_result_t;

-- is_auto_x_MUX[uxn_device_h_l201_c7_32af]
signal is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l213_c26_4a3b]
signal UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l213_c13_b111]
signal BIN_OP_AND_uxn_device_h_l213_c13_b111_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c13_b111_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l213_c13_d5e6]
signal UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l213_c13_3c14]
signal MUX_uxn_device_h_l213_c13_3c14_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l213_c13_3c14_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l213_c13_3c14_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l213_c13_3c14_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l214_c33_efd9]
signal BIN_OP_OR_uxn_device_h_l214_c33_efd9_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l214_c33_efd9_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l214_c20_7aad]
signal MUX_uxn_device_h_l214_c20_7aad_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_7aad_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_7aad_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_7aad_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l215_c33_383b]
signal BIN_OP_OR_uxn_device_h_l215_c33_383b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l215_c33_383b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l215_c20_dc0f]
signal MUX_uxn_device_h_l215_c20_dc0f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_dc0f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_dc0f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_dc0f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l220_c26_450f]
signal BIN_OP_AND_uxn_device_h_l220_c26_450f_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c26_450f_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l224_c11_3795]
signal BIN_OP_EQ_uxn_device_h_l224_c11_3795_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_3795_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l224_c7_d156]
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l224_c7_d156]
signal auto_advance_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l224_c7_d156]
signal is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l224_c7_d156]
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l224_c7_d156]
signal result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l224_c7_d156]
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l224_c7_d156]
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l224_c7_d156]
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l224_c7_d156]
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l224_c7_d156]
signal result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l224_c7_d156]
signal is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l231_c20_40fb]
signal BIN_OP_AND_uxn_device_h_l231_c20_40fb_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_40fb_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l231_c50_8b66]
signal BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l231_c50_7a21]
signal MUX_uxn_device_h_l231_c50_7a21_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_7a21_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_7a21_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_7a21_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l231_c20_e508]
signal BIN_OP_AND_uxn_device_h_l231_c20_e508_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_e508_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l231_c20_135a]
signal MUX_uxn_device_h_l231_c20_135a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_135a_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_135a_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_135a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l232_c20_0340]
signal BIN_OP_AND_uxn_device_h_l232_c20_0340_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_0340_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l232_c50_676b]
signal BIN_OP_EQ_uxn_device_h_l232_c50_676b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c50_676b_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l232_c50_eecc]
signal MUX_uxn_device_h_l232_c50_eecc_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_eecc_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_eecc_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_eecc_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l232_c20_f150]
signal BIN_OP_AND_uxn_device_h_l232_c20_f150_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_f150_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l232_c20_28d0]
signal MUX_uxn_device_h_l232_c20_28d0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_28d0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_28d0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_28d0_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l233_c35_be96]
signal UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l233_c53_3aeb]
signal UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l233_c22_2094]
signal MUX_uxn_device_h_l233_c22_2094_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l233_c22_2094_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l233_c22_2094_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l233_c22_2094_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l234_c31_0985]
signal MUX_uxn_device_h_l234_c31_0985_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c31_0985_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l234_c31_0985_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l234_c31_0985_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l235_c26_7731]
signal UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l237_c11_22a6]
signal BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l237_c7_fafb]
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l237_c7_fafb]
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l237_c7_fafb]
signal result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l237_c7_fafb]
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l239_c34_d608]
signal BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l239_c44_c350]
signal BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l239_c21_e3e4]
signal MUX_uxn_device_h_l239_c21_e3e4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l239_c21_e3e4_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l239_c21_e3e4_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l239_c21_e3e4_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l240_c31_b860]
signal MUX_uxn_device_h_l240_c31_b860_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l240_c31_b860_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l240_c31_b860_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l240_c31_b860_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l241_c26_ba9c]
signal UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l243_c11_8625]
signal BIN_OP_EQ_uxn_device_h_l243_c11_8625_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c11_8625_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l243_c7_12ae]
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l243_c7_12ae]
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l243_c7_12ae]
signal result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l243_c7_12ae]
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l247_c22_b94b]
signal UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l250_c11_cd5f]
signal BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l250_c7_0ca5]
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l250_c7_0ca5]
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_device_h_l250_c7_0ca5]
signal result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l250_c7_0ca5]
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l254_c21_e631]
signal BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output : unsigned(8 downto 0);

-- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d
signal CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x : unsigned(7 downto 0);
signal CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output : unsigned(7 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output : unsigned(0 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output : unsigned(0 downto 0);

function uint12_3_0( x : unsigned) return unsigned is
--variable x : unsigned(11 downto 0);
  variable return_output : unsigned(3 downto 0);
begin
return_output := unsigned(std_logic_vector(x(3 downto 0)));
return return_output;
end function;

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

function uint8_7_7( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(7- i);
      end loop;
return return_output;
end function;

function uint8_6_6( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(6- i);
      end loop;
return return_output;
end function;

function uint8_5_5( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(5- i);
      end loop;
return return_output;
end function;

function uint8_4_4( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(0 downto 0);
begin
for i in 0 to return_output'length-1 loop
        return_output(i) := x(4- i);
      end loop;
return return_output;
end function;

function uint8_1_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);
begin
return_output := unsigned(std_logic_vector(x(1 downto 0)));
return return_output;
end function;

function uint8_uint2_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(1 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(1 downto 0) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_2( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(2 downto 2) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_3( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(3 downto 3) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_uint1_4( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(7 downto 0);
  --variable x : unsigned(0 downto 0);
  variable intermediate : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

    intermediate := (others => '0');
    intermediate(7 downto 0) := unsigned(inp);
    intermediate(4 downto 4) := x;
    
    return_output := intermediate(7 downto 0) ;
    
    return return_output;

end function;

function uint8_7_0( x : unsigned) return unsigned is
--variable x : unsigned(7 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
return return_output;
end function;

function uint16_uint8_0( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(7 downto 0) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function uint16_uint8_8( inp : unsigned;
 x : unsigned) return unsigned is

  --variable inp : unsigned(15 downto 0);
  --variable x : unsigned(7 downto 0);
  variable intermediate : unsigned(15 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

    intermediate := (others => '0');
    intermediate(15 downto 0) := unsigned(inp);
    intermediate(15 downto 8) := x;
    
    return_output := intermediate(15 downto 0) ;
    
    return return_output;

end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_f42a( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_1;
      base.vram_write_layer := ref_toks_2;
      base.device_ram_address := ref_toks_3;
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

function CONST_REF_RD_device_out_result_t_device_out_result_t_96f0( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.u8_value := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l172_c6_bb45
BIN_OP_EQ_uxn_device_h_l172_c6_bb45 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left,
BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right,
BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output);

-- flip_y_MUX_uxn_device_h_l172_c2_330c
flip_y_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l172_c2_330c_cond,
flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue,
flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse,
flip_y_MUX_uxn_device_h_l172_c2_330c_return_output);

-- ctrl_MUX_uxn_device_h_l172_c2_330c
ctrl_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l172_c2_330c_cond,
ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue,
ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse,
ctrl_MUX_uxn_device_h_l172_c2_330c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l172_c2_330c
ctrl_mode_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond,
ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue,
ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse,
ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output);

-- layer_MUX_uxn_device_h_l172_c2_330c
layer_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l172_c2_330c_cond,
layer_MUX_uxn_device_h_l172_c2_330c_iftrue,
layer_MUX_uxn_device_h_l172_c2_330c_iffalse,
layer_MUX_uxn_device_h_l172_c2_330c_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c
is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output);

-- x_MUX_uxn_device_h_l172_c2_330c
x_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l172_c2_330c_cond,
x_MUX_uxn_device_h_l172_c2_330c_iftrue,
x_MUX_uxn_device_h_l172_c2_330c_iffalse,
x_MUX_uxn_device_h_l172_c2_330c_return_output);

-- auto_advance_MUX_uxn_device_h_l172_c2_330c
auto_advance_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l172_c2_330c_cond,
auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue,
auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse,
auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output);

-- is_auto_y_MUX_uxn_device_h_l172_c2_330c
is_auto_y_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond,
is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue,
is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse,
is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output);

-- tmp8_MUX_uxn_device_h_l172_c2_330c
tmp8_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l172_c2_330c_cond,
tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue,
tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse,
tmp8_MUX_uxn_device_h_l172_c2_330c_return_output);

-- flip_x_MUX_uxn_device_h_l172_c2_330c
flip_x_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l172_c2_330c_cond,
flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue,
flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse,
flip_x_MUX_uxn_device_h_l172_c2_330c_return_output);

-- tmp8b_MUX_uxn_device_h_l172_c2_330c
tmp8b_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l172_c2_330c_cond,
tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue,
tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse,
tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output);

-- color_MUX_uxn_device_h_l172_c2_330c
color_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l172_c2_330c_cond,
color_MUX_uxn_device_h_l172_c2_330c_iftrue,
color_MUX_uxn_device_h_l172_c2_330c_iffalse,
color_MUX_uxn_device_h_l172_c2_330c_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c
is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output);

-- result_MUX_uxn_device_h_l172_c2_330c
result_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l172_c2_330c_cond,
result_MUX_uxn_device_h_l172_c2_330c_iftrue,
result_MUX_uxn_device_h_l172_c2_330c_iffalse,
result_MUX_uxn_device_h_l172_c2_330c_return_output);

-- y_MUX_uxn_device_h_l172_c2_330c
y_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l172_c2_330c_cond,
y_MUX_uxn_device_h_l172_c2_330c_iftrue,
y_MUX_uxn_device_h_l172_c2_330c_iffalse,
y_MUX_uxn_device_h_l172_c2_330c_return_output);

-- is_auto_x_MUX_uxn_device_h_l172_c2_330c
is_auto_x_MUX_uxn_device_h_l172_c2_330c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond,
is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue,
is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse,
is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_5abe
BIN_OP_EQ_uxn_device_h_l178_c11_5abe : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left,
BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right,
BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output);

-- flip_y_MUX_uxn_device_h_l178_c7_2dca
flip_y_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l178_c7_2dca_cond,
flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue,
flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse,
flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- ctrl_MUX_uxn_device_h_l178_c7_2dca
ctrl_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l178_c7_2dca_cond,
ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue,
ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse,
ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- ctrl_mode_MUX_uxn_device_h_l178_c7_2dca
ctrl_mode_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond,
ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue,
ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse,
ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- layer_MUX_uxn_device_h_l178_c7_2dca
layer_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l178_c7_2dca_cond,
layer_MUX_uxn_device_h_l178_c7_2dca_iftrue,
layer_MUX_uxn_device_h_l178_c7_2dca_iffalse,
layer_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca
is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- x_MUX_uxn_device_h_l178_c7_2dca
x_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l178_c7_2dca_cond,
x_MUX_uxn_device_h_l178_c7_2dca_iftrue,
x_MUX_uxn_device_h_l178_c7_2dca_iffalse,
x_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- auto_advance_MUX_uxn_device_h_l178_c7_2dca
auto_advance_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond,
auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue,
auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse,
auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- is_auto_y_MUX_uxn_device_h_l178_c7_2dca
is_auto_y_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond,
is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue,
is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse,
is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- tmp8_MUX_uxn_device_h_l178_c7_2dca
tmp8_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l178_c7_2dca_cond,
tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue,
tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse,
tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- flip_x_MUX_uxn_device_h_l178_c7_2dca
flip_x_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l178_c7_2dca_cond,
flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue,
flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse,
flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- tmp8b_MUX_uxn_device_h_l178_c7_2dca
tmp8b_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond,
tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue,
tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse,
tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- color_MUX_uxn_device_h_l178_c7_2dca
color_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l178_c7_2dca_cond,
color_MUX_uxn_device_h_l178_c7_2dca_iftrue,
color_MUX_uxn_device_h_l178_c7_2dca_iffalse,
color_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca
is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- result_MUX_uxn_device_h_l178_c7_2dca
result_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l178_c7_2dca_cond,
result_MUX_uxn_device_h_l178_c7_2dca_iftrue,
result_MUX_uxn_device_h_l178_c7_2dca_iffalse,
result_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- y_MUX_uxn_device_h_l178_c7_2dca
y_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l178_c7_2dca_cond,
y_MUX_uxn_device_h_l178_c7_2dca_iftrue,
y_MUX_uxn_device_h_l178_c7_2dca_iffalse,
y_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- is_auto_x_MUX_uxn_device_h_l178_c7_2dca
is_auto_x_MUX_uxn_device_h_l178_c7_2dca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond,
is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue,
is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse,
is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_3228
BIN_OP_EQ_uxn_device_h_l181_c11_3228 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_3228_left,
BIN_OP_EQ_uxn_device_h_l181_c11_3228_right,
BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output);

-- flip_y_MUX_uxn_device_h_l181_c7_0c00
flip_y_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l181_c7_0c00_cond,
flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue,
flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse,
flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- ctrl_MUX_uxn_device_h_l181_c7_0c00
ctrl_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l181_c7_0c00_cond,
ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue,
ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse,
ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- ctrl_mode_MUX_uxn_device_h_l181_c7_0c00
ctrl_mode_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond,
ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue,
ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse,
ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- layer_MUX_uxn_device_h_l181_c7_0c00
layer_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l181_c7_0c00_cond,
layer_MUX_uxn_device_h_l181_c7_0c00_iftrue,
layer_MUX_uxn_device_h_l181_c7_0c00_iffalse,
layer_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00
is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- x_MUX_uxn_device_h_l181_c7_0c00
x_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c7_0c00_cond,
x_MUX_uxn_device_h_l181_c7_0c00_iftrue,
x_MUX_uxn_device_h_l181_c7_0c00_iffalse,
x_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- auto_advance_MUX_uxn_device_h_l181_c7_0c00
auto_advance_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond,
auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue,
auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse,
auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- is_auto_y_MUX_uxn_device_h_l181_c7_0c00
is_auto_y_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond,
is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue,
is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse,
is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- tmp8_MUX_uxn_device_h_l181_c7_0c00
tmp8_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l181_c7_0c00_cond,
tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue,
tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse,
tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- flip_x_MUX_uxn_device_h_l181_c7_0c00
flip_x_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l181_c7_0c00_cond,
flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue,
flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse,
flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- tmp8b_MUX_uxn_device_h_l181_c7_0c00
tmp8b_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond,
tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue,
tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse,
tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- color_MUX_uxn_device_h_l181_c7_0c00
color_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l181_c7_0c00_cond,
color_MUX_uxn_device_h_l181_c7_0c00_iftrue,
color_MUX_uxn_device_h_l181_c7_0c00_iffalse,
color_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00
is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- result_MUX_uxn_device_h_l181_c7_0c00
result_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_0c00_cond,
result_MUX_uxn_device_h_l181_c7_0c00_iftrue,
result_MUX_uxn_device_h_l181_c7_0c00_iffalse,
result_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- y_MUX_uxn_device_h_l181_c7_0c00
y_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l181_c7_0c00_cond,
y_MUX_uxn_device_h_l181_c7_0c00_iftrue,
y_MUX_uxn_device_h_l181_c7_0c00_iffalse,
y_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- is_auto_x_MUX_uxn_device_h_l181_c7_0c00
is_auto_x_MUX_uxn_device_h_l181_c7_0c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond,
is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue,
is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse,
is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output);

-- BIN_OP_EQ_uxn_device_h_l185_c20_012b
BIN_OP_EQ_uxn_device_h_l185_c20_012b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l185_c20_012b_left,
BIN_OP_EQ_uxn_device_h_l185_c20_012b_right,
BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output);

-- MUX_uxn_device_h_l185_c20_99d2
MUX_uxn_device_h_l185_c20_99d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l185_c20_99d2_cond,
MUX_uxn_device_h_l185_c20_99d2_iftrue,
MUX_uxn_device_h_l185_c20_99d2_iffalse,
MUX_uxn_device_h_l185_c20_99d2_return_output);

-- BIN_OP_EQ_uxn_device_h_l187_c11_cc8e
BIN_OP_EQ_uxn_device_h_l187_c11_cc8e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left,
BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right,
BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output);

-- flip_y_MUX_uxn_device_h_l187_c7_308d
flip_y_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l187_c7_308d_cond,
flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue,
flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse,
flip_y_MUX_uxn_device_h_l187_c7_308d_return_output);

-- ctrl_MUX_uxn_device_h_l187_c7_308d
ctrl_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l187_c7_308d_cond,
ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue,
ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse,
ctrl_MUX_uxn_device_h_l187_c7_308d_return_output);

-- ctrl_mode_MUX_uxn_device_h_l187_c7_308d
ctrl_mode_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond,
ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue,
ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse,
ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output);

-- layer_MUX_uxn_device_h_l187_c7_308d
layer_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l187_c7_308d_cond,
layer_MUX_uxn_device_h_l187_c7_308d_iftrue,
layer_MUX_uxn_device_h_l187_c7_308d_iffalse,
layer_MUX_uxn_device_h_l187_c7_308d_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d
is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output);

-- x_MUX_uxn_device_h_l187_c7_308d
x_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l187_c7_308d_cond,
x_MUX_uxn_device_h_l187_c7_308d_iftrue,
x_MUX_uxn_device_h_l187_c7_308d_iffalse,
x_MUX_uxn_device_h_l187_c7_308d_return_output);

-- auto_advance_MUX_uxn_device_h_l187_c7_308d
auto_advance_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l187_c7_308d_cond,
auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue,
auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse,
auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output);

-- is_auto_y_MUX_uxn_device_h_l187_c7_308d
is_auto_y_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond,
is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue,
is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse,
is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output);

-- tmp8_MUX_uxn_device_h_l187_c7_308d
tmp8_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l187_c7_308d_cond,
tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue,
tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse,
tmp8_MUX_uxn_device_h_l187_c7_308d_return_output);

-- flip_x_MUX_uxn_device_h_l187_c7_308d
flip_x_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l187_c7_308d_cond,
flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue,
flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse,
flip_x_MUX_uxn_device_h_l187_c7_308d_return_output);

-- tmp8b_MUX_uxn_device_h_l187_c7_308d
tmp8b_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l187_c7_308d_cond,
tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue,
tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse,
tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output);

-- color_MUX_uxn_device_h_l187_c7_308d
color_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l187_c7_308d_cond,
color_MUX_uxn_device_h_l187_c7_308d_iftrue,
color_MUX_uxn_device_h_l187_c7_308d_iffalse,
color_MUX_uxn_device_h_l187_c7_308d_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d
is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output);

-- result_MUX_uxn_device_h_l187_c7_308d
result_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l187_c7_308d_cond,
result_MUX_uxn_device_h_l187_c7_308d_iftrue,
result_MUX_uxn_device_h_l187_c7_308d_iffalse,
result_MUX_uxn_device_h_l187_c7_308d_return_output);

-- y_MUX_uxn_device_h_l187_c7_308d
y_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l187_c7_308d_cond,
y_MUX_uxn_device_h_l187_c7_308d_iftrue,
y_MUX_uxn_device_h_l187_c7_308d_iffalse,
y_MUX_uxn_device_h_l187_c7_308d_return_output);

-- is_auto_x_MUX_uxn_device_h_l187_c7_308d
is_auto_x_MUX_uxn_device_h_l187_c7_308d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond,
is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue,
is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse,
is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c3_34a0
BIN_OP_OR_uxn_device_h_l189_c3_34a0 : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c3_34a0_left,
BIN_OP_OR_uxn_device_h_l189_c3_34a0_right,
BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output);

-- BIN_OP_EQ_uxn_device_h_l191_c11_fd61
BIN_OP_EQ_uxn_device_h_l191_c11_fd61 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left,
BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right,
BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output);

-- flip_y_MUX_uxn_device_h_l191_c7_8e4f
flip_y_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond,
flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- ctrl_MUX_uxn_device_h_l191_c7_8e4f
ctrl_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond,
ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f
ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond,
ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- layer_MUX_uxn_device_h_l191_c7_8e4f
layer_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l191_c7_8e4f_cond,
layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
layer_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f
is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- auto_advance_MUX_uxn_device_h_l191_c7_8e4f
auto_advance_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond,
auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- is_auto_y_MUX_uxn_device_h_l191_c7_8e4f
is_auto_y_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond,
is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- tmp8_MUX_uxn_device_h_l191_c7_8e4f
tmp8_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond,
tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- flip_x_MUX_uxn_device_h_l191_c7_8e4f
flip_x_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond,
flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- tmp8b_MUX_uxn_device_h_l191_c7_8e4f
tmp8b_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond,
tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- color_MUX_uxn_device_h_l191_c7_8e4f
color_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l191_c7_8e4f_cond,
color_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
color_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
color_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f
is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- result_MUX_uxn_device_h_l191_c7_8e4f
result_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l191_c7_8e4f_cond,
result_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
result_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
result_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- y_MUX_uxn_device_h_l191_c7_8e4f
y_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l191_c7_8e4f_cond,
y_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
y_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
y_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- is_auto_x_MUX_uxn_device_h_l191_c7_8e4f
is_auto_x_MUX_uxn_device_h_l191_c7_8e4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond,
is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue,
is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse,
is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c20_1130
BIN_OP_EQ_uxn_device_h_l195_c20_1130 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c20_1130_left,
BIN_OP_EQ_uxn_device_h_l195_c20_1130_right,
BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output);

-- MUX_uxn_device_h_l195_c20_4960
MUX_uxn_device_h_l195_c20_4960 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l195_c20_4960_cond,
MUX_uxn_device_h_l195_c20_4960_iftrue,
MUX_uxn_device_h_l195_c20_4960_iffalse,
MUX_uxn_device_h_l195_c20_4960_return_output);

-- BIN_OP_EQ_uxn_device_h_l197_c11_9ec7
BIN_OP_EQ_uxn_device_h_l197_c11_9ec7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left,
BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right,
BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output);

-- flip_y_MUX_uxn_device_h_l197_c7_1cf7
flip_y_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond,
flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- ctrl_MUX_uxn_device_h_l197_c7_1cf7
ctrl_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond,
ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7
ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond,
ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- layer_MUX_uxn_device_h_l197_c7_1cf7
layer_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l197_c7_1cf7_cond,
layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
layer_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- auto_advance_MUX_uxn_device_h_l197_c7_1cf7
auto_advance_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond,
auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- is_auto_y_MUX_uxn_device_h_l197_c7_1cf7
is_auto_y_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond,
is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- tmp8_MUX_uxn_device_h_l197_c7_1cf7
tmp8_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond,
tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- flip_x_MUX_uxn_device_h_l197_c7_1cf7
flip_x_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond,
flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- tmp8b_MUX_uxn_device_h_l197_c7_1cf7
tmp8b_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond,
tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- color_MUX_uxn_device_h_l197_c7_1cf7
color_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l197_c7_1cf7_cond,
color_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
color_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
color_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- result_MUX_uxn_device_h_l197_c7_1cf7
result_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l197_c7_1cf7_cond,
result_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
result_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
result_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- y_MUX_uxn_device_h_l197_c7_1cf7
y_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l197_c7_1cf7_cond,
y_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
y_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
y_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- is_auto_x_MUX_uxn_device_h_l197_c7_1cf7
is_auto_x_MUX_uxn_device_h_l197_c7_1cf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond,
is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue,
is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse,
is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output);

-- BIN_OP_OR_uxn_device_h_l198_c3_5077
BIN_OP_OR_uxn_device_h_l198_c3_5077 : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l198_c3_5077_left,
BIN_OP_OR_uxn_device_h_l198_c3_5077_right,
BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output);

-- BIN_OP_EQ_uxn_device_h_l201_c11_1c4d
BIN_OP_EQ_uxn_device_h_l201_c11_1c4d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left,
BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right,
BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output);

-- flip_y_MUX_uxn_device_h_l201_c7_32af
flip_y_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l201_c7_32af_cond,
flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue,
flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse,
flip_y_MUX_uxn_device_h_l201_c7_32af_return_output);

-- ctrl_MUX_uxn_device_h_l201_c7_32af
ctrl_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l201_c7_32af_cond,
ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue,
ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse,
ctrl_MUX_uxn_device_h_l201_c7_32af_return_output);

-- ctrl_mode_MUX_uxn_device_h_l201_c7_32af
ctrl_mode_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond,
ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue,
ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse,
ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output);

-- layer_MUX_uxn_device_h_l201_c7_32af
layer_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l201_c7_32af_cond,
layer_MUX_uxn_device_h_l201_c7_32af_iftrue,
layer_MUX_uxn_device_h_l201_c7_32af_iffalse,
layer_MUX_uxn_device_h_l201_c7_32af_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af
is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output);

-- auto_advance_MUX_uxn_device_h_l201_c7_32af
auto_advance_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l201_c7_32af_cond,
auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue,
auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse,
auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output);

-- is_auto_y_MUX_uxn_device_h_l201_c7_32af
is_auto_y_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond,
is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue,
is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse,
is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output);

-- tmp8_MUX_uxn_device_h_l201_c7_32af
tmp8_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l201_c7_32af_cond,
tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue,
tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse,
tmp8_MUX_uxn_device_h_l201_c7_32af_return_output);

-- flip_x_MUX_uxn_device_h_l201_c7_32af
flip_x_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l201_c7_32af_cond,
flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue,
flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse,
flip_x_MUX_uxn_device_h_l201_c7_32af_return_output);

-- tmp8b_MUX_uxn_device_h_l201_c7_32af
tmp8b_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l201_c7_32af_cond,
tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue,
tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse,
tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output);

-- color_MUX_uxn_device_h_l201_c7_32af
color_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l201_c7_32af_cond,
color_MUX_uxn_device_h_l201_c7_32af_iftrue,
color_MUX_uxn_device_h_l201_c7_32af_iffalse,
color_MUX_uxn_device_h_l201_c7_32af_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af
is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output);

-- result_MUX_uxn_device_h_l201_c7_32af
result_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l201_c7_32af_cond,
result_MUX_uxn_device_h_l201_c7_32af_iftrue,
result_MUX_uxn_device_h_l201_c7_32af_iffalse,
result_MUX_uxn_device_h_l201_c7_32af_return_output);

-- is_auto_x_MUX_uxn_device_h_l201_c7_32af
is_auto_x_MUX_uxn_device_h_l201_c7_32af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond,
is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue,
is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse,
is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output);

-- UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b
UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr,
UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output);

-- BIN_OP_AND_uxn_device_h_l213_c13_b111
BIN_OP_AND_uxn_device_h_l213_c13_b111 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l213_c13_b111_left,
BIN_OP_AND_uxn_device_h_l213_c13_b111_right,
BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output);

-- UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6
UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr,
UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output);

-- MUX_uxn_device_h_l213_c13_3c14
MUX_uxn_device_h_l213_c13_3c14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l213_c13_3c14_cond,
MUX_uxn_device_h_l213_c13_3c14_iftrue,
MUX_uxn_device_h_l213_c13_3c14_iffalse,
MUX_uxn_device_h_l213_c13_3c14_return_output);

-- BIN_OP_OR_uxn_device_h_l214_c33_efd9
BIN_OP_OR_uxn_device_h_l214_c33_efd9 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l214_c33_efd9_left,
BIN_OP_OR_uxn_device_h_l214_c33_efd9_right,
BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output);

-- MUX_uxn_device_h_l214_c20_7aad
MUX_uxn_device_h_l214_c20_7aad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l214_c20_7aad_cond,
MUX_uxn_device_h_l214_c20_7aad_iftrue,
MUX_uxn_device_h_l214_c20_7aad_iffalse,
MUX_uxn_device_h_l214_c20_7aad_return_output);

-- BIN_OP_OR_uxn_device_h_l215_c33_383b
BIN_OP_OR_uxn_device_h_l215_c33_383b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l215_c33_383b_left,
BIN_OP_OR_uxn_device_h_l215_c33_383b_right,
BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output);

-- MUX_uxn_device_h_l215_c20_dc0f
MUX_uxn_device_h_l215_c20_dc0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l215_c20_dc0f_cond,
MUX_uxn_device_h_l215_c20_dc0f_iftrue,
MUX_uxn_device_h_l215_c20_dc0f_iffalse,
MUX_uxn_device_h_l215_c20_dc0f_return_output);

-- BIN_OP_AND_uxn_device_h_l220_c26_450f
BIN_OP_AND_uxn_device_h_l220_c26_450f : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l220_c26_450f_left,
BIN_OP_AND_uxn_device_h_l220_c26_450f_right,
BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output);

-- BIN_OP_EQ_uxn_device_h_l224_c11_3795
BIN_OP_EQ_uxn_device_h_l224_c11_3795 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l224_c11_3795_left,
BIN_OP_EQ_uxn_device_h_l224_c11_3795_right,
BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156
is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output);

-- auto_advance_MUX_uxn_device_h_l224_c7_d156
auto_advance_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l224_c7_d156_cond,
auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue,
auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse,
auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output);

-- is_auto_y_MUX_uxn_device_h_l224_c7_d156
is_auto_y_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond,
is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue,
is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse,
is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156
is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_u16_addr_MUX_uxn_device_h_l224_c7_d156
result_u16_addr_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond,
result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l224_c7_d156
result_is_vram_write_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond,
result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l224_c7_d156
result_is_deo_done_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond,
result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l224_c7_d156
result_device_ram_address_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond,
result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output);

-- result_u8_value_MUX_uxn_device_h_l224_c7_d156
result_u8_value_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond,
result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue,
result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse,
result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output);

-- is_auto_x_MUX_uxn_device_h_l224_c7_d156
is_auto_x_MUX_uxn_device_h_l224_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond,
is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue,
is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse,
is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output);

-- BIN_OP_AND_uxn_device_h_l231_c20_40fb
BIN_OP_AND_uxn_device_h_l231_c20_40fb : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l231_c20_40fb_left,
BIN_OP_AND_uxn_device_h_l231_c20_40fb_right,
BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output);

-- BIN_OP_EQ_uxn_device_h_l231_c50_8b66
BIN_OP_EQ_uxn_device_h_l231_c50_8b66 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left,
BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right,
BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output);

-- MUX_uxn_device_h_l231_c50_7a21
MUX_uxn_device_h_l231_c50_7a21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l231_c50_7a21_cond,
MUX_uxn_device_h_l231_c50_7a21_iftrue,
MUX_uxn_device_h_l231_c50_7a21_iffalse,
MUX_uxn_device_h_l231_c50_7a21_return_output);

-- BIN_OP_AND_uxn_device_h_l231_c20_e508
BIN_OP_AND_uxn_device_h_l231_c20_e508 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l231_c20_e508_left,
BIN_OP_AND_uxn_device_h_l231_c20_e508_right,
BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output);

-- MUX_uxn_device_h_l231_c20_135a
MUX_uxn_device_h_l231_c20_135a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l231_c20_135a_cond,
MUX_uxn_device_h_l231_c20_135a_iftrue,
MUX_uxn_device_h_l231_c20_135a_iffalse,
MUX_uxn_device_h_l231_c20_135a_return_output);

-- BIN_OP_AND_uxn_device_h_l232_c20_0340
BIN_OP_AND_uxn_device_h_l232_c20_0340 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l232_c20_0340_left,
BIN_OP_AND_uxn_device_h_l232_c20_0340_right,
BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output);

-- BIN_OP_EQ_uxn_device_h_l232_c50_676b
BIN_OP_EQ_uxn_device_h_l232_c50_676b : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l232_c50_676b_left,
BIN_OP_EQ_uxn_device_h_l232_c50_676b_right,
BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output);

-- MUX_uxn_device_h_l232_c50_eecc
MUX_uxn_device_h_l232_c50_eecc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l232_c50_eecc_cond,
MUX_uxn_device_h_l232_c50_eecc_iftrue,
MUX_uxn_device_h_l232_c50_eecc_iffalse,
MUX_uxn_device_h_l232_c50_eecc_return_output);

-- BIN_OP_AND_uxn_device_h_l232_c20_f150
BIN_OP_AND_uxn_device_h_l232_c20_f150 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l232_c20_f150_left,
BIN_OP_AND_uxn_device_h_l232_c20_f150_right,
BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output);

-- MUX_uxn_device_h_l232_c20_28d0
MUX_uxn_device_h_l232_c20_28d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l232_c20_28d0_cond,
MUX_uxn_device_h_l232_c20_28d0_iftrue,
MUX_uxn_device_h_l232_c20_28d0_iffalse,
MUX_uxn_device_h_l232_c20_28d0_return_output);

-- UNARY_OP_NOT_uxn_device_h_l233_c35_be96
UNARY_OP_NOT_uxn_device_h_l233_c35_be96 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr,
UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output);

-- UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb
UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr,
UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output);

-- MUX_uxn_device_h_l233_c22_2094
MUX_uxn_device_h_l233_c22_2094 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l233_c22_2094_cond,
MUX_uxn_device_h_l233_c22_2094_iftrue,
MUX_uxn_device_h_l233_c22_2094_iffalse,
MUX_uxn_device_h_l233_c22_2094_return_output);

-- MUX_uxn_device_h_l234_c31_0985
MUX_uxn_device_h_l234_c31_0985 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l234_c31_0985_cond,
MUX_uxn_device_h_l234_c31_0985_iftrue,
MUX_uxn_device_h_l234_c31_0985_iffalse,
MUX_uxn_device_h_l234_c31_0985_return_output);

-- UNARY_OP_NOT_uxn_device_h_l235_c26_7731
UNARY_OP_NOT_uxn_device_h_l235_c26_7731 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr,
UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output);

-- BIN_OP_EQ_uxn_device_h_l237_c11_22a6
BIN_OP_EQ_uxn_device_h_l237_c11_22a6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left,
BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right,
BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb
result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond,
result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output);

-- result_u8_value_MUX_uxn_device_h_l237_c7_fafb
result_u8_value_MUX_uxn_device_h_l237_c7_fafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond,
result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue,
result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse,
result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb
result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond,
result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output);

-- BIN_OP_PLUS_uxn_device_h_l239_c34_d608
BIN_OP_PLUS_uxn_device_h_l239_c34_d608 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left,
BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right,
BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output);

-- BIN_OP_PLUS_uxn_device_h_l239_c44_c350
BIN_OP_PLUS_uxn_device_h_l239_c44_c350 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left,
BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right,
BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output);

-- MUX_uxn_device_h_l239_c21_e3e4
MUX_uxn_device_h_l239_c21_e3e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l239_c21_e3e4_cond,
MUX_uxn_device_h_l239_c21_e3e4_iftrue,
MUX_uxn_device_h_l239_c21_e3e4_iffalse,
MUX_uxn_device_h_l239_c21_e3e4_return_output);

-- MUX_uxn_device_h_l240_c31_b860
MUX_uxn_device_h_l240_c31_b860 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l240_c31_b860_cond,
MUX_uxn_device_h_l240_c31_b860_iftrue,
MUX_uxn_device_h_l240_c31_b860_iffalse,
MUX_uxn_device_h_l240_c31_b860_return_output);

-- UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c
UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr,
UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output);

-- BIN_OP_EQ_uxn_device_h_l243_c11_8625
BIN_OP_EQ_uxn_device_h_l243_c11_8625 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l243_c11_8625_left,
BIN_OP_EQ_uxn_device_h_l243_c11_8625_right,
BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae
result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond,
result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue,
result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse,
result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output);

-- result_u8_value_MUX_uxn_device_h_l243_c7_12ae
result_u8_value_MUX_uxn_device_h_l243_c7_12ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond,
result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue,
result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse,
result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae
result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond,
result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue,
result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse,
result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output);

-- UNARY_OP_NOT_uxn_device_h_l247_c22_b94b
UNARY_OP_NOT_uxn_device_h_l247_c22_b94b : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr,
UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output);

-- BIN_OP_EQ_uxn_device_h_l250_c11_cd5f
BIN_OP_EQ_uxn_device_h_l250_c11_cd5f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left,
BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right,
BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5
result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond,
result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output);

-- result_u8_value_MUX_uxn_device_h_l250_c7_0ca5
result_u8_value_MUX_uxn_device_h_l250_c7_0ca5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond,
result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue,
result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse,
result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5
result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond,
result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l254_c21_e631
BIN_OP_PLUS_uxn_device_h_l254_c21_e631 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left,
BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right,
BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output);

-- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x,
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output);



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
 tmp8b,
 phase4,
 color,
 ctrl_mode,
 flip_x,
 flip_y,
 layer,
 is_auto_x,
 is_auto_y,
 is_x_in_bounds,
 is_y_in_bounds,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output,
 flip_y_MUX_uxn_device_h_l172_c2_330c_return_output,
 ctrl_MUX_uxn_device_h_l172_c2_330c_return_output,
 ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output,
 layer_MUX_uxn_device_h_l172_c2_330c_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output,
 x_MUX_uxn_device_h_l172_c2_330c_return_output,
 auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output,
 is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output,
 tmp8_MUX_uxn_device_h_l172_c2_330c_return_output,
 flip_x_MUX_uxn_device_h_l172_c2_330c_return_output,
 tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output,
 color_MUX_uxn_device_h_l172_c2_330c_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output,
 result_MUX_uxn_device_h_l172_c2_330c_return_output,
 y_MUX_uxn_device_h_l172_c2_330c_return_output,
 is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output,
 flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output,
 ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output,
 ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output,
 layer_MUX_uxn_device_h_l178_c7_2dca_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output,
 x_MUX_uxn_device_h_l178_c7_2dca_return_output,
 auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output,
 is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output,
 tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output,
 flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output,
 tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output,
 color_MUX_uxn_device_h_l178_c7_2dca_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output,
 result_MUX_uxn_device_h_l178_c7_2dca_return_output,
 y_MUX_uxn_device_h_l178_c7_2dca_return_output,
 is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output,
 flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output,
 ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output,
 ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output,
 layer_MUX_uxn_device_h_l181_c7_0c00_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output,
 x_MUX_uxn_device_h_l181_c7_0c00_return_output,
 auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output,
 is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output,
 tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output,
 flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output,
 tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output,
 color_MUX_uxn_device_h_l181_c7_0c00_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output,
 result_MUX_uxn_device_h_l181_c7_0c00_return_output,
 y_MUX_uxn_device_h_l181_c7_0c00_return_output,
 is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output,
 BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output,
 MUX_uxn_device_h_l185_c20_99d2_return_output,
 BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output,
 flip_y_MUX_uxn_device_h_l187_c7_308d_return_output,
 ctrl_MUX_uxn_device_h_l187_c7_308d_return_output,
 ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output,
 layer_MUX_uxn_device_h_l187_c7_308d_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output,
 x_MUX_uxn_device_h_l187_c7_308d_return_output,
 auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output,
 is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output,
 tmp8_MUX_uxn_device_h_l187_c7_308d_return_output,
 flip_x_MUX_uxn_device_h_l187_c7_308d_return_output,
 tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output,
 color_MUX_uxn_device_h_l187_c7_308d_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output,
 result_MUX_uxn_device_h_l187_c7_308d_return_output,
 y_MUX_uxn_device_h_l187_c7_308d_return_output,
 is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output,
 BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output,
 BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output,
 flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 layer_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 color_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 result_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 y_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output,
 MUX_uxn_device_h_l195_c20_4960_return_output,
 BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output,
 flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 layer_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 color_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 result_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 y_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output,
 BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output,
 BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output,
 flip_y_MUX_uxn_device_h_l201_c7_32af_return_output,
 ctrl_MUX_uxn_device_h_l201_c7_32af_return_output,
 ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output,
 layer_MUX_uxn_device_h_l201_c7_32af_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output,
 auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output,
 is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output,
 tmp8_MUX_uxn_device_h_l201_c7_32af_return_output,
 flip_x_MUX_uxn_device_h_l201_c7_32af_return_output,
 tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output,
 color_MUX_uxn_device_h_l201_c7_32af_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output,
 result_MUX_uxn_device_h_l201_c7_32af_return_output,
 is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output,
 UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output,
 BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output,
 UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output,
 MUX_uxn_device_h_l213_c13_3c14_return_output,
 BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output,
 MUX_uxn_device_h_l214_c20_7aad_return_output,
 BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output,
 MUX_uxn_device_h_l215_c20_dc0f_return_output,
 BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output,
 BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output,
 auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output,
 is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output,
 result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output,
 is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output,
 BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output,
 BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output,
 MUX_uxn_device_h_l231_c50_7a21_return_output,
 BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output,
 MUX_uxn_device_h_l231_c20_135a_return_output,
 BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output,
 BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output,
 MUX_uxn_device_h_l232_c50_eecc_return_output,
 BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output,
 MUX_uxn_device_h_l232_c20_28d0_return_output,
 UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output,
 UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output,
 MUX_uxn_device_h_l233_c22_2094_return_output,
 MUX_uxn_device_h_l234_c31_0985_return_output,
 UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output,
 BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output,
 result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output,
 BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output,
 BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output,
 MUX_uxn_device_h_l239_c21_e3e4_return_output,
 MUX_uxn_device_h_l240_c31_b860_return_output,
 UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output,
 BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output,
 result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output,
 result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output,
 UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output,
 BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output,
 result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output,
 BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output,
 CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l172_c2_330c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_330c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_330c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_2dca_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_330c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l178_c7_2dca_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_2dca_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_2dca_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_0c00_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_0c00_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_0c00_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_0c00_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_308d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_99d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_99d2_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_99d2_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_99d2_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_x_uxn_device_h_l189_c3_0ded : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l187_c7_308d_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_308d_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_308d_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_8e4f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_8e4f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1cf7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_4960_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_4960_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_4960_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_4960_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1cf7_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_32af_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(7 downto 0);
 variable VAR_y_uxn_device_h_l198_c3_55b8 : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l201_c7_32af_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_32af_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_32af_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l201_c7_32af_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l204_c11_3e2e_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l205_c12_097c_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l206_c12_99a0_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_0_uxn_device_h_l207_c11_63c1_return_output : unsigned(1 downto 0);
 variable VAR_uint8_uint2_0_uxn_device_h_l209_c10_ec20_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_uxn_device_h_l210_c10_f17c_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_uxn_device_h_l211_c10_6708_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l212_c10_69ba_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_3c14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_3c14_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_3c14_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_7_0_uxn_device_h_l213_c44_11d1_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_3c14_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_7aad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_7aad_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_7aad_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_7aad_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_dc0f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_dc0f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_dc0f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_dc0f_return_output : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l216_c21_5e56_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l217_c21_7608_return_output : unsigned(15 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l219_c3_eda1 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l229_c3_b77d : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_d156_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l227_c15_d934_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_135a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_7a21_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_7a21_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_7a21_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_7a21_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_135a_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_135a_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_135a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_28d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_eecc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_eecc_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_eecc_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_eecc_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_28d0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_28d0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_28d0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_2094_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_2094_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_2094_iffalse : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_2094_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_0985_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_0985_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_0985_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_0985_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_e3e4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_e3e4_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_e3e4_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_e3e4_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_b860_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_b860_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_b860_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_b860_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l247_c3_2a4d : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l254_c3_3351 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_0ca5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_0ca5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output : unsigned(8 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_468b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output : unsigned(0 downto 0);
 -- State registers comb logic variables
variable REG_VAR_x : unsigned(7 downto 0);
variable REG_VAR_y : unsigned(7 downto 0);
variable REG_VAR_ctrl : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_tmp8b : unsigned(7 downto 0);
variable REG_VAR_phase4 : unsigned(3 downto 0);
variable REG_VAR_color : unsigned(1 downto 0);
variable REG_VAR_ctrl_mode : unsigned(0 downto 0);
variable REG_VAR_flip_x : unsigned(0 downto 0);
variable REG_VAR_flip_y : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_is_auto_x : unsigned(0 downto 0);
variable REG_VAR_is_auto_y : unsigned(0 downto 0);
variable REG_VAR_is_x_in_bounds : unsigned(0 downto 0);
variable REG_VAR_is_y_in_bounds : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_ctrl := ctrl;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_tmp8b := tmp8b;
  REG_VAR_phase4 := phase4;
  REG_VAR_color := color;
  REG_VAR_ctrl_mode := ctrl_mode;
  REG_VAR_flip_x := flip_x;
  REG_VAR_flip_y := flip_y;
  REG_VAR_layer := layer;
  REG_VAR_is_auto_x := is_auto_x;
  REG_VAR_is_auto_y := is_auto_y;
  REG_VAR_is_x_in_bounds := is_x_in_bounds;
  REG_VAR_is_y_in_bounds := is_y_in_bounds;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_MUX_uxn_device_h_l234_c31_0985_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right := to_unsigned(10, 4);
     VAR_MUX_uxn_device_h_l231_c50_7a21_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_right := to_unsigned(9, 4);
     VAR_MUX_uxn_device_h_l240_c31_b860_iffalse := to_unsigned(43, 8);
     VAR_result_u16_addr_uxn_device_h_l229_c3_b77d := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_result_u16_addr_uxn_device_h_l229_c3_b77d;
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_right := to_unsigned(7, 4);
     VAR_MUX_uxn_device_h_l240_c31_b860_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_right := to_unsigned(255, 8);
     VAR_MUX_uxn_device_h_l195_c20_4960_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right := to_unsigned(1, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l185_c20_99d2_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right := to_unsigned(0, 4);
     VAR_MUX_uxn_device_h_l185_c20_99d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right := to_unsigned(3, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l219_c3_eda1 := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right := to_unsigned(4, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l231_c50_7a21_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l213_c13_3c14_iffalse := to_unsigned(255, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c50_eecc_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right := to_unsigned(5, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_right := to_unsigned(2, 4);
     VAR_MUX_uxn_device_h_l234_c31_0985_iffalse := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l231_c20_135a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l195_c20_4960_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right := to_unsigned(6, 4);
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c20_28d0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c50_eecc_iffalse := to_unsigned(0, 1);

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
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l172_c2_330c_iftrue := color;
     VAR_color_MUX_uxn_device_h_l178_c7_2dca_iftrue := color;
     VAR_color_MUX_uxn_device_h_l181_c7_0c00_iftrue := color;
     VAR_color_MUX_uxn_device_h_l187_c7_308d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iftrue := color;
     VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iftrue := color;
     VAR_color_MUX_uxn_device_h_l201_c7_32af_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse := flip_y;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right := is_auto_x;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left := is_auto_x;
     VAR_MUX_uxn_device_h_l239_c21_e3e4_cond := is_auto_x;
     VAR_MUX_uxn_device_h_l240_c31_b860_cond := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left := is_auto_y;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse := is_auto_y;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_right := is_x_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_right := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l214_c20_7aad_iffalse := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l231_c20_135a_iffalse := is_x_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse := is_x_in_bounds;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_right := is_y_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_right := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l215_c20_dc0f_iffalse := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l232_c20_28d0_iffalse := is_y_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse := is_y_in_bounds;
     VAR_layer_MUX_uxn_device_h_l172_c2_330c_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l187_c7_308d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l201_c7_32af_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_left := VAR_previous_device_ram_read;
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse := tmp8;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse := tmp8b;
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left := x;
     VAR_x_MUX_uxn_device_h_l172_c2_330c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l178_c7_2dca_iftrue := x;
     VAR_x_MUX_uxn_device_h_l187_c7_308d_iffalse := x;
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left := y;
     VAR_y_MUX_uxn_device_h_l172_c2_330c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l178_c7_2dca_iftrue := y;
     VAR_y_MUX_uxn_device_h_l181_c7_0c00_iftrue := y;
     VAR_y_MUX_uxn_device_h_l187_c7_308d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse := y;
     -- uint8_4_4[uxn_device_h_l206_c12_99a0] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l206_c12_99a0_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l239_c34_d608] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_left;
     BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output := BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output;

     -- uint12_3_0[uxn_device_h_l170_c11_2d68] LATENCY=0
     VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output := uint12_3_0(
     VAR_phase);

     -- BIN_OP_PLUS[uxn_device_h_l239_c44_c350] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_left;
     BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output := BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output;

     -- BIN_OP_EQ[uxn_device_h_l232_c50_676b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l232_c50_676b_left <= VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_left;
     BIN_OP_EQ_uxn_device_h_l232_c50_676b_right <= VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output := BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l197_c7_1cf7] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1cf7_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l172_c2_330c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_330c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l185_c20_012b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l185_c20_012b_left <= VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_left;
     BIN_OP_EQ_uxn_device_h_l185_c20_012b_right <= VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output := BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output;

     -- uint8_5_5[uxn_device_h_l205_c12_097c] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l205_c12_097c_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- UNARY_OP_NOT[uxn_device_h_l247_c22_b94b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output := UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output;

     -- uint8_1_0[uxn_device_h_l207_c11_63c1] LATENCY=0
     VAR_uint8_1_0_uxn_device_h_l207_c11_63c1_return_output := uint8_1_0(
     VAR_previous_device_ram_read);

     -- uint8_7_7[uxn_device_h_l203_c15_22e5] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output;

     -- uint8_1_1[uxn_device_h_l227_c15_d934] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l227_c15_d934_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d LATENCY=0
     -- Inputs
     CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x <= VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_x;
     -- Outputs
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output := CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l178_c7_2dca] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_2dca_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- uint8_0_0[uxn_device_h_l226_c15_d2ff] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l224_c7_d156] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_d156_return_output := result.u16_addr;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l250_c7_0ca5] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_0ca5_return_output := result.u8_value;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l250_c7_0ca5] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_0ca5_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l195_c20_1130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c20_1130_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_left;
     BIN_OP_EQ_uxn_device_h_l195_c20_1130_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output := BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l254_c21_e631] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left <= VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_left;
     BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right <= VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output := BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output;

     -- uint8_7_0[uxn_device_h_l213_c44_11d1] LATENCY=0
     VAR_uint8_7_0_uxn_device_h_l213_c44_11d1_return_output := uint8_7_0(
     x);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l187_c7_308d] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_308d_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_device_h_l250_c7_0ca5] LATENCY=0
     VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_0ca5_return_output := result.is_deo_done;

     -- uint8_6_6[uxn_device_h_l204_c11_3e2e] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l204_c11_3e2e_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- UNARY_OP_NOT[uxn_device_h_l213_c26_4a3b] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output := UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l181_c7_0c00] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_0c00_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_468b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_468b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l250_c7_0ca5] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_0ca5_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l231_c50_8b66] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left <= VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_left;
     BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right <= VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output := BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output;

     -- uint16_uint8_0[uxn_device_h_l216_c21_5e56] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l216_c21_5e56_return_output := uint16_uint8_0(
     resize(to_unsigned(0, 1), 16),
     x);

     -- MUX[uxn_device_h_l240_c31_b860] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l240_c31_b860_cond <= VAR_MUX_uxn_device_h_l240_c31_b860_cond;
     MUX_uxn_device_h_l240_c31_b860_iftrue <= VAR_MUX_uxn_device_h_l240_c31_b860_iftrue;
     MUX_uxn_device_h_l240_c31_b860_iffalse <= VAR_MUX_uxn_device_h_l240_c31_b860_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l240_c31_b860_return_output := MUX_uxn_device_h_l240_c31_b860_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l191_c7_8e4f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_8e4f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l224_c7_d156] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_d156_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_2c69_return_output;
     VAR_MUX_uxn_device_h_l185_c20_99d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c20_012b_return_output;
     VAR_MUX_uxn_device_h_l195_c20_4960_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c20_1130_return_output;
     VAR_MUX_uxn_device_h_l231_c50_7a21_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c50_8b66_return_output;
     VAR_MUX_uxn_device_h_l232_c50_eecc_cond := VAR_BIN_OP_EQ_uxn_device_h_l232_c50_676b_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l238_DUPLICATE_4c25_return_output;
     VAR_MUX_uxn_device_h_l239_c21_e3e4_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_d608_return_output, 8);
     VAR_MUX_uxn_device_h_l239_c21_e3e4_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_c350_return_output, 8);
     VAR_result_u8_value_uxn_device_h_l254_c3_3351 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_e631_return_output, 8);
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_468b_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_468b_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_0c00_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_4c0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue := VAR_MUX_uxn_device_h_l240_c31_b860_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_right := VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_4a3b_return_output;
     VAR_result_u8_value_uxn_device_h_l247_c3_2a4d := resize(VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_b94b_return_output, 8);
     VAR_result_MUX_uxn_device_h_l178_c7_2dca_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_2dca_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_0c00_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_0c00_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_308d_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_308d_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_result_MUX_uxn_device_h_l172_c2_330c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_330c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse := VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_d156_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_d156_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     REG_VAR_phase4 := VAR_uint12_3_0_uxn_device_h_l170_c11_2d68_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_left := VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left := VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output;
     VAR_MUX_uxn_device_h_l233_c22_2094_cond := VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output;
     VAR_MUX_uxn_device_h_l234_c31_0985_cond := VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_uint8_0_0_uxn_device_h_l226_c15_d2ff_return_output;
     VAR_color_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_1_0_uxn_device_h_l207_c11_63c1_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_left := VAR_uint8_1_1_uxn_device_h_l227_c15_d934_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right := VAR_uint8_1_1_uxn_device_h_l227_c15_d934_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_uint8_1_1_uxn_device_h_l227_c15_d934_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_left := VAR_uint8_4_4_uxn_device_h_l206_c12_99a0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_4_4_uxn_device_h_l206_c12_99a0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_left := VAR_uint8_5_5_uxn_device_h_l205_c12_097c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_5_5_uxn_device_h_l205_c12_097c_return_output;
     VAR_layer_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_6_6_uxn_device_h_l204_c11_3e2e_return_output;
     VAR_MUX_uxn_device_h_l213_c13_3c14_iftrue := VAR_uint8_7_0_uxn_device_h_l213_c44_11d1_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_left := VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output;
     VAR_MUX_uxn_device_h_l214_c20_7aad_cond := VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output;
     VAR_MUX_uxn_device_h_l215_c20_dc0f_cond := VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue := VAR_result_u8_value_uxn_device_h_l247_c3_2a4d;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue := VAR_result_u8_value_uxn_device_h_l254_c3_3351;
     -- MUX[uxn_device_h_l231_c50_7a21] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l231_c50_7a21_cond <= VAR_MUX_uxn_device_h_l231_c50_7a21_cond;
     MUX_uxn_device_h_l231_c50_7a21_iftrue <= VAR_MUX_uxn_device_h_l231_c50_7a21_iftrue;
     MUX_uxn_device_h_l231_c50_7a21_iffalse <= VAR_MUX_uxn_device_h_l231_c50_7a21_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l231_c50_7a21_return_output := MUX_uxn_device_h_l231_c50_7a21_return_output;

     -- BIN_OP_EQ[uxn_device_h_l201_c11_1c4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_left;
     BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output := BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;

     -- BIN_OP_AND[uxn_device_h_l232_c20_0340] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l232_c20_0340_left <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_left;
     BIN_OP_AND_uxn_device_h_l232_c20_0340_right <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output := BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output;

     -- BIN_OP_AND[uxn_device_h_l213_c13_b111] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l213_c13_b111_left <= VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_left;
     BIN_OP_AND_uxn_device_h_l213_c13_b111_right <= VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output := BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output;

     -- BIN_OP_EQ[uxn_device_h_l197_c11_9ec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left <= VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_left;
     BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right <= VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output := BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l243_c11_8625] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l243_c11_8625_left <= VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_left;
     BIN_OP_EQ_uxn_device_h_l243_c11_8625_right <= VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output := BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_3228] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_3228_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_3228_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;

     -- BIN_OP_EQ[uxn_device_h_l237_c11_22a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left <= VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_left;
     BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right <= VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output := BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l187_c11_cc8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left <= VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_left;
     BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right <= VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output := BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;

     -- MUX[uxn_device_h_l239_c21_e3e4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l239_c21_e3e4_cond <= VAR_MUX_uxn_device_h_l239_c21_e3e4_cond;
     MUX_uxn_device_h_l239_c21_e3e4_iftrue <= VAR_MUX_uxn_device_h_l239_c21_e3e4_iftrue;
     MUX_uxn_device_h_l239_c21_e3e4_iffalse <= VAR_MUX_uxn_device_h_l239_c21_e3e4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l239_c21_e3e4_return_output := MUX_uxn_device_h_l239_c21_e3e4_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l241_c26_ba9c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output := UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output;

     -- MUX[uxn_device_h_l195_c20_4960] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l195_c20_4960_cond <= VAR_MUX_uxn_device_h_l195_c20_4960_cond;
     MUX_uxn_device_h_l195_c20_4960_iftrue <= VAR_MUX_uxn_device_h_l195_c20_4960_iftrue;
     MUX_uxn_device_h_l195_c20_4960_iffalse <= VAR_MUX_uxn_device_h_l195_c20_4960_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l195_c20_4960_return_output := MUX_uxn_device_h_l195_c20_4960_return_output;

     -- MUX[uxn_device_h_l185_c20_99d2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l185_c20_99d2_cond <= VAR_MUX_uxn_device_h_l185_c20_99d2_cond;
     MUX_uxn_device_h_l185_c20_99d2_iftrue <= VAR_MUX_uxn_device_h_l185_c20_99d2_iftrue;
     MUX_uxn_device_h_l185_c20_99d2_iffalse <= VAR_MUX_uxn_device_h_l185_c20_99d2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l185_c20_99d2_return_output := MUX_uxn_device_h_l185_c20_99d2_return_output;

     -- BIN_OP_AND[uxn_device_h_l231_c20_40fb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l231_c20_40fb_left <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_left;
     BIN_OP_AND_uxn_device_h_l231_c20_40fb_right <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output := BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l224_c11_3795] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l224_c11_3795_left <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_left;
     BIN_OP_EQ_uxn_device_h_l224_c11_3795_right <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output := BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c3_34a0] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c3_34a0_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_left;
     BIN_OP_OR_uxn_device_h_l189_c3_34a0_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output := BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l250_c11_cd5f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_left;
     BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output := BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output;

     -- MUX[uxn_device_h_l232_c50_eecc] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l232_c50_eecc_cond <= VAR_MUX_uxn_device_h_l232_c50_eecc_cond;
     MUX_uxn_device_h_l232_c50_eecc_iftrue <= VAR_MUX_uxn_device_h_l232_c50_eecc_iftrue;
     MUX_uxn_device_h_l232_c50_eecc_iffalse <= VAR_MUX_uxn_device_h_l232_c50_eecc_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l232_c50_eecc_return_output := MUX_uxn_device_h_l232_c50_eecc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l178_c11_5abe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;

     -- BIN_OP_OR[uxn_device_h_l215_c33_383b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l215_c33_383b_left <= VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_left;
     BIN_OP_OR_uxn_device_h_l215_c33_383b_right <= VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output := BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output;

     -- uint8_uint2_0[uxn_device_h_l209_c10_ec20] LATENCY=0
     VAR_uint8_uint2_0_uxn_device_h_l209_c10_ec20_return_output := uint8_uint2_0(
     resize(to_unsigned(0, 1), 8),
     VAR_uint8_1_0_uxn_device_h_l207_c11_63c1_return_output);

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output;

     -- uint16_uint8_8[uxn_device_h_l217_c21_7608] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l217_c21_7608_return_output := uint16_uint8_8(
     VAR_uint16_uint8_0_uxn_device_h_l216_c21_5e56_return_output,
     y);

     -- BIN_OP_OR[uxn_device_h_l214_c33_efd9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l214_c33_efd9_left <= VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_left;
     BIN_OP_OR_uxn_device_h_l214_c33_efd9_right <= VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output := BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l172_c6_bb45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left <= VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_left;
     BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right <= VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output := BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;

     -- BIN_OP_OR[uxn_device_h_l198_c3_5077] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l198_c3_5077_left <= VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_left;
     BIN_OP_OR_uxn_device_h_l198_c3_5077_right <= VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output := BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output;

     -- MUX[uxn_device_h_l234_c31_0985] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l234_c31_0985_cond <= VAR_MUX_uxn_device_h_l234_c31_0985_cond;
     MUX_uxn_device_h_l234_c31_0985_iftrue <= VAR_MUX_uxn_device_h_l234_c31_0985_iftrue;
     MUX_uxn_device_h_l234_c31_0985_iffalse <= VAR_MUX_uxn_device_h_l234_c31_0985_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l234_c31_0985_return_output := MUX_uxn_device_h_l234_c31_0985_return_output;

     -- BIN_OP_EQ[uxn_device_h_l191_c11_fd61] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_left;
     BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output := BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr := VAR_BIN_OP_AND_uxn_device_h_l213_c13_b111_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_left := VAR_BIN_OP_AND_uxn_device_h_l231_c20_40fb_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_left := VAR_BIN_OP_AND_uxn_device_h_l232_c20_0340_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_color_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_layer_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_result_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_x_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_y_MUX_uxn_device_h_l172_c2_330c_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_bb45_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_color_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_layer_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_result_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_x_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_y_MUX_uxn_device_h_l178_c7_2dca_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_5abe_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_0c00_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_3228_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_color_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_layer_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_x_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_y_MUX_uxn_device_h_l187_c7_308d_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_cc8e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_color_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_8e4f_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fd61_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_color_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_y_MUX_uxn_device_h_l197_c7_1cf7_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_9ec7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_color_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_layer_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_1c4d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_3795_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_22a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_8625_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_cd5f_return_output;
     VAR_x_uxn_device_h_l189_c3_0ded := resize(VAR_BIN_OP_OR_uxn_device_h_l189_c3_34a0_return_output, 8);
     VAR_y_uxn_device_h_l198_c3_55b8 := resize(VAR_BIN_OP_OR_uxn_device_h_l198_c3_5077_return_output, 8);
     VAR_MUX_uxn_device_h_l214_c20_7aad_iftrue := VAR_BIN_OP_OR_uxn_device_h_l214_c33_efd9_return_output;
     VAR_MUX_uxn_device_h_l215_c20_dc0f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l215_c33_383b_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_3efa_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue := VAR_MUX_uxn_device_h_l185_c20_99d2_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue := VAR_MUX_uxn_device_h_l195_c20_4960_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_right := VAR_MUX_uxn_device_h_l231_c50_7a21_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_right := VAR_MUX_uxn_device_h_l232_c50_eecc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_MUX_uxn_device_h_l234_c31_0985_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue := VAR_MUX_uxn_device_h_l239_c21_e3e4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_ba9c_return_output;
     VAR_x_MUX_uxn_device_h_l187_c7_308d_iftrue := VAR_x_uxn_device_h_l189_c3_0ded;
     VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue := VAR_y_uxn_device_h_l198_c3_55b8;
     -- MUX[uxn_device_h_l215_c20_dc0f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l215_c20_dc0f_cond <= VAR_MUX_uxn_device_h_l215_c20_dc0f_cond;
     MUX_uxn_device_h_l215_c20_dc0f_iftrue <= VAR_MUX_uxn_device_h_l215_c20_dc0f_iftrue;
     MUX_uxn_device_h_l215_c20_dc0f_iffalse <= VAR_MUX_uxn_device_h_l215_c20_dc0f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l215_c20_dc0f_return_output := MUX_uxn_device_h_l215_c20_dc0f_return_output;

     -- MUX[uxn_device_h_l214_c20_7aad] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l214_c20_7aad_cond <= VAR_MUX_uxn_device_h_l214_c20_7aad_cond;
     MUX_uxn_device_h_l214_c20_7aad_iftrue <= VAR_MUX_uxn_device_h_l214_c20_7aad_iftrue;
     MUX_uxn_device_h_l214_c20_7aad_iffalse <= VAR_MUX_uxn_device_h_l214_c20_7aad_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l214_c20_7aad_return_output := MUX_uxn_device_h_l214_c20_7aad_return_output;

     -- is_auto_x_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_cond;
     is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iftrue;
     is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output := is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_cond;
     result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output := result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- x_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_x_MUX_uxn_device_h_l187_c7_308d_cond;
     x_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_x_MUX_uxn_device_h_l187_c7_308d_iftrue;
     x_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_x_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l187_c7_308d_return_output := x_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l250_c7_0ca5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_cond;
     result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iftrue;
     result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output := result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output;

     -- auto_advance_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_cond;
     auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iftrue;
     auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output := auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l250_c7_0ca5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_cond;
     result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output := result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l250_c7_0ca5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_cond;
     result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output := result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l250_c7_0ca5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_cond;
     result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output := result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output;

     -- is_auto_y_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_cond;
     is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iftrue;
     is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output := is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- ctrl_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_cond;
     ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iftrue;
     ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_return_output := ctrl_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l235_c26_7731] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output := UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output;

     -- BIN_OP_AND[uxn_device_h_l231_c20_e508] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l231_c20_e508_left <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_left;
     BIN_OP_AND_uxn_device_h_l231_c20_e508_right <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output := BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output;

     -- BIN_OP_AND[uxn_device_h_l232_c20_f150] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l232_c20_f150_left <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_left;
     BIN_OP_AND_uxn_device_h_l232_c20_f150_right <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output := BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output;

     -- y_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_y_MUX_uxn_device_h_l197_c7_1cf7_cond;
     y_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     y_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l197_c7_1cf7_return_output := y_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- color_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_color_MUX_uxn_device_h_l201_c7_32af_cond;
     color_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_color_MUX_uxn_device_h_l201_c7_32af_iftrue;
     color_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_color_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l201_c7_32af_return_output := color_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_cond;
     ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iftrue;
     ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output := ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- layer_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_layer_MUX_uxn_device_h_l201_c7_32af_cond;
     layer_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_layer_MUX_uxn_device_h_l201_c7_32af_iftrue;
     layer_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_layer_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l201_c7_32af_return_output := layer_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l213_c13_d5e6] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output := UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output;

     -- flip_x_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_cond;
     flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iftrue;
     flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_return_output := flip_x_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- uint8_uint1_2[uxn_device_h_l210_c10_f17c] LATENCY=0
     VAR_uint8_uint1_2_uxn_device_h_l210_c10_f17c_return_output := uint8_uint1_2(
     VAR_uint8_uint2_0_uxn_device_h_l209_c10_ec20_return_output,
     VAR_uint8_5_5_uxn_device_h_l205_c12_097c_return_output);

     -- flip_y_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_cond;
     flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iftrue;
     flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_return_output := flip_y_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l231_c20_135a_cond := VAR_BIN_OP_AND_uxn_device_h_l231_c20_e508_return_output;
     VAR_MUX_uxn_device_h_l232_c20_28d0_cond := VAR_BIN_OP_AND_uxn_device_h_l232_c20_f150_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_left := VAR_MUX_uxn_device_h_l214_c20_7aad_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_MUX_uxn_device_h_l214_c20_7aad_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_right := VAR_MUX_uxn_device_h_l215_c20_dc0f_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_MUX_uxn_device_h_l215_c20_dc0f_return_output;
     VAR_MUX_uxn_device_h_l213_c13_3c14_cond := VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_d5e6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_7731_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_auto_advance_MUX_uxn_device_h_l224_c7_d156_return_output;
     VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_color_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_ctrl_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_flip_x_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_flip_y_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l224_c7_d156_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l224_c7_d156_return_output;
     VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_layer_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l250_c7_0ca5_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_x_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_y_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     -- result_u8_value_MUX[uxn_device_h_l243_c7_12ae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_cond;
     result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iftrue;
     result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output := result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output;

     -- flip_y_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_cond;
     flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output := flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_cond;
     ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output := ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- auto_advance_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_cond;
     auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iftrue;
     auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output := auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- MUX[uxn_device_h_l231_c20_135a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l231_c20_135a_cond <= VAR_MUX_uxn_device_h_l231_c20_135a_cond;
     MUX_uxn_device_h_l231_c20_135a_iftrue <= VAR_MUX_uxn_device_h_l231_c20_135a_iftrue;
     MUX_uxn_device_h_l231_c20_135a_iffalse <= VAR_MUX_uxn_device_h_l231_c20_135a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l231_c20_135a_return_output := MUX_uxn_device_h_l231_c20_135a_return_output;

     -- color_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_color_MUX_uxn_device_h_l197_c7_1cf7_cond;
     color_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     color_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_color_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l197_c7_1cf7_return_output := color_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l243_c7_12ae] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_cond;
     result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output := result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output;

     -- uint8_uint1_3[uxn_device_h_l211_c10_6708] LATENCY=0
     VAR_uint8_uint1_3_uxn_device_h_l211_c10_6708_return_output := uint8_uint1_3(
     VAR_uint8_uint1_2_uxn_device_h_l210_c10_f17c_return_output,
     VAR_uint8_4_4_uxn_device_h_l206_c12_99a0_return_output);

     -- is_auto_x_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_cond;
     is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iftrue;
     is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output := is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- ctrl_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_cond;
     ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output := ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- layer_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_cond;
     layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_return_output := layer_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- flip_x_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_cond;
     flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output := flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- x_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_x_MUX_uxn_device_h_l181_c7_0c00_cond;
     x_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_x_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     x_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_x_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c7_0c00_return_output := x_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- MUX[uxn_device_h_l213_c13_3c14] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l213_c13_3c14_cond <= VAR_MUX_uxn_device_h_l213_c13_3c14_cond;
     MUX_uxn_device_h_l213_c13_3c14_iftrue <= VAR_MUX_uxn_device_h_l213_c13_3c14_iftrue;
     MUX_uxn_device_h_l213_c13_3c14_iffalse <= VAR_MUX_uxn_device_h_l213_c13_3c14_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l213_c13_3c14_return_output := MUX_uxn_device_h_l213_c13_3c14_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l243_c7_12ae] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output := result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l243_c7_12ae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_cond;
     result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output := result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output;

     -- BIN_OP_AND[uxn_device_h_l220_c26_450f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l220_c26_450f_left <= VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_left;
     BIN_OP_AND_uxn_device_h_l220_c26_450f_right <= VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output := BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output;

     -- y_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_y_MUX_uxn_device_h_l191_c7_8e4f_cond;
     y_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     y_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l191_c7_8e4f_return_output := y_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- MUX[uxn_device_h_l232_c20_28d0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l232_c20_28d0_cond <= VAR_MUX_uxn_device_h_l232_c20_28d0_cond;
     MUX_uxn_device_h_l232_c20_28d0_iftrue <= VAR_MUX_uxn_device_h_l232_c20_28d0_iftrue;
     MUX_uxn_device_h_l232_c20_28d0_iffalse <= VAR_MUX_uxn_device_h_l232_c20_28d0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l232_c20_28d0_return_output := MUX_uxn_device_h_l232_c20_28d0_return_output;

     -- is_auto_y_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_cond;
     is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iftrue;
     is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output := is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- Submodule level 4
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_MUX_uxn_device_h_l213_c13_3c14_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr := VAR_MUX_uxn_device_h_l231_c20_135a_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_MUX_uxn_device_h_l231_c20_135a_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr := VAR_MUX_uxn_device_h_l232_c20_28d0_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_MUX_uxn_device_h_l232_c20_28d0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_color_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_ctrl_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_flip_x_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_flip_y_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_layer_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_12ae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_12ae_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_12ae_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l243_c7_12ae_return_output;
     VAR_x_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_x_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_y_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_y_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     -- y_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_y_MUX_uxn_device_h_l187_c7_308d_cond;
     y_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_y_MUX_uxn_device_h_l187_c7_308d_iftrue;
     y_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_y_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l187_c7_308d_return_output := y_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_auto_x_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_cond;
     is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output := is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- color_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_color_MUX_uxn_device_h_l191_c7_8e4f_cond;
     color_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     color_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_color_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l191_c7_8e4f_return_output := color_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- auto_advance_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_cond;
     auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output := auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l237_c7_fafb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output := result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l233_c53_3aeb] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output := UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_cond;
     ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output := ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond;
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output := is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- is_auto_y_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_cond;
     is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output := is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- flip_x_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_cond;
     flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output := flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_cond;
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output := is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l237_c7_fafb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_cond;
     result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output := result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l233_c35_be96] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output := UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output;

     -- result_u8_value_MUX[uxn_device_h_l237_c7_fafb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_cond;
     result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iftrue;
     result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output := result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output;

     -- x_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_x_MUX_uxn_device_h_l178_c7_2dca_cond;
     x_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_x_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     x_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_x_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l178_c7_2dca_return_output := x_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- uint8_uint1_4[uxn_device_h_l212_c10_69ba] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l212_c10_69ba_return_output := uint8_uint1_4(
     VAR_uint8_uint1_3_uxn_device_h_l211_c10_6708_return_output,
     VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l237_c7_fafb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_cond;
     result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output := result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output;

     -- ctrl_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_cond;
     ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output := ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- tmp8b_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_cond;
     tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iftrue;
     tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output := tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- layer_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_cond;
     layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_return_output := layer_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- flip_y_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_cond;
     flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output := flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l233_c22_2094_iftrue := resize(VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_be96_return_output, 8);
     VAR_MUX_uxn_device_h_l233_c22_2094_iffalse := resize(VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_3aeb_return_output, 8);
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_color_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_color_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_ctrl_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_flip_x_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_flip_y_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_d156_return_output;
     VAR_layer_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_layer_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_fafb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_fafb_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_fafb_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l237_c7_fafb_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_tmp8b_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_uint8_uint1_4_uxn_device_h_l212_c10_69ba_return_output;
     VAR_x_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_x_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_y_MUX_uxn_device_h_l187_c7_308d_return_output;
     -- x_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_x_MUX_uxn_device_h_l172_c2_330c_cond;
     x_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_x_MUX_uxn_device_h_l172_c2_330c_iftrue;
     x_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_x_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l172_c2_330c_return_output := x_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- auto_advance_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_cond;
     auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output := auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- tmp8_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_cond;
     tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iftrue;
     tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_return_output := tmp8_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond;
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output := is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_cond;
     result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output := result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_cond;
     ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iftrue;
     ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output := ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- MUX[uxn_device_h_l233_c22_2094] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l233_c22_2094_cond <= VAR_MUX_uxn_device_h_l233_c22_2094_cond;
     MUX_uxn_device_h_l233_c22_2094_iftrue <= VAR_MUX_uxn_device_h_l233_c22_2094_iftrue;
     MUX_uxn_device_h_l233_c22_2094_iffalse <= VAR_MUX_uxn_device_h_l233_c22_2094_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l233_c22_2094_return_output := MUX_uxn_device_h_l233_c22_2094_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_cond;
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output := is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- ctrl_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_cond;
     ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iftrue;
     ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_return_output := ctrl_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_auto_x_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_cond;
     is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output := is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- y_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_y_MUX_uxn_device_h_l181_c7_0c00_cond;
     y_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_y_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     y_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_y_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l181_c7_0c00_return_output := y_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output := result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- flip_x_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_cond;
     flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iftrue;
     flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_return_output := flip_x_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- color_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_color_MUX_uxn_device_h_l187_c7_308d_cond;
     color_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_color_MUX_uxn_device_h_l187_c7_308d_iftrue;
     color_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_color_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l187_c7_308d_return_output := color_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_cond;
     is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output := is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- layer_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_layer_MUX_uxn_device_h_l187_c7_308d_cond;
     layer_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_layer_MUX_uxn_device_h_l187_c7_308d_iftrue;
     layer_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_layer_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l187_c7_308d_return_output := layer_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_cond;
     result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output := result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a[uxn_device_h_l201_c7_32af] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_32af_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_f42a(
     result,
     VAR_uint16_uint8_8_uxn_device_h_l217_c21_7608_return_output,
     VAR_uint8_6_6_uxn_device_h_l204_c11_3e2e_return_output,
     VAR_result_device_ram_address_uxn_device_h_l219_c3_eda1,
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_450f_return_output,
     VAR_uint8_7_7_uxn_device_h_l203_c15_22e5_return_output,
     VAR_uint8_uint1_4_uxn_device_h_l212_c10_69ba_return_output);

     -- flip_y_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_cond;
     flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iftrue;
     flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_return_output := flip_y_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- tmp8b_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_cond;
     tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output := tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue := VAR_MUX_uxn_device_h_l233_c22_2094_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_color_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_ctrl_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_flip_x_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_flip_y_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_layer_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_32af_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_32af_return_output;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_tmp8_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_tmp8b_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_y_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_y_MUX_uxn_device_h_l181_c7_0c00_return_output;
     -- auto_advance_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_cond;
     auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iftrue;
     auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output := auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond;
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output := is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- ctrl_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_cond;
     ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output := ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_cond;
     ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output := ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- tmp8_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_cond;
     tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output := tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- color_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_color_MUX_uxn_device_h_l181_c7_0c00_cond;
     color_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_color_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     color_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_color_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l181_c7_0c00_return_output := color_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- layer_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_layer_MUX_uxn_device_h_l181_c7_0c00_cond;
     layer_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     layer_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_layer_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l181_c7_0c00_return_output := layer_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- result_u8_value_MUX[uxn_device_h_l224_c7_d156] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_cond;
     result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iftrue;
     result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output := result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output;

     -- flip_x_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_cond;
     flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output := flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- y_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_y_MUX_uxn_device_h_l178_c7_2dca_cond;
     y_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_y_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     y_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_y_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l178_c7_2dca_return_output := y_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- is_auto_y_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_cond;
     is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iftrue;
     is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output := is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_cond;
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output := is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- flip_y_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_cond;
     flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output := flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- tmp8b_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_cond;
     tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output := tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- is_auto_x_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_cond;
     is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iftrue;
     is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output := is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- Submodule level 7
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_auto_advance_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_color_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_color_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_ctrl_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_flip_x_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_flip_y_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_layer_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_tmp8_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_tmp8b_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_y_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_y_MUX_uxn_device_h_l178_c7_2dca_return_output;
     -- color_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_color_MUX_uxn_device_h_l178_c7_2dca_cond;
     color_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_color_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     color_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_color_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l178_c7_2dca_return_output := color_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- is_auto_x_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_cond;
     is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output := is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- is_auto_y_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_cond;
     is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output := is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- flip_y_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_cond;
     flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output := flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- tmp8_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_cond;
     tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output := tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0[uxn_device_h_l201_c7_32af] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l201_c7_32af_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_96f0(
     result,
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_d156_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_d156_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_d156_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_d156_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_d156_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_d156_return_output);

     -- flip_x_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_cond;
     flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output := flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond;
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output := is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_cond;
     ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output := ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- tmp8b_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_cond;
     tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iftrue;
     tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output := tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- auto_advance_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_cond;
     auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output := auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- y_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_y_MUX_uxn_device_h_l172_c2_330c_cond;
     y_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_y_MUX_uxn_device_h_l172_c2_330c_iftrue;
     y_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_y_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l172_c2_330c_return_output := y_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_cond;
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output := is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- ctrl_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_cond;
     ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output := ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- layer_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_layer_MUX_uxn_device_h_l178_c7_2dca_cond;
     layer_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     layer_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_layer_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l178_c7_2dca_return_output := layer_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- Submodule level 8
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_auto_advance_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_color_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_color_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_ctrl_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_flip_x_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_flip_y_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_layer_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_layer_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_32af_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_96f0_uxn_device_h_l201_c7_32af_return_output;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_tmp8_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_tmp8b_MUX_uxn_device_h_l187_c7_308d_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l172_c2_330c_return_output;
     -- layer_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_layer_MUX_uxn_device_h_l172_c2_330c_cond;
     layer_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_layer_MUX_uxn_device_h_l172_c2_330c_iftrue;
     layer_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_layer_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l172_c2_330c_return_output := layer_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- flip_y_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_cond;
     flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iftrue;
     flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_return_output := flip_y_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond;
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output := is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_cond;
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output := is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- is_auto_y_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_cond;
     is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output := is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- tmp8b_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_cond;
     tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output := tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_cond;
     ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output := ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_auto_x_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_cond;
     is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output := is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- ctrl_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_cond;
     ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iftrue;
     ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_return_output := ctrl_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- auto_advance_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_cond;
     auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output := auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- result_MUX[uxn_device_h_l201_c7_32af] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l201_c7_32af_cond <= VAR_result_MUX_uxn_device_h_l201_c7_32af_cond;
     result_MUX_uxn_device_h_l201_c7_32af_iftrue <= VAR_result_MUX_uxn_device_h_l201_c7_32af_iftrue;
     result_MUX_uxn_device_h_l201_c7_32af_iffalse <= VAR_result_MUX_uxn_device_h_l201_c7_32af_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l201_c7_32af_return_output := result_MUX_uxn_device_h_l201_c7_32af_return_output;

     -- color_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_color_MUX_uxn_device_h_l172_c2_330c_cond;
     color_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_color_MUX_uxn_device_h_l172_c2_330c_iftrue;
     color_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_color_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l172_c2_330c_return_output := color_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- flip_x_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_cond;
     flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iftrue;
     flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_return_output := flip_x_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- tmp8_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_cond;
     tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iftrue;
     tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_return_output := tmp8_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- Submodule level 9
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l178_c7_2dca_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_308d_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iffalse := VAR_result_MUX_uxn_device_h_l201_c7_32af_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_tmp8_MUX_uxn_device_h_l187_c7_308d_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_tmp8b_MUX_uxn_device_h_l181_c7_0c00_return_output;
     -- is_y_in_bounds_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output := is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- tmp8_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_cond;
     tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output := tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- result_MUX[uxn_device_h_l197_c7_1cf7] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l197_c7_1cf7_cond <= VAR_result_MUX_uxn_device_h_l197_c7_1cf7_cond;
     result_MUX_uxn_device_h_l197_c7_1cf7_iftrue <= VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iftrue;
     result_MUX_uxn_device_h_l197_c7_1cf7_iffalse <= VAR_result_MUX_uxn_device_h_l197_c7_1cf7_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l197_c7_1cf7_return_output := result_MUX_uxn_device_h_l197_c7_1cf7_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_cond;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output := is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- tmp8b_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_cond;
     tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output := tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- auto_advance_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_cond;
     auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iftrue;
     auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output := auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_auto_x_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_cond;
     is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iftrue;
     is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output := is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_auto_y_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_cond;
     is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iftrue;
     is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output := is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- Submodule level 10
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iffalse := VAR_result_MUX_uxn_device_h_l197_c7_1cf7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_tmp8_MUX_uxn_device_h_l181_c7_0c00_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_tmp8b_MUX_uxn_device_h_l178_c7_2dca_return_output;
     -- is_x_in_bounds_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond;
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output := is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- tmp8b_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_cond;
     tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iftrue;
     tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output := tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- result_MUX[uxn_device_h_l191_c7_8e4f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l191_c7_8e4f_cond <= VAR_result_MUX_uxn_device_h_l191_c7_8e4f_cond;
     result_MUX_uxn_device_h_l191_c7_8e4f_iftrue <= VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iftrue;
     result_MUX_uxn_device_h_l191_c7_8e4f_iffalse <= VAR_result_MUX_uxn_device_h_l191_c7_8e4f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l191_c7_8e4f_return_output := result_MUX_uxn_device_h_l191_c7_8e4f_return_output;

     -- tmp8_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_cond;
     tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output := tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_cond;
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output := is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- Submodule level 11
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_2dca_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_308d_iffalse := VAR_result_MUX_uxn_device_h_l191_c7_8e4f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_tmp8_MUX_uxn_device_h_l178_c7_2dca_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_device_h_l172_c2_330c_return_output;
     -- tmp8_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_cond;
     tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iftrue;
     tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_return_output := tmp8_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond;
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output := is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_cond;
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output := is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- result_MUX[uxn_device_h_l187_c7_308d] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l187_c7_308d_cond <= VAR_result_MUX_uxn_device_h_l187_c7_308d_cond;
     result_MUX_uxn_device_h_l187_c7_308d_iftrue <= VAR_result_MUX_uxn_device_h_l187_c7_308d_iftrue;
     result_MUX_uxn_device_h_l187_c7_308d_iffalse <= VAR_result_MUX_uxn_device_h_l187_c7_308d_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l187_c7_308d_return_output := result_MUX_uxn_device_h_l187_c7_308d_return_output;

     -- Submodule level 12
     REG_VAR_is_x_in_bounds := VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output;
     REG_VAR_is_y_in_bounds := VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_0c00_iffalse := VAR_result_MUX_uxn_device_h_l187_c7_308d_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l172_c2_330c_return_output;
     -- result_MUX[uxn_device_h_l181_c7_0c00] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_0c00_cond <= VAR_result_MUX_uxn_device_h_l181_c7_0c00_cond;
     result_MUX_uxn_device_h_l181_c7_0c00_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_0c00_iftrue;
     result_MUX_uxn_device_h_l181_c7_0c00_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_0c00_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_0c00_return_output := result_MUX_uxn_device_h_l181_c7_0c00_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l178_c7_2dca_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_0c00_return_output;
     -- result_MUX[uxn_device_h_l178_c7_2dca] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l178_c7_2dca_cond <= VAR_result_MUX_uxn_device_h_l178_c7_2dca_cond;
     result_MUX_uxn_device_h_l178_c7_2dca_iftrue <= VAR_result_MUX_uxn_device_h_l178_c7_2dca_iftrue;
     result_MUX_uxn_device_h_l178_c7_2dca_iffalse <= VAR_result_MUX_uxn_device_h_l178_c7_2dca_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l178_c7_2dca_return_output := result_MUX_uxn_device_h_l178_c7_2dca_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l172_c2_330c_iffalse := VAR_result_MUX_uxn_device_h_l178_c7_2dca_return_output;
     -- result_MUX[uxn_device_h_l172_c2_330c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l172_c2_330c_cond <= VAR_result_MUX_uxn_device_h_l172_c2_330c_cond;
     result_MUX_uxn_device_h_l172_c2_330c_iftrue <= VAR_result_MUX_uxn_device_h_l172_c2_330c_iftrue;
     result_MUX_uxn_device_h_l172_c2_330c_iffalse <= VAR_result_MUX_uxn_device_h_l172_c2_330c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l172_c2_330c_return_output := result_MUX_uxn_device_h_l172_c2_330c_return_output;

     -- Submodule level 15
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l172_c2_330c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l172_c2_330c_return_output;
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
REG_COMB_tmp8b <= REG_VAR_tmp8b;
REG_COMB_phase4 <= REG_VAR_phase4;
REG_COMB_color <= REG_VAR_color;
REG_COMB_ctrl_mode <= REG_VAR_ctrl_mode;
REG_COMB_flip_x <= REG_VAR_flip_x;
REG_COMB_flip_y <= REG_VAR_flip_y;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_is_auto_x <= REG_VAR_is_auto_x;
REG_COMB_is_auto_y <= REG_VAR_is_auto_y;
REG_COMB_is_x_in_bounds <= REG_VAR_is_x_in_bounds;
REG_COMB_is_y_in_bounds <= REG_VAR_is_y_in_bounds;
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
     tmp8b <= REG_COMB_tmp8b;
     phase4 <= REG_COMB_phase4;
     color <= REG_COMB_color;
     ctrl_mode <= REG_COMB_ctrl_mode;
     flip_x <= REG_COMB_flip_x;
     flip_y <= REG_COMB_flip_y;
     layer <= REG_COMB_layer;
     is_auto_x <= REG_COMB_is_auto_x;
     is_auto_y <= REG_COMB_is_auto_y;
     is_x_in_bounds <= REG_COMB_is_x_in_bounds;
     is_y_in_bounds <= REG_COMB_is_y_in_bounds;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
