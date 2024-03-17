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
-- BIN_OP_EQ[uxn_device_h_l172_c6_01f4]
signal BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l172_c2_78cf]
signal flip_y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l172_c2_78cf]
signal tmp8_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l172_c2_78cf]
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l172_c2_78cf]
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l172_c2_78cf]
signal flip_x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l172_c2_78cf]
signal ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l172_c2_78cf]
signal is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l172_c2_78cf]
signal result_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l172_c2_78cf_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l172_c2_78cf_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l172_c2_78cf_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l172_c2_78cf]
signal y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l172_c2_78cf]
signal color_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l172_c2_78cf]
signal layer_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l172_c2_78cf]
signal ctrl_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l172_c2_78cf]
signal x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l172_c2_78cf]
signal tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l172_c2_78cf]
signal auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l172_c2_78cf]
signal is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_a267]
signal BIN_OP_EQ_uxn_device_h_l178_c11_a267_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_a267_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l178_c7_cae1]
signal flip_y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l178_c7_cae1]
signal tmp8_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l178_c7_cae1]
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l178_c7_cae1]
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l178_c7_cae1]
signal flip_x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l178_c7_cae1]
signal ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l178_c7_cae1]
signal is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l178_c7_cae1]
signal result_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l178_c7_cae1_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l178_c7_cae1_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l178_c7_cae1_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l178_c7_cae1]
signal y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l178_c7_cae1]
signal color_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l178_c7_cae1]
signal layer_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l178_c7_cae1]
signal ctrl_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l178_c7_cae1]
signal x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l178_c7_cae1]
signal tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l178_c7_cae1]
signal auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l178_c7_cae1]
signal is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_2098]
signal BIN_OP_EQ_uxn_device_h_l181_c11_2098_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_2098_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l181_c7_e8c0]
signal flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l181_c7_e8c0]
signal tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l181_c7_e8c0]
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l181_c7_e8c0]
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l181_c7_e8c0]
signal flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l181_c7_e8c0]
signal ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l181_c7_e8c0]
signal is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_e8c0]
signal result_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_e8c0_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_e8c0_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_e8c0_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l181_c7_e8c0]
signal y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l181_c7_e8c0]
signal color_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l181_c7_e8c0]
signal layer_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l181_c7_e8c0]
signal ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c7_e8c0]
signal x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l181_c7_e8c0]
signal tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l181_c7_e8c0]
signal auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l181_c7_e8c0]
signal is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l185_c20_b331]
signal BIN_OP_EQ_uxn_device_h_l185_c20_b331_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c20_b331_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l185_c20_9d38]
signal MUX_uxn_device_h_l185_c20_9d38_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_9d38_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_9d38_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l185_c20_9d38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l187_c11_a312]
signal BIN_OP_EQ_uxn_device_h_l187_c11_a312_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l187_c11_a312_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l187_c7_83f4]
signal flip_y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l187_c7_83f4]
signal tmp8_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l187_c7_83f4]
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l187_c7_83f4]
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l187_c7_83f4]
signal flip_x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l187_c7_83f4]
signal ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l187_c7_83f4]
signal is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l187_c7_83f4]
signal result_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l187_c7_83f4_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l187_c7_83f4_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l187_c7_83f4_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l187_c7_83f4]
signal y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l187_c7_83f4]
signal color_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l187_c7_83f4]
signal layer_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l187_c7_83f4]
signal ctrl_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l187_c7_83f4]
signal x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l187_c7_83f4]
signal tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l187_c7_83f4]
signal auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l187_c7_83f4]
signal is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l189_c3_aa4d]
signal BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l191_c11_fc38]
signal BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l191_c7_1fbd]
signal flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l191_c7_1fbd]
signal tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l191_c7_1fbd]
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l191_c7_1fbd]
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l191_c7_1fbd]
signal flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l191_c7_1fbd]
signal ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l191_c7_1fbd]
signal is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l191_c7_1fbd]
signal result_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l191_c7_1fbd_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_1fbd_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l191_c7_1fbd_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l191_c7_1fbd]
signal y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l191_c7_1fbd]
signal color_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l191_c7_1fbd]
signal layer_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l191_c7_1fbd]
signal ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l191_c7_1fbd]
signal tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l191_c7_1fbd]
signal auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l191_c7_1fbd]
signal is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c20_0233]
signal BIN_OP_EQ_uxn_device_h_l195_c20_0233_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c20_0233_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l195_c20_ca9e]
signal MUX_uxn_device_h_l195_c20_ca9e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_ca9e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_ca9e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l195_c20_ca9e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l197_c11_a786]
signal BIN_OP_EQ_uxn_device_h_l197_c11_a786_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l197_c11_a786_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l197_c7_1581]
signal flip_y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l197_c7_1581]
signal tmp8_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l197_c7_1581]
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l197_c7_1581]
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l197_c7_1581]
signal flip_x_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l197_c7_1581]
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l197_c7_1581]
signal is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l197_c7_1581]
signal result_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l197_c7_1581_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l197_c7_1581_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l197_c7_1581_return_output : device_out_result_t;

-- y_MUX[uxn_device_h_l197_c7_1581]
signal y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l197_c7_1581]
signal color_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l197_c7_1581]
signal layer_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l197_c7_1581]
signal ctrl_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l197_c7_1581]
signal tmp8b_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l197_c7_1581]
signal auto_advance_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l197_c7_1581]
signal is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l198_c3_8a3a]
signal BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l201_c11_c39e]
signal BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l201_c7_b020]
signal flip_y_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l201_c7_b020]
signal tmp8_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l201_c7_b020]
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l201_c7_b020]
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l201_c7_b020]
signal flip_x_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l201_c7_b020]
signal ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l201_c7_b020]
signal is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l201_c7_b020]
signal result_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l201_c7_b020_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c7_b020_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l201_c7_b020_return_output : device_out_result_t;

-- color_MUX[uxn_device_h_l201_c7_b020]
signal color_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(1 downto 0);

-- layer_MUX[uxn_device_h_l201_c7_b020]
signal layer_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l201_c7_b020]
signal ctrl_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);

-- tmp8b_MUX[uxn_device_h_l201_c7_b020]
signal tmp8b_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l201_c7_b020]
signal auto_advance_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l201_c7_b020]
signal is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l213_c26_bc2d]
signal UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l213_c13_8e66]
signal BIN_OP_AND_uxn_device_h_l213_c13_8e66_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c13_8e66_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l213_c13_3114]
signal UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l213_c13_6078]
signal MUX_uxn_device_h_l213_c13_6078_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l213_c13_6078_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l213_c13_6078_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l213_c13_6078_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l214_c33_fd3e]
signal BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l214_c20_e8b7]
signal MUX_uxn_device_h_l214_c20_e8b7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_e8b7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_e8b7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l214_c20_e8b7_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l215_c33_25b7]
signal BIN_OP_OR_uxn_device_h_l215_c33_25b7_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l215_c33_25b7_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l215_c20_2d2f]
signal MUX_uxn_device_h_l215_c20_2d2f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_2d2f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_2d2f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l215_c20_2d2f_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l220_c26_d370]
signal BIN_OP_AND_uxn_device_h_l220_c26_d370_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c26_d370_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l224_c11_f60f]
signal BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output : unsigned(0 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l224_c7_7d69]
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l224_c7_7d69]
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l224_c7_7d69]
signal is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l224_c7_7d69]
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l224_c7_7d69]
signal result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l224_c7_7d69]
signal result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l224_c7_7d69]
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l224_c7_7d69]
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l224_c7_7d69]
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l224_c7_7d69]
signal auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);

-- is_auto_y_MUX[uxn_device_h_l224_c7_7d69]
signal is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l231_c20_5891]
signal BIN_OP_AND_uxn_device_h_l231_c20_5891_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_5891_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l231_c50_f503]
signal BIN_OP_EQ_uxn_device_h_l231_c50_f503_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c50_f503_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l231_c50_f65e]
signal MUX_uxn_device_h_l231_c50_f65e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_f65e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_f65e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c50_f65e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l231_c20_8dbe]
signal BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l231_c20_23b6]
signal MUX_uxn_device_h_l231_c20_23b6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_23b6_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_23b6_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l231_c20_23b6_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l232_c20_35b9]
signal BIN_OP_AND_uxn_device_h_l232_c20_35b9_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_35b9_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l232_c50_1811]
signal BIN_OP_EQ_uxn_device_h_l232_c50_1811_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c50_1811_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l232_c50_30c7]
signal MUX_uxn_device_h_l232_c50_30c7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_30c7_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_30c7_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c50_30c7_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l232_c20_2d6e]
signal BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l232_c20_fd8b]
signal MUX_uxn_device_h_l232_c20_fd8b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_fd8b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_fd8b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l232_c20_fd8b_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l233_c35_98d1]
signal UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l233_c53_202c]
signal UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l233_c22_40a6]
signal MUX_uxn_device_h_l233_c22_40a6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l233_c22_40a6_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l233_c22_40a6_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l233_c22_40a6_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l234_c31_759b]
signal MUX_uxn_device_h_l234_c31_759b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c31_759b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l234_c31_759b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l234_c31_759b_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l235_c26_3d61]
signal UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l237_c11_15f4]
signal BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l237_c7_4899]
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l237_c7_4899]
signal result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l237_c7_4899]
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l237_c7_4899]
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l239_c34_ad59]
signal BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l239_c44_5042]
signal BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l239_c21_a755]
signal MUX_uxn_device_h_l239_c21_a755_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l239_c21_a755_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l239_c21_a755_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l239_c21_a755_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l240_c31_3498]
signal MUX_uxn_device_h_l240_c31_3498_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l240_c31_3498_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l240_c31_3498_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l240_c31_3498_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l241_c26_0193]
signal UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l243_c11_cc09]
signal BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l243_c7_fa8e]
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l243_c7_fa8e]
signal result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l243_c7_fa8e]
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l243_c7_fa8e]
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l247_c22_6cca]
signal UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l250_c11_9811]
signal BIN_OP_EQ_uxn_device_h_l250_c11_9811_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_9811_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l250_c7_feb2]
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l250_c7_feb2]
signal result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l250_c7_feb2]
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l250_c7_feb2]
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l254_c21_b67f]
signal BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output : unsigned(8 downto 0);

-- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242
signal CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x : unsigned(7 downto 0);
signal CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output : unsigned(7 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output : unsigned(0 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_39a7( ref_toks_0 : device_out_result_t;
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
      base.u8_value := ref_toks_2;
      base.u16_addr := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.is_deo_done := ref_toks_5;
      base.device_ram_address := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l172_c6_01f4
BIN_OP_EQ_uxn_device_h_l172_c6_01f4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left,
BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right,
BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output);

-- flip_y_MUX_uxn_device_h_l172_c2_78cf
flip_y_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l172_c2_78cf_cond,
flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue,
flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse,
flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- tmp8_MUX_uxn_device_h_l172_c2_78cf
tmp8_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l172_c2_78cf_cond,
tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue,
tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse,
tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf
is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf
is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- flip_x_MUX_uxn_device_h_l172_c2_78cf
flip_x_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l172_c2_78cf_cond,
flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue,
flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse,
flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- ctrl_mode_MUX_uxn_device_h_l172_c2_78cf
ctrl_mode_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond,
ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue,
ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse,
ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- is_auto_x_MUX_uxn_device_h_l172_c2_78cf
is_auto_x_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond,
is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue,
is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse,
is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- result_MUX_uxn_device_h_l172_c2_78cf
result_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l172_c2_78cf_cond,
result_MUX_uxn_device_h_l172_c2_78cf_iftrue,
result_MUX_uxn_device_h_l172_c2_78cf_iffalse,
result_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- y_MUX_uxn_device_h_l172_c2_78cf
y_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l172_c2_78cf_cond,
y_MUX_uxn_device_h_l172_c2_78cf_iftrue,
y_MUX_uxn_device_h_l172_c2_78cf_iffalse,
y_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- color_MUX_uxn_device_h_l172_c2_78cf
color_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l172_c2_78cf_cond,
color_MUX_uxn_device_h_l172_c2_78cf_iftrue,
color_MUX_uxn_device_h_l172_c2_78cf_iffalse,
color_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- layer_MUX_uxn_device_h_l172_c2_78cf
layer_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l172_c2_78cf_cond,
layer_MUX_uxn_device_h_l172_c2_78cf_iftrue,
layer_MUX_uxn_device_h_l172_c2_78cf_iffalse,
layer_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- ctrl_MUX_uxn_device_h_l172_c2_78cf
ctrl_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l172_c2_78cf_cond,
ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue,
ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse,
ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- x_MUX_uxn_device_h_l172_c2_78cf
x_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l172_c2_78cf_cond,
x_MUX_uxn_device_h_l172_c2_78cf_iftrue,
x_MUX_uxn_device_h_l172_c2_78cf_iffalse,
x_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- tmp8b_MUX_uxn_device_h_l172_c2_78cf
tmp8b_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond,
tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue,
tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse,
tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- auto_advance_MUX_uxn_device_h_l172_c2_78cf
auto_advance_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond,
auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue,
auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse,
auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- is_auto_y_MUX_uxn_device_h_l172_c2_78cf
is_auto_y_MUX_uxn_device_h_l172_c2_78cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond,
is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue,
is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse,
is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_a267
BIN_OP_EQ_uxn_device_h_l178_c11_a267 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_a267_left,
BIN_OP_EQ_uxn_device_h_l178_c11_a267_right,
BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output);

-- flip_y_MUX_uxn_device_h_l178_c7_cae1
flip_y_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l178_c7_cae1_cond,
flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue,
flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse,
flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- tmp8_MUX_uxn_device_h_l178_c7_cae1
tmp8_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l178_c7_cae1_cond,
tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue,
tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse,
tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1
is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1
is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- flip_x_MUX_uxn_device_h_l178_c7_cae1
flip_x_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l178_c7_cae1_cond,
flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue,
flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse,
flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- ctrl_mode_MUX_uxn_device_h_l178_c7_cae1
ctrl_mode_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond,
ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue,
ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse,
ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- is_auto_x_MUX_uxn_device_h_l178_c7_cae1
is_auto_x_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond,
is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue,
is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse,
is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- result_MUX_uxn_device_h_l178_c7_cae1
result_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l178_c7_cae1_cond,
result_MUX_uxn_device_h_l178_c7_cae1_iftrue,
result_MUX_uxn_device_h_l178_c7_cae1_iffalse,
result_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- y_MUX_uxn_device_h_l178_c7_cae1
y_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l178_c7_cae1_cond,
y_MUX_uxn_device_h_l178_c7_cae1_iftrue,
y_MUX_uxn_device_h_l178_c7_cae1_iffalse,
y_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- color_MUX_uxn_device_h_l178_c7_cae1
color_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l178_c7_cae1_cond,
color_MUX_uxn_device_h_l178_c7_cae1_iftrue,
color_MUX_uxn_device_h_l178_c7_cae1_iffalse,
color_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- layer_MUX_uxn_device_h_l178_c7_cae1
layer_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l178_c7_cae1_cond,
layer_MUX_uxn_device_h_l178_c7_cae1_iftrue,
layer_MUX_uxn_device_h_l178_c7_cae1_iffalse,
layer_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- ctrl_MUX_uxn_device_h_l178_c7_cae1
ctrl_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l178_c7_cae1_cond,
ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue,
ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse,
ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- x_MUX_uxn_device_h_l178_c7_cae1
x_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l178_c7_cae1_cond,
x_MUX_uxn_device_h_l178_c7_cae1_iftrue,
x_MUX_uxn_device_h_l178_c7_cae1_iffalse,
x_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- tmp8b_MUX_uxn_device_h_l178_c7_cae1
tmp8b_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond,
tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue,
tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse,
tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- auto_advance_MUX_uxn_device_h_l178_c7_cae1
auto_advance_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond,
auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue,
auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse,
auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- is_auto_y_MUX_uxn_device_h_l178_c7_cae1
is_auto_y_MUX_uxn_device_h_l178_c7_cae1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond,
is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue,
is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse,
is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_2098
BIN_OP_EQ_uxn_device_h_l181_c11_2098 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_2098_left,
BIN_OP_EQ_uxn_device_h_l181_c11_2098_right,
BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output);

-- flip_y_MUX_uxn_device_h_l181_c7_e8c0
flip_y_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond,
flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- tmp8_MUX_uxn_device_h_l181_c7_e8c0
tmp8_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond,
tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0
is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0
is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- flip_x_MUX_uxn_device_h_l181_c7_e8c0
flip_x_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond,
flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0
ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond,
ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- is_auto_x_MUX_uxn_device_h_l181_c7_e8c0
is_auto_x_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond,
is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- result_MUX_uxn_device_h_l181_c7_e8c0
result_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_e8c0_cond,
result_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
result_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
result_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- y_MUX_uxn_device_h_l181_c7_e8c0
y_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l181_c7_e8c0_cond,
y_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
y_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
y_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- color_MUX_uxn_device_h_l181_c7_e8c0
color_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l181_c7_e8c0_cond,
color_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
color_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
color_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- layer_MUX_uxn_device_h_l181_c7_e8c0
layer_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l181_c7_e8c0_cond,
layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
layer_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- ctrl_MUX_uxn_device_h_l181_c7_e8c0
ctrl_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond,
ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- x_MUX_uxn_device_h_l181_c7_e8c0
x_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c7_e8c0_cond,
x_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
x_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
x_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- tmp8b_MUX_uxn_device_h_l181_c7_e8c0
tmp8b_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond,
tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- auto_advance_MUX_uxn_device_h_l181_c7_e8c0
auto_advance_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond,
auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- is_auto_y_MUX_uxn_device_h_l181_c7_e8c0
is_auto_y_MUX_uxn_device_h_l181_c7_e8c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond,
is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue,
is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse,
is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output);

-- BIN_OP_EQ_uxn_device_h_l185_c20_b331
BIN_OP_EQ_uxn_device_h_l185_c20_b331 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l185_c20_b331_left,
BIN_OP_EQ_uxn_device_h_l185_c20_b331_right,
BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output);

-- MUX_uxn_device_h_l185_c20_9d38
MUX_uxn_device_h_l185_c20_9d38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l185_c20_9d38_cond,
MUX_uxn_device_h_l185_c20_9d38_iftrue,
MUX_uxn_device_h_l185_c20_9d38_iffalse,
MUX_uxn_device_h_l185_c20_9d38_return_output);

-- BIN_OP_EQ_uxn_device_h_l187_c11_a312
BIN_OP_EQ_uxn_device_h_l187_c11_a312 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l187_c11_a312_left,
BIN_OP_EQ_uxn_device_h_l187_c11_a312_right,
BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output);

-- flip_y_MUX_uxn_device_h_l187_c7_83f4
flip_y_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l187_c7_83f4_cond,
flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue,
flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse,
flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- tmp8_MUX_uxn_device_h_l187_c7_83f4
tmp8_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l187_c7_83f4_cond,
tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue,
tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse,
tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4
is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4
is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- flip_x_MUX_uxn_device_h_l187_c7_83f4
flip_x_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l187_c7_83f4_cond,
flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue,
flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse,
flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- ctrl_mode_MUX_uxn_device_h_l187_c7_83f4
ctrl_mode_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond,
ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue,
ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse,
ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- is_auto_x_MUX_uxn_device_h_l187_c7_83f4
is_auto_x_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond,
is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue,
is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse,
is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- result_MUX_uxn_device_h_l187_c7_83f4
result_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l187_c7_83f4_cond,
result_MUX_uxn_device_h_l187_c7_83f4_iftrue,
result_MUX_uxn_device_h_l187_c7_83f4_iffalse,
result_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- y_MUX_uxn_device_h_l187_c7_83f4
y_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l187_c7_83f4_cond,
y_MUX_uxn_device_h_l187_c7_83f4_iftrue,
y_MUX_uxn_device_h_l187_c7_83f4_iffalse,
y_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- color_MUX_uxn_device_h_l187_c7_83f4
color_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l187_c7_83f4_cond,
color_MUX_uxn_device_h_l187_c7_83f4_iftrue,
color_MUX_uxn_device_h_l187_c7_83f4_iffalse,
color_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- layer_MUX_uxn_device_h_l187_c7_83f4
layer_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l187_c7_83f4_cond,
layer_MUX_uxn_device_h_l187_c7_83f4_iftrue,
layer_MUX_uxn_device_h_l187_c7_83f4_iffalse,
layer_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- ctrl_MUX_uxn_device_h_l187_c7_83f4
ctrl_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l187_c7_83f4_cond,
ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue,
ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse,
ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- x_MUX_uxn_device_h_l187_c7_83f4
x_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l187_c7_83f4_cond,
x_MUX_uxn_device_h_l187_c7_83f4_iftrue,
x_MUX_uxn_device_h_l187_c7_83f4_iffalse,
x_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- tmp8b_MUX_uxn_device_h_l187_c7_83f4
tmp8b_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond,
tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue,
tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse,
tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- auto_advance_MUX_uxn_device_h_l187_c7_83f4
auto_advance_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond,
auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue,
auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse,
auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- is_auto_y_MUX_uxn_device_h_l187_c7_83f4
is_auto_y_MUX_uxn_device_h_l187_c7_83f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond,
is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue,
is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse,
is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output);

-- BIN_OP_OR_uxn_device_h_l189_c3_aa4d
BIN_OP_OR_uxn_device_h_l189_c3_aa4d : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left,
BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right,
BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output);

-- BIN_OP_EQ_uxn_device_h_l191_c11_fc38
BIN_OP_EQ_uxn_device_h_l191_c11_fc38 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left,
BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right,
BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output);

