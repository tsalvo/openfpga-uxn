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
-- Submodules: 177
entity pixel_deo_0CLK_1bcb4129 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(11 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end pixel_deo_0CLK_1bcb4129;
architecture arch of pixel_deo_0CLK_1bcb4129 is
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
signal is_in_bounds : unsigned(0 downto 0) := to_unsigned(0, 1);
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
signal REG_COMB_is_in_bounds : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_device_h_l171_c6_d197]
signal BIN_OP_EQ_uxn_device_h_l171_c6_d197_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l171_c6_d197_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l171_c2_943c]
signal x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l171_c2_943c]
signal flip_x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l171_c2_943c]
signal flip_y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l171_c2_943c]
signal is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l171_c2_943c]
signal is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l171_c2_943c]
signal color_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l171_c2_943c]
signal layer_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l171_c2_943c]
signal is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l171_c2_943c]
signal result_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l171_c2_943c_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l171_c2_943c_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l171_c2_943c_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l171_c2_943c]
signal ctrl_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l171_c2_943c]
signal y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l171_c2_943c]
signal ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l171_c2_943c]
signal auto_advance_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l171_c2_943c]
signal tmp8_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l177_c11_d37b]
signal BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l177_c7_0b05]
signal x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l177_c7_0b05]
signal flip_x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l177_c7_0b05]
signal flip_y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l177_c7_0b05]
signal is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l177_c7_0b05]
signal is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l177_c7_0b05]
signal color_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l177_c7_0b05]
signal layer_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l177_c7_0b05]
signal is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l177_c7_0b05]
signal result_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l177_c7_0b05_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_0b05_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l177_c7_0b05_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l177_c7_0b05]
signal ctrl_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l177_c7_0b05]
signal y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l177_c7_0b05]
signal ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l177_c7_0b05]
signal auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l177_c7_0b05]
signal tmp8_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l180_c11_934e]
signal BIN_OP_EQ_uxn_device_h_l180_c11_934e_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l180_c11_934e_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l180_c7_751b]
signal x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l180_c7_751b]
signal flip_x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l180_c7_751b]
signal flip_y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l180_c7_751b]
signal is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l180_c7_751b]
signal is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l180_c7_751b]
signal color_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l180_c7_751b]
signal layer_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- is_in_bounds_MUX[uxn_device_h_l180_c7_751b]
signal is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l180_c7_751b]
signal result_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l180_c7_751b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l180_c7_751b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l180_c7_751b_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l180_c7_751b]
signal ctrl_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l180_c7_751b]
signal y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l180_c7_751b]
signal ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l180_c7_751b]
signal auto_advance_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l180_c7_751b]
signal tmp8_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l184_c18_7893]
signal BIN_OP_EQ_uxn_device_h_l184_c18_7893_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c18_7893_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l184_c18_4275]
signal MUX_uxn_device_h_l184_c18_4275_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l184_c18_4275_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l184_c18_4275_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l184_c18_4275_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l186_c11_1649]
signal BIN_OP_EQ_uxn_device_h_l186_c11_1649_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l186_c11_1649_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l186_c7_fb9b]
signal x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(15 downto 0);

-- flip_x_MUX[uxn_device_h_l186_c7_fb9b]
signal flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l186_c7_fb9b]
signal flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l186_c7_fb9b]
signal is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l186_c7_fb9b]
signal is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l186_c7_fb9b]
signal color_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l186_c7_fb9b]
signal layer_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l186_c7_fb9b]
signal result_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l186_c7_fb9b_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l186_c7_fb9b_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l186_c7_fb9b_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l186_c7_fb9b]
signal ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l186_c7_fb9b]
signal y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l186_c7_fb9b]
signal ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l186_c7_fb9b]
signal auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l186_c7_fb9b]
signal tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l188_c3_40ed]
signal BIN_OP_OR_uxn_device_h_l188_c3_40ed_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l188_c3_40ed_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l190_c11_bab7]
signal BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l190_c7_655e]
signal flip_x_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l190_c7_655e]
signal flip_y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l190_c7_655e]
signal is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l190_c7_655e]
signal is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l190_c7_655e]
signal color_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l190_c7_655e]
signal layer_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l190_c7_655e]
signal result_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l190_c7_655e_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_655e_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_655e_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l190_c7_655e]
signal ctrl_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l190_c7_655e]
signal y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l190_c7_655e]
signal ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l190_c7_655e]
signal auto_advance_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l190_c7_655e]
signal tmp8_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l195_c11_af68]
signal BIN_OP_EQ_uxn_device_h_l195_c11_af68_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_af68_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l195_c7_a1be]
signal flip_x_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l195_c7_a1be]
signal flip_y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l195_c7_a1be]
signal is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l195_c7_a1be]
signal is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l195_c7_a1be]
signal color_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l195_c7_a1be]
signal layer_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l195_c7_a1be]
signal result_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l195_c7_a1be_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_a1be_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l195_c7_a1be_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l195_c7_a1be]
signal ctrl_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l195_c7_a1be]
signal y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(15 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l195_c7_a1be]
signal ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l195_c7_a1be]
signal auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l195_c7_a1be]
signal tmp8_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l196_c3_0209]
signal BIN_OP_OR_uxn_device_h_l196_c3_0209_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l196_c3_0209_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l199_c11_3072]
signal BIN_OP_EQ_uxn_device_h_l199_c11_3072_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l199_c11_3072_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output : unsigned(0 downto 0);

-- flip_x_MUX[uxn_device_h_l199_c7_6d18]
signal flip_x_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l199_c7_6d18]
signal flip_y_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l199_c7_6d18]
signal is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l199_c7_6d18]
signal is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l199_c7_6d18]
signal color_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(3 downto 0);
signal color_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(3 downto 0);

-- layer_MUX[uxn_device_h_l199_c7_6d18]
signal layer_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l199_c7_6d18]
signal result_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l199_c7_6d18_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l199_c7_6d18_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l199_c7_6d18_return_output : device_out_result_t;

-- ctrl_MUX[uxn_device_h_l199_c7_6d18]
signal ctrl_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l199_c7_6d18]
signal ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l199_c7_6d18]
signal auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_device_h_l199_c7_6d18]
signal tmp8_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);

-- CONST_SR_7[uxn_device_h_l202_c25_258a]
signal CONST_SR_7_uxn_device_h_l202_c25_258a_x : unsigned(7 downto 0);
signal CONST_SR_7_uxn_device_h_l202_c25_258a_return_output : unsigned(7 downto 0);

-- CONST_SR_6[uxn_device_h_l203_c21_1ae9]
signal CONST_SR_6_uxn_device_h_l203_c21_1ae9_x : unsigned(7 downto 0);
signal CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output : unsigned(7 downto 0);

-- CONST_SR_5[uxn_device_h_l204_c22_d886]
signal CONST_SR_5_uxn_device_h_l204_c22_d886_x : unsigned(7 downto 0);
signal CONST_SR_5_uxn_device_h_l204_c22_d886_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_device_h_l205_c22_5633]
signal CONST_SR_4_uxn_device_h_l205_c22_5633_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_device_h_l205_c22_5633_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l206_c10_eeac]
signal BIN_OP_AND_uxn_device_h_l206_c10_eeac_left : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c10_eeac_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_device_h_l207_c22_5007]
signal CONST_SL_8_uxn_device_h_l207_c22_5007_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_device_h_l207_c22_5007_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l207_c22_6f15]
signal BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l209_c25_7219]
signal MUX_uxn_device_h_l209_c25_7219_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l209_c25_7219_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l209_c25_7219_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l209_c25_7219_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l209_c12_f6b2]
signal MUX_uxn_device_h_l209_c12_f6b2_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l209_c12_f6b2_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l209_c12_f6b2_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l209_c12_f6b2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l209_c3_32f9]
signal BIN_OP_OR_uxn_device_h_l209_c3_32f9_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l209_c3_32f9_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l210_c25_837a]
signal MUX_uxn_device_h_l210_c25_837a_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l210_c25_837a_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l210_c25_837a_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l210_c25_837a_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l210_c12_5d90]
signal MUX_uxn_device_h_l210_c12_5d90_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l210_c12_5d90_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l210_c12_5d90_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l210_c12_5d90_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l210_c3_3d75]
signal BIN_OP_OR_uxn_device_h_l210_c3_3d75_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l210_c3_3d75_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l212_c26_ceb5]
signal BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l216_c11_7276]
signal BIN_OP_EQ_uxn_device_h_l216_c11_7276_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l216_c11_7276_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l216_c7_7ff7]
signal is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l216_c7_7ff7]
signal is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l216_c7_7ff7]
signal result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l216_c7_7ff7]
signal result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l216_c7_7ff7]
signal result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l216_c7_7ff7]
signal result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l216_c7_7ff7]
signal result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_device_h_l216_c7_7ff7]
signal result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l216_c7_7ff7]
signal auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l223_c36_646e]
signal BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l223_c51_2abc]
signal BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l223_c23_951e]
signal MUX_uxn_device_h_l223_c23_951e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l223_c23_951e_iftrue : unsigned(16 downto 0);
signal MUX_uxn_device_h_l223_c23_951e_iffalse : unsigned(16 downto 0);
signal MUX_uxn_device_h_l223_c23_951e_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l223_c23_ac31]
signal CONST_SR_8_uxn_device_h_l223_c23_ac31_x : unsigned(16 downto 0);
signal CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l224_c31_b2a9]
signal MUX_uxn_device_h_l224_c31_b2a9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l224_c31_b2a9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l224_c31_b2a9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l224_c31_b2a9_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l225_c26_1b71]
signal UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l227_c11_50a9]
signal BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l227_c7_a7b0]
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l227_c7_a7b0]
signal result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l227_c7_a7b0]
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l227_c7_a7b0]
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l229_c34_39fe]
signal BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output : unsigned(16 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l229_c44_432b]
signal BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output : unsigned(16 downto 0);

-- MUX[uxn_device_h_l229_c21_0bb5]
signal MUX_uxn_device_h_l229_c21_0bb5_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l229_c21_0bb5_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l229_c21_0bb5_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l229_c21_0bb5_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l230_c31_4ef1]
signal MUX_uxn_device_h_l230_c31_4ef1_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l230_c31_4ef1_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l230_c31_4ef1_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l230_c31_4ef1_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l231_c26_b525]
signal UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l233_c11_ae07]
signal BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l233_c7_eb85]
signal result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l233_c7_eb85]
signal result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l233_c7_eb85]
signal result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l233_c7_eb85]
signal result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l237_c32_80ef]
signal BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output : unsigned(16 downto 0);

-- CONST_SR_8[uxn_device_h_l237_c32_db9f]
signal CONST_SR_8_uxn_device_h_l237_c32_db9f_x : unsigned(16 downto 0);
signal CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_device_h_l240_c11_55c4]
signal BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right : unsigned(11 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l240_c7_1927]
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l240_c7_1927]
signal result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l240_c7_1927]
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l240_c7_1927]
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l244_c31_2d01]
signal BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output : unsigned(16 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690
signal CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output : unsigned(15 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output : unsigned(0 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output : unsigned(0 downto 0);

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

function uint16_7_0( x : unsigned) return unsigned is
--variable x : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);
begin
return_output := unsigned(std_logic_vector(x(7 downto 0)));
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

function CAST_TO_uint8_t_uint17_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(16 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_8b59( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.is_device_ram_write := ref_toks_4;
      base.u16_addr := ref_toks_5;
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
-- BIN_OP_EQ_uxn_device_h_l171_c6_d197
BIN_OP_EQ_uxn_device_h_l171_c6_d197 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l171_c6_d197_left,
BIN_OP_EQ_uxn_device_h_l171_c6_d197_right,
BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output);

-- x_MUX_uxn_device_h_l171_c2_943c
x_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l171_c2_943c_cond,
x_MUX_uxn_device_h_l171_c2_943c_iftrue,
x_MUX_uxn_device_h_l171_c2_943c_iffalse,
x_MUX_uxn_device_h_l171_c2_943c_return_output);

-- flip_x_MUX_uxn_device_h_l171_c2_943c
flip_x_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l171_c2_943c_cond,
flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue,
flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse,
flip_x_MUX_uxn_device_h_l171_c2_943c_return_output);

-- flip_y_MUX_uxn_device_h_l171_c2_943c
flip_y_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l171_c2_943c_cond,
flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue,
flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse,
flip_y_MUX_uxn_device_h_l171_c2_943c_return_output);

-- is_auto_x_MUX_uxn_device_h_l171_c2_943c
is_auto_x_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond,
is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue,
is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse,
is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output);

-- is_auto_y_MUX_uxn_device_h_l171_c2_943c
is_auto_y_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond,
is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue,
is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse,
is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output);

-- color_MUX_uxn_device_h_l171_c2_943c
color_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l171_c2_943c_cond,
color_MUX_uxn_device_h_l171_c2_943c_iftrue,
color_MUX_uxn_device_h_l171_c2_943c_iffalse,
color_MUX_uxn_device_h_l171_c2_943c_return_output);

-- layer_MUX_uxn_device_h_l171_c2_943c
layer_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l171_c2_943c_cond,
layer_MUX_uxn_device_h_l171_c2_943c_iftrue,
layer_MUX_uxn_device_h_l171_c2_943c_iffalse,
layer_MUX_uxn_device_h_l171_c2_943c_return_output);

-- is_in_bounds_MUX_uxn_device_h_l171_c2_943c
is_in_bounds_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond,
is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue,
is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse,
is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output);

-- result_MUX_uxn_device_h_l171_c2_943c
result_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l171_c2_943c_cond,
result_MUX_uxn_device_h_l171_c2_943c_iftrue,
result_MUX_uxn_device_h_l171_c2_943c_iffalse,
result_MUX_uxn_device_h_l171_c2_943c_return_output);

-- ctrl_MUX_uxn_device_h_l171_c2_943c
ctrl_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l171_c2_943c_cond,
ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue,
ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse,
ctrl_MUX_uxn_device_h_l171_c2_943c_return_output);

-- y_MUX_uxn_device_h_l171_c2_943c
y_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l171_c2_943c_cond,
y_MUX_uxn_device_h_l171_c2_943c_iftrue,
y_MUX_uxn_device_h_l171_c2_943c_iffalse,
y_MUX_uxn_device_h_l171_c2_943c_return_output);

-- ctrl_mode_MUX_uxn_device_h_l171_c2_943c
ctrl_mode_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond,
ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue,
ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse,
ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output);

-- auto_advance_MUX_uxn_device_h_l171_c2_943c
auto_advance_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l171_c2_943c_cond,
auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue,
auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse,
auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output);

-- tmp8_MUX_uxn_device_h_l171_c2_943c
tmp8_MUX_uxn_device_h_l171_c2_943c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l171_c2_943c_cond,
tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue,
tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse,
tmp8_MUX_uxn_device_h_l171_c2_943c_return_output);

-- BIN_OP_EQ_uxn_device_h_l177_c11_d37b
BIN_OP_EQ_uxn_device_h_l177_c11_d37b : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left,
BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right,
BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output);

-- x_MUX_uxn_device_h_l177_c7_0b05
x_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l177_c7_0b05_cond,
x_MUX_uxn_device_h_l177_c7_0b05_iftrue,
x_MUX_uxn_device_h_l177_c7_0b05_iffalse,
x_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- flip_x_MUX_uxn_device_h_l177_c7_0b05
flip_x_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l177_c7_0b05_cond,
flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue,
flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse,
flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- flip_y_MUX_uxn_device_h_l177_c7_0b05
flip_y_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l177_c7_0b05_cond,
flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue,
flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse,
flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- is_auto_x_MUX_uxn_device_h_l177_c7_0b05
is_auto_x_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond,
is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue,
is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse,
is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- is_auto_y_MUX_uxn_device_h_l177_c7_0b05
is_auto_y_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond,
is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue,
is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse,
is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- color_MUX_uxn_device_h_l177_c7_0b05
color_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l177_c7_0b05_cond,
color_MUX_uxn_device_h_l177_c7_0b05_iftrue,
color_MUX_uxn_device_h_l177_c7_0b05_iffalse,
color_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- layer_MUX_uxn_device_h_l177_c7_0b05
layer_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l177_c7_0b05_cond,
layer_MUX_uxn_device_h_l177_c7_0b05_iftrue,
layer_MUX_uxn_device_h_l177_c7_0b05_iffalse,
layer_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- is_in_bounds_MUX_uxn_device_h_l177_c7_0b05
is_in_bounds_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond,
is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue,
is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse,
is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- result_MUX_uxn_device_h_l177_c7_0b05
result_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l177_c7_0b05_cond,
result_MUX_uxn_device_h_l177_c7_0b05_iftrue,
result_MUX_uxn_device_h_l177_c7_0b05_iffalse,
result_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- ctrl_MUX_uxn_device_h_l177_c7_0b05
ctrl_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l177_c7_0b05_cond,
ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue,
ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse,
ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- y_MUX_uxn_device_h_l177_c7_0b05
y_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l177_c7_0b05_cond,
y_MUX_uxn_device_h_l177_c7_0b05_iftrue,
y_MUX_uxn_device_h_l177_c7_0b05_iffalse,
y_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- ctrl_mode_MUX_uxn_device_h_l177_c7_0b05
ctrl_mode_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond,
ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue,
ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse,
ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- auto_advance_MUX_uxn_device_h_l177_c7_0b05
auto_advance_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond,
auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue,
auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse,
auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- tmp8_MUX_uxn_device_h_l177_c7_0b05
tmp8_MUX_uxn_device_h_l177_c7_0b05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l177_c7_0b05_cond,
tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue,
tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse,
tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output);

-- BIN_OP_EQ_uxn_device_h_l180_c11_934e
BIN_OP_EQ_uxn_device_h_l180_c11_934e : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l180_c11_934e_left,
BIN_OP_EQ_uxn_device_h_l180_c11_934e_right,
BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output);

-- x_MUX_uxn_device_h_l180_c7_751b
x_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l180_c7_751b_cond,
x_MUX_uxn_device_h_l180_c7_751b_iftrue,
x_MUX_uxn_device_h_l180_c7_751b_iffalse,
x_MUX_uxn_device_h_l180_c7_751b_return_output);

-- flip_x_MUX_uxn_device_h_l180_c7_751b
flip_x_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l180_c7_751b_cond,
flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue,
flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse,
flip_x_MUX_uxn_device_h_l180_c7_751b_return_output);

-- flip_y_MUX_uxn_device_h_l180_c7_751b
flip_y_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l180_c7_751b_cond,
flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue,
flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse,
flip_y_MUX_uxn_device_h_l180_c7_751b_return_output);

-- is_auto_x_MUX_uxn_device_h_l180_c7_751b
is_auto_x_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond,
is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue,
is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse,
is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output);

-- is_auto_y_MUX_uxn_device_h_l180_c7_751b
is_auto_y_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond,
is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue,
is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse,
is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output);

-- color_MUX_uxn_device_h_l180_c7_751b
color_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l180_c7_751b_cond,
color_MUX_uxn_device_h_l180_c7_751b_iftrue,
color_MUX_uxn_device_h_l180_c7_751b_iffalse,
color_MUX_uxn_device_h_l180_c7_751b_return_output);

-- layer_MUX_uxn_device_h_l180_c7_751b
layer_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l180_c7_751b_cond,
layer_MUX_uxn_device_h_l180_c7_751b_iftrue,
layer_MUX_uxn_device_h_l180_c7_751b_iffalse,
layer_MUX_uxn_device_h_l180_c7_751b_return_output);

-- is_in_bounds_MUX_uxn_device_h_l180_c7_751b
is_in_bounds_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond,
is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue,
is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse,
is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output);

-- result_MUX_uxn_device_h_l180_c7_751b
result_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l180_c7_751b_cond,
result_MUX_uxn_device_h_l180_c7_751b_iftrue,
result_MUX_uxn_device_h_l180_c7_751b_iffalse,
result_MUX_uxn_device_h_l180_c7_751b_return_output);

-- ctrl_MUX_uxn_device_h_l180_c7_751b
ctrl_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l180_c7_751b_cond,
ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue,
ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse,
ctrl_MUX_uxn_device_h_l180_c7_751b_return_output);

-- y_MUX_uxn_device_h_l180_c7_751b
y_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l180_c7_751b_cond,
y_MUX_uxn_device_h_l180_c7_751b_iftrue,
y_MUX_uxn_device_h_l180_c7_751b_iffalse,
y_MUX_uxn_device_h_l180_c7_751b_return_output);

-- ctrl_mode_MUX_uxn_device_h_l180_c7_751b
ctrl_mode_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond,
ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue,
ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse,
ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output);

-- auto_advance_MUX_uxn_device_h_l180_c7_751b
auto_advance_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l180_c7_751b_cond,
auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue,
auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse,
auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output);

-- tmp8_MUX_uxn_device_h_l180_c7_751b
tmp8_MUX_uxn_device_h_l180_c7_751b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l180_c7_751b_cond,
tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue,
tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse,
tmp8_MUX_uxn_device_h_l180_c7_751b_return_output);

-- BIN_OP_EQ_uxn_device_h_l184_c18_7893
BIN_OP_EQ_uxn_device_h_l184_c18_7893 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l184_c18_7893_left,
BIN_OP_EQ_uxn_device_h_l184_c18_7893_right,
BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output);

-- MUX_uxn_device_h_l184_c18_4275
MUX_uxn_device_h_l184_c18_4275 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l184_c18_4275_cond,
MUX_uxn_device_h_l184_c18_4275_iftrue,
MUX_uxn_device_h_l184_c18_4275_iffalse,
MUX_uxn_device_h_l184_c18_4275_return_output);

-- BIN_OP_EQ_uxn_device_h_l186_c11_1649
BIN_OP_EQ_uxn_device_h_l186_c11_1649 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l186_c11_1649_left,
BIN_OP_EQ_uxn_device_h_l186_c11_1649_right,
BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output);