-- flip_y_MUX_uxn_device_h_l191_c7_1fbd
flip_y_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond,
flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- tmp8_MUX_uxn_device_h_l191_c7_1fbd
tmp8_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond,
tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd
is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd
is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- flip_x_MUX_uxn_device_h_l191_c7_1fbd
flip_x_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond,
flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd
ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond,
ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- is_auto_x_MUX_uxn_device_h_l191_c7_1fbd
is_auto_x_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond,
is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- result_MUX_uxn_device_h_l191_c7_1fbd
result_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l191_c7_1fbd_cond,
result_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
result_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
result_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- y_MUX_uxn_device_h_l191_c7_1fbd
y_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l191_c7_1fbd_cond,
y_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
y_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
y_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- color_MUX_uxn_device_h_l191_c7_1fbd
color_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l191_c7_1fbd_cond,
color_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
color_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
color_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- layer_MUX_uxn_device_h_l191_c7_1fbd
layer_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l191_c7_1fbd_cond,
layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
layer_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- ctrl_MUX_uxn_device_h_l191_c7_1fbd
ctrl_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond,
ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- tmp8b_MUX_uxn_device_h_l191_c7_1fbd
tmp8b_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond,
tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- auto_advance_MUX_uxn_device_h_l191_c7_1fbd
auto_advance_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond,
auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- is_auto_y_MUX_uxn_device_h_l191_c7_1fbd
is_auto_y_MUX_uxn_device_h_l191_c7_1fbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond,
is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue,
is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse,
is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c20_0233
BIN_OP_EQ_uxn_device_h_l195_c20_0233 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c20_0233_left,
BIN_OP_EQ_uxn_device_h_l195_c20_0233_right,
BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output);

-- MUX_uxn_device_h_l195_c20_ca9e
MUX_uxn_device_h_l195_c20_ca9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l195_c20_ca9e_cond,
MUX_uxn_device_h_l195_c20_ca9e_iftrue,
MUX_uxn_device_h_l195_c20_ca9e_iffalse,
MUX_uxn_device_h_l195_c20_ca9e_return_output);

-- BIN_OP_EQ_uxn_device_h_l197_c11_a786
BIN_OP_EQ_uxn_device_h_l197_c11_a786 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l197_c11_a786_left,
BIN_OP_EQ_uxn_device_h_l197_c11_a786_right,
BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output);

-- flip_y_MUX_uxn_device_h_l197_c7_1581
flip_y_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l197_c7_1581_cond,
flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue,
flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse,
flip_y_MUX_uxn_device_h_l197_c7_1581_return_output);

-- tmp8_MUX_uxn_device_h_l197_c7_1581
tmp8_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l197_c7_1581_cond,
tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue,
tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse,
tmp8_MUX_uxn_device_h_l197_c7_1581_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output);

-- flip_x_MUX_uxn_device_h_l197_c7_1581
flip_x_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l197_c7_1581_cond,
flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue,
flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse,
flip_x_MUX_uxn_device_h_l197_c7_1581_return_output);

-- ctrl_mode_MUX_uxn_device_h_l197_c7_1581
ctrl_mode_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond,
ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue,
ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse,
ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output);

-- is_auto_x_MUX_uxn_device_h_l197_c7_1581
is_auto_x_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond,
is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue,
is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse,
is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output);

-- result_MUX_uxn_device_h_l197_c7_1581
result_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l197_c7_1581_cond,
result_MUX_uxn_device_h_l197_c7_1581_iftrue,
result_MUX_uxn_device_h_l197_c7_1581_iffalse,
result_MUX_uxn_device_h_l197_c7_1581_return_output);

-- y_MUX_uxn_device_h_l197_c7_1581
y_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l197_c7_1581_cond,
y_MUX_uxn_device_h_l197_c7_1581_iftrue,
y_MUX_uxn_device_h_l197_c7_1581_iffalse,
y_MUX_uxn_device_h_l197_c7_1581_return_output);

-- color_MUX_uxn_device_h_l197_c7_1581
color_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l197_c7_1581_cond,
color_MUX_uxn_device_h_l197_c7_1581_iftrue,
color_MUX_uxn_device_h_l197_c7_1581_iffalse,
color_MUX_uxn_device_h_l197_c7_1581_return_output);

-- layer_MUX_uxn_device_h_l197_c7_1581
layer_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l197_c7_1581_cond,
layer_MUX_uxn_device_h_l197_c7_1581_iftrue,
layer_MUX_uxn_device_h_l197_c7_1581_iffalse,
layer_MUX_uxn_device_h_l197_c7_1581_return_output);

-- ctrl_MUX_uxn_device_h_l197_c7_1581
ctrl_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l197_c7_1581_cond,
ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue,
ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse,
ctrl_MUX_uxn_device_h_l197_c7_1581_return_output);

-- tmp8b_MUX_uxn_device_h_l197_c7_1581
tmp8b_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l197_c7_1581_cond,
tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue,
tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse,
tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output);

-- auto_advance_MUX_uxn_device_h_l197_c7_1581
auto_advance_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l197_c7_1581_cond,
auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue,
auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse,
auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output);

-- is_auto_y_MUX_uxn_device_h_l197_c7_1581
is_auto_y_MUX_uxn_device_h_l197_c7_1581 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond,
is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue,
is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse,
is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output);

-- BIN_OP_OR_uxn_device_h_l198_c3_8a3a
BIN_OP_OR_uxn_device_h_l198_c3_8a3a : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left,
BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right,
BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output);

-- BIN_OP_EQ_uxn_device_h_l201_c11_c39e
BIN_OP_EQ_uxn_device_h_l201_c11_c39e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left,
BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right,
BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output);

-- flip_y_MUX_uxn_device_h_l201_c7_b020
flip_y_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l201_c7_b020_cond,
flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue,
flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse,
flip_y_MUX_uxn_device_h_l201_c7_b020_return_output);

-- tmp8_MUX_uxn_device_h_l201_c7_b020
tmp8_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l201_c7_b020_cond,
tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue,
tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse,
tmp8_MUX_uxn_device_h_l201_c7_b020_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020
is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020
is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output);

-- flip_x_MUX_uxn_device_h_l201_c7_b020
flip_x_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l201_c7_b020_cond,
flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue,
flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse,
flip_x_MUX_uxn_device_h_l201_c7_b020_return_output);

-- ctrl_mode_MUX_uxn_device_h_l201_c7_b020
ctrl_mode_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond,
ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue,
ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse,
ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output);

-- is_auto_x_MUX_uxn_device_h_l201_c7_b020
is_auto_x_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond,
is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue,
is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse,
is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output);

-- result_MUX_uxn_device_h_l201_c7_b020
result_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l201_c7_b020_cond,
result_MUX_uxn_device_h_l201_c7_b020_iftrue,
result_MUX_uxn_device_h_l201_c7_b020_iffalse,
result_MUX_uxn_device_h_l201_c7_b020_return_output);

-- color_MUX_uxn_device_h_l201_c7_b020
color_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l201_c7_b020_cond,
color_MUX_uxn_device_h_l201_c7_b020_iftrue,
color_MUX_uxn_device_h_l201_c7_b020_iffalse,
color_MUX_uxn_device_h_l201_c7_b020_return_output);

-- layer_MUX_uxn_device_h_l201_c7_b020
layer_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l201_c7_b020_cond,
layer_MUX_uxn_device_h_l201_c7_b020_iftrue,
layer_MUX_uxn_device_h_l201_c7_b020_iffalse,
layer_MUX_uxn_device_h_l201_c7_b020_return_output);

-- ctrl_MUX_uxn_device_h_l201_c7_b020
ctrl_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l201_c7_b020_cond,
ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue,
ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse,
ctrl_MUX_uxn_device_h_l201_c7_b020_return_output);

-- tmp8b_MUX_uxn_device_h_l201_c7_b020
tmp8b_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l201_c7_b020_cond,
tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue,
tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse,
tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output);

-- auto_advance_MUX_uxn_device_h_l201_c7_b020
auto_advance_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l201_c7_b020_cond,
auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue,
auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse,
auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output);

-- is_auto_y_MUX_uxn_device_h_l201_c7_b020
is_auto_y_MUX_uxn_device_h_l201_c7_b020 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond,
is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue,
is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse,
is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output);

-- UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d
UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr,
UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output);

-- BIN_OP_AND_uxn_device_h_l213_c13_8e66
BIN_OP_AND_uxn_device_h_l213_c13_8e66 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l213_c13_8e66_left,
BIN_OP_AND_uxn_device_h_l213_c13_8e66_right,
BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output);

-- UNARY_OP_NOT_uxn_device_h_l213_c13_3114
UNARY_OP_NOT_uxn_device_h_l213_c13_3114 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr,
UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output);

-- MUX_uxn_device_h_l213_c13_6078
MUX_uxn_device_h_l213_c13_6078 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l213_c13_6078_cond,
MUX_uxn_device_h_l213_c13_6078_iftrue,
MUX_uxn_device_h_l213_c13_6078_iffalse,
MUX_uxn_device_h_l213_c13_6078_return_output);

-- BIN_OP_OR_uxn_device_h_l214_c33_fd3e
BIN_OP_OR_uxn_device_h_l214_c33_fd3e : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left,
BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right,
BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output);

-- MUX_uxn_device_h_l214_c20_e8b7
MUX_uxn_device_h_l214_c20_e8b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l214_c20_e8b7_cond,
MUX_uxn_device_h_l214_c20_e8b7_iftrue,
MUX_uxn_device_h_l214_c20_e8b7_iffalse,
MUX_uxn_device_h_l214_c20_e8b7_return_output);

-- BIN_OP_OR_uxn_device_h_l215_c33_25b7
BIN_OP_OR_uxn_device_h_l215_c33_25b7 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l215_c33_25b7_left,
BIN_OP_OR_uxn_device_h_l215_c33_25b7_right,
BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output);

-- MUX_uxn_device_h_l215_c20_2d2f
MUX_uxn_device_h_l215_c20_2d2f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l215_c20_2d2f_cond,
MUX_uxn_device_h_l215_c20_2d2f_iftrue,
MUX_uxn_device_h_l215_c20_2d2f_iffalse,
MUX_uxn_device_h_l215_c20_2d2f_return_output);

-- BIN_OP_AND_uxn_device_h_l220_c26_d370
BIN_OP_AND_uxn_device_h_l220_c26_d370 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l220_c26_d370_left,
BIN_OP_AND_uxn_device_h_l220_c26_d370_right,
BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output);

-- BIN_OP_EQ_uxn_device_h_l224_c11_f60f
BIN_OP_EQ_uxn_device_h_l224_c11_f60f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left,
BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right,
BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69
is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69
is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- is_auto_x_MUX_uxn_device_h_l224_c7_7d69
is_auto_x_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond,
is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue,
is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse,
is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_u8_value_MUX_uxn_device_h_l224_c7_7d69
result_u8_value_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond,
result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_u16_addr_MUX_uxn_device_h_l224_c7_7d69
result_u16_addr_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond,
result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69
result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond,
result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69
result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond,
result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69
result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond,
result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue,
result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse,
result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- auto_advance_MUX_uxn_device_h_l224_c7_7d69
auto_advance_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond,
auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue,
auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse,
auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- is_auto_y_MUX_uxn_device_h_l224_c7_7d69
is_auto_y_MUX_uxn_device_h_l224_c7_7d69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond,
is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue,
is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse,
is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output);

-- BIN_OP_AND_uxn_device_h_l231_c20_5891
BIN_OP_AND_uxn_device_h_l231_c20_5891 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l231_c20_5891_left,
BIN_OP_AND_uxn_device_h_l231_c20_5891_right,
BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output);

-- BIN_OP_EQ_uxn_device_h_l231_c50_f503
BIN_OP_EQ_uxn_device_h_l231_c50_f503 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l231_c50_f503_left,
BIN_OP_EQ_uxn_device_h_l231_c50_f503_right,
BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output);