-- x_MUX_uxn_device_h_l186_c7_fb9b
x_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l186_c7_fb9b_cond,
x_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
x_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
x_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- flip_x_MUX_uxn_device_h_l186_c7_fb9b
flip_x_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond,
flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- flip_y_MUX_uxn_device_h_l186_c7_fb9b
flip_y_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond,
flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- is_auto_x_MUX_uxn_device_h_l186_c7_fb9b
is_auto_x_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond,
is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- is_auto_y_MUX_uxn_device_h_l186_c7_fb9b
is_auto_y_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond,
is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- color_MUX_uxn_device_h_l186_c7_fb9b
color_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l186_c7_fb9b_cond,
color_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
color_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
color_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- layer_MUX_uxn_device_h_l186_c7_fb9b
layer_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l186_c7_fb9b_cond,
layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
layer_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- result_MUX_uxn_device_h_l186_c7_fb9b
result_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l186_c7_fb9b_cond,
result_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
result_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
result_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- ctrl_MUX_uxn_device_h_l186_c7_fb9b
ctrl_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond,
ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- y_MUX_uxn_device_h_l186_c7_fb9b
y_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l186_c7_fb9b_cond,
y_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
y_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
y_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b
ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond,
ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- auto_advance_MUX_uxn_device_h_l186_c7_fb9b
auto_advance_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond,
auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- tmp8_MUX_uxn_device_h_l186_c7_fb9b
tmp8_MUX_uxn_device_h_l186_c7_fb9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond,
tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue,
tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse,
tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output);

-- BIN_OP_OR_uxn_device_h_l188_c3_40ed
BIN_OP_OR_uxn_device_h_l188_c3_40ed : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l188_c3_40ed_left,
BIN_OP_OR_uxn_device_h_l188_c3_40ed_right,
BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output);

-- BIN_OP_EQ_uxn_device_h_l190_c11_bab7
BIN_OP_EQ_uxn_device_h_l190_c11_bab7 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left,
BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right,
BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output);

-- flip_x_MUX_uxn_device_h_l190_c7_655e
flip_x_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l190_c7_655e_cond,
flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue,
flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse,
flip_x_MUX_uxn_device_h_l190_c7_655e_return_output);

-- flip_y_MUX_uxn_device_h_l190_c7_655e
flip_y_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l190_c7_655e_cond,
flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue,
flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse,
flip_y_MUX_uxn_device_h_l190_c7_655e_return_output);

-- is_auto_x_MUX_uxn_device_h_l190_c7_655e
is_auto_x_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond,
is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue,
is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse,
is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output);

-- is_auto_y_MUX_uxn_device_h_l190_c7_655e
is_auto_y_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond,
is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue,
is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse,
is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output);

-- color_MUX_uxn_device_h_l190_c7_655e
color_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l190_c7_655e_cond,
color_MUX_uxn_device_h_l190_c7_655e_iftrue,
color_MUX_uxn_device_h_l190_c7_655e_iffalse,
color_MUX_uxn_device_h_l190_c7_655e_return_output);

-- layer_MUX_uxn_device_h_l190_c7_655e
layer_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l190_c7_655e_cond,
layer_MUX_uxn_device_h_l190_c7_655e_iftrue,
layer_MUX_uxn_device_h_l190_c7_655e_iffalse,
layer_MUX_uxn_device_h_l190_c7_655e_return_output);

-- result_MUX_uxn_device_h_l190_c7_655e
result_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l190_c7_655e_cond,
result_MUX_uxn_device_h_l190_c7_655e_iftrue,
result_MUX_uxn_device_h_l190_c7_655e_iffalse,
result_MUX_uxn_device_h_l190_c7_655e_return_output);

-- ctrl_MUX_uxn_device_h_l190_c7_655e
ctrl_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l190_c7_655e_cond,
ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue,
ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse,
ctrl_MUX_uxn_device_h_l190_c7_655e_return_output);

-- y_MUX_uxn_device_h_l190_c7_655e
y_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l190_c7_655e_cond,
y_MUX_uxn_device_h_l190_c7_655e_iftrue,
y_MUX_uxn_device_h_l190_c7_655e_iffalse,
y_MUX_uxn_device_h_l190_c7_655e_return_output);

-- ctrl_mode_MUX_uxn_device_h_l190_c7_655e
ctrl_mode_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond,
ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue,
ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse,
ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output);

-- auto_advance_MUX_uxn_device_h_l190_c7_655e
auto_advance_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l190_c7_655e_cond,
auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue,
auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse,
auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output);

-- tmp8_MUX_uxn_device_h_l190_c7_655e
tmp8_MUX_uxn_device_h_l190_c7_655e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l190_c7_655e_cond,
tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue,
tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse,
tmp8_MUX_uxn_device_h_l190_c7_655e_return_output);

-- BIN_OP_EQ_uxn_device_h_l195_c11_af68
BIN_OP_EQ_uxn_device_h_l195_c11_af68 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l195_c11_af68_left,
BIN_OP_EQ_uxn_device_h_l195_c11_af68_right,
BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output);

-- flip_x_MUX_uxn_device_h_l195_c7_a1be
flip_x_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l195_c7_a1be_cond,
flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue,
flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse,
flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- flip_y_MUX_uxn_device_h_l195_c7_a1be
flip_y_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l195_c7_a1be_cond,
flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue,
flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse,
flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- is_auto_x_MUX_uxn_device_h_l195_c7_a1be
is_auto_x_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond,
is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue,
is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse,
is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- is_auto_y_MUX_uxn_device_h_l195_c7_a1be
is_auto_y_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond,
is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue,
is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse,
is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- color_MUX_uxn_device_h_l195_c7_a1be
color_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l195_c7_a1be_cond,
color_MUX_uxn_device_h_l195_c7_a1be_iftrue,
color_MUX_uxn_device_h_l195_c7_a1be_iffalse,
color_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- layer_MUX_uxn_device_h_l195_c7_a1be
layer_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l195_c7_a1be_cond,
layer_MUX_uxn_device_h_l195_c7_a1be_iftrue,
layer_MUX_uxn_device_h_l195_c7_a1be_iffalse,
layer_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- result_MUX_uxn_device_h_l195_c7_a1be
result_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l195_c7_a1be_cond,
result_MUX_uxn_device_h_l195_c7_a1be_iftrue,
result_MUX_uxn_device_h_l195_c7_a1be_iffalse,
result_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- ctrl_MUX_uxn_device_h_l195_c7_a1be
ctrl_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l195_c7_a1be_cond,
ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue,
ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse,
ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- y_MUX_uxn_device_h_l195_c7_a1be
y_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l195_c7_a1be_cond,
y_MUX_uxn_device_h_l195_c7_a1be_iftrue,
y_MUX_uxn_device_h_l195_c7_a1be_iffalse,
y_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- ctrl_mode_MUX_uxn_device_h_l195_c7_a1be
ctrl_mode_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond,
ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue,
ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse,
ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- auto_advance_MUX_uxn_device_h_l195_c7_a1be
auto_advance_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond,
auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue,
auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse,
auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- tmp8_MUX_uxn_device_h_l195_c7_a1be
tmp8_MUX_uxn_device_h_l195_c7_a1be : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l195_c7_a1be_cond,
tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue,
tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse,
tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output);

-- BIN_OP_OR_uxn_device_h_l196_c3_0209
BIN_OP_OR_uxn_device_h_l196_c3_0209 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l196_c3_0209_left,
BIN_OP_OR_uxn_device_h_l196_c3_0209_right,
BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output);

-- BIN_OP_EQ_uxn_device_h_l199_c11_3072
BIN_OP_EQ_uxn_device_h_l199_c11_3072 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l199_c11_3072_left,
BIN_OP_EQ_uxn_device_h_l199_c11_3072_right,
BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output);

-- flip_x_MUX_uxn_device_h_l199_c7_6d18
flip_x_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l199_c7_6d18_cond,
flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue,
flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse,
flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- flip_y_MUX_uxn_device_h_l199_c7_6d18
flip_y_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l199_c7_6d18_cond,
flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue,
flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse,
flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- is_auto_x_MUX_uxn_device_h_l199_c7_6d18
is_auto_x_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond,
is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue,
is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse,
is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- is_auto_y_MUX_uxn_device_h_l199_c7_6d18
is_auto_y_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond,
is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue,
is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse,
is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- color_MUX_uxn_device_h_l199_c7_6d18
color_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l199_c7_6d18_cond,
color_MUX_uxn_device_h_l199_c7_6d18_iftrue,
color_MUX_uxn_device_h_l199_c7_6d18_iffalse,
color_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- layer_MUX_uxn_device_h_l199_c7_6d18
layer_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l199_c7_6d18_cond,
layer_MUX_uxn_device_h_l199_c7_6d18_iftrue,
layer_MUX_uxn_device_h_l199_c7_6d18_iffalse,
layer_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- result_MUX_uxn_device_h_l199_c7_6d18
result_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l199_c7_6d18_cond,
result_MUX_uxn_device_h_l199_c7_6d18_iftrue,
result_MUX_uxn_device_h_l199_c7_6d18_iffalse,
result_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- ctrl_MUX_uxn_device_h_l199_c7_6d18
ctrl_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l199_c7_6d18_cond,
ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue,
ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse,
ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- ctrl_mode_MUX_uxn_device_h_l199_c7_6d18
ctrl_mode_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond,
ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue,
ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse,
ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- auto_advance_MUX_uxn_device_h_l199_c7_6d18
auto_advance_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond,
auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue,
auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse,
auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- tmp8_MUX_uxn_device_h_l199_c7_6d18
tmp8_MUX_uxn_device_h_l199_c7_6d18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l199_c7_6d18_cond,
tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue,
tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse,
tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output);

-- CONST_SR_7_uxn_device_h_l202_c25_258a
CONST_SR_7_uxn_device_h_l202_c25_258a : entity work.CONST_SR_7_uint8_t_0CLK_de264c78 port map (
CONST_SR_7_uxn_device_h_l202_c25_258a_x,
CONST_SR_7_uxn_device_h_l202_c25_258a_return_output);

-- CONST_SR_6_uxn_device_h_l203_c21_1ae9
CONST_SR_6_uxn_device_h_l203_c21_1ae9 : entity work.CONST_SR_6_uint8_t_0CLK_de264c78 port map (
CONST_SR_6_uxn_device_h_l203_c21_1ae9_x,
CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output);

-- CONST_SR_5_uxn_device_h_l204_c22_d886
CONST_SR_5_uxn_device_h_l204_c22_d886 : entity work.CONST_SR_5_uint8_t_0CLK_de264c78 port map (
CONST_SR_5_uxn_device_h_l204_c22_d886_x,
CONST_SR_5_uxn_device_h_l204_c22_d886_return_output);

-- CONST_SR_4_uxn_device_h_l205_c22_5633
CONST_SR_4_uxn_device_h_l205_c22_5633 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_device_h_l205_c22_5633_x,
CONST_SR_4_uxn_device_h_l205_c22_5633_return_output);

-- BIN_OP_AND_uxn_device_h_l206_c10_eeac
BIN_OP_AND_uxn_device_h_l206_c10_eeac : entity work.BIN_OP_AND_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l206_c10_eeac_left,
BIN_OP_AND_uxn_device_h_l206_c10_eeac_right,
BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output);

-- CONST_SL_8_uxn_device_h_l207_c22_5007
CONST_SL_8_uxn_device_h_l207_c22_5007 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_device_h_l207_c22_5007_x,
CONST_SL_8_uxn_device_h_l207_c22_5007_return_output);

-- BIN_OP_PLUS_uxn_device_h_l207_c22_6f15
BIN_OP_PLUS_uxn_device_h_l207_c22_6f15 : entity work.BIN_OP_PLUS_uint16_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left,
BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right,
BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output);

-- MUX_uxn_device_h_l209_c25_7219
MUX_uxn_device_h_l209_c25_7219 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l209_c25_7219_cond,
MUX_uxn_device_h_l209_c25_7219_iftrue,
MUX_uxn_device_h_l209_c25_7219_iffalse,
MUX_uxn_device_h_l209_c25_7219_return_output);

-- MUX_uxn_device_h_l209_c12_f6b2
MUX_uxn_device_h_l209_c12_f6b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l209_c12_f6b2_cond,
MUX_uxn_device_h_l209_c12_f6b2_iftrue,
MUX_uxn_device_h_l209_c12_f6b2_iffalse,
MUX_uxn_device_h_l209_c12_f6b2_return_output);

-- BIN_OP_OR_uxn_device_h_l209_c3_32f9
BIN_OP_OR_uxn_device_h_l209_c3_32f9 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l209_c3_32f9_left,
BIN_OP_OR_uxn_device_h_l209_c3_32f9_right,
BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output);

-- MUX_uxn_device_h_l210_c25_837a
MUX_uxn_device_h_l210_c25_837a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l210_c25_837a_cond,
MUX_uxn_device_h_l210_c25_837a_iftrue,
MUX_uxn_device_h_l210_c25_837a_iffalse,
MUX_uxn_device_h_l210_c25_837a_return_output);

-- MUX_uxn_device_h_l210_c12_5d90
MUX_uxn_device_h_l210_c12_5d90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l210_c12_5d90_cond,
MUX_uxn_device_h_l210_c12_5d90_iftrue,
MUX_uxn_device_h_l210_c12_5d90_iffalse,
MUX_uxn_device_h_l210_c12_5d90_return_output);

-- BIN_OP_OR_uxn_device_h_l210_c3_3d75
BIN_OP_OR_uxn_device_h_l210_c3_3d75 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l210_c3_3d75_left,
BIN_OP_OR_uxn_device_h_l210_c3_3d75_right,
BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output);

-- BIN_OP_OR_uxn_device_h_l212_c26_ceb5
BIN_OP_OR_uxn_device_h_l212_c26_ceb5 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left,
BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right,
BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output);

-- BIN_OP_EQ_uxn_device_h_l216_c11_7276
BIN_OP_EQ_uxn_device_h_l216_c11_7276 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l216_c11_7276_left,
BIN_OP_EQ_uxn_device_h_l216_c11_7276_right,
BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output);

-- is_auto_x_MUX_uxn_device_h_l216_c7_7ff7
is_auto_x_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond,
is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- is_auto_y_MUX_uxn_device_h_l216_c7_7ff7
is_auto_y_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond,
is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7
result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7
result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7
result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7
result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7
result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- result_u8_value_MUX_uxn_device_h_l216_c7_7ff7
result_u8_value_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond,
result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- auto_advance_MUX_uxn_device_h_l216_c7_7ff7
auto_advance_MUX_uxn_device_h_l216_c7_7ff7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond,
auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue,
auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse,
auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output);

-- BIN_OP_PLUS_uxn_device_h_l223_c36_646e
BIN_OP_PLUS_uxn_device_h_l223_c36_646e : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left,
BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right,
BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output);

-- BIN_OP_PLUS_uxn_device_h_l223_c51_2abc
BIN_OP_PLUS_uxn_device_h_l223_c51_2abc : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left,
BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right,
BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output);

-- MUX_uxn_device_h_l223_c23_951e
MUX_uxn_device_h_l223_c23_951e : entity work.MUX_uint1_t_uint17_t_uint17_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l223_c23_951e_cond,
MUX_uxn_device_h_l223_c23_951e_iftrue,
MUX_uxn_device_h_l223_c23_951e_iffalse,
MUX_uxn_device_h_l223_c23_951e_return_output);

-- CONST_SR_8_uxn_device_h_l223_c23_ac31
CONST_SR_8_uxn_device_h_l223_c23_ac31 : entity work.CONST_SR_8_uint17_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l223_c23_ac31_x,
CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output);

-- MUX_uxn_device_h_l224_c31_b2a9
MUX_uxn_device_h_l224_c31_b2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l224_c31_b2a9_cond,
MUX_uxn_device_h_l224_c31_b2a9_iftrue,
MUX_uxn_device_h_l224_c31_b2a9_iffalse,
MUX_uxn_device_h_l224_c31_b2a9_return_output);

-- UNARY_OP_NOT_uxn_device_h_l225_c26_1b71
UNARY_OP_NOT_uxn_device_h_l225_c26_1b71 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr,
UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output);

-- BIN_OP_EQ_uxn_device_h_l227_c11_50a9
BIN_OP_EQ_uxn_device_h_l227_c11_50a9 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left,
BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right,
BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0
result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond,
result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output);

-- result_u8_value_MUX_uxn_device_h_l227_c7_a7b0
result_u8_value_MUX_uxn_device_h_l227_c7_a7b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond,
result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue,
result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse,
result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0
result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond,
result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output);

-- BIN_OP_PLUS_uxn_device_h_l229_c34_39fe
BIN_OP_PLUS_uxn_device_h_l229_c34_39fe : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left,
BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right,
BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output);

-- BIN_OP_PLUS_uxn_device_h_l229_c44_432b
BIN_OP_PLUS_uxn_device_h_l229_c44_432b : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left,
BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right,
BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output);

-- MUX_uxn_device_h_l229_c21_0bb5
MUX_uxn_device_h_l229_c21_0bb5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l229_c21_0bb5_cond,
MUX_uxn_device_h_l229_c21_0bb5_iftrue,
MUX_uxn_device_h_l229_c21_0bb5_iffalse,
MUX_uxn_device_h_l229_c21_0bb5_return_output);

-- MUX_uxn_device_h_l230_c31_4ef1
MUX_uxn_device_h_l230_c31_4ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l230_c31_4ef1_cond,
MUX_uxn_device_h_l230_c31_4ef1_iftrue,
MUX_uxn_device_h_l230_c31_4ef1_iffalse,
MUX_uxn_device_h_l230_c31_4ef1_return_output);

-- UNARY_OP_NOT_uxn_device_h_l231_c26_b525
UNARY_OP_NOT_uxn_device_h_l231_c26_b525 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr,
UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output);

-- BIN_OP_EQ_uxn_device_h_l233_c11_ae07
BIN_OP_EQ_uxn_device_h_l233_c11_ae07 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left,
BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right,
BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85
result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond,
result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue,
result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse,
result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output);

-- result_u8_value_MUX_uxn_device_h_l233_c7_eb85
result_u8_value_MUX_uxn_device_h_l233_c7_eb85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond,
result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue,
result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse,
result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85
result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond,
result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue,
result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse,
result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85
result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond,
result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output);

-- BIN_OP_PLUS_uxn_device_h_l237_c32_80ef
BIN_OP_PLUS_uxn_device_h_l237_c32_80ef : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left,
BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right,
BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output);

-- CONST_SR_8_uxn_device_h_l237_c32_db9f
CONST_SR_8_uxn_device_h_l237_c32_db9f : entity work.CONST_SR_8_uint17_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_device_h_l237_c32_db9f_x,
CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output);

-- BIN_OP_EQ_uxn_device_h_l240_c11_55c4
BIN_OP_EQ_uxn_device_h_l240_c11_55c4 : entity work.BIN_OP_EQ_uint12_t_uint12_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left,
BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right,
BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l240_c7_1927
result_is_deo_done_MUX_uxn_device_h_l240_c7_1927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond,
result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue,
result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse,
result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output);

-- result_u8_value_MUX_uxn_device_h_l240_c7_1927
result_u8_value_MUX_uxn_device_h_l240_c7_1927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond,
result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue,
result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse,
result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l240_c7_1927
result_device_ram_address_MUX_uxn_device_h_l240_c7_1927 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond,
result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue,
result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse,
result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output);