-- MUX_uxn_device_h_l231_c50_f65e
MUX_uxn_device_h_l231_c50_f65e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l231_c50_f65e_cond,
MUX_uxn_device_h_l231_c50_f65e_iftrue,
MUX_uxn_device_h_l231_c50_f65e_iffalse,
MUX_uxn_device_h_l231_c50_f65e_return_output);

-- BIN_OP_AND_uxn_device_h_l231_c20_8dbe
BIN_OP_AND_uxn_device_h_l231_c20_8dbe : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left,
BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right,
BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output);

-- MUX_uxn_device_h_l231_c20_23b6
MUX_uxn_device_h_l231_c20_23b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l231_c20_23b6_cond,
MUX_uxn_device_h_l231_c20_23b6_iftrue,
MUX_uxn_device_h_l231_c20_23b6_iffalse,
MUX_uxn_device_h_l231_c20_23b6_return_output);

-- BIN_OP_AND_uxn_device_h_l232_c20_35b9
BIN_OP_AND_uxn_device_h_l232_c20_35b9 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l232_c20_35b9_left,
BIN_OP_AND_uxn_device_h_l232_c20_35b9_right,
BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output);

-- BIN_OP_EQ_uxn_device_h_l232_c50_1811
BIN_OP_EQ_uxn_device_h_l232_c50_1811 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l232_c50_1811_left,
BIN_OP_EQ_uxn_device_h_l232_c50_1811_right,
BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output);

-- MUX_uxn_device_h_l232_c50_30c7
MUX_uxn_device_h_l232_c50_30c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l232_c50_30c7_cond,
MUX_uxn_device_h_l232_c50_30c7_iftrue,
MUX_uxn_device_h_l232_c50_30c7_iffalse,
MUX_uxn_device_h_l232_c50_30c7_return_output);

-- BIN_OP_AND_uxn_device_h_l232_c20_2d6e
BIN_OP_AND_uxn_device_h_l232_c20_2d6e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left,
BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right,
BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output);

-- MUX_uxn_device_h_l232_c20_fd8b
MUX_uxn_device_h_l232_c20_fd8b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l232_c20_fd8b_cond,
MUX_uxn_device_h_l232_c20_fd8b_iftrue,
MUX_uxn_device_h_l232_c20_fd8b_iffalse,
MUX_uxn_device_h_l232_c20_fd8b_return_output);

-- UNARY_OP_NOT_uxn_device_h_l233_c35_98d1
UNARY_OP_NOT_uxn_device_h_l233_c35_98d1 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr,
UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output);

-- UNARY_OP_NOT_uxn_device_h_l233_c53_202c
UNARY_OP_NOT_uxn_device_h_l233_c53_202c : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr,
UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output);

-- MUX_uxn_device_h_l233_c22_40a6
MUX_uxn_device_h_l233_c22_40a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l233_c22_40a6_cond,
MUX_uxn_device_h_l233_c22_40a6_iftrue,
MUX_uxn_device_h_l233_c22_40a6_iffalse,
MUX_uxn_device_h_l233_c22_40a6_return_output);

-- MUX_uxn_device_h_l234_c31_759b
MUX_uxn_device_h_l234_c31_759b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l234_c31_759b_cond,
MUX_uxn_device_h_l234_c31_759b_iftrue,
MUX_uxn_device_h_l234_c31_759b_iffalse,
MUX_uxn_device_h_l234_c31_759b_return_output);

-- UNARY_OP_NOT_uxn_device_h_l235_c26_3d61
UNARY_OP_NOT_uxn_device_h_l235_c26_3d61 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr,
UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output);

-- BIN_OP_EQ_uxn_device_h_l237_c11_15f4
BIN_OP_EQ_uxn_device_h_l237_c11_15f4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left,
BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right,
BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output);

-- result_u8_value_MUX_uxn_device_h_l237_c7_4899
result_u8_value_MUX_uxn_device_h_l237_c7_4899 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond,
result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue,
result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse,
result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l237_c7_4899
result_is_deo_done_MUX_uxn_device_h_l237_c7_4899 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond,
result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue,
result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse,
result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l237_c7_4899
result_device_ram_address_MUX_uxn_device_h_l237_c7_4899 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond,
result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue,
result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse,
result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output);

-- BIN_OP_PLUS_uxn_device_h_l239_c34_ad59
BIN_OP_PLUS_uxn_device_h_l239_c34_ad59 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left,
BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right,
BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output);

-- BIN_OP_PLUS_uxn_device_h_l239_c44_5042
BIN_OP_PLUS_uxn_device_h_l239_c44_5042 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left,
BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right,
BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output);

-- MUX_uxn_device_h_l239_c21_a755
MUX_uxn_device_h_l239_c21_a755 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l239_c21_a755_cond,
MUX_uxn_device_h_l239_c21_a755_iftrue,
MUX_uxn_device_h_l239_c21_a755_iffalse,
MUX_uxn_device_h_l239_c21_a755_return_output);

-- MUX_uxn_device_h_l240_c31_3498
MUX_uxn_device_h_l240_c31_3498 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l240_c31_3498_cond,
MUX_uxn_device_h_l240_c31_3498_iftrue,
MUX_uxn_device_h_l240_c31_3498_iffalse,
MUX_uxn_device_h_l240_c31_3498_return_output);

-- UNARY_OP_NOT_uxn_device_h_l241_c26_0193
UNARY_OP_NOT_uxn_device_h_l241_c26_0193 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr,
UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output);

-- BIN_OP_EQ_uxn_device_h_l243_c11_cc09
BIN_OP_EQ_uxn_device_h_l243_c11_cc09 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left,
BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right,
BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output);

-- result_u8_value_MUX_uxn_device_h_l243_c7_fa8e
result_u8_value_MUX_uxn_device_h_l243_c7_fa8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond,
result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue,
result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse,
result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e
result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond,
result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e
result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond,
result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output);

-- UNARY_OP_NOT_uxn_device_h_l247_c22_6cca
UNARY_OP_NOT_uxn_device_h_l247_c22_6cca : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr,
UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output);

-- BIN_OP_EQ_uxn_device_h_l250_c11_9811
BIN_OP_EQ_uxn_device_h_l250_c11_9811 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l250_c11_9811_left,
BIN_OP_EQ_uxn_device_h_l250_c11_9811_right,
BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output);

-- result_u8_value_MUX_uxn_device_h_l250_c7_feb2
result_u8_value_MUX_uxn_device_h_l250_c7_feb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond,
result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue,
result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse,
result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2
result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond,
result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2
result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond,
result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output);

-- BIN_OP_PLUS_uxn_device_h_l254_c21_b67f
BIN_OP_PLUS_uxn_device_h_l254_c21_b67f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left,
BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right,
BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output);

-- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242 : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x,
CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output);



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
 BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output,
 flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output,
 tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output,
 flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output,
 ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output,
 is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output,
 result_MUX_uxn_device_h_l172_c2_78cf_return_output,
 y_MUX_uxn_device_h_l172_c2_78cf_return_output,
 color_MUX_uxn_device_h_l172_c2_78cf_return_output,
 layer_MUX_uxn_device_h_l172_c2_78cf_return_output,
 ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output,
 x_MUX_uxn_device_h_l172_c2_78cf_return_output,
 tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output,
 auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output,
 is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output,
 flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output,
 tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output,
 flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output,
 ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output,
 is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output,
 result_MUX_uxn_device_h_l178_c7_cae1_return_output,
 y_MUX_uxn_device_h_l178_c7_cae1_return_output,
 color_MUX_uxn_device_h_l178_c7_cae1_return_output,
 layer_MUX_uxn_device_h_l178_c7_cae1_return_output,
 ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output,
 x_MUX_uxn_device_h_l178_c7_cae1_return_output,
 tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output,
 auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output,
 is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output,
 flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 result_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 y_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 color_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 layer_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 x_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output,
 BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output,
 MUX_uxn_device_h_l185_c20_9d38_return_output,
 BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output,
 flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output,
 tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output,
 flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output,
 ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output,
 is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output,
 result_MUX_uxn_device_h_l187_c7_83f4_return_output,
 y_MUX_uxn_device_h_l187_c7_83f4_return_output,
 color_MUX_uxn_device_h_l187_c7_83f4_return_output,
 layer_MUX_uxn_device_h_l187_c7_83f4_return_output,
 ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output,
 x_MUX_uxn_device_h_l187_c7_83f4_return_output,
 tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output,
 auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output,
 is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output,
 BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output,
 BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output,
 flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 result_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 y_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 color_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 layer_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output,
 MUX_uxn_device_h_l195_c20_ca9e_return_output,
 BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output,
 flip_y_MUX_uxn_device_h_l197_c7_1581_return_output,
 tmp8_MUX_uxn_device_h_l197_c7_1581_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output,
 flip_x_MUX_uxn_device_h_l197_c7_1581_return_output,
 ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output,
 is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output,
 result_MUX_uxn_device_h_l197_c7_1581_return_output,
 y_MUX_uxn_device_h_l197_c7_1581_return_output,
 color_MUX_uxn_device_h_l197_c7_1581_return_output,
 layer_MUX_uxn_device_h_l197_c7_1581_return_output,
 ctrl_MUX_uxn_device_h_l197_c7_1581_return_output,
 tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output,
 auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output,
 is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output,
 BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output,
 BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output,
 flip_y_MUX_uxn_device_h_l201_c7_b020_return_output,
 tmp8_MUX_uxn_device_h_l201_c7_b020_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output,
 flip_x_MUX_uxn_device_h_l201_c7_b020_return_output,
 ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output,
 is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output,
 result_MUX_uxn_device_h_l201_c7_b020_return_output,
 color_MUX_uxn_device_h_l201_c7_b020_return_output,
 layer_MUX_uxn_device_h_l201_c7_b020_return_output,
 ctrl_MUX_uxn_device_h_l201_c7_b020_return_output,
 tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output,
 auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output,
 is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output,
 UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output,
 BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output,
 UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output,
 MUX_uxn_device_h_l213_c13_6078_return_output,
 BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output,
 MUX_uxn_device_h_l214_c20_e8b7_return_output,
 BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output,
 MUX_uxn_device_h_l215_c20_2d2f_return_output,
 BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output,
 BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output,
 is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output,
 result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output,
 auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output,
 is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output,
 BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output,
 BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output,
 MUX_uxn_device_h_l231_c50_f65e_return_output,
 BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output,
 MUX_uxn_device_h_l231_c20_23b6_return_output,
 BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output,
 BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output,
 MUX_uxn_device_h_l232_c50_30c7_return_output,
 BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output,
 MUX_uxn_device_h_l232_c20_fd8b_return_output,
 UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output,
 UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output,
 MUX_uxn_device_h_l233_c22_40a6_return_output,
 MUX_uxn_device_h_l234_c31_759b_return_output,
 UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output,
 BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output,
 result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output,
 result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output,
 result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output,
 BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output,
 BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output,
 MUX_uxn_device_h_l239_c21_a755_return_output,
 MUX_uxn_device_h_l240_c31_3498_return_output,
 UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output,
 BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output,
 result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output,
 UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output,
 BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output,
 result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output,
 BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output,
 CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l172_c2_78cf_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_78cf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_78cf_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_cae1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_78cf_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l178_c7_cae1_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_cae1_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_cae1_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e8c0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_e8c0_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_83f4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_9d38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_9d38_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_9d38_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l185_c20_9d38_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l187_c7_83f4_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_83f4_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_83f4_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_1fbd_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_x_uxn_device_h_l189_c3_3f9d : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_1fbd_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1581_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_ca9e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_ca9e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_ca9e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l195_c20_ca9e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l197_c7_1581_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1581_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1581_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_b020_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
 variable VAR_y_uxn_device_h_l198_c3_3fe4 : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l201_c7_b020_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_b020_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_b020_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l201_c7_b020_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l204_c11_a8f3_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l205_c12_d294_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l206_c12_48a0_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_0_uxn_device_h_l207_c11_b6d6_return_output : unsigned(1 downto 0);
 variable VAR_uint8_uint2_0_uxn_device_h_l209_c10_785c_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_uxn_device_h_l210_c10_5e6a_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_uxn_device_h_l211_c10_f6a8_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l212_c10_d409_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_6078_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_6078_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_6078_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_7_0_uxn_device_h_l213_c44_7b89_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l213_c13_6078_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_e8b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_e8b7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_e8b7_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l214_c20_e8b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_2d2f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_2d2f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_2d2f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l215_c20_2d2f_return_output : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l216_c21_df39_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l217_c21_22d2_return_output : unsigned(15 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l219_c3_ffed : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l229_c3_4676 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_7d69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l227_c15_7dfd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_23b6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_f65e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_f65e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_f65e_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c50_f65e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_23b6_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_23b6_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l231_c20_23b6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_fd8b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_30c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_30c7_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_30c7_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c50_30c7_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_fd8b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_fd8b_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l232_c20_fd8b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_40a6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_40a6_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_40a6_iffalse : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l233_c22_40a6_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_759b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_759b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_759b_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c31_759b_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_a755_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_a755_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_a755_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l239_c21_a755_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_3498_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_3498_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_3498_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l240_c31_3498_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l247_c3_ecb2 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l254_c3_6f76 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_feb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_feb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output : unsigned(8 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_b025_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output : unsigned(0 downto 0);
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
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right := to_unsigned(4, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_right := to_unsigned(5, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_right := to_unsigned(1, 4);
     VAR_MUX_uxn_device_h_l231_c20_23b6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_right := to_unsigned(2, 4);
     VAR_MUX_uxn_device_h_l231_c50_f65e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l213_c13_6078_iffalse := to_unsigned(255, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l232_c50_30c7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l234_c31_759b_iffalse := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l240_c31_3498_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right := to_unsigned(7, 4);
     VAR_MUX_uxn_device_h_l195_c20_ca9e_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right := to_unsigned(6, 4);
     VAR_MUX_uxn_device_h_l232_c20_fd8b_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l195_c20_ca9e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right := to_unsigned(0, 4);
     VAR_result_u16_addr_uxn_device_h_l229_c3_4676 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_result_u16_addr_uxn_device_h_l229_c3_4676;
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l185_c20_9d38_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l185_c20_9d38_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l231_c50_f65e_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l232_c50_30c7_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l240_c31_3498_iffalse := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue := to_unsigned(43, 8);
     VAR_result_device_ram_address_uxn_device_h_l219_c3_ffed := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l234_c31_759b_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_right := to_unsigned(255, 8);

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
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l172_c2_78cf_iftrue := color;
     VAR_color_MUX_uxn_device_h_l178_c7_cae1_iftrue := color;
     VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iftrue := color;
     VAR_color_MUX_uxn_device_h_l187_c7_83f4_iftrue := color;
     VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iftrue := color;
     VAR_color_MUX_uxn_device_h_l197_c7_1581_iftrue := color;
     VAR_color_MUX_uxn_device_h_l201_c7_b020_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse := flip_y;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right := is_auto_x;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left := is_auto_x;
     VAR_MUX_uxn_device_h_l239_c21_a755_cond := is_auto_x;
     VAR_MUX_uxn_device_h_l240_c31_3498_cond := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left := is_auto_y;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse := is_auto_y;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_right := is_x_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l214_c20_e8b7_iffalse := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l231_c20_23b6_iffalse := is_x_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse := is_x_in_bounds;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_right := is_y_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_right := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l215_c20_2d2f_iffalse := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l232_c20_fd8b_iffalse := is_y_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse := is_y_in_bounds;
     VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l197_c7_1581_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l201_c7_b020_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_left := VAR_previous_device_ram_read;
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse := tmp8;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse := tmp8b;
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left := x;
     VAR_x_MUX_uxn_device_h_l172_c2_78cf_iftrue := x;
     VAR_x_MUX_uxn_device_h_l178_c7_cae1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l187_c7_83f4_iffalse := x;
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left := y;
     VAR_y_MUX_uxn_device_h_l172_c2_78cf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l178_c7_cae1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue := y;
     VAR_y_MUX_uxn_device_h_l187_c7_83f4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l197_c7_1581_iffalse := y;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l181_c7_e8c0] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_e8c0_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- uint8_7_7[uxn_device_h_l203_c15_b59c] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l187_c7_83f4] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_83f4_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- uint8_5_5[uxn_device_h_l205_c12_d294] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l205_c12_d294_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l254_c21_b67f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_left;
     BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output := BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output;

     -- uint8_1_0[uxn_device_h_l207_c11_b6d6] LATENCY=0
     VAR_uint8_1_0_uxn_device_h_l207_c11_b6d6_return_output := uint8_1_0(
     VAR_previous_device_ram_read);

     -- UNARY_OP_NOT[uxn_device_h_l213_c26_bc2d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output := UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l172_c2_78cf] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_78cf_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- uint8_7_0[uxn_device_h_l213_c44_7b89] LATENCY=0
     VAR_uint8_7_0_uxn_device_h_l213_c44_7b89_return_output := uint8_7_0(
     x);

     -- BIN_OP_EQ[uxn_device_h_l232_c50_1811] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l232_c50_1811_left <= VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_left;
     BIN_OP_EQ_uxn_device_h_l232_c50_1811_right <= VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output := BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output;

     -- uint8_1_1[uxn_device_h_l227_c15_7dfd] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l227_c15_7dfd_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- BIN_OP_PLUS[uxn_device_h_l239_c34_ad59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_left;
     BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output := BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l224_c7_7d69] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_7d69_return_output := result.u16_addr;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l250_c7_feb2] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_feb2_return_output := result.is_device_ram_write;

     -- uint8_4_4[uxn_device_h_l206_c12_48a0] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l206_c12_48a0_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_b025 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_b025_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- uint16_uint8_0[uxn_device_h_l216_c21_df39] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l216_c21_df39_return_output := uint16_uint8_0(
     resize(to_unsigned(0, 1), 16),
     x);

     -- BIN_OP_PLUS[uxn_device_h_l239_c44_5042] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_left;
     BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right <= VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output := BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l178_c7_cae1] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_cae1_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l197_c7_1581] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1581_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- MUX[uxn_device_h_l240_c31_3498] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l240_c31_3498_cond <= VAR_MUX_uxn_device_h_l240_c31_3498_cond;
     MUX_uxn_device_h_l240_c31_3498_iftrue <= VAR_MUX_uxn_device_h_l240_c31_3498_iftrue;
     MUX_uxn_device_h_l240_c31_3498_iffalse <= VAR_MUX_uxn_device_h_l240_c31_3498_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l240_c31_3498_return_output := MUX_uxn_device_h_l240_c31_3498_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l250_c7_feb2] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_feb2_return_output := result.device_ram_address;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l224_c7_7d69] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_7d69_return_output := result.is_vram_write;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l191_c7_1fbd] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_1fbd_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- uint8_6_6[uxn_device_h_l204_c11_a8f3] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l204_c11_a8f3_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- UNARY_OP_NOT[uxn_device_h_l247_c22_6cca] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output := UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l185_c20_b331] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l185_c20_b331_left <= VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_left;
     BIN_OP_EQ_uxn_device_h_l185_c20_b331_right <= VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output := BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output;

     -- BIN_OP_EQ[uxn_device_h_l195_c20_0233] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c20_0233_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_left;
     BIN_OP_EQ_uxn_device_h_l195_c20_0233_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output := BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output;

     -- BIN_OP_EQ[uxn_device_h_l231_c50_f503] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l231_c50_f503_left <= VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_left;
     BIN_OP_EQ_uxn_device_h_l231_c50_f503_right <= VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output := BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l250_c7_feb2] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_feb2_return_output := result.u8_value;

     -- uint8_0_0[uxn_device_h_l226_c15_8a41] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242 LATENCY=0
     -- Inputs
     CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x <= VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_x;
     -- Outputs
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output := CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output;

     -- result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_device_h_l250_c7_feb2] LATENCY=0
     VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_feb2_return_output := result.is_deo_done;

     -- uint12_3_0[uxn_device_h_l170_c11_82cd] LATENCY=0
     VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output := uint12_3_0(
     VAR_phase);

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l252_l245_DUPLICATE_4e46_return_output;
     VAR_MUX_uxn_device_h_l185_c20_9d38_cond := VAR_BIN_OP_EQ_uxn_device_h_l185_c20_b331_return_output;
     VAR_MUX_uxn_device_h_l195_c20_ca9e_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c20_0233_return_output;
     VAR_MUX_uxn_device_h_l231_c50_f65e_cond := VAR_BIN_OP_EQ_uxn_device_h_l231_c50_f503_return_output;
     VAR_MUX_uxn_device_h_l232_c50_30c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l232_c50_1811_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l241_DUPLICATE_324a_return_output;
     VAR_MUX_uxn_device_h_l239_c21_a755_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l239_c34_ad59_return_output, 8);
     VAR_MUX_uxn_device_h_l239_c21_a755_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l239_c44_5042_return_output, 8);
     VAR_result_u8_value_uxn_device_h_l254_c3_6f76 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l254_c21_b67f_return_output, 8);
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_b025_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l189_l198_DUPLICATE_b025_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l194_l184_DUPLICATE_a242_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue := VAR_MUX_uxn_device_h_l240_c31_3498_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_right := VAR_UNARY_OP_NOT_uxn_device_h_l213_c26_bc2d_return_output;
     VAR_result_u8_value_uxn_device_h_l247_c3_ecb2 := resize(VAR_UNARY_OP_NOT_uxn_device_h_l247_c22_6cca_return_output, 8);
     VAR_result_MUX_uxn_device_h_l178_c7_cae1_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l178_c7_cae1_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_83f4_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l187_c7_83f4_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1581_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l197_c7_1581_return_output;
     VAR_result_MUX_uxn_device_h_l172_c2_78cf_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l172_c2_78cf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse := VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l224_c7_7d69_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l224_c7_7d69_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l250_c7_feb2_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_left := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     REG_VAR_phase4 := VAR_uint12_3_0_uxn_device_h_l170_c11_82cd_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_left := VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left := VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output;
     VAR_MUX_uxn_device_h_l233_c22_40a6_cond := VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output;
     VAR_MUX_uxn_device_h_l234_c31_759b_cond := VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_uint8_0_0_uxn_device_h_l226_c15_8a41_return_output;
     VAR_color_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_1_0_uxn_device_h_l207_c11_b6d6_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_left := VAR_uint8_1_1_uxn_device_h_l227_c15_7dfd_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right := VAR_uint8_1_1_uxn_device_h_l227_c15_7dfd_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_uint8_1_1_uxn_device_h_l227_c15_7dfd_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left := VAR_uint8_4_4_uxn_device_h_l206_c12_48a0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_4_4_uxn_device_h_l206_c12_48a0_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_left := VAR_uint8_5_5_uxn_device_h_l205_c12_d294_return_output;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_5_5_uxn_device_h_l205_c12_d294_return_output;
     VAR_layer_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_6_6_uxn_device_h_l204_c11_a8f3_return_output;
     VAR_MUX_uxn_device_h_l213_c13_6078_iftrue := VAR_uint8_7_0_uxn_device_h_l213_c44_7b89_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_left := VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output;
     VAR_MUX_uxn_device_h_l214_c20_e8b7_cond := VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output;
     VAR_MUX_uxn_device_h_l215_c20_2d2f_cond := VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue := VAR_result_u8_value_uxn_device_h_l247_c3_ecb2;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue := VAR_result_u8_value_uxn_device_h_l254_c3_6f76;
     -- BIN_OP_EQ[uxn_device_h_l237_c11_15f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_left;
     BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output := BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output;

     -- BIN_OP_AND[uxn_device_h_l213_c13_8e66] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l213_c13_8e66_left <= VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_left;
     BIN_OP_AND_uxn_device_h_l213_c13_8e66_right <= VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output := BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output;

     -- BIN_OP_EQ[uxn_device_h_l224_c11_f60f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_left;
     BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right <= VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output := BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l197_c11_a786] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l197_c11_a786_left <= VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_left;
     BIN_OP_EQ_uxn_device_h_l197_c11_a786_right <= VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output := BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;

     -- BIN_OP_EQ[uxn_device_h_l243_c11_cc09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left <= VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_left;
     BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right <= VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output := BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output;

     -- BIN_OP_AND[uxn_device_h_l232_c20_35b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l232_c20_35b9_left <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_left;
     BIN_OP_AND_uxn_device_h_l232_c20_35b9_right <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output := BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l241_c26_0193] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output := UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output;

     -- MUX[uxn_device_h_l239_c21_a755] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l239_c21_a755_cond <= VAR_MUX_uxn_device_h_l239_c21_a755_cond;
     MUX_uxn_device_h_l239_c21_a755_iftrue <= VAR_MUX_uxn_device_h_l239_c21_a755_iftrue;
     MUX_uxn_device_h_l239_c21_a755_iffalse <= VAR_MUX_uxn_device_h_l239_c21_a755_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l239_c21_a755_return_output := MUX_uxn_device_h_l239_c21_a755_return_output;

     -- BIN_OP_AND[uxn_device_h_l231_c20_5891] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l231_c20_5891_left <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_left;
     BIN_OP_AND_uxn_device_h_l231_c20_5891_right <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output := BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output;

     -- BIN_OP_EQ[uxn_device_h_l201_c11_c39e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_left;
     BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right <= VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output := BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;

     -- BIN_OP_OR[uxn_device_h_l214_c33_fd3e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left <= VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_left;
     BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right <= VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output := BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output;

     -- BIN_OP_OR[uxn_device_h_l215_c33_25b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l215_c33_25b7_left <= VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_left;
     BIN_OP_OR_uxn_device_h_l215_c33_25b7_right <= VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output := BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l250_c11_9811] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l250_c11_9811_left <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_left;
     BIN_OP_EQ_uxn_device_h_l250_c11_9811_right <= VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output := BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output;

     -- BIN_OP_EQ[uxn_device_h_l178_c11_a267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_a267_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_a267_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;

     -- uint16_uint8_8[uxn_device_h_l217_c21_22d2] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l217_c21_22d2_return_output := uint16_uint8_8(
     VAR_uint16_uint8_0_uxn_device_h_l216_c21_df39_return_output,
     y);

     -- MUX[uxn_device_h_l234_c31_759b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l234_c31_759b_cond <= VAR_MUX_uxn_device_h_l234_c31_759b_cond;
     MUX_uxn_device_h_l234_c31_759b_iftrue <= VAR_MUX_uxn_device_h_l234_c31_759b_iftrue;
     MUX_uxn_device_h_l234_c31_759b_iffalse <= VAR_MUX_uxn_device_h_l234_c31_759b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l234_c31_759b_return_output := MUX_uxn_device_h_l234_c31_759b_return_output;

     -- uint8_uint2_0[uxn_device_h_l209_c10_785c] LATENCY=0
     VAR_uint8_uint2_0_uxn_device_h_l209_c10_785c_return_output := uint8_uint2_0(
     resize(to_unsigned(0, 1), 8),
     VAR_uint8_1_0_uxn_device_h_l207_c11_b6d6_return_output);

     -- BIN_OP_EQ[uxn_device_h_l172_c6_01f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_left;
     BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output := BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;

     -- MUX[uxn_device_h_l232_c50_30c7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l232_c50_30c7_cond <= VAR_MUX_uxn_device_h_l232_c50_30c7_cond;
     MUX_uxn_device_h_l232_c50_30c7_iftrue <= VAR_MUX_uxn_device_h_l232_c50_30c7_iftrue;
     MUX_uxn_device_h_l232_c50_30c7_iffalse <= VAR_MUX_uxn_device_h_l232_c50_30c7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l232_c50_30c7_return_output := MUX_uxn_device_h_l232_c50_30c7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l181_c11_2098] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_2098_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_2098_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;

     -- BIN_OP_OR[uxn_device_h_l189_c3_aa4d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left <= VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_left;
     BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right <= VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output := BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output;

     -- MUX[uxn_device_h_l231_c50_f65e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l231_c50_f65e_cond <= VAR_MUX_uxn_device_h_l231_c50_f65e_cond;
     MUX_uxn_device_h_l231_c50_f65e_iftrue <= VAR_MUX_uxn_device_h_l231_c50_f65e_iftrue;
     MUX_uxn_device_h_l231_c50_f65e_iffalse <= VAR_MUX_uxn_device_h_l231_c50_f65e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l231_c50_f65e_return_output := MUX_uxn_device_h_l231_c50_f65e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l187_c11_a312] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l187_c11_a312_left <= VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_left;
     BIN_OP_EQ_uxn_device_h_l187_c11_a312_right <= VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output := BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;

     -- BIN_OP_EQ[uxn_device_h_l191_c11_fc38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_left;
     BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right <= VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output := BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;

     -- MUX[uxn_device_h_l185_c20_9d38] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l185_c20_9d38_cond <= VAR_MUX_uxn_device_h_l185_c20_9d38_cond;
     MUX_uxn_device_h_l185_c20_9d38_iftrue <= VAR_MUX_uxn_device_h_l185_c20_9d38_iftrue;
     MUX_uxn_device_h_l185_c20_9d38_iffalse <= VAR_MUX_uxn_device_h_l185_c20_9d38_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l185_c20_9d38_return_output := MUX_uxn_device_h_l185_c20_9d38_return_output;

     -- BIN_OP_OR[uxn_device_h_l198_c3_8a3a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left <= VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_left;
     BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right <= VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output := BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output;

     -- MUX[uxn_device_h_l195_c20_ca9e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l195_c20_ca9e_cond <= VAR_MUX_uxn_device_h_l195_c20_ca9e_cond;
     MUX_uxn_device_h_l195_c20_ca9e_iftrue <= VAR_MUX_uxn_device_h_l195_c20_ca9e_iftrue;
     MUX_uxn_device_h_l195_c20_ca9e_iffalse <= VAR_MUX_uxn_device_h_l195_c20_ca9e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l195_c20_ca9e_return_output := MUX_uxn_device_h_l195_c20_ca9e_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr := VAR_BIN_OP_AND_uxn_device_h_l213_c13_8e66_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left := VAR_BIN_OP_AND_uxn_device_h_l231_c20_5891_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left := VAR_BIN_OP_AND_uxn_device_h_l232_c20_35b9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_color_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_layer_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_result_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_x_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_y_MUX_uxn_device_h_l172_c2_78cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l172_c6_01f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_color_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_layer_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_result_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_x_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_y_MUX_uxn_device_h_l178_c7_cae1_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_a267_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_e8c0_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_2098_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_color_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_layer_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_x_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_y_MUX_uxn_device_h_l187_c7_83f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l187_c11_a312_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_color_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_1fbd_cond := VAR_BIN_OP_EQ_uxn_device_h_l191_c11_fc38_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_color_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_layer_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_y_MUX_uxn_device_h_l197_c7_1581_cond := VAR_BIN_OP_EQ_uxn_device_h_l197_c11_a786_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_color_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_layer_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_cond := VAR_BIN_OP_EQ_uxn_device_h_l201_c11_c39e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond := VAR_BIN_OP_EQ_uxn_device_h_l224_c11_f60f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond := VAR_BIN_OP_EQ_uxn_device_h_l237_c11_15f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l243_c11_cc09_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l250_c11_9811_return_output;
     VAR_x_uxn_device_h_l189_c3_3f9d := resize(VAR_BIN_OP_OR_uxn_device_h_l189_c3_aa4d_return_output, 8);
     VAR_y_uxn_device_h_l198_c3_3fe4 := resize(VAR_BIN_OP_OR_uxn_device_h_l198_c3_8a3a_return_output, 8);
     VAR_MUX_uxn_device_h_l214_c20_e8b7_iftrue := VAR_BIN_OP_OR_uxn_device_h_l214_c33_fd3e_return_output;
     VAR_MUX_uxn_device_h_l215_c20_2d2f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l215_c33_25b7_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l230_l235_DUPLICATE_ee55_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue := VAR_MUX_uxn_device_h_l185_c20_9d38_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue := VAR_MUX_uxn_device_h_l195_c20_ca9e_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right := VAR_MUX_uxn_device_h_l231_c50_f65e_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right := VAR_MUX_uxn_device_h_l232_c50_30c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_MUX_uxn_device_h_l234_c31_759b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue := VAR_MUX_uxn_device_h_l239_c21_a755_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l241_c26_0193_return_output;
     VAR_x_MUX_uxn_device_h_l187_c7_83f4_iftrue := VAR_x_uxn_device_h_l189_c3_3f9d;
     VAR_y_MUX_uxn_device_h_l197_c7_1581_iftrue := VAR_y_uxn_device_h_l198_c3_3fe4;
     -- x_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_x_MUX_uxn_device_h_l187_c7_83f4_cond;
     x_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_x_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     x_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_x_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l187_c7_83f4_return_output := x_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- MUX[uxn_device_h_l215_c20_2d2f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l215_c20_2d2f_cond <= VAR_MUX_uxn_device_h_l215_c20_2d2f_cond;
     MUX_uxn_device_h_l215_c20_2d2f_iftrue <= VAR_MUX_uxn_device_h_l215_c20_2d2f_iftrue;
     MUX_uxn_device_h_l215_c20_2d2f_iffalse <= VAR_MUX_uxn_device_h_l215_c20_2d2f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l215_c20_2d2f_return_output := MUX_uxn_device_h_l215_c20_2d2f_return_output;

     -- color_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_color_MUX_uxn_device_h_l201_c7_b020_cond;
     color_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_color_MUX_uxn_device_h_l201_c7_b020_iftrue;
     color_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_color_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l201_c7_b020_return_output := color_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- is_auto_y_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_cond;
     is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output := is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l250_c7_feb2] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output := result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l250_c7_feb2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_cond;
     result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output := result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_cond;
     ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iftrue;
     ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output := ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l235_c26_3d61] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output := UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output;

     -- y_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_y_MUX_uxn_device_h_l197_c7_1581_cond;
     y_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_y_MUX_uxn_device_h_l197_c7_1581_iftrue;
     y_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_y_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l197_c7_1581_return_output := y_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- result_u8_value_MUX[uxn_device_h_l250_c7_feb2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_cond;
     result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iftrue;
     result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output := result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output := result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- layer_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_layer_MUX_uxn_device_h_l201_c7_b020_cond;
     layer_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_layer_MUX_uxn_device_h_l201_c7_b020_iftrue;
     layer_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_layer_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l201_c7_b020_return_output := layer_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- is_auto_x_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_cond;
     is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output := is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- MUX[uxn_device_h_l214_c20_e8b7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l214_c20_e8b7_cond <= VAR_MUX_uxn_device_h_l214_c20_e8b7_cond;
     MUX_uxn_device_h_l214_c20_e8b7_iftrue <= VAR_MUX_uxn_device_h_l214_c20_e8b7_iftrue;
     MUX_uxn_device_h_l214_c20_e8b7_iffalse <= VAR_MUX_uxn_device_h_l214_c20_e8b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l214_c20_e8b7_return_output := MUX_uxn_device_h_l214_c20_e8b7_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l213_c13_3114] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output := UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output;

     -- BIN_OP_AND[uxn_device_h_l232_c20_2d6e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_left;
     BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right <= VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output := BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output;

     -- auto_advance_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_cond;
     auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output := auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l250_c7_feb2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_cond;
     result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output := result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output;

     -- flip_y_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_cond;
     flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iftrue;
     flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_return_output := flip_y_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output := result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- ctrl_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_cond;
     ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iftrue;
     ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_return_output := ctrl_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- uint8_uint1_2[uxn_device_h_l210_c10_5e6a] LATENCY=0
     VAR_uint8_uint1_2_uxn_device_h_l210_c10_5e6a_return_output := uint8_uint1_2(
     VAR_uint8_uint2_0_uxn_device_h_l209_c10_785c_return_output,
     VAR_uint8_5_5_uxn_device_h_l205_c12_d294_return_output);

     -- flip_x_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_cond;
     flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iftrue;
     flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_return_output := flip_x_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- BIN_OP_AND[uxn_device_h_l231_c20_8dbe] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_left;
     BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right <= VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output := BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l231_c20_23b6_cond := VAR_BIN_OP_AND_uxn_device_h_l231_c20_8dbe_return_output;
     VAR_MUX_uxn_device_h_l232_c20_fd8b_cond := VAR_BIN_OP_AND_uxn_device_h_l232_c20_2d6e_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_left := VAR_MUX_uxn_device_h_l214_c20_e8b7_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_MUX_uxn_device_h_l214_c20_e8b7_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_right := VAR_MUX_uxn_device_h_l215_c20_2d2f_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_MUX_uxn_device_h_l215_c20_2d2f_return_output;
     VAR_MUX_uxn_device_h_l213_c13_6078_cond := VAR_UNARY_OP_NOT_uxn_device_h_l213_c13_3114_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l235_c26_3d61_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_auto_advance_MUX_uxn_device_h_l224_c7_7d69_return_output;
     VAR_color_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_color_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_ctrl_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_flip_x_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_flip_y_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l224_c7_7d69_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l224_c7_7d69_return_output;
     VAR_layer_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_layer_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l250_c7_feb2_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l250_c7_feb2_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_x_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_y_MUX_uxn_device_h_l197_c7_1581_return_output;
     -- result_u8_value_MUX[uxn_device_h_l243_c7_fa8e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_cond;
     result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iftrue;
     result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output := result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output;

     -- y_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_y_MUX_uxn_device_h_l191_c7_1fbd_cond;
     y_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     y_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l191_c7_1fbd_return_output := y_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- flip_x_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_cond;
     flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iftrue;
     flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_return_output := flip_x_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- uint8_uint1_3[uxn_device_h_l211_c10_f6a8] LATENCY=0
     VAR_uint8_uint1_3_uxn_device_h_l211_c10_f6a8_return_output := uint8_uint1_3(
     VAR_uint8_uint1_2_uxn_device_h_l210_c10_5e6a_return_output,
     VAR_uint8_4_4_uxn_device_h_l206_c12_48a0_return_output);

     -- BIN_OP_AND[uxn_device_h_l220_c26_d370] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l220_c26_d370_left <= VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_left;
     BIN_OP_AND_uxn_device_h_l220_c26_d370_right <= VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output := BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output;

     -- MUX[uxn_device_h_l232_c20_fd8b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l232_c20_fd8b_cond <= VAR_MUX_uxn_device_h_l232_c20_fd8b_cond;
     MUX_uxn_device_h_l232_c20_fd8b_iftrue <= VAR_MUX_uxn_device_h_l232_c20_fd8b_iftrue;
     MUX_uxn_device_h_l232_c20_fd8b_iffalse <= VAR_MUX_uxn_device_h_l232_c20_fd8b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l232_c20_fd8b_return_output := MUX_uxn_device_h_l232_c20_fd8b_return_output;

     -- x_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_x_MUX_uxn_device_h_l181_c7_e8c0_cond;
     x_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     x_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c7_e8c0_return_output := x_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- MUX[uxn_device_h_l231_c20_23b6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l231_c20_23b6_cond <= VAR_MUX_uxn_device_h_l231_c20_23b6_cond;
     MUX_uxn_device_h_l231_c20_23b6_iftrue <= VAR_MUX_uxn_device_h_l231_c20_23b6_iftrue;
     MUX_uxn_device_h_l231_c20_23b6_iffalse <= VAR_MUX_uxn_device_h_l231_c20_23b6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l231_c20_23b6_return_output := MUX_uxn_device_h_l231_c20_23b6_return_output;

     -- color_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_color_MUX_uxn_device_h_l197_c7_1581_cond;
     color_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_color_MUX_uxn_device_h_l197_c7_1581_iftrue;
     color_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_color_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l197_c7_1581_return_output := color_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- layer_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_layer_MUX_uxn_device_h_l197_c7_1581_cond;
     layer_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_layer_MUX_uxn_device_h_l197_c7_1581_iftrue;
     layer_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_layer_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l197_c7_1581_return_output := layer_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_cond;
     ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iftrue;
     ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output := ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l243_c7_fa8e] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output := result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output;

     -- auto_advance_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_cond;
     auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iftrue;
     auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output := auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- is_auto_y_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_cond;
     is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iftrue;
     is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output := is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- flip_y_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_cond;
     flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iftrue;
     flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_return_output := flip_y_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l243_c7_fa8e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_cond;
     result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output := result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output;

     -- ctrl_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_cond;
     ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iftrue;
     ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_return_output := ctrl_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- MUX[uxn_device_h_l213_c13_6078] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l213_c13_6078_cond <= VAR_MUX_uxn_device_h_l213_c13_6078_cond;
     MUX_uxn_device_h_l213_c13_6078_iftrue <= VAR_MUX_uxn_device_h_l213_c13_6078_iftrue;
     MUX_uxn_device_h_l213_c13_6078_iffalse <= VAR_MUX_uxn_device_h_l213_c13_6078_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l213_c13_6078_return_output := MUX_uxn_device_h_l213_c13_6078_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l243_c7_fa8e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_cond;
     result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output := result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output;

     -- is_auto_x_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_cond;
     is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iftrue;
     is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output := is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- Submodule level 4
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_MUX_uxn_device_h_l213_c13_6078_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr := VAR_MUX_uxn_device_h_l231_c20_23b6_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_MUX_uxn_device_h_l231_c20_23b6_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr := VAR_MUX_uxn_device_h_l232_c20_fd8b_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_MUX_uxn_device_h_l232_c20_fd8b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_auto_advance_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_color_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_ctrl_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_flip_x_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_flip_y_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_layer_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l243_c7_fa8e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l243_c7_fa8e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l243_c7_fa8e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l243_c7_fa8e_return_output;
     VAR_x_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_x_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_y_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_y_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l237_c7_4899] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_cond;
     result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output := result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output;

     -- is_auto_y_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_cond;
     is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iftrue;
     is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output := is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_cond;
     ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output := ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- flip_x_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_cond;
     flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output := flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- auto_advance_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_cond;
     auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iftrue;
     auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output := auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l233_c35_98d1] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output := UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l233_c53_202c] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output := UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l237_c7_4899] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output := result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l237_c7_4899] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_cond;
     result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output := result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output;

     -- color_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_color_MUX_uxn_device_h_l191_c7_1fbd_cond;
     color_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     color_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_color_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l191_c7_1fbd_return_output := color_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- uint8_uint1_4[uxn_device_h_l212_c10_d409] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l212_c10_d409_return_output := uint8_uint1_4(
     VAR_uint8_uint1_3_uxn_device_h_l211_c10_f6a8_return_output,
     VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output);

     -- is_y_in_bounds_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond;
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output := is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- ctrl_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_cond;
     ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output := ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- result_u8_value_MUX[uxn_device_h_l237_c7_4899] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_cond;
     result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iftrue;
     result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output := result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output;

     -- tmp8b_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_cond;
     tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iftrue;
     tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output := tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- y_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_y_MUX_uxn_device_h_l187_c7_83f4_cond;
     y_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_y_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     y_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_y_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l187_c7_83f4_return_output := y_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- x_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_x_MUX_uxn_device_h_l178_c7_cae1_cond;
     x_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_x_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     x_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_x_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l178_c7_cae1_return_output := x_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_cond;
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output := is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- is_auto_x_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_cond;
     is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iftrue;
     is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output := is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- layer_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_cond;
     layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_return_output := layer_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- flip_y_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_cond;
     flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output := flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l233_c22_40a6_iftrue := resize(VAR_UNARY_OP_NOT_uxn_device_h_l233_c35_98d1_return_output, 8);
     VAR_MUX_uxn_device_h_l233_c22_40a6_iffalse := resize(VAR_UNARY_OP_NOT_uxn_device_h_l233_c53_202c_return_output, 8);
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_auto_advance_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_color_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_color_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_ctrl_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_flip_x_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_flip_y_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l224_c7_7d69_return_output;
     VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_layer_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l237_c7_4899_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l237_c7_4899_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l237_c7_4899_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l237_c7_4899_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_tmp8b_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_uint8_uint1_4_uxn_device_h_l212_c10_d409_return_output;
     VAR_x_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_x_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_y_MUX_uxn_device_h_l187_c7_83f4_return_output;
     -- layer_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_layer_MUX_uxn_device_h_l187_c7_83f4_cond;
     layer_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     layer_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_layer_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l187_c7_83f4_return_output := layer_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond;
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output := is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- flip_y_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_cond;
     flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output := flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output := result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output := result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- ctrl_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_cond;
     ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output := ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- is_auto_x_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_cond;
     is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output := is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- tmp8b_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_cond;
     tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iftrue;
     tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output := tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_cond;
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output := is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- x_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_x_MUX_uxn_device_h_l172_c2_78cf_cond;
     x_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_x_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     x_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_x_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l172_c2_78cf_return_output := x_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_cond;
     ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output := ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- color_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_color_MUX_uxn_device_h_l187_c7_83f4_cond;
     color_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_color_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     color_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_color_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l187_c7_83f4_return_output := color_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- y_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_y_MUX_uxn_device_h_l181_c7_e8c0_cond;
     y_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     y_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l181_c7_e8c0_return_output := y_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- flip_x_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_cond;
     flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output := flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a[uxn_device_h_l201_c7_b020] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_b020_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_f42a(
     result,
     VAR_uint16_uint8_8_uxn_device_h_l217_c21_22d2_return_output,
     VAR_uint8_6_6_uxn_device_h_l204_c11_a8f3_return_output,
     VAR_result_device_ram_address_uxn_device_h_l219_c3_ffed,
     VAR_BIN_OP_AND_uxn_device_h_l220_c26_d370_return_output,
     VAR_uint8_7_7_uxn_device_h_l203_c15_b59c_return_output,
     VAR_uint8_uint1_4_uxn_device_h_l212_c10_d409_return_output);

     -- is_auto_y_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_cond;
     is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output := is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- auto_advance_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_cond;
     auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output := auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- MUX[uxn_device_h_l233_c22_40a6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l233_c22_40a6_cond <= VAR_MUX_uxn_device_h_l233_c22_40a6_cond;
     MUX_uxn_device_h_l233_c22_40a6_iftrue <= VAR_MUX_uxn_device_h_l233_c22_40a6_iftrue;
     MUX_uxn_device_h_l233_c22_40a6_iffalse <= VAR_MUX_uxn_device_h_l233_c22_40a6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l233_c22_40a6_return_output := MUX_uxn_device_h_l233_c22_40a6_return_output;

     -- tmp8_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_cond;
     tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iftrue;
     tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_return_output := tmp8_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output := result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue := VAR_MUX_uxn_device_h_l233_c22_40a6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_color_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_ctrl_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_flip_x_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_flip_y_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_layer_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_b020_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l201_c7_b020_return_output;
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_tmp8_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_tmp8b_MUX_uxn_device_h_l197_c7_1581_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_y_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_y_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     -- tmp8_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_cond;
     tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iftrue;
     tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_return_output := tmp8_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond;
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output := is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- auto_advance_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_cond;
     auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output := auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l224_c7_7d69] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_cond;
     result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iftrue;
     result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output := result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output;

     -- y_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_y_MUX_uxn_device_h_l178_c7_cae1_cond;
     y_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_y_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     y_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_y_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l178_c7_cae1_return_output := y_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_auto_x_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_cond;
     is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output := is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_cond;
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output := is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- flip_x_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_cond;
     flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output := flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- is_auto_y_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_cond;
     is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output := is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- flip_y_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_cond;
     flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output := flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- ctrl_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_cond;
     ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output := ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- tmp8b_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_cond;
     tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output := tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_cond;
     ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output := ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- color_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_color_MUX_uxn_device_h_l181_c7_e8c0_cond;
     color_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     color_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_color_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l181_c7_e8c0_return_output := color_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- layer_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_cond;
     layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_return_output := layer_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- Submodule level 7
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_color_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_color_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_ctrl_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_flip_x_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_flip_y_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_layer_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_tmp8_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_tmp8b_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_y_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_y_MUX_uxn_device_h_l178_c7_cae1_return_output;
     -- color_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_color_MUX_uxn_device_h_l178_c7_cae1_cond;
     color_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_color_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     color_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_color_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l178_c7_cae1_return_output := color_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond;
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output := is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- ctrl_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_cond;
     ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output := ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_auto_x_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_cond;
     is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output := is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_cond;
     ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output := ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- auto_advance_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_cond;
     auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output := auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- y_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_y_MUX_uxn_device_h_l172_c2_78cf_cond;
     y_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_y_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     y_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_y_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l172_c2_78cf_return_output := y_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- tmp8b_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_cond;
     tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output := tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- tmp8_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_cond;
     tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output := tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- flip_x_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_cond;
     flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output := flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7[uxn_device_h_l201_c7_b020] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l201_c7_b020_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_39a7(
     result,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l224_c7_7d69_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l224_c7_7d69_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l224_c7_7d69_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l224_c7_7d69_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l224_c7_7d69_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l224_c7_7d69_return_output);

     -- is_y_in_bounds_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_cond;
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output := is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- flip_y_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_cond;
     flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output := flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- layer_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_layer_MUX_uxn_device_h_l178_c7_cae1_cond;
     layer_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     layer_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_layer_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l178_c7_cae1_return_output := layer_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_auto_y_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_cond;
     is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output := is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- Submodule level 8
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_color_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_color_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_ctrl_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_flip_x_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_flip_y_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_layer_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_result_MUX_uxn_device_h_l201_c7_b020_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_39a7_uxn_device_h_l201_c7_b020_return_output;
     VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_tmp8_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_tmp8b_MUX_uxn_device_h_l187_c7_83f4_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l172_c2_78cf_return_output;
     -- is_y_in_bounds_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond;
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output := is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- color_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_color_MUX_uxn_device_h_l172_c2_78cf_cond;
     color_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_color_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     color_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_color_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l172_c2_78cf_return_output := color_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_cond;
     ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output := ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- layer_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_layer_MUX_uxn_device_h_l172_c2_78cf_cond;
     layer_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     layer_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_layer_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l172_c2_78cf_return_output := layer_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- tmp8b_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_cond;
     tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output := tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- flip_y_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_cond;
     flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output := flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- result_MUX[uxn_device_h_l201_c7_b020] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l201_c7_b020_cond <= VAR_result_MUX_uxn_device_h_l201_c7_b020_cond;
     result_MUX_uxn_device_h_l201_c7_b020_iftrue <= VAR_result_MUX_uxn_device_h_l201_c7_b020_iftrue;
     result_MUX_uxn_device_h_l201_c7_b020_iffalse <= VAR_result_MUX_uxn_device_h_l201_c7_b020_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l201_c7_b020_return_output := result_MUX_uxn_device_h_l201_c7_b020_return_output;

     -- flip_x_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_cond;
     flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output := flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- is_auto_y_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_cond;
     is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output := is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- tmp8_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_cond;
     tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output := tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- auto_advance_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_cond;
     auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output := auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_auto_x_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_cond;
     is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output := is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_cond;
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output := is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- ctrl_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_cond;
     ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output := ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- Submodule level 9
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l178_c7_cae1_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l187_c7_83f4_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_result_MUX_uxn_device_h_l197_c7_1581_iffalse := VAR_result_MUX_uxn_device_h_l201_c7_b020_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_tmp8_MUX_uxn_device_h_l187_c7_83f4_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_tmp8b_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     -- tmp8_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_cond;
     tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output := tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output := is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- auto_advance_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_cond;
     auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output := auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- is_auto_y_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_cond;
     is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output := is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- is_auto_x_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_cond;
     is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output := is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- tmp8b_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_cond;
     tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output := tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- result_MUX[uxn_device_h_l197_c7_1581] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l197_c7_1581_cond <= VAR_result_MUX_uxn_device_h_l197_c7_1581_cond;
     result_MUX_uxn_device_h_l197_c7_1581_iftrue <= VAR_result_MUX_uxn_device_h_l197_c7_1581_iftrue;
     result_MUX_uxn_device_h_l197_c7_1581_iffalse <= VAR_result_MUX_uxn_device_h_l197_c7_1581_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l197_c7_1581_return_output := result_MUX_uxn_device_h_l197_c7_1581_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_cond;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output := is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- Submodule level 10
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iffalse := VAR_result_MUX_uxn_device_h_l197_c7_1581_return_output;
     VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_tmp8_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_tmp8b_MUX_uxn_device_h_l178_c7_cae1_return_output;
     -- tmp8b_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_cond;
     tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output := tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- result_MUX[uxn_device_h_l191_c7_1fbd] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l191_c7_1fbd_cond <= VAR_result_MUX_uxn_device_h_l191_c7_1fbd_cond;
     result_MUX_uxn_device_h_l191_c7_1fbd_iftrue <= VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iftrue;
     result_MUX_uxn_device_h_l191_c7_1fbd_iffalse <= VAR_result_MUX_uxn_device_h_l191_c7_1fbd_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l191_c7_1fbd_return_output := result_MUX_uxn_device_h_l191_c7_1fbd_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond;
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output := is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_cond;
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output := is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- tmp8_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_cond;
     tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output := tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- Submodule level 11
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l178_c7_cae1_return_output;
     VAR_result_MUX_uxn_device_h_l187_c7_83f4_iffalse := VAR_result_MUX_uxn_device_h_l191_c7_1fbd_return_output;
     VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_tmp8_MUX_uxn_device_h_l178_c7_cae1_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_device_h_l172_c2_78cf_return_output;
     -- result_MUX[uxn_device_h_l187_c7_83f4] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l187_c7_83f4_cond <= VAR_result_MUX_uxn_device_h_l187_c7_83f4_cond;
     result_MUX_uxn_device_h_l187_c7_83f4_iftrue <= VAR_result_MUX_uxn_device_h_l187_c7_83f4_iftrue;
     result_MUX_uxn_device_h_l187_c7_83f4_iffalse <= VAR_result_MUX_uxn_device_h_l187_c7_83f4_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l187_c7_83f4_return_output := result_MUX_uxn_device_h_l187_c7_83f4_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond;
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output := is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- tmp8_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_cond;
     tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output := tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_cond;
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output := is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- Submodule level 12
     REG_VAR_is_x_in_bounds := VAR_is_x_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output;
     REG_VAR_is_y_in_bounds := VAR_is_y_in_bounds_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iffalse := VAR_result_MUX_uxn_device_h_l187_c7_83f4_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l172_c2_78cf_return_output;
     -- result_MUX[uxn_device_h_l181_c7_e8c0] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_e8c0_cond <= VAR_result_MUX_uxn_device_h_l181_c7_e8c0_cond;
     result_MUX_uxn_device_h_l181_c7_e8c0_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iftrue;
     result_MUX_uxn_device_h_l181_c7_e8c0_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_e8c0_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_e8c0_return_output := result_MUX_uxn_device_h_l181_c7_e8c0_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l178_c7_cae1_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_e8c0_return_output;
     -- result_MUX[uxn_device_h_l178_c7_cae1] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l178_c7_cae1_cond <= VAR_result_MUX_uxn_device_h_l178_c7_cae1_cond;
     result_MUX_uxn_device_h_l178_c7_cae1_iftrue <= VAR_result_MUX_uxn_device_h_l178_c7_cae1_iftrue;
     result_MUX_uxn_device_h_l178_c7_cae1_iffalse <= VAR_result_MUX_uxn_device_h_l178_c7_cae1_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l178_c7_cae1_return_output := result_MUX_uxn_device_h_l178_c7_cae1_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l172_c2_78cf_iffalse := VAR_result_MUX_uxn_device_h_l178_c7_cae1_return_output;
     -- result_MUX[uxn_device_h_l172_c2_78cf] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l172_c2_78cf_cond <= VAR_result_MUX_uxn_device_h_l172_c2_78cf_cond;
     result_MUX_uxn_device_h_l172_c2_78cf_iftrue <= VAR_result_MUX_uxn_device_h_l172_c2_78cf_iftrue;
     result_MUX_uxn_device_h_l172_c2_78cf_iffalse <= VAR_result_MUX_uxn_device_h_l172_c2_78cf_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l172_c2_78cf_return_output := result_MUX_uxn_device_h_l172_c2_78cf_return_output;

     -- Submodule level 15
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l172_c2_78cf_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l172_c2_78cf_return_output;
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