-- BIN_OP_PLUS_uxn_device_h_l244_c31_2d01
BIN_OP_PLUS_uxn_device_h_l244_c31_2d01 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left,
BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right,
BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690
CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x,
CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output);



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
 is_in_bounds,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output,
 x_MUX_uxn_device_h_l171_c2_943c_return_output,
 flip_x_MUX_uxn_device_h_l171_c2_943c_return_output,
 flip_y_MUX_uxn_device_h_l171_c2_943c_return_output,
 is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output,
 is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output,
 color_MUX_uxn_device_h_l171_c2_943c_return_output,
 layer_MUX_uxn_device_h_l171_c2_943c_return_output,
 is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output,
 result_MUX_uxn_device_h_l171_c2_943c_return_output,
 ctrl_MUX_uxn_device_h_l171_c2_943c_return_output,
 y_MUX_uxn_device_h_l171_c2_943c_return_output,
 ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output,
 auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output,
 tmp8_MUX_uxn_device_h_l171_c2_943c_return_output,
 BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output,
 x_MUX_uxn_device_h_l177_c7_0b05_return_output,
 flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output,
 flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output,
 is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output,
 is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output,
 color_MUX_uxn_device_h_l177_c7_0b05_return_output,
 layer_MUX_uxn_device_h_l177_c7_0b05_return_output,
 is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output,
 result_MUX_uxn_device_h_l177_c7_0b05_return_output,
 ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output,
 y_MUX_uxn_device_h_l177_c7_0b05_return_output,
 ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output,
 auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output,
 tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output,
 BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output,
 x_MUX_uxn_device_h_l180_c7_751b_return_output,
 flip_x_MUX_uxn_device_h_l180_c7_751b_return_output,
 flip_y_MUX_uxn_device_h_l180_c7_751b_return_output,
 is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output,
 is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output,
 color_MUX_uxn_device_h_l180_c7_751b_return_output,
 layer_MUX_uxn_device_h_l180_c7_751b_return_output,
 is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output,
 result_MUX_uxn_device_h_l180_c7_751b_return_output,
 ctrl_MUX_uxn_device_h_l180_c7_751b_return_output,
 y_MUX_uxn_device_h_l180_c7_751b_return_output,
 ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output,
 auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output,
 tmp8_MUX_uxn_device_h_l180_c7_751b_return_output,
 BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output,
 MUX_uxn_device_h_l184_c18_4275_return_output,
 BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output,
 x_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 color_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 layer_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 result_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 y_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output,
 BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output,
 BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output,
 flip_x_MUX_uxn_device_h_l190_c7_655e_return_output,
 flip_y_MUX_uxn_device_h_l190_c7_655e_return_output,
 is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output,
 is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output,
 color_MUX_uxn_device_h_l190_c7_655e_return_output,
 layer_MUX_uxn_device_h_l190_c7_655e_return_output,
 result_MUX_uxn_device_h_l190_c7_655e_return_output,
 ctrl_MUX_uxn_device_h_l190_c7_655e_return_output,
 y_MUX_uxn_device_h_l190_c7_655e_return_output,
 ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output,
 auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output,
 tmp8_MUX_uxn_device_h_l190_c7_655e_return_output,
 BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output,
 flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output,
 flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output,
 is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output,
 is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output,
 color_MUX_uxn_device_h_l195_c7_a1be_return_output,
 layer_MUX_uxn_device_h_l195_c7_a1be_return_output,
 result_MUX_uxn_device_h_l195_c7_a1be_return_output,
 ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output,
 y_MUX_uxn_device_h_l195_c7_a1be_return_output,
 ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output,
 auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output,
 tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output,
 BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output,
 BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output,
 flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output,
 flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output,
 is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output,
 is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output,
 color_MUX_uxn_device_h_l199_c7_6d18_return_output,
 layer_MUX_uxn_device_h_l199_c7_6d18_return_output,
 result_MUX_uxn_device_h_l199_c7_6d18_return_output,
 ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output,
 ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output,
 auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output,
 tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output,
 CONST_SR_7_uxn_device_h_l202_c25_258a_return_output,
 CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output,
 CONST_SR_5_uxn_device_h_l204_c22_d886_return_output,
 CONST_SR_4_uxn_device_h_l205_c22_5633_return_output,
 BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output,
 CONST_SL_8_uxn_device_h_l207_c22_5007_return_output,
 BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output,
 MUX_uxn_device_h_l209_c25_7219_return_output,
 MUX_uxn_device_h_l209_c12_f6b2_return_output,
 BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output,
 MUX_uxn_device_h_l210_c25_837a_return_output,
 MUX_uxn_device_h_l210_c12_5d90_return_output,
 BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output,
 BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output,
 BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output,
 is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output,
 BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output,
 BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output,
 MUX_uxn_device_h_l223_c23_951e_return_output,
 CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output,
 MUX_uxn_device_h_l224_c31_b2a9_return_output,
 UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output,
 BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output,
 result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output,
 BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output,
 BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output,
 MUX_uxn_device_h_l229_c21_0bb5_return_output,
 MUX_uxn_device_h_l230_c31_4ef1_return_output,
 UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output,
 BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output,
 result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output,
 result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output,
 result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output,
 BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output,
 CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output,
 BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output,
 result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output,
 result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output,
 BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l171_c2_943c_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l171_c2_943c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l171_c2_943c_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_0b05_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l171_c2_943c_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l177_c7_0b05_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_0b05_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_0b05_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l180_c7_751b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l180_c7_751b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l180_c7_751b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l180_c7_751b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_fb9b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l184_c18_4275_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l184_c18_4275_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l184_c18_4275_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l184_c18_4275_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_fb9b_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_655e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l190_c7_655e_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_655e_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_655e_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_a1be_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l195_c7_a1be_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l195_c7_a1be_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_a1be_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l199_c7_6d18_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(3 downto 0);
 variable VAR_color_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l199_c7_6d18_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l199_c7_6d18_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l199_c7_6d18_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l199_c7_6d18_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l201_c11_1066_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l203_c11_f3d1_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l204_c12_d2f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_x : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint1_t_uxn_device_h_l205_c12_f623_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_uxn_device_h_l206_c3_2b8c : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output : unsigned(3 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l207_c3_1668 : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right : unsigned(7 downto 0);
 variable VAR_uint16_7_0_uxn_device_h_l207_c32_d25f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c12_f6b2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c25_7219_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c25_7219_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c25_7219_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c25_7219_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c12_f6b2_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c12_f6b2_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l209_c12_f6b2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_left : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c12_5d90_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c25_837a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c25_837a_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c25_837a_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c25_837a_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c12_5d90_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c12_5d90_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l210_c12_5d90_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l211_c3_fb4a : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l221_c3_52a9 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l216_c7_7ff7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l223_c3_f73b : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l219_c15_0db8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l223_c23_951e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l223_c23_951e_iftrue : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l223_c23_951e_iffalse : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l223_c23_951e_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_x : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l224_c31_b2a9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l224_c31_b2a9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l224_c31_b2a9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l224_c31_b2a9_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l229_c21_0bb5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l229_c21_0bb5_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l229_c21_0bb5_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output : unsigned(16 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_device_h_l229_c21_0bb5_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l230_c31_4ef1_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l230_c31_4ef1_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l230_c31_4ef1_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l230_c31_4ef1_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output : unsigned(16 downto 0);
 variable VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_x : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l237_c21_6617_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right : unsigned(11 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l240_c7_1927_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l240_c7_1927_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l244_c21_09fc_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output : unsigned(0 downto 0);
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
variable REG_VAR_is_in_bounds : unsigned(0 downto 0);
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
  REG_VAR_is_in_bounds := is_in_bounds;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right := to_unsigned(1, 16);
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right := to_unsigned(1, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_right := to_unsigned(7, 12);
     VAR_MUX_uxn_device_h_l224_c31_b2a9_iftrue := to_unsigned(40, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_right := to_unsigned(0, 12);
     VAR_result_device_ram_address_uxn_device_h_l211_c3_fb4a := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l210_c12_5d90_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_right := to_unsigned(3, 12);
     VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right := to_unsigned(9, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right := to_unsigned(1, 16);
     VAR_MUX_uxn_device_h_l209_c25_7219_iftrue := to_unsigned(24, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right := to_unsigned(8, 12);
     VAR_MUX_uxn_device_h_l209_c12_f6b2_iffalse := to_unsigned(0, 8);
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_right := to_unsigned(5, 12);
     VAR_result_u16_addr_uxn_device_h_l221_c3_52a9 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_result_u16_addr_uxn_device_h_l221_c3_52a9;
     VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue := to_unsigned(42, 8);
     VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l210_c25_837a_iftrue := to_unsigned(4, 8);
     VAR_MUX_uxn_device_h_l184_c18_4275_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l230_c31_4ef1_iffalse := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_right := to_unsigned(6, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l209_c25_7219_iffalse := to_unsigned(16, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right := to_unsigned(10, 12);
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l230_c31_4ef1_iftrue := to_unsigned(41, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right := to_unsigned(4, 12);
     VAR_MUX_uxn_device_h_l224_c31_b2a9_iffalse := to_unsigned(42, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_right := to_unsigned(2, 12);
     VAR_MUX_uxn_device_h_l210_c25_837a_iffalse := to_unsigned(0, 8);
     VAR_MUX_uxn_device_h_l184_c18_4275_iftrue := to_unsigned(1, 1);

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
     VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l171_c2_943c_iftrue := color;
     VAR_color_MUX_uxn_device_h_l177_c7_0b05_iftrue := color;
     VAR_color_MUX_uxn_device_h_l180_c7_751b_iftrue := color;
     VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iftrue := color;
     VAR_color_MUX_uxn_device_h_l190_c7_655e_iftrue := color;
     VAR_color_MUX_uxn_device_h_l195_c7_a1be_iftrue := color;
     VAR_color_MUX_uxn_device_h_l199_c7_6d18_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse := flip_y;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right := is_auto_x;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left := is_auto_x;
     VAR_MUX_uxn_device_h_l229_c21_0bb5_cond := is_auto_x;
     VAR_MUX_uxn_device_h_l230_c31_4ef1_cond := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left := is_auto_y;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse := is_auto_y;
     VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right := is_in_bounds;
     VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue := is_in_bounds;
     VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue := is_in_bounds;
     VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse := is_in_bounds;
     VAR_layer_MUX_uxn_device_h_l171_c2_943c_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l180_c7_751b_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l190_c7_655e_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_left := VAR_previous_device_ram_read;
     VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_x := VAR_previous_device_ram_read;
     VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse := tmp8;
     VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left := x;
     VAR_x_MUX_uxn_device_h_l171_c2_943c_iftrue := x;
     VAR_x_MUX_uxn_device_h_l177_c7_0b05_iftrue := x;
     VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse := x;
     VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left := y;
     VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_x := y;
     VAR_y_MUX_uxn_device_h_l171_c2_943c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l177_c7_0b05_iftrue := y;
     VAR_y_MUX_uxn_device_h_l180_c7_751b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l195_c7_a1be_iffalse := y;
     -- uint8_1_1[uxn_device_h_l219_c15_0db8] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l219_c15_0db8_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- uint16_7_0[uxn_device_h_l207_c32_d25f] LATENCY=0
     VAR_uint16_7_0_uxn_device_h_l207_c32_d25f_return_output := uint16_7_0(
     x);

     -- BIN_OP_EQ[uxn_device_h_l186_c11_1649] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l186_c11_1649_left <= VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_left;
     BIN_OP_EQ_uxn_device_h_l186_c11_1649_right <= VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output := BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;

     -- BIN_OP_EQ[uxn_device_h_l180_c11_934e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l180_c11_934e_left <= VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_left;
     BIN_OP_EQ_uxn_device_h_l180_c11_934e_right <= VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output := BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l240_c7_1927] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l240_c7_1927_return_output := result.is_device_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l216_c7_7ff7] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l216_c7_7ff7_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l233_c11_ae07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left <= VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_left;
     BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right <= VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output := BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l195_c7_a1be] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l195_c7_a1be_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_EQ[uxn_device_h_l216_c11_7276] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l216_c11_7276_left <= VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_left;
     BIN_OP_EQ_uxn_device_h_l216_c11_7276_right <= VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output := BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l177_c7_0b05] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_0b05_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_EQ[uxn_device_h_l240_c11_55c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_left;
     BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output := BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output;

     -- MUX[uxn_device_h_l230_c31_4ef1] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l230_c31_4ef1_cond <= VAR_MUX_uxn_device_h_l230_c31_4ef1_cond;
     MUX_uxn_device_h_l230_c31_4ef1_iftrue <= VAR_MUX_uxn_device_h_l230_c31_4ef1_iftrue;
     MUX_uxn_device_h_l230_c31_4ef1_iffalse <= VAR_MUX_uxn_device_h_l230_c31_4ef1_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l230_c31_4ef1_return_output := MUX_uxn_device_h_l230_c31_4ef1_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l244_c31_2d01] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left <= VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_left;
     BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right <= VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output := BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output;

     -- CONST_SR_7[uxn_device_h_l202_c25_258a] LATENCY=0
     -- Inputs
     CONST_SR_7_uxn_device_h_l202_c25_258a_x <= VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_x;
     -- Outputs
     VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_return_output := CONST_SR_7_uxn_device_h_l202_c25_258a_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l171_c2_943c] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l171_c2_943c_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- BIN_OP_EQ[uxn_device_h_l195_c11_af68] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l195_c11_af68_left <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_left;
     BIN_OP_EQ_uxn_device_h_l195_c11_af68_right <= VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output := BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;

     -- BIN_OP_EQ[uxn_device_h_l199_c11_3072] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l199_c11_3072_left <= VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_left;
     BIN_OP_EQ_uxn_device_h_l199_c11_3072_right <= VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output := BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l240_c7_1927] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l240_c7_1927_return_output := result.device_ram_address;

     -- BIN_OP_PLUS[uxn_device_h_l229_c34_39fe] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left <= VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_left;
     BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right <= VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output := BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l186_c7_fb9b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_fb9b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_PLUS[uxn_device_h_l237_c32_80ef] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left <= VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_left;
     BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right <= VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output := BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output;

     -- BIN_OP_EQ[uxn_device_h_l184_c18_7893] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l184_c18_7893_left <= VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_left;
     BIN_OP_EQ_uxn_device_h_l184_c18_7893_right <= VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output := BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output;

     -- CONST_SL_8[uxn_device_h_l207_c22_5007] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_device_h_l207_c22_5007_x <= VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_return_output := CONST_SL_8_uxn_device_h_l207_c22_5007_return_output;

     -- uint8_0_0[uxn_device_h_l218_c15_711a] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- CONST_SR_5[uxn_device_h_l204_c22_d886] LATENCY=0
     -- Inputs
     CONST_SR_5_uxn_device_h_l204_c22_d886_x <= VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_x;
     -- Outputs
     VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_return_output := CONST_SR_5_uxn_device_h_l204_c22_d886_return_output;

     -- CONST_SR_4[uxn_device_h_l205_c22_5633] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_device_h_l205_c22_5633_x <= VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_return_output := CONST_SR_4_uxn_device_h_l205_c22_5633_return_output;

     -- BIN_OP_EQ[uxn_device_h_l171_c6_d197] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l171_c6_d197_left <= VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_left;
     BIN_OP_EQ_uxn_device_h_l171_c6_d197_right <= VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output := BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;

     -- result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_device_h_l240_c7_1927] LATENCY=0
     VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l240_c7_1927_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l177_c11_d37b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_left;
     BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right <= VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output := BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l190_c11_bab7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_left;
     BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output := BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;

     -- CONST_SR_6[uxn_device_h_l203_c21_1ae9] LATENCY=0
     -- Inputs
     CONST_SR_6_uxn_device_h_l203_c21_1ae9_x <= VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_x;
     -- Outputs
     VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output := CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l223_c51_2abc] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left <= VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_left;
     BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right <= VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output := BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l223_c36_646e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left <= VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_left;
     BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right <= VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output := BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output;

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l240_c7_1927] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l240_c7_1927_return_output := result.u8_value;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l190_c7_655e] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_655e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l216_c7_7ff7] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l216_c7_7ff7_return_output := result.u16_addr;

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l229_c44_432b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_left;
     BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output := BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l201_c11_1066] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l201_c11_1066_return_output := CAST_TO_uint4_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l180_c7_751b] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l180_c7_751b_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- BIN_OP_EQ[uxn_device_h_l227_c11_50a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left <= VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_left;
     BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right <= VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output := BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output;

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l242_l235_DUPLICATE_b8bd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_color_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_layer_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_result_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_x_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_y_MUX_uxn_device_h_l171_c2_943c_cond := VAR_BIN_OP_EQ_uxn_device_h_l171_c6_d197_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_x_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_0b05_cond := VAR_BIN_OP_EQ_uxn_device_h_l177_c11_d37b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_color_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_layer_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_result_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_x_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_y_MUX_uxn_device_h_l180_c7_751b_cond := VAR_BIN_OP_EQ_uxn_device_h_l180_c11_934e_return_output;
     VAR_MUX_uxn_device_h_l184_c18_4275_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c18_7893_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_color_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_result_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_x_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_y_MUX_uxn_device_h_l186_c7_fb9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l186_c11_1649_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_color_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_layer_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_655e_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_bab7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_color_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_layer_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_y_MUX_uxn_device_h_l195_c7_a1be_cond := VAR_BIN_OP_EQ_uxn_device_h_l195_c11_af68_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_color_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_layer_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_result_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_cond := VAR_BIN_OP_EQ_uxn_device_h_l199_c11_3072_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond := VAR_BIN_OP_EQ_uxn_device_h_l216_c11_7276_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_50a9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond := VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond := VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond := VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond := VAR_BIN_OP_EQ_uxn_device_h_l233_c11_ae07_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_55c4_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l228_l231_DUPLICATE_9409_return_output;
     VAR_MUX_uxn_device_h_l223_c23_951e_iftrue := VAR_BIN_OP_PLUS_uxn_device_h_l223_c36_646e_return_output;
     VAR_MUX_uxn_device_h_l223_c23_951e_iffalse := VAR_BIN_OP_PLUS_uxn_device_h_l223_c51_2abc_return_output;
     VAR_MUX_uxn_device_h_l229_c21_0bb5_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l229_c34_39fe_return_output, 8);
     VAR_MUX_uxn_device_h_l229_c21_0bb5_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l229_c44_432b_return_output, 8);
     VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_x := VAR_BIN_OP_PLUS_uxn_device_h_l237_c32_80ef_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l182_l196_l192_l188_DUPLICATE_e369_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_left := VAR_CAST_TO_uint4_t_uxn_device_h_l201_c11_1066_return_output;
     VAR_color_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_CAST_TO_uint4_t_uxn_device_h_l201_c11_1066_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left := VAR_CONST_SL_8_uxn_device_h_l207_c22_5007_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue := VAR_MUX_uxn_device_h_l230_c31_4ef1_return_output;
     VAR_result_MUX_uxn_device_h_l177_c7_0b05_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l177_c7_0b05_return_output;
     VAR_result_MUX_uxn_device_h_l180_c7_751b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l180_c7_751b_return_output;
     VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_655e_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_655e_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_a1be_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l195_c7_a1be_return_output;
     VAR_result_MUX_uxn_device_h_l171_c2_943c_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l171_c2_943c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l240_c7_1927_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse := VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l240_c7_1927_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l240_c7_1927_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l216_c7_7ff7_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l216_c7_7ff7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l240_c7_1927_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right := VAR_uint16_7_0_uxn_device_h_l207_c32_d25f_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left := VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output;
     VAR_MUX_uxn_device_h_l223_c23_951e_cond := VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output;
     VAR_MUX_uxn_device_h_l224_c31_b2a9_cond := VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_uint8_0_0_uxn_device_h_l218_c15_711a_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right := VAR_uint8_1_1_uxn_device_h_l219_c15_0db8_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_uint8_1_1_uxn_device_h_l219_c15_0db8_return_output;
     -- UNARY_OP_NOT[uxn_device_h_l231_c26_b525] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output := UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output;

     -- MUX[uxn_device_h_l223_c23_951e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l223_c23_951e_cond <= VAR_MUX_uxn_device_h_l223_c23_951e_cond;
     MUX_uxn_device_h_l223_c23_951e_iftrue <= VAR_MUX_uxn_device_h_l223_c23_951e_iftrue;
     MUX_uxn_device_h_l223_c23_951e_iffalse <= VAR_MUX_uxn_device_h_l223_c23_951e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l223_c23_951e_return_output := MUX_uxn_device_h_l223_c23_951e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l240_c7_1927] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output := result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output;

     -- ctrl_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_cond;
     ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output := ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- is_auto_y_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_cond;
     is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output := is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l207_c22_6f15] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_left;
     BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right <= VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output := BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output;

     -- auto_advance_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_cond;
     auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output := auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- BIN_OP_OR[uxn_device_h_l188_c3_40ed] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l188_c3_40ed_left <= VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_left;
     BIN_OP_OR_uxn_device_h_l188_c3_40ed_right <= VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output := BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l244_c21_09fc] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l244_c21_09fc_return_output := CAST_TO_uint8_t_uint17_t(
     VAR_BIN_OP_PLUS_uxn_device_h_l244_c31_2d01_return_output);

     -- CONST_SR_8[uxn_device_h_l237_c32_db9f] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l237_c32_db9f_x <= VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output := CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output;

     -- MUX[uxn_device_h_l224_c31_b2a9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l224_c31_b2a9_cond <= VAR_MUX_uxn_device_h_l224_c31_b2a9_cond;
     MUX_uxn_device_h_l224_c31_b2a9_iftrue <= VAR_MUX_uxn_device_h_l224_c31_b2a9_iftrue;
     MUX_uxn_device_h_l224_c31_b2a9_iffalse <= VAR_MUX_uxn_device_h_l224_c31_b2a9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l224_c31_b2a9_return_output := MUX_uxn_device_h_l224_c31_b2a9_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l204_c12_d2f8] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l204_c12_d2f8_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_5_uxn_device_h_l204_c22_d886_return_output);

     -- CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output := CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output;

     -- BIN_OP_AND[uxn_device_h_l206_c10_eeac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l206_c10_eeac_left <= VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_left;
     BIN_OP_AND_uxn_device_h_l206_c10_eeac_right <= VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output := BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l205_c12_f623] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l205_c12_f623_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_4_uxn_device_h_l205_c22_5633_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l240_c7_1927] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_cond;
     result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output := result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output;

     -- is_auto_x_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_cond;
     is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output := is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- BIN_OP_OR[uxn_device_h_l196_c3_0209] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l196_c3_0209_left <= VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_left;
     BIN_OP_OR_uxn_device_h_l196_c3_0209_right <= VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output := BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l240_c7_1927] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_cond;
     result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output := result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output;

     -- color_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_color_MUX_uxn_device_h_l199_c7_6d18_cond;
     color_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_color_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     color_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_color_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l199_c7_6d18_return_output := color_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- MUX[uxn_device_h_l184_c18_4275] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l184_c18_4275_cond <= VAR_MUX_uxn_device_h_l184_c18_4275_cond;
     MUX_uxn_device_h_l184_c18_4275_iftrue <= VAR_MUX_uxn_device_h_l184_c18_4275_iftrue;
     MUX_uxn_device_h_l184_c18_4275_iffalse <= VAR_MUX_uxn_device_h_l184_c18_4275_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l184_c18_4275_return_output := MUX_uxn_device_h_l184_c18_4275_return_output;

     -- MUX[uxn_device_h_l229_c21_0bb5] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l229_c21_0bb5_cond <= VAR_MUX_uxn_device_h_l229_c21_0bb5_cond;
     MUX_uxn_device_h_l229_c21_0bb5_iftrue <= VAR_MUX_uxn_device_h_l229_c21_0bb5_iftrue;
     MUX_uxn_device_h_l229_c21_0bb5_iffalse <= VAR_MUX_uxn_device_h_l229_c21_0bb5_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l229_c21_0bb5_return_output := MUX_uxn_device_h_l229_c21_0bb5_return_output;

     -- CAST_TO_uint1_t[uxn_device_h_l202_c15_7498] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_7_uxn_device_h_l202_c25_258a_return_output);

     -- CAST_TO_uint1_t[uxn_device_h_l203_c11_f3d1] LATENCY=0
     VAR_CAST_TO_uint1_t_uxn_device_h_l203_c11_f3d1_return_output := CAST_TO_uint1_t_uint8_t(
     VAR_CONST_SR_6_uxn_device_h_l203_c21_1ae9_return_output);

     -- Submodule level 2
     VAR_tmp8_uxn_device_h_l206_c3_2b8c := resize(VAR_BIN_OP_AND_uxn_device_h_l206_c10_eeac_return_output, 8);
     VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue := VAR_BIN_OP_OR_uxn_device_h_l188_c3_40ed_return_output;
     VAR_y_MUX_uxn_device_h_l195_c7_a1be_iftrue := VAR_BIN_OP_OR_uxn_device_h_l196_c3_0209_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l222_l225_DUPLICATE_a10b_return_output;
     VAR_result_u16_addr_uxn_device_h_l207_c3_1668 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l207_c22_6f15_return_output, 16);
     VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left := VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output;
     VAR_MUX_uxn_device_h_l209_c12_f6b2_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output;
     VAR_MUX_uxn_device_h_l210_c12_5d90_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output;
     VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l203_c11_f3d1_return_output;
     VAR_MUX_uxn_device_h_l210_c25_837a_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l204_c12_d2f8_return_output;
     VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l204_c12_d2f8_return_output;
     VAR_MUX_uxn_device_h_l209_c25_7219_cond := VAR_CAST_TO_uint1_t_uxn_device_h_l205_c12_f623_return_output;
     VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_CAST_TO_uint1_t_uxn_device_h_l205_c12_f623_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l244_c21_09fc_return_output;
     VAR_x_MUX_uxn_device_h_l180_c7_751b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_655e_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l193_l183_DUPLICATE_7690_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue := VAR_MUX_uxn_device_h_l184_c18_4275_return_output;
     VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_x := VAR_MUX_uxn_device_h_l223_c23_951e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_MUX_uxn_device_h_l224_c31_b2a9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue := VAR_MUX_uxn_device_h_l229_c21_0bb5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l231_c26_b525_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse := VAR_auto_advance_MUX_uxn_device_h_l216_c7_7ff7_return_output;
     VAR_color_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_color_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_ctrl_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l216_c7_7ff7_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l216_c7_7ff7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_1927_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_1927_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_1927_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_left := VAR_tmp8_uxn_device_h_l206_c3_2b8c;
     -- auto_advance_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_cond;
     auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output := auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l225_c26_1b71] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output := UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output;

     -- y_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_y_MUX_uxn_device_h_l195_c7_a1be_cond;
     y_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_y_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     y_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_y_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l195_c7_a1be_return_output := y_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- flip_y_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_cond;
     flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output := flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- result_u8_value_MUX[uxn_device_h_l240_c7_1927] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_cond;
     result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iftrue;
     result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output := result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output;

     -- flip_x_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_cond;
     flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output := flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- color_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_color_MUX_uxn_device_h_l195_c7_a1be_cond;
     color_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_color_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     color_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_color_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l195_c7_a1be_return_output := color_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- CONST_SR_8[uxn_device_h_l223_c23_ac31] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_device_h_l223_c23_ac31_x <= VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output := CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output;

     -- is_auto_y_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_cond;
     is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output := is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_cond;
     ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output := ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l233_c7_eb85] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output := result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output;

     -- MUX[uxn_device_h_l209_c25_7219] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l209_c25_7219_cond <= VAR_MUX_uxn_device_h_l209_c25_7219_cond;
     MUX_uxn_device_h_l209_c25_7219_iftrue <= VAR_MUX_uxn_device_h_l209_c25_7219_iftrue;
     MUX_uxn_device_h_l209_c25_7219_iffalse <= VAR_MUX_uxn_device_h_l209_c25_7219_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l209_c25_7219_return_output := MUX_uxn_device_h_l209_c25_7219_return_output;

     -- ctrl_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_cond;
     ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output := ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l233_c7_eb85] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_cond;
     result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output := result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output;

     -- MUX[uxn_device_h_l210_c25_837a] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l210_c25_837a_cond <= VAR_MUX_uxn_device_h_l210_c25_837a_cond;
     MUX_uxn_device_h_l210_c25_837a_iftrue <= VAR_MUX_uxn_device_h_l210_c25_837a_iftrue;
     MUX_uxn_device_h_l210_c25_837a_iffalse <= VAR_MUX_uxn_device_h_l210_c25_837a_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l210_c25_837a_return_output := MUX_uxn_device_h_l210_c25_837a_return_output;

     -- is_auto_x_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_cond;
     is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output := is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l237_c21_6617] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l237_c21_6617_return_output := CAST_TO_uint8_t_uint17_t(
     VAR_CONST_SR_8_uxn_device_h_l237_c32_db9f_return_output);

     -- result_is_deo_done_MUX[uxn_device_h_l233_c7_eb85] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_cond;
     result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output := result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output;

     -- layer_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_layer_MUX_uxn_device_h_l199_c7_6d18_cond;
     layer_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     layer_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_layer_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l199_c7_6d18_return_output := layer_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- x_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_x_MUX_uxn_device_h_l186_c7_fb9b_cond;
     x_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     x_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l186_c7_fb9b_return_output := x_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_cond;
     is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iftrue;
     is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output := is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- BIN_OP_OR[uxn_device_h_l212_c26_ceb5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left <= VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_left;
     BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right <= VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output := BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l237_c21_6617_return_output;
     VAR_result_u8_value_uxn_device_h_l223_c3_f73b := resize(VAR_CONST_SR_8_uxn_device_h_l223_c23_ac31_return_output, 8);
     VAR_MUX_uxn_device_h_l209_c12_f6b2_iftrue := VAR_MUX_uxn_device_h_l209_c25_7219_return_output;
     VAR_MUX_uxn_device_h_l210_c12_5d90_iftrue := VAR_MUX_uxn_device_h_l210_c25_837a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l225_c26_1b71_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_auto_advance_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_color_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_color_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_ctrl_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_flip_x_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_flip_y_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_is_in_bounds_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_layer_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l233_c7_eb85_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l233_c7_eb85_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l233_c7_eb85_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l240_c7_1927_return_output;
     VAR_x_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_x_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_y_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue := VAR_result_u8_value_uxn_device_h_l223_c3_f73b;
     -- auto_advance_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_cond;
     auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output := auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- is_auto_x_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_cond;
     is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output := is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- ctrl_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_cond;
     ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iftrue;
     ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_return_output := ctrl_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l227_c7_a7b0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_cond;
     result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output := result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output;

     -- MUX[uxn_device_h_l210_c12_5d90] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l210_c12_5d90_cond <= VAR_MUX_uxn_device_h_l210_c12_5d90_cond;
     MUX_uxn_device_h_l210_c12_5d90_iftrue <= VAR_MUX_uxn_device_h_l210_c12_5d90_iftrue;
     MUX_uxn_device_h_l210_c12_5d90_iffalse <= VAR_MUX_uxn_device_h_l210_c12_5d90_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l210_c12_5d90_return_output := MUX_uxn_device_h_l210_c12_5d90_return_output;

     -- MUX[uxn_device_h_l209_c12_f6b2] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l209_c12_f6b2_cond <= VAR_MUX_uxn_device_h_l209_c12_f6b2_cond;
     MUX_uxn_device_h_l209_c12_f6b2_iftrue <= VAR_MUX_uxn_device_h_l209_c12_f6b2_iftrue;
     MUX_uxn_device_h_l209_c12_f6b2_iffalse <= VAR_MUX_uxn_device_h_l209_c12_f6b2_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l209_c12_f6b2_return_output := MUX_uxn_device_h_l209_c12_f6b2_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l227_c7_a7b0] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output := result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output;

     -- flip_x_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_cond;
     flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output := flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_cond;
     ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output := ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- flip_y_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_cond;
     flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output := flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- color_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_color_MUX_uxn_device_h_l190_c7_655e_cond;
     color_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_color_MUX_uxn_device_h_l190_c7_655e_iftrue;
     color_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_color_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l190_c7_655e_return_output := color_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l227_c7_a7b0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_cond;
     result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output := result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_cond;
     is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output := is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- y_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_y_MUX_uxn_device_h_l190_c7_655e_cond;
     y_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_y_MUX_uxn_device_h_l190_c7_655e_iftrue;
     y_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_y_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l190_c7_655e_return_output := y_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- is_auto_y_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_cond;
     is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output := is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- x_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_x_MUX_uxn_device_h_l180_c7_751b_cond;
     x_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_x_MUX_uxn_device_h_l180_c7_751b_iftrue;
     x_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_x_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l180_c7_751b_return_output := x_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- layer_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_layer_MUX_uxn_device_h_l195_c7_a1be_cond;
     layer_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     layer_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_layer_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l195_c7_a1be_return_output := layer_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- result_u8_value_MUX[uxn_device_h_l233_c7_eb85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond <= VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_cond;
     result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iftrue;
     result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output := result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_right := VAR_MUX_uxn_device_h_l209_c12_f6b2_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_right := VAR_MUX_uxn_device_h_l210_c12_5d90_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_color_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_ctrl_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_flip_x_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_flip_y_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_is_in_bounds_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_layer_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_layer_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_a7b0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_a7b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_a7b0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l233_c7_eb85_return_output;
     VAR_x_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_x_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_y_MUX_uxn_device_h_l190_c7_655e_return_output;
     -- flip_x_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_cond;
     flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iftrue;
     flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_return_output := flip_x_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- is_auto_y_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_cond;
     is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iftrue;
     is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output := is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_cond;
     ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iftrue;
     ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output := ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- BIN_OP_OR[uxn_device_h_l209_c3_32f9] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l209_c3_32f9_left <= VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_left;
     BIN_OP_OR_uxn_device_h_l209_c3_32f9_right <= VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output := BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- auto_advance_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_cond;
     auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iftrue;
     auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output := auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- y_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_y_MUX_uxn_device_h_l186_c7_fb9b_cond;
     y_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     y_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l186_c7_fb9b_return_output := y_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- ctrl_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_cond;
     ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output := ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- color_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_color_MUX_uxn_device_h_l186_c7_fb9b_cond;
     color_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     color_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_color_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l186_c7_fb9b_return_output := color_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l227_c7_a7b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_cond;
     result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iftrue;
     result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output := result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output;

     -- x_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_x_MUX_uxn_device_h_l177_c7_0b05_cond;
     x_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_x_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     x_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_x_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l177_c7_0b05_return_output := x_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- is_in_bounds_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_cond;
     is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iftrue;
     is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output := is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- flip_y_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_cond;
     flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iftrue;
     flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_return_output := flip_y_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- layer_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_layer_MUX_uxn_device_h_l190_c7_655e_cond;
     layer_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_layer_MUX_uxn_device_h_l190_c7_655e_iftrue;
     layer_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_layer_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l190_c7_655e_return_output := layer_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- is_auto_x_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_cond;
     is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iftrue;
     is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output := is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_left := VAR_BIN_OP_OR_uxn_device_h_l209_c3_32f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_color_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_color_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_ctrl_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_flip_x_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_flip_y_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l190_c7_655e_return_output;
     REG_VAR_is_in_bounds := VAR_is_in_bounds_MUX_uxn_device_h_l171_c2_943c_return_output;
     VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_layer_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l227_c7_a7b0_return_output;
     VAR_x_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_x_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_y_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_y_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     -- layer_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_cond;
     layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_return_output := layer_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- color_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_color_MUX_uxn_device_h_l180_c7_751b_cond;
     color_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_color_MUX_uxn_device_h_l180_c7_751b_iftrue;
     color_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_color_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l180_c7_751b_return_output := color_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- ctrl_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_cond;
     ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iftrue;
     ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_return_output := ctrl_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_cond;
     ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output := ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- y_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_y_MUX_uxn_device_h_l180_c7_751b_cond;
     y_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_y_MUX_uxn_device_h_l180_c7_751b_iftrue;
     y_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_y_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l180_c7_751b_return_output := y_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- BIN_OP_OR[uxn_device_h_l210_c3_3d75] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l210_c3_3d75_left <= VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_left;
     BIN_OP_OR_uxn_device_h_l210_c3_3d75_right <= VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output := BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output;

     -- x_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_x_MUX_uxn_device_h_l171_c2_943c_cond;
     x_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_x_MUX_uxn_device_h_l171_c2_943c_iftrue;
     x_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_x_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l171_c2_943c_return_output := x_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- flip_y_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_cond;
     flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output := flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- is_auto_x_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_cond;
     is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output := is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- auto_advance_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_cond;
     auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output := auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- result_u8_value_MUX[uxn_device_h_l216_c7_7ff7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_cond;
     result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iftrue;
     result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output := result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output;

     -- flip_x_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_cond;
     flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output := flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- is_auto_y_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_cond;
     is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output := is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- Submodule level 6
     VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_color_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_color_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_ctrl_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_flip_x_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_flip_y_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_layer_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_layer_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l171_c2_943c_return_output;
     VAR_y_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_y_MUX_uxn_device_h_l180_c7_751b_return_output;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a[uxn_device_h_l199_c7_6d18] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l199_c7_6d18_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_f42a(
     result,
     VAR_result_u16_addr_uxn_device_h_l207_c3_1668,
     VAR_CAST_TO_uint1_t_uxn_device_h_l203_c11_f3d1_return_output,
     VAR_result_device_ram_address_uxn_device_h_l211_c3_fb4a,
     VAR_BIN_OP_OR_uxn_device_h_l212_c26_ceb5_return_output,
     VAR_CAST_TO_uint1_t_uxn_device_h_l202_c15_7498_return_output,
     VAR_BIN_OP_OR_uxn_device_h_l210_c3_3d75_return_output);

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59[uxn_device_h_l199_c7_6d18] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l199_c7_6d18_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_8b59(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l216_c7_7ff7_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l216_c7_7ff7_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l216_c7_7ff7_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l216_c7_7ff7_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l216_c7_7ff7_return_output);

     -- flip_y_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_cond;
     flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iftrue;
     flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_return_output := flip_y_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- flip_x_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_cond;
     flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iftrue;
     flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_return_output := flip_x_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- y_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_y_MUX_uxn_device_h_l177_c7_0b05_cond;
     y_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_y_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     y_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_y_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l177_c7_0b05_return_output := y_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- color_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_color_MUX_uxn_device_h_l177_c7_0b05_cond;
     color_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_color_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     color_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_color_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l177_c7_0b05_return_output := color_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- is_auto_y_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_cond;
     is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iftrue;
     is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output := is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- ctrl_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_cond;
     ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output := ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_cond;
     ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iftrue;
     ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output := ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- auto_advance_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_cond;
     auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iftrue;
     auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output := auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- tmp8_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_cond;
     tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output := tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- is_auto_x_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_cond;
     is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iftrue;
     is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output := is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- layer_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_layer_MUX_uxn_device_h_l180_c7_751b_cond;
     layer_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_layer_MUX_uxn_device_h_l180_c7_751b_iftrue;
     layer_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_layer_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l180_c7_751b_return_output := layer_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- Submodule level 7
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_auto_advance_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_color_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_color_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_ctrl_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_flip_x_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_flip_y_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_layer_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_result_MUX_uxn_device_h_l199_c7_6d18_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_8b59_uxn_device_h_l199_c7_6d18_return_output;
     VAR_result_MUX_uxn_device_h_l199_c7_6d18_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l199_c7_6d18_return_output;
     VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_tmp8_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_y_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_y_MUX_uxn_device_h_l177_c7_0b05_return_output;
     -- ctrl_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_cond;
     ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iftrue;
     ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_return_output := ctrl_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- result_MUX[uxn_device_h_l199_c7_6d18] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l199_c7_6d18_cond <= VAR_result_MUX_uxn_device_h_l199_c7_6d18_cond;
     result_MUX_uxn_device_h_l199_c7_6d18_iftrue <= VAR_result_MUX_uxn_device_h_l199_c7_6d18_iftrue;
     result_MUX_uxn_device_h_l199_c7_6d18_iffalse <= VAR_result_MUX_uxn_device_h_l199_c7_6d18_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l199_c7_6d18_return_output := result_MUX_uxn_device_h_l199_c7_6d18_return_output;

     -- flip_y_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_cond;
     flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output := flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_cond;
     ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output := ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- is_auto_x_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_cond;
     is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output := is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- flip_x_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_cond;
     flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output := flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- color_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_color_MUX_uxn_device_h_l171_c2_943c_cond;
     color_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_color_MUX_uxn_device_h_l171_c2_943c_iftrue;
     color_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_color_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l171_c2_943c_return_output := color_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- y_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_y_MUX_uxn_device_h_l171_c2_943c_cond;
     y_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_y_MUX_uxn_device_h_l171_c2_943c_iftrue;
     y_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_y_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l171_c2_943c_return_output := y_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- layer_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_layer_MUX_uxn_device_h_l177_c7_0b05_cond;
     layer_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     layer_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_layer_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l177_c7_0b05_return_output := layer_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- auto_advance_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_cond;
     auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output := auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- tmp8_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_cond;
     tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output := tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- is_auto_y_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_cond;
     is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output := is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- Submodule level 8
     VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l177_c7_0b05_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l171_c2_943c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_flip_x_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_flip_y_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_layer_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_layer_MUX_uxn_device_h_l177_c7_0b05_return_output;
     VAR_result_MUX_uxn_device_h_l195_c7_a1be_iffalse := VAR_result_MUX_uxn_device_h_l199_c7_6d18_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_tmp8_MUX_uxn_device_h_l195_c7_a1be_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l171_c2_943c_return_output;
     -- tmp8_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_cond;
     tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iftrue;
     tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_return_output := tmp8_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- auto_advance_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_cond;
     auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iftrue;
     auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output := auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- flip_x_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_cond;
     flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iftrue;
     flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_return_output := flip_x_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- result_MUX[uxn_device_h_l195_c7_a1be] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l195_c7_a1be_cond <= VAR_result_MUX_uxn_device_h_l195_c7_a1be_cond;
     result_MUX_uxn_device_h_l195_c7_a1be_iftrue <= VAR_result_MUX_uxn_device_h_l195_c7_a1be_iftrue;
     result_MUX_uxn_device_h_l195_c7_a1be_iffalse <= VAR_result_MUX_uxn_device_h_l195_c7_a1be_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l195_c7_a1be_return_output := result_MUX_uxn_device_h_l195_c7_a1be_return_output;

     -- is_auto_y_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_cond;
     is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iftrue;
     is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output := is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_cond;
     ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iftrue;
     ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output := ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- flip_y_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_cond;
     flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iftrue;
     flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_return_output := flip_y_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- layer_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_layer_MUX_uxn_device_h_l171_c2_943c_cond;
     layer_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_layer_MUX_uxn_device_h_l171_c2_943c_iftrue;
     layer_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_layer_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l171_c2_943c_return_output := layer_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- is_auto_x_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_cond;
     is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iftrue;
     is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output := is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- Submodule level 9
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l171_c2_943c_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l171_c2_943c_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_655e_iffalse := VAR_result_MUX_uxn_device_h_l195_c7_a1be_return_output;
     VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_tmp8_MUX_uxn_device_h_l190_c7_655e_return_output;
     -- result_MUX[uxn_device_h_l190_c7_655e] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l190_c7_655e_cond <= VAR_result_MUX_uxn_device_h_l190_c7_655e_cond;
     result_MUX_uxn_device_h_l190_c7_655e_iftrue <= VAR_result_MUX_uxn_device_h_l190_c7_655e_iftrue;
     result_MUX_uxn_device_h_l190_c7_655e_iffalse <= VAR_result_MUX_uxn_device_h_l190_c7_655e_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l190_c7_655e_return_output := result_MUX_uxn_device_h_l190_c7_655e_return_output;

     -- tmp8_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_cond;
     tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output := tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- Submodule level 10
     VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iffalse := VAR_result_MUX_uxn_device_h_l190_c7_655e_return_output;
     VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_tmp8_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     -- result_MUX[uxn_device_h_l186_c7_fb9b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l186_c7_fb9b_cond <= VAR_result_MUX_uxn_device_h_l186_c7_fb9b_cond;
     result_MUX_uxn_device_h_l186_c7_fb9b_iftrue <= VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iftrue;
     result_MUX_uxn_device_h_l186_c7_fb9b_iffalse <= VAR_result_MUX_uxn_device_h_l186_c7_fb9b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l186_c7_fb9b_return_output := result_MUX_uxn_device_h_l186_c7_fb9b_return_output;

     -- tmp8_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_cond;
     tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iftrue;
     tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_return_output := tmp8_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- Submodule level 11
     VAR_result_MUX_uxn_device_h_l180_c7_751b_iffalse := VAR_result_MUX_uxn_device_h_l186_c7_fb9b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_tmp8_MUX_uxn_device_h_l180_c7_751b_return_output;
     -- tmp8_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_cond;
     tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output := tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- result_MUX[uxn_device_h_l180_c7_751b] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l180_c7_751b_cond <= VAR_result_MUX_uxn_device_h_l180_c7_751b_cond;
     result_MUX_uxn_device_h_l180_c7_751b_iftrue <= VAR_result_MUX_uxn_device_h_l180_c7_751b_iftrue;
     result_MUX_uxn_device_h_l180_c7_751b_iffalse <= VAR_result_MUX_uxn_device_h_l180_c7_751b_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l180_c7_751b_return_output := result_MUX_uxn_device_h_l180_c7_751b_return_output;

     -- Submodule level 12
     VAR_result_MUX_uxn_device_h_l177_c7_0b05_iffalse := VAR_result_MUX_uxn_device_h_l180_c7_751b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_tmp8_MUX_uxn_device_h_l177_c7_0b05_return_output;
     -- tmp8_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_cond;
     tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iftrue;
     tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_return_output := tmp8_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- result_MUX[uxn_device_h_l177_c7_0b05] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l177_c7_0b05_cond <= VAR_result_MUX_uxn_device_h_l177_c7_0b05_cond;
     result_MUX_uxn_device_h_l177_c7_0b05_iftrue <= VAR_result_MUX_uxn_device_h_l177_c7_0b05_iftrue;
     result_MUX_uxn_device_h_l177_c7_0b05_iffalse <= VAR_result_MUX_uxn_device_h_l177_c7_0b05_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l177_c7_0b05_return_output := result_MUX_uxn_device_h_l177_c7_0b05_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l171_c2_943c_iffalse := VAR_result_MUX_uxn_device_h_l177_c7_0b05_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l171_c2_943c_return_output;
     -- result_MUX[uxn_device_h_l171_c2_943c] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l171_c2_943c_cond <= VAR_result_MUX_uxn_device_h_l171_c2_943c_cond;
     result_MUX_uxn_device_h_l171_c2_943c_iftrue <= VAR_result_MUX_uxn_device_h_l171_c2_943c_iftrue;
     result_MUX_uxn_device_h_l171_c2_943c_iffalse <= VAR_result_MUX_uxn_device_h_l171_c2_943c_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l171_c2_943c_return_output := result_MUX_uxn_device_h_l171_c2_943c_return_output;

     -- Submodule level 14
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l171_c2_943c_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l171_c2_943c_return_output;
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
REG_COMB_is_in_bounds <= REG_VAR_is_in_bounds;
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
     is_in_bounds <= REG_COMB_is_in_bounds;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
