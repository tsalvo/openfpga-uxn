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
-- BIN_OP_EQ[uxn_device_h_l175_c6_5839]
signal BIN_OP_EQ_uxn_device_h_l175_c6_5839_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c6_5839_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l175_c2_a72a]
signal color_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l175_c2_a72a]
signal y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l175_c2_a72a]
signal ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l175_c2_a72a]
signal auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l175_c2_a72a]
signal x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l175_c2_a72a]
signal flip_x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l175_c2_a72a]
signal layer_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l175_c2_a72a]
signal flip_y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l175_c2_a72a]
signal tmp8_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l175_c2_a72a]
signal is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l175_c2_a72a]
signal is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l175_c2_a72a]
signal ctrl_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l175_c2_a72a]
signal is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l175_c2_a72a]
signal result_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l175_c2_a72a_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l175_c2_a72a_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l175_c2_a72a_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l175_c2_a72a]
signal is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l175_c2_a72a]
signal tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l181_c11_7bf3]
signal BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l181_c7_d2ad]
signal color_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l181_c7_d2ad]
signal y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l181_c7_d2ad]
signal ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l181_c7_d2ad]
signal auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l181_c7_d2ad]
signal x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l181_c7_d2ad]
signal flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l181_c7_d2ad]
signal layer_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l181_c7_d2ad]
signal flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l181_c7_d2ad]
signal tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l181_c7_d2ad]
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l181_c7_d2ad]
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l181_c7_d2ad]
signal ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l181_c7_d2ad]
signal is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l181_c7_d2ad]
signal result_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l181_c7_d2ad_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_d2ad_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l181_c7_d2ad_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l181_c7_d2ad]
signal is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l181_c7_d2ad]
signal tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l184_c11_595c]
signal BIN_OP_EQ_uxn_device_h_l184_c11_595c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c11_595c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l184_c7_e6b6]
signal color_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l184_c7_e6b6]
signal y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l184_c7_e6b6]
signal ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l184_c7_e6b6]
signal auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l184_c7_e6b6]
signal x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l184_c7_e6b6]
signal flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l184_c7_e6b6]
signal layer_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l184_c7_e6b6]
signal flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l184_c7_e6b6]
signal tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l184_c7_e6b6]
signal is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l184_c7_e6b6]
signal is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l184_c7_e6b6]
signal ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l184_c7_e6b6]
signal is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l184_c7_e6b6]
signal result_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l184_c7_e6b6_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l184_c7_e6b6_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l184_c7_e6b6_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l184_c7_e6b6]
signal is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l184_c7_e6b6]
signal tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l188_c20_e733]
signal BIN_OP_EQ_uxn_device_h_l188_c20_e733_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l188_c20_e733_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l188_c20_e690]
signal MUX_uxn_device_h_l188_c20_e690_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c20_e690_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c20_e690_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l188_c20_e690_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l190_c11_2a24]
signal BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l190_c7_cb26]
signal color_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l190_c7_cb26]
signal y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l190_c7_cb26]
signal ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l190_c7_cb26]
signal auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l190_c7_cb26]
signal x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l190_c7_cb26]
signal flip_x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l190_c7_cb26]
signal layer_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l190_c7_cb26]
signal flip_y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l190_c7_cb26]
signal tmp8_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l190_c7_cb26]
signal is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l190_c7_cb26]
signal is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l190_c7_cb26]
signal ctrl_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l190_c7_cb26]
signal is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l190_c7_cb26]
signal result_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l190_c7_cb26_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_cb26_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l190_c7_cb26_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l190_c7_cb26]
signal is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l190_c7_cb26]
signal tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l192_c3_e826]
signal BIN_OP_OR_uxn_device_h_l192_c3_e826_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l192_c3_e826_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l194_c11_f70b]
signal BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l194_c7_692f]
signal color_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l194_c7_692f]
signal y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l194_c7_692f]
signal ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l194_c7_692f]
signal auto_advance_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l194_c7_692f]
signal flip_x_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l194_c7_692f]
signal layer_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l194_c7_692f]
signal flip_y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l194_c7_692f]
signal tmp8_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l194_c7_692f]
signal is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l194_c7_692f]
signal is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l194_c7_692f]
signal ctrl_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l194_c7_692f]
signal is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l194_c7_692f]
signal result_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l194_c7_692f_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l194_c7_692f_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l194_c7_692f_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l194_c7_692f]
signal is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l194_c7_692f]
signal tmp8b_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l198_c20_1c69]
signal BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l198_c20_48da]
signal MUX_uxn_device_h_l198_c20_48da_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l198_c20_48da_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l198_c20_48da_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l198_c20_48da_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l200_c11_3e37]
signal BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l200_c7_f986]
signal color_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l200_c7_f986]
signal y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
signal y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l200_c7_f986]
signal ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l200_c7_f986]
signal auto_advance_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l200_c7_f986]
signal flip_x_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l200_c7_f986]
signal layer_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l200_c7_f986]
signal flip_y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l200_c7_f986]
signal tmp8_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l200_c7_f986]
signal is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l200_c7_f986]
signal is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l200_c7_f986]
signal ctrl_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l200_c7_f986]
signal is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l200_c7_f986]
signal result_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l200_c7_f986_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l200_c7_f986_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l200_c7_f986_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l200_c7_f986]
signal is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l200_c7_f986]
signal tmp8b_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l201_c3_4847]
signal BIN_OP_OR_uxn_device_h_l201_c3_4847_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c3_4847_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l204_c11_d72a]
signal BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l204_c7_0b39]
signal color_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(1 downto 0);

-- ctrl_mode_MUX[uxn_device_h_l204_c7_0b39]
signal ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l204_c7_0b39]
signal auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);

-- flip_x_MUX[uxn_device_h_l204_c7_0b39]
signal flip_x_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l204_c7_0b39]
signal layer_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- flip_y_MUX[uxn_device_h_l204_c7_0b39]
signal flip_y_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_device_h_l204_c7_0b39]
signal tmp8_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l204_c7_0b39]
signal is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l204_c7_0b39]
signal is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- ctrl_MUX[uxn_device_h_l204_c7_0b39]
signal ctrl_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
signal ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);

-- is_auto_x_MUX[uxn_device_h_l204_c7_0b39]
signal is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- result_MUX[uxn_device_h_l204_c7_0b39]
signal result_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l204_c7_0b39_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_0b39_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l204_c7_0b39_return_output : device_out_result_t;

-- is_auto_y_MUX[uxn_device_h_l204_c7_0b39]
signal is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);

-- tmp8b_MUX[uxn_device_h_l204_c7_0b39]
signal tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
signal tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
signal tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l216_c26_f35a]
signal UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l216_c13_d4e3]
signal BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l216_c13_52ec]
signal UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l216_c13_0677]
signal MUX_uxn_device_h_l216_c13_0677_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l216_c13_0677_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l216_c13_0677_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l216_c13_0677_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l217_c33_3428]
signal BIN_OP_OR_uxn_device_h_l217_c33_3428_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c33_3428_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l217_c20_3b8f]
signal MUX_uxn_device_h_l217_c20_3b8f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l217_c20_3b8f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l217_c20_3b8f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l217_c20_3b8f_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_device_h_l218_c33_9257]
signal BIN_OP_OR_uxn_device_h_l218_c33_9257_left : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l218_c33_9257_right : unsigned(0 downto 0);
signal BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l218_c20_1cde]
signal MUX_uxn_device_h_l218_c20_1cde_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c20_1cde_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c20_1cde_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l218_c20_1cde_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l223_c26_f29e]
signal BIN_OP_AND_uxn_device_h_l223_c26_f29e_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l223_c26_f29e_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l227_c11_bcfd]
signal BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l227_c7_825d]
signal auto_advance_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);

-- is_x_in_bounds_MUX[uxn_device_h_l227_c7_825d]
signal is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- is_y_in_bounds_MUX[uxn_device_h_l227_c7_825d]
signal is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- is_auto_x_MUX[uxn_device_h_l227_c7_825d]
signal is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l227_c7_825d]
signal result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- result_u16_addr_MUX[uxn_device_h_l227_c7_825d]
signal result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(15 downto 0);
signal result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(15 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l227_c7_825d]
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l227_c7_825d]
signal result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l227_c7_825d]
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l227_c7_825d]
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- is_auto_y_MUX[uxn_device_h_l227_c7_825d]
signal is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
signal is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l234_c20_a7e6]
signal BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l234_c50_fcb7]
signal BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l234_c50_b120]
signal MUX_uxn_device_h_l234_c50_b120_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c50_b120_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c50_b120_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c50_b120_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l234_c20_84fc]
signal BIN_OP_AND_uxn_device_h_l234_c20_84fc_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l234_c20_84fc_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l234_c20_a3a0]
signal MUX_uxn_device_h_l234_c20_a3a0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c20_a3a0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c20_a3a0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l234_c20_a3a0_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l235_c20_2860]
signal BIN_OP_AND_uxn_device_h_l235_c20_2860_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l235_c20_2860_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l235_c50_ec35]
signal BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l235_c50_2a76]
signal MUX_uxn_device_h_l235_c50_2a76_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c50_2a76_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c50_2a76_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c50_2a76_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l235_c20_043b]
signal BIN_OP_AND_uxn_device_h_l235_c20_043b_left : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l235_c20_043b_right : unsigned(0 downto 0);
signal BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l235_c20_34c4]
signal MUX_uxn_device_h_l235_c20_34c4_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c20_34c4_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c20_34c4_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l235_c20_34c4_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l236_c35_31f9]
signal UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l236_c53_a92d]
signal UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l236_c22_e1ac]
signal MUX_uxn_device_h_l236_c22_e1ac_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l236_c22_e1ac_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l236_c22_e1ac_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l236_c22_e1ac_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l237_c31_07b7]
signal MUX_uxn_device_h_l237_c31_07b7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l237_c31_07b7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l237_c31_07b7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l237_c31_07b7_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l238_c26_cac0]
signal UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l240_c11_49d8]
signal BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l240_c7_e9a5]
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l240_c7_e9a5]
signal result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l240_c7_e9a5]
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l240_c7_e9a5]
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l242_c34_5520]
signal BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output : unsigned(8 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l242_c44_5276]
signal BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output : unsigned(8 downto 0);

-- MUX[uxn_device_h_l242_c21_ddf7]
signal MUX_uxn_device_h_l242_c21_ddf7_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l242_c21_ddf7_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l242_c21_ddf7_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l242_c21_ddf7_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l243_c31_2ee9]
signal MUX_uxn_device_h_l243_c31_2ee9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l243_c31_2ee9_iftrue : unsigned(7 downto 0);
signal MUX_uxn_device_h_l243_c31_2ee9_iffalse : unsigned(7 downto 0);
signal MUX_uxn_device_h_l243_c31_2ee9_return_output : unsigned(7 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l244_c26_5e08]
signal UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l246_c11_a5da]
signal BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l246_c7_f91c]
signal result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l246_c7_f91c]
signal result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l246_c7_f91c]
signal result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l246_c7_f91c]
signal result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(0 downto 0);

-- UNARY_OP_NOT[uxn_device_h_l250_c22_23ad]
signal UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr : unsigned(0 downto 0);
signal UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l253_c11_682d]
signal BIN_OP_EQ_uxn_device_h_l253_c11_682d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l253_c11_682d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l253_c7_a67d]
signal result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l253_c7_a67d]
signal result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l253_c7_a67d]
signal result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l253_c7_a67d]
signal result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l257_c21_183f]
signal BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output : unsigned(8 downto 0);

-- CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b
signal CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x : unsigned(7 downto 0);
signal CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output : unsigned(7 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right : unsigned(0 downto 0);
signal BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output : unsigned(0 downto 0);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right : unsigned(0 downto 0);
signal BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc( ref_toks_0 : device_out_result_t;
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
      base.u16_addr := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_deo_done := ref_toks_6;

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
-- BIN_OP_EQ_uxn_device_h_l175_c6_5839
BIN_OP_EQ_uxn_device_h_l175_c6_5839 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l175_c6_5839_left,
BIN_OP_EQ_uxn_device_h_l175_c6_5839_right,
BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output);

-- color_MUX_uxn_device_h_l175_c2_a72a
color_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l175_c2_a72a_cond,
color_MUX_uxn_device_h_l175_c2_a72a_iftrue,
color_MUX_uxn_device_h_l175_c2_a72a_iffalse,
color_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- y_MUX_uxn_device_h_l175_c2_a72a
y_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l175_c2_a72a_cond,
y_MUX_uxn_device_h_l175_c2_a72a_iftrue,
y_MUX_uxn_device_h_l175_c2_a72a_iffalse,
y_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- ctrl_mode_MUX_uxn_device_h_l175_c2_a72a
ctrl_mode_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond,
ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue,
ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse,
ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- auto_advance_MUX_uxn_device_h_l175_c2_a72a
auto_advance_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond,
auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue,
auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse,
auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- x_MUX_uxn_device_h_l175_c2_a72a
x_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l175_c2_a72a_cond,
x_MUX_uxn_device_h_l175_c2_a72a_iftrue,
x_MUX_uxn_device_h_l175_c2_a72a_iffalse,
x_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- flip_x_MUX_uxn_device_h_l175_c2_a72a
flip_x_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l175_c2_a72a_cond,
flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue,
flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse,
flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- layer_MUX_uxn_device_h_l175_c2_a72a
layer_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l175_c2_a72a_cond,
layer_MUX_uxn_device_h_l175_c2_a72a_iftrue,
layer_MUX_uxn_device_h_l175_c2_a72a_iffalse,
layer_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- flip_y_MUX_uxn_device_h_l175_c2_a72a
flip_y_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l175_c2_a72a_cond,
flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue,
flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse,
flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- tmp8_MUX_uxn_device_h_l175_c2_a72a
tmp8_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l175_c2_a72a_cond,
tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue,
tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse,
tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a
is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond,
is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a
is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond,
is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- ctrl_MUX_uxn_device_h_l175_c2_a72a
ctrl_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l175_c2_a72a_cond,
ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue,
ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse,
ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- is_auto_x_MUX_uxn_device_h_l175_c2_a72a
is_auto_x_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond,
is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue,
is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse,
is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- result_MUX_uxn_device_h_l175_c2_a72a
result_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l175_c2_a72a_cond,
result_MUX_uxn_device_h_l175_c2_a72a_iftrue,
result_MUX_uxn_device_h_l175_c2_a72a_iffalse,
result_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- is_auto_y_MUX_uxn_device_h_l175_c2_a72a
is_auto_y_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond,
is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue,
is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse,
is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- tmp8b_MUX_uxn_device_h_l175_c2_a72a
tmp8b_MUX_uxn_device_h_l175_c2_a72a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond,
tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue,
tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse,
tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output);

-- BIN_OP_EQ_uxn_device_h_l181_c11_7bf3
BIN_OP_EQ_uxn_device_h_l181_c11_7bf3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left,
BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right,
BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output);

-- color_MUX_uxn_device_h_l181_c7_d2ad
color_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l181_c7_d2ad_cond,
color_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
color_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
color_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- y_MUX_uxn_device_h_l181_c7_d2ad
y_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l181_c7_d2ad_cond,
y_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
y_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
y_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad
ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond,
ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- auto_advance_MUX_uxn_device_h_l181_c7_d2ad
auto_advance_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond,
auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- x_MUX_uxn_device_h_l181_c7_d2ad
x_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l181_c7_d2ad_cond,
x_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
x_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
x_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- flip_x_MUX_uxn_device_h_l181_c7_d2ad
flip_x_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond,
flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- layer_MUX_uxn_device_h_l181_c7_d2ad
layer_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l181_c7_d2ad_cond,
layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
layer_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- flip_y_MUX_uxn_device_h_l181_c7_d2ad
flip_y_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond,
flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- tmp8_MUX_uxn_device_h_l181_c7_d2ad
tmp8_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond,
tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad
is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad
is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- ctrl_MUX_uxn_device_h_l181_c7_d2ad
ctrl_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond,
ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- is_auto_x_MUX_uxn_device_h_l181_c7_d2ad
is_auto_x_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond,
is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- result_MUX_uxn_device_h_l181_c7_d2ad
result_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l181_c7_d2ad_cond,
result_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
result_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
result_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- is_auto_y_MUX_uxn_device_h_l181_c7_d2ad
is_auto_y_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond,
is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- tmp8b_MUX_uxn_device_h_l181_c7_d2ad
tmp8b_MUX_uxn_device_h_l181_c7_d2ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond,
tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue,
tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse,
tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output);

-- BIN_OP_EQ_uxn_device_h_l184_c11_595c
BIN_OP_EQ_uxn_device_h_l184_c11_595c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l184_c11_595c_left,
BIN_OP_EQ_uxn_device_h_l184_c11_595c_right,
BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output);

-- color_MUX_uxn_device_h_l184_c7_e6b6
color_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l184_c7_e6b6_cond,
color_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
color_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
color_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- y_MUX_uxn_device_h_l184_c7_e6b6
y_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l184_c7_e6b6_cond,
y_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
y_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
y_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6
ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond,
ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- auto_advance_MUX_uxn_device_h_l184_c7_e6b6
auto_advance_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond,
auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- x_MUX_uxn_device_h_l184_c7_e6b6
x_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l184_c7_e6b6_cond,
x_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
x_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
x_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- flip_x_MUX_uxn_device_h_l184_c7_e6b6
flip_x_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond,
flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- layer_MUX_uxn_device_h_l184_c7_e6b6
layer_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l184_c7_e6b6_cond,
layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
layer_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- flip_y_MUX_uxn_device_h_l184_c7_e6b6
flip_y_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond,
flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- tmp8_MUX_uxn_device_h_l184_c7_e6b6
tmp8_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond,
tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6
is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond,
is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6
is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond,
is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- ctrl_MUX_uxn_device_h_l184_c7_e6b6
ctrl_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond,
ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- is_auto_x_MUX_uxn_device_h_l184_c7_e6b6
is_auto_x_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond,
is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- result_MUX_uxn_device_h_l184_c7_e6b6
result_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l184_c7_e6b6_cond,
result_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
result_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
result_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- is_auto_y_MUX_uxn_device_h_l184_c7_e6b6
is_auto_y_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond,
is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- tmp8b_MUX_uxn_device_h_l184_c7_e6b6
tmp8b_MUX_uxn_device_h_l184_c7_e6b6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond,
tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue,
tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse,
tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output);

-- BIN_OP_EQ_uxn_device_h_l188_c20_e733
BIN_OP_EQ_uxn_device_h_l188_c20_e733 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l188_c20_e733_left,
BIN_OP_EQ_uxn_device_h_l188_c20_e733_right,
BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output);

-- MUX_uxn_device_h_l188_c20_e690
MUX_uxn_device_h_l188_c20_e690 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l188_c20_e690_cond,
MUX_uxn_device_h_l188_c20_e690_iftrue,
MUX_uxn_device_h_l188_c20_e690_iffalse,
MUX_uxn_device_h_l188_c20_e690_return_output);

-- BIN_OP_EQ_uxn_device_h_l190_c11_2a24
BIN_OP_EQ_uxn_device_h_l190_c11_2a24 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left,
BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right,
BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output);

-- color_MUX_uxn_device_h_l190_c7_cb26
color_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l190_c7_cb26_cond,
color_MUX_uxn_device_h_l190_c7_cb26_iftrue,
color_MUX_uxn_device_h_l190_c7_cb26_iffalse,
color_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- y_MUX_uxn_device_h_l190_c7_cb26
y_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l190_c7_cb26_cond,
y_MUX_uxn_device_h_l190_c7_cb26_iftrue,
y_MUX_uxn_device_h_l190_c7_cb26_iffalse,
y_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- ctrl_mode_MUX_uxn_device_h_l190_c7_cb26
ctrl_mode_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond,
ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue,
ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse,
ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- auto_advance_MUX_uxn_device_h_l190_c7_cb26
auto_advance_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond,
auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue,
auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse,
auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- x_MUX_uxn_device_h_l190_c7_cb26
x_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l190_c7_cb26_cond,
x_MUX_uxn_device_h_l190_c7_cb26_iftrue,
x_MUX_uxn_device_h_l190_c7_cb26_iffalse,
x_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- flip_x_MUX_uxn_device_h_l190_c7_cb26
flip_x_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l190_c7_cb26_cond,
flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue,
flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse,
flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- layer_MUX_uxn_device_h_l190_c7_cb26
layer_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l190_c7_cb26_cond,
layer_MUX_uxn_device_h_l190_c7_cb26_iftrue,
layer_MUX_uxn_device_h_l190_c7_cb26_iffalse,
layer_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- flip_y_MUX_uxn_device_h_l190_c7_cb26
flip_y_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l190_c7_cb26_cond,
flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue,
flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse,
flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- tmp8_MUX_uxn_device_h_l190_c7_cb26
tmp8_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l190_c7_cb26_cond,
tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue,
tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse,
tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26
is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond,
is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26
is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond,
is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- ctrl_MUX_uxn_device_h_l190_c7_cb26
ctrl_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l190_c7_cb26_cond,
ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue,
ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse,
ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- is_auto_x_MUX_uxn_device_h_l190_c7_cb26
is_auto_x_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond,
is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue,
is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse,
is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- result_MUX_uxn_device_h_l190_c7_cb26
result_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l190_c7_cb26_cond,
result_MUX_uxn_device_h_l190_c7_cb26_iftrue,
result_MUX_uxn_device_h_l190_c7_cb26_iffalse,
result_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- is_auto_y_MUX_uxn_device_h_l190_c7_cb26
is_auto_y_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond,
is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue,
is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse,
is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- tmp8b_MUX_uxn_device_h_l190_c7_cb26
tmp8b_MUX_uxn_device_h_l190_c7_cb26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond,
tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue,
tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse,
tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output);

-- BIN_OP_OR_uxn_device_h_l192_c3_e826
BIN_OP_OR_uxn_device_h_l192_c3_e826 : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l192_c3_e826_left,
BIN_OP_OR_uxn_device_h_l192_c3_e826_right,
BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output);

-- BIN_OP_EQ_uxn_device_h_l194_c11_f70b
BIN_OP_EQ_uxn_device_h_l194_c11_f70b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left,
BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right,
BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output);

-- color_MUX_uxn_device_h_l194_c7_692f
color_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l194_c7_692f_cond,
color_MUX_uxn_device_h_l194_c7_692f_iftrue,
color_MUX_uxn_device_h_l194_c7_692f_iffalse,
color_MUX_uxn_device_h_l194_c7_692f_return_output);

-- y_MUX_uxn_device_h_l194_c7_692f
y_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l194_c7_692f_cond,
y_MUX_uxn_device_h_l194_c7_692f_iftrue,
y_MUX_uxn_device_h_l194_c7_692f_iffalse,
y_MUX_uxn_device_h_l194_c7_692f_return_output);

-- ctrl_mode_MUX_uxn_device_h_l194_c7_692f
ctrl_mode_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond,
ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue,
ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse,
ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output);

-- auto_advance_MUX_uxn_device_h_l194_c7_692f
auto_advance_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l194_c7_692f_cond,
auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue,
auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse,
auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output);

-- flip_x_MUX_uxn_device_h_l194_c7_692f
flip_x_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l194_c7_692f_cond,
flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue,
flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse,
flip_x_MUX_uxn_device_h_l194_c7_692f_return_output);

-- layer_MUX_uxn_device_h_l194_c7_692f
layer_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l194_c7_692f_cond,
layer_MUX_uxn_device_h_l194_c7_692f_iftrue,
layer_MUX_uxn_device_h_l194_c7_692f_iffalse,
layer_MUX_uxn_device_h_l194_c7_692f_return_output);

-- flip_y_MUX_uxn_device_h_l194_c7_692f
flip_y_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l194_c7_692f_cond,
flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue,
flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse,
flip_y_MUX_uxn_device_h_l194_c7_692f_return_output);

-- tmp8_MUX_uxn_device_h_l194_c7_692f
tmp8_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l194_c7_692f_cond,
tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue,
tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse,
tmp8_MUX_uxn_device_h_l194_c7_692f_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f
is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond,
is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f
is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond,
is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output);

-- ctrl_MUX_uxn_device_h_l194_c7_692f
ctrl_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l194_c7_692f_cond,
ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue,
ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse,
ctrl_MUX_uxn_device_h_l194_c7_692f_return_output);

-- is_auto_x_MUX_uxn_device_h_l194_c7_692f
is_auto_x_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond,
is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue,
is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse,
is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output);

-- result_MUX_uxn_device_h_l194_c7_692f
result_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l194_c7_692f_cond,
result_MUX_uxn_device_h_l194_c7_692f_iftrue,
result_MUX_uxn_device_h_l194_c7_692f_iffalse,
result_MUX_uxn_device_h_l194_c7_692f_return_output);

-- is_auto_y_MUX_uxn_device_h_l194_c7_692f
is_auto_y_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond,
is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue,
is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse,
is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output);

-- tmp8b_MUX_uxn_device_h_l194_c7_692f
tmp8b_MUX_uxn_device_h_l194_c7_692f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l194_c7_692f_cond,
tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue,
tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse,
tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output);

-- BIN_OP_EQ_uxn_device_h_l198_c20_1c69
BIN_OP_EQ_uxn_device_h_l198_c20_1c69 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left,
BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right,
BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output);

-- MUX_uxn_device_h_l198_c20_48da
MUX_uxn_device_h_l198_c20_48da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l198_c20_48da_cond,
MUX_uxn_device_h_l198_c20_48da_iftrue,
MUX_uxn_device_h_l198_c20_48da_iffalse,
MUX_uxn_device_h_l198_c20_48da_return_output);

-- BIN_OP_EQ_uxn_device_h_l200_c11_3e37
BIN_OP_EQ_uxn_device_h_l200_c11_3e37 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left,
BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right,
BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output);

-- color_MUX_uxn_device_h_l200_c7_f986
color_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l200_c7_f986_cond,
color_MUX_uxn_device_h_l200_c7_f986_iftrue,
color_MUX_uxn_device_h_l200_c7_f986_iffalse,
color_MUX_uxn_device_h_l200_c7_f986_return_output);

-- y_MUX_uxn_device_h_l200_c7_f986
y_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l200_c7_f986_cond,
y_MUX_uxn_device_h_l200_c7_f986_iftrue,
y_MUX_uxn_device_h_l200_c7_f986_iffalse,
y_MUX_uxn_device_h_l200_c7_f986_return_output);

-- ctrl_mode_MUX_uxn_device_h_l200_c7_f986
ctrl_mode_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond,
ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue,
ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse,
ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output);

-- auto_advance_MUX_uxn_device_h_l200_c7_f986
auto_advance_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l200_c7_f986_cond,
auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue,
auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse,
auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output);

-- flip_x_MUX_uxn_device_h_l200_c7_f986
flip_x_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l200_c7_f986_cond,
flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue,
flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse,
flip_x_MUX_uxn_device_h_l200_c7_f986_return_output);

-- layer_MUX_uxn_device_h_l200_c7_f986
layer_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l200_c7_f986_cond,
layer_MUX_uxn_device_h_l200_c7_f986_iftrue,
layer_MUX_uxn_device_h_l200_c7_f986_iffalse,
layer_MUX_uxn_device_h_l200_c7_f986_return_output);

-- flip_y_MUX_uxn_device_h_l200_c7_f986
flip_y_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l200_c7_f986_cond,
flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue,
flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse,
flip_y_MUX_uxn_device_h_l200_c7_f986_return_output);

-- tmp8_MUX_uxn_device_h_l200_c7_f986
tmp8_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l200_c7_f986_cond,
tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue,
tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse,
tmp8_MUX_uxn_device_h_l200_c7_f986_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986
is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond,
is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986
is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond,
is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output);

-- ctrl_MUX_uxn_device_h_l200_c7_f986
ctrl_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l200_c7_f986_cond,
ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue,
ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse,
ctrl_MUX_uxn_device_h_l200_c7_f986_return_output);

-- is_auto_x_MUX_uxn_device_h_l200_c7_f986
is_auto_x_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond,
is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue,
is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse,
is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output);

-- result_MUX_uxn_device_h_l200_c7_f986
result_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l200_c7_f986_cond,
result_MUX_uxn_device_h_l200_c7_f986_iftrue,
result_MUX_uxn_device_h_l200_c7_f986_iffalse,
result_MUX_uxn_device_h_l200_c7_f986_return_output);

-- is_auto_y_MUX_uxn_device_h_l200_c7_f986
is_auto_y_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond,
is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue,
is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse,
is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output);

-- tmp8b_MUX_uxn_device_h_l200_c7_f986
tmp8b_MUX_uxn_device_h_l200_c7_f986 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l200_c7_f986_cond,
tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue,
tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse,
tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output);

-- BIN_OP_OR_uxn_device_h_l201_c3_4847
BIN_OP_OR_uxn_device_h_l201_c3_4847 : entity work.BIN_OP_OR_uint8_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l201_c3_4847_left,
BIN_OP_OR_uxn_device_h_l201_c3_4847_right,
BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output);

-- BIN_OP_EQ_uxn_device_h_l204_c11_d72a
BIN_OP_EQ_uxn_device_h_l204_c11_d72a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left,
BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right,
BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output);

-- color_MUX_uxn_device_h_l204_c7_0b39
color_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l204_c7_0b39_cond,
color_MUX_uxn_device_h_l204_c7_0b39_iftrue,
color_MUX_uxn_device_h_l204_c7_0b39_iffalse,
color_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- ctrl_mode_MUX_uxn_device_h_l204_c7_0b39
ctrl_mode_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond,
ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue,
ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse,
ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- auto_advance_MUX_uxn_device_h_l204_c7_0b39
auto_advance_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond,
auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue,
auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse,
auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- flip_x_MUX_uxn_device_h_l204_c7_0b39
flip_x_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_x_MUX_uxn_device_h_l204_c7_0b39_cond,
flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue,
flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse,
flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- layer_MUX_uxn_device_h_l204_c7_0b39
layer_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l204_c7_0b39_cond,
layer_MUX_uxn_device_h_l204_c7_0b39_iftrue,
layer_MUX_uxn_device_h_l204_c7_0b39_iffalse,
layer_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- flip_y_MUX_uxn_device_h_l204_c7_0b39
flip_y_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
flip_y_MUX_uxn_device_h_l204_c7_0b39_cond,
flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue,
flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse,
flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- tmp8_MUX_uxn_device_h_l204_c7_0b39
tmp8_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_device_h_l204_c7_0b39_cond,
tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue,
tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse,
tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39
is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond,
is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39
is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond,
is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- ctrl_MUX_uxn_device_h_l204_c7_0b39
ctrl_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
ctrl_MUX_uxn_device_h_l204_c7_0b39_cond,
ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue,
ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse,
ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- is_auto_x_MUX_uxn_device_h_l204_c7_0b39
is_auto_x_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond,
is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue,
is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse,
is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- result_MUX_uxn_device_h_l204_c7_0b39
result_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l204_c7_0b39_cond,
result_MUX_uxn_device_h_l204_c7_0b39_iftrue,
result_MUX_uxn_device_h_l204_c7_0b39_iffalse,
result_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- is_auto_y_MUX_uxn_device_h_l204_c7_0b39
is_auto_y_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond,
is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue,
is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse,
is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- tmp8b_MUX_uxn_device_h_l204_c7_0b39
tmp8b_MUX_uxn_device_h_l204_c7_0b39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond,
tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue,
tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse,
tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output);

-- UNARY_OP_NOT_uxn_device_h_l216_c26_f35a
UNARY_OP_NOT_uxn_device_h_l216_c26_f35a : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr,
UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output);

-- BIN_OP_AND_uxn_device_h_l216_c13_d4e3
BIN_OP_AND_uxn_device_h_l216_c13_d4e3 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left,
BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right,
BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output);

-- UNARY_OP_NOT_uxn_device_h_l216_c13_52ec
UNARY_OP_NOT_uxn_device_h_l216_c13_52ec : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr,
UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output);

-- MUX_uxn_device_h_l216_c13_0677
MUX_uxn_device_h_l216_c13_0677 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l216_c13_0677_cond,
MUX_uxn_device_h_l216_c13_0677_iftrue,
MUX_uxn_device_h_l216_c13_0677_iffalse,
MUX_uxn_device_h_l216_c13_0677_return_output);

-- BIN_OP_OR_uxn_device_h_l217_c33_3428
BIN_OP_OR_uxn_device_h_l217_c33_3428 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l217_c33_3428_left,
BIN_OP_OR_uxn_device_h_l217_c33_3428_right,
BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output);

-- MUX_uxn_device_h_l217_c20_3b8f
MUX_uxn_device_h_l217_c20_3b8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l217_c20_3b8f_cond,
MUX_uxn_device_h_l217_c20_3b8f_iftrue,
MUX_uxn_device_h_l217_c20_3b8f_iffalse,
MUX_uxn_device_h_l217_c20_3b8f_return_output);

-- BIN_OP_OR_uxn_device_h_l218_c33_9257
BIN_OP_OR_uxn_device_h_l218_c33_9257 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l218_c33_9257_left,
BIN_OP_OR_uxn_device_h_l218_c33_9257_right,
BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output);

-- MUX_uxn_device_h_l218_c20_1cde
MUX_uxn_device_h_l218_c20_1cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l218_c20_1cde_cond,
MUX_uxn_device_h_l218_c20_1cde_iftrue,
MUX_uxn_device_h_l218_c20_1cde_iffalse,
MUX_uxn_device_h_l218_c20_1cde_return_output);

-- BIN_OP_AND_uxn_device_h_l223_c26_f29e
BIN_OP_AND_uxn_device_h_l223_c26_f29e : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l223_c26_f29e_left,
BIN_OP_AND_uxn_device_h_l223_c26_f29e_right,
BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output);

-- BIN_OP_EQ_uxn_device_h_l227_c11_bcfd
BIN_OP_EQ_uxn_device_h_l227_c11_bcfd : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left,
BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right,
BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output);

-- auto_advance_MUX_uxn_device_h_l227_c7_825d
auto_advance_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l227_c7_825d_cond,
auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue,
auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse,
auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output);

-- is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d
is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond,
is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue,
is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse,
is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output);

-- is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d
is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond,
is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue,
is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse,
is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output);

-- is_auto_x_MUX_uxn_device_h_l227_c7_825d
is_auto_x_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond,
is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue,
is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse,
is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l227_c7_825d
result_is_vram_write_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond,
result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_u16_addr_MUX_uxn_device_h_l227_c7_825d
result_u16_addr_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond,
result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_u8_value_MUX_uxn_device_h_l227_c7_825d
result_u8_value_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond,
result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l227_c7_825d
result_device_ram_address_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond,
result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l227_c7_825d
result_is_deo_done_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond,
result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output);

-- is_auto_y_MUX_uxn_device_h_l227_c7_825d
is_auto_y_MUX_uxn_device_h_l227_c7_825d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond,
is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue,
is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse,
is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output);

-- BIN_OP_AND_uxn_device_h_l234_c20_a7e6
BIN_OP_AND_uxn_device_h_l234_c20_a7e6 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left,
BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right,
BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output);

-- BIN_OP_EQ_uxn_device_h_l234_c50_fcb7
BIN_OP_EQ_uxn_device_h_l234_c50_fcb7 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left,
BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right,
BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output);

-- MUX_uxn_device_h_l234_c50_b120
MUX_uxn_device_h_l234_c50_b120 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l234_c50_b120_cond,
MUX_uxn_device_h_l234_c50_b120_iftrue,
MUX_uxn_device_h_l234_c50_b120_iffalse,
MUX_uxn_device_h_l234_c50_b120_return_output);

-- BIN_OP_AND_uxn_device_h_l234_c20_84fc
BIN_OP_AND_uxn_device_h_l234_c20_84fc : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l234_c20_84fc_left,
BIN_OP_AND_uxn_device_h_l234_c20_84fc_right,
BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output);

-- MUX_uxn_device_h_l234_c20_a3a0
MUX_uxn_device_h_l234_c20_a3a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l234_c20_a3a0_cond,
MUX_uxn_device_h_l234_c20_a3a0_iftrue,
MUX_uxn_device_h_l234_c20_a3a0_iffalse,
MUX_uxn_device_h_l234_c20_a3a0_return_output);

-- BIN_OP_AND_uxn_device_h_l235_c20_2860
BIN_OP_AND_uxn_device_h_l235_c20_2860 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l235_c20_2860_left,
BIN_OP_AND_uxn_device_h_l235_c20_2860_right,
BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output);

-- BIN_OP_EQ_uxn_device_h_l235_c50_ec35
BIN_OP_EQ_uxn_device_h_l235_c50_ec35 : entity work.BIN_OP_EQ_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left,
BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right,
BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output);

-- MUX_uxn_device_h_l235_c50_2a76
MUX_uxn_device_h_l235_c50_2a76 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l235_c50_2a76_cond,
MUX_uxn_device_h_l235_c50_2a76_iftrue,
MUX_uxn_device_h_l235_c50_2a76_iffalse,
MUX_uxn_device_h_l235_c50_2a76_return_output);

-- BIN_OP_AND_uxn_device_h_l235_c20_043b
BIN_OP_AND_uxn_device_h_l235_c20_043b : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l235_c20_043b_left,
BIN_OP_AND_uxn_device_h_l235_c20_043b_right,
BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output);

-- MUX_uxn_device_h_l235_c20_34c4
MUX_uxn_device_h_l235_c20_34c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l235_c20_34c4_cond,
MUX_uxn_device_h_l235_c20_34c4_iftrue,
MUX_uxn_device_h_l235_c20_34c4_iffalse,
MUX_uxn_device_h_l235_c20_34c4_return_output);

-- UNARY_OP_NOT_uxn_device_h_l236_c35_31f9
UNARY_OP_NOT_uxn_device_h_l236_c35_31f9 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr,
UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output);

-- UNARY_OP_NOT_uxn_device_h_l236_c53_a92d
UNARY_OP_NOT_uxn_device_h_l236_c53_a92d : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr,
UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output);

-- MUX_uxn_device_h_l236_c22_e1ac
MUX_uxn_device_h_l236_c22_e1ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l236_c22_e1ac_cond,
MUX_uxn_device_h_l236_c22_e1ac_iftrue,
MUX_uxn_device_h_l236_c22_e1ac_iffalse,
MUX_uxn_device_h_l236_c22_e1ac_return_output);

-- MUX_uxn_device_h_l237_c31_07b7
MUX_uxn_device_h_l237_c31_07b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l237_c31_07b7_cond,
MUX_uxn_device_h_l237_c31_07b7_iftrue,
MUX_uxn_device_h_l237_c31_07b7_iffalse,
MUX_uxn_device_h_l237_c31_07b7_return_output);

-- UNARY_OP_NOT_uxn_device_h_l238_c26_cac0
UNARY_OP_NOT_uxn_device_h_l238_c26_cac0 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr,
UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output);

-- BIN_OP_EQ_uxn_device_h_l240_c11_49d8
BIN_OP_EQ_uxn_device_h_l240_c11_49d8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left,
BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right,
BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output);

-- result_u8_value_MUX_uxn_device_h_l240_c7_e9a5
result_u8_value_MUX_uxn_device_h_l240_c7_e9a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond,
result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue,
result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse,
result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5
result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond,
result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5
result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond,
result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l242_c34_5520
BIN_OP_PLUS_uxn_device_h_l242_c34_5520 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left,
BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right,
BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output);

-- BIN_OP_PLUS_uxn_device_h_l242_c44_5276
BIN_OP_PLUS_uxn_device_h_l242_c44_5276 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left,
BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right,
BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output);

-- MUX_uxn_device_h_l242_c21_ddf7
MUX_uxn_device_h_l242_c21_ddf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l242_c21_ddf7_cond,
MUX_uxn_device_h_l242_c21_ddf7_iftrue,
MUX_uxn_device_h_l242_c21_ddf7_iffalse,
MUX_uxn_device_h_l242_c21_ddf7_return_output);

-- MUX_uxn_device_h_l243_c31_2ee9
MUX_uxn_device_h_l243_c31_2ee9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l243_c31_2ee9_cond,
MUX_uxn_device_h_l243_c31_2ee9_iftrue,
MUX_uxn_device_h_l243_c31_2ee9_iffalse,
MUX_uxn_device_h_l243_c31_2ee9_return_output);

-- UNARY_OP_NOT_uxn_device_h_l244_c26_5e08
UNARY_OP_NOT_uxn_device_h_l244_c26_5e08 : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr,
UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output);

-- BIN_OP_EQ_uxn_device_h_l246_c11_a5da
BIN_OP_EQ_uxn_device_h_l246_c11_a5da : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left,
BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right,
BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c
result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond,
result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output);

-- result_u8_value_MUX_uxn_device_h_l246_c7_f91c
result_u8_value_MUX_uxn_device_h_l246_c7_f91c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond,
result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue,
result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse,
result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c
result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond,
result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c
result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond,
result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output);

-- UNARY_OP_NOT_uxn_device_h_l250_c22_23ad
UNARY_OP_NOT_uxn_device_h_l250_c22_23ad : entity work.UNARY_OP_NOT_uint1_t_0CLK_de264c78 port map (
UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr,
UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output);

-- BIN_OP_EQ_uxn_device_h_l253_c11_682d
BIN_OP_EQ_uxn_device_h_l253_c11_682d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l253_c11_682d_left,
BIN_OP_EQ_uxn_device_h_l253_c11_682d_right,
BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d
result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output);

-- result_u8_value_MUX_uxn_device_h_l253_c7_a67d
result_u8_value_MUX_uxn_device_h_l253_c7_a67d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond,
result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue,
result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse,
result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d
result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond,
result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d
result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond,
result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l257_c21_183f
BIN_OP_PLUS_uxn_device_h_l257_c21_183f : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left,
BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right,
BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output);

-- CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b
CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b : entity work.CONST_SL_8_uint8_t_0CLK_de264c78 port map (
CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x,
CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output);

-- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98 : entity work.BIN_OP_OR_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right,
BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output);

-- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38 : entity work.BIN_OP_AND_uint1_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right,
BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output);



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
 BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output,
 color_MUX_uxn_device_h_l175_c2_a72a_return_output,
 y_MUX_uxn_device_h_l175_c2_a72a_return_output,
 ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output,
 auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output,
 x_MUX_uxn_device_h_l175_c2_a72a_return_output,
 flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output,
 layer_MUX_uxn_device_h_l175_c2_a72a_return_output,
 flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output,
 tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output,
 ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output,
 is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output,
 result_MUX_uxn_device_h_l175_c2_a72a_return_output,
 is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output,
 tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output,
 BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output,
 color_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 y_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 x_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 layer_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 result_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output,
 BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output,
 color_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 y_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 x_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 layer_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 result_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output,
 BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output,
 MUX_uxn_device_h_l188_c20_e690_return_output,
 BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output,
 color_MUX_uxn_device_h_l190_c7_cb26_return_output,
 y_MUX_uxn_device_h_l190_c7_cb26_return_output,
 ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output,
 auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output,
 x_MUX_uxn_device_h_l190_c7_cb26_return_output,
 flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output,
 layer_MUX_uxn_device_h_l190_c7_cb26_return_output,
 flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output,
 tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output,
 ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output,
 is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output,
 result_MUX_uxn_device_h_l190_c7_cb26_return_output,
 is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output,
 tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output,
 BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output,
 BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output,
 color_MUX_uxn_device_h_l194_c7_692f_return_output,
 y_MUX_uxn_device_h_l194_c7_692f_return_output,
 ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output,
 auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output,
 flip_x_MUX_uxn_device_h_l194_c7_692f_return_output,
 layer_MUX_uxn_device_h_l194_c7_692f_return_output,
 flip_y_MUX_uxn_device_h_l194_c7_692f_return_output,
 tmp8_MUX_uxn_device_h_l194_c7_692f_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output,
 ctrl_MUX_uxn_device_h_l194_c7_692f_return_output,
 is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output,
 result_MUX_uxn_device_h_l194_c7_692f_return_output,
 is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output,
 tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output,
 BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output,
 MUX_uxn_device_h_l198_c20_48da_return_output,
 BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output,
 color_MUX_uxn_device_h_l200_c7_f986_return_output,
 y_MUX_uxn_device_h_l200_c7_f986_return_output,
 ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output,
 auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output,
 flip_x_MUX_uxn_device_h_l200_c7_f986_return_output,
 layer_MUX_uxn_device_h_l200_c7_f986_return_output,
 flip_y_MUX_uxn_device_h_l200_c7_f986_return_output,
 tmp8_MUX_uxn_device_h_l200_c7_f986_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output,
 ctrl_MUX_uxn_device_h_l200_c7_f986_return_output,
 is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output,
 result_MUX_uxn_device_h_l200_c7_f986_return_output,
 is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output,
 tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output,
 BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output,
 BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output,
 color_MUX_uxn_device_h_l204_c7_0b39_return_output,
 ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output,
 auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output,
 flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output,
 layer_MUX_uxn_device_h_l204_c7_0b39_return_output,
 flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output,
 tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output,
 ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output,
 is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output,
 result_MUX_uxn_device_h_l204_c7_0b39_return_output,
 is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output,
 tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output,
 UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output,
 BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output,
 UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output,
 MUX_uxn_device_h_l216_c13_0677_return_output,
 BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output,
 MUX_uxn_device_h_l217_c20_3b8f_return_output,
 BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output,
 MUX_uxn_device_h_l218_c20_1cde_return_output,
 BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output,
 BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output,
 auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output,
 is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output,
 is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output,
 is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output,
 is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output,
 BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output,
 BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output,
 MUX_uxn_device_h_l234_c50_b120_return_output,
 BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output,
 MUX_uxn_device_h_l234_c20_a3a0_return_output,
 BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output,
 BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output,
 MUX_uxn_device_h_l235_c50_2a76_return_output,
 BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output,
 MUX_uxn_device_h_l235_c20_34c4_return_output,
 UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output,
 UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output,
 MUX_uxn_device_h_l236_c22_e1ac_return_output,
 MUX_uxn_device_h_l237_c31_07b7_return_output,
 UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output,
 BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output,
 result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output,
 BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output,
 BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output,
 MUX_uxn_device_h_l242_c21_ddf7_return_output,
 MUX_uxn_device_h_l243_c31_2ee9_return_output,
 UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output,
 BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output,
 result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output,
 UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output,
 BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output,
 result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output,
 BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output,
 CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output,
 BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output,
 BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(11 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l175_c2_a72a_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l175_c2_a72a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c2_a72a_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_d2ad_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c2_a72a_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_d2ad_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l184_c7_e6b6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l184_c7_e6b6_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_cb26_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c20_e690_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c20_e690_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c20_e690_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l188_c20_e690_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_x_uxn_device_h_l192_c3_5bbc : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l190_c7_cb26_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_cb26_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_cb26_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_692f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l194_c7_692f_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l194_c7_692f_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_692f_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l200_c7_f986_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l198_c20_48da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l198_c20_48da_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l198_c20_48da_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l198_c20_48da_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
 variable VAR_y_uxn_device_h_l201_c3_32e6 : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
 variable VAR_y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l200_c7_f986_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l200_c7_f986_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l200_c7_f986_iffalse : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_0b39_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
 variable VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l204_c7_0b39_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l204_c7_0b39_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_0b39_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l204_c7_0b39_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond : unsigned(0 downto 0);
 variable VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output : unsigned(0 downto 0);
 variable VAR_uint8_6_6_uxn_device_h_l207_c11_e003_return_output : unsigned(0 downto 0);
 variable VAR_uint8_5_5_uxn_device_h_l208_c12_adef_return_output : unsigned(0 downto 0);
 variable VAR_uint8_4_4_uxn_device_h_l209_c12_68cb_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_0_uxn_device_h_l210_c11_1d0c_return_output : unsigned(1 downto 0);
 variable VAR_uint8_uint2_0_uxn_device_h_l212_c10_12bd_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_2_uxn_device_h_l213_c10_c3ba_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_3_uxn_device_h_l214_c10_e76b_return_output : unsigned(7 downto 0);
 variable VAR_uint8_uint1_4_uxn_device_h_l215_c10_13bd_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l216_c13_0677_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l216_c13_0677_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l216_c13_0677_iffalse : unsigned(7 downto 0);
 variable VAR_uint8_7_0_uxn_device_h_l216_c44_6364_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l216_c13_0677_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l217_c20_3b8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l217_c20_3b8f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l217_c20_3b8f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l217_c20_3b8f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c20_1cde_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c20_1cde_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c20_1cde_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l218_c20_1cde_return_output : unsigned(0 downto 0);
 variable VAR_uint16_uint8_0_uxn_device_h_l219_c21_3de6_return_output : unsigned(15 downto 0);
 variable VAR_uint16_uint8_8_uxn_device_h_l220_c21_b2c0_return_output : unsigned(15 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l222_c3_b171 : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_addr_uxn_device_h_l232_c3_0303 : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l227_c7_825d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse : unsigned(0 downto 0);
 variable VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond : unsigned(0 downto 0);
 variable VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output : unsigned(0 downto 0);
 variable VAR_uint8_1_1_uxn_device_h_l230_c15_c31d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c20_a3a0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c50_b120_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c50_b120_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c50_b120_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c50_b120_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c20_a3a0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c20_a3a0_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l234_c20_a3a0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c20_34c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_left : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c50_2a76_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c50_2a76_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c50_2a76_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c50_2a76_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c20_34c4_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c20_34c4_iffalse : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l235_c20_34c4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l236_c22_e1ac_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l236_c22_e1ac_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l236_c22_e1ac_iffalse : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l236_c22_e1ac_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l237_c31_07b7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l237_c31_07b7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l237_c31_07b7_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l237_c31_07b7_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l242_c21_ddf7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l242_c21_ddf7_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l242_c21_ddf7_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output : unsigned(8 downto 0);
 variable VAR_MUX_uxn_device_h_l242_c21_ddf7_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l243_c31_2ee9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l243_c31_2ee9_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l243_c31_2ee9_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l243_c31_2ee9_return_output : unsigned(7 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l250_c3_cbc4 : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr : unsigned(0 downto 0);
 variable VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l257_c3_57fb : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l253_c7_a67d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l253_c7_a67d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output : unsigned(8 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x : unsigned(7 downto 0);
 variable VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l201_l192_DUPLICATE_eaa6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output : unsigned(0 downto 0);
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
     VAR_MUX_uxn_device_h_l235_c50_2a76_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l188_c20_e690_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right := to_unsigned(3, 4);
     VAR_MUX_uxn_device_h_l198_c20_48da_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right := to_unsigned(4, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_right := to_unsigned(2, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right := to_unsigned(9, 4);
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l216_c13_0677_iffalse := to_unsigned(255, 8);
     VAR_MUX_uxn_device_h_l234_c50_b120_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l237_c31_07b7_iffalse := to_unsigned(42, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right := to_unsigned(1, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l198_c20_48da_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l235_c50_2a76_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue := to_unsigned(42, 8);
     VAR_MUX_uxn_device_h_l237_c31_07b7_iftrue := to_unsigned(40, 8);
     VAR_result_device_ram_address_uxn_device_h_l222_c3_b171 := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_device_h_l243_c31_2ee9_iffalse := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_right := to_unsigned(10, 4);
     VAR_result_u16_addr_uxn_device_h_l232_c3_0303 := resize(to_unsigned(0, 1), 16);
     VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_result_u16_addr_uxn_device_h_l232_c3_0303;
     VAR_MUX_uxn_device_h_l234_c50_b120_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l235_c20_34c4_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l243_c31_2ee9_iftrue := to_unsigned(41, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right := to_unsigned(255, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right := to_unsigned(7, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right := to_unsigned(6, 4);
     VAR_MUX_uxn_device_h_l188_c20_e690_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_right := to_unsigned(0, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right := to_unsigned(8, 4);
     VAR_MUX_uxn_device_h_l234_c20_a3a0_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue := to_unsigned(43, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right := to_unsigned(5, 4);

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
     VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse := auto_advance;
     VAR_color_MUX_uxn_device_h_l175_c2_a72a_iftrue := color;
     VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iftrue := color;
     VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iftrue := color;
     VAR_color_MUX_uxn_device_h_l190_c7_cb26_iftrue := color;
     VAR_color_MUX_uxn_device_h_l194_c7_692f_iftrue := color;
     VAR_color_MUX_uxn_device_h_l200_c7_f986_iftrue := color;
     VAR_color_MUX_uxn_device_h_l204_c7_0b39_iffalse := color;
     VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue := ctrl;
     VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse := ctrl;
     VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue := ctrl_mode;
     VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse := ctrl_mode;
     VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue := flip_x;
     VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse := flip_x;
     VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue := flip_y;
     VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse := flip_y;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right := is_auto_x;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left := is_auto_x;
     VAR_MUX_uxn_device_h_l242_c21_ddf7_cond := is_auto_x;
     VAR_MUX_uxn_device_h_l243_c31_2ee9_cond := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue := is_auto_x;
     VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse := is_auto_x;
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left := is_auto_y;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue := is_auto_y;
     VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse := is_auto_y;
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right := is_x_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_right := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l217_c20_3b8f_iffalse := is_x_in_bounds;
     VAR_MUX_uxn_device_h_l234_c20_a3a0_iffalse := is_x_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue := is_x_in_bounds;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse := is_x_in_bounds;
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_right := is_y_in_bounds;
     VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_right := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l218_c20_1cde_iffalse := is_y_in_bounds;
     VAR_MUX_uxn_device_h_l235_c20_34c4_iffalse := is_y_in_bounds;
     VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue := is_y_in_bounds;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse := is_y_in_bounds;
     VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l194_c7_692f_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l200_c7_f986_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iffalse := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left := VAR_previous_device_ram_read;
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_previous_device_ram_read;
     VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_previous_device_ram_read;
     VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse := tmp8;
     VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue := tmp8b;
     VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse := tmp8b;
     VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left := x;
     VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left := x;
     VAR_x_MUX_uxn_device_h_l175_c2_a72a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue := x;
     VAR_x_MUX_uxn_device_h_l190_c7_cb26_iffalse := x;
     VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left := y;
     VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left := y;
     VAR_y_MUX_uxn_device_h_l175_c2_a72a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue := y;
     VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l190_c7_cb26_iftrue := y;
     VAR_y_MUX_uxn_device_h_l200_c7_f986_iffalse := y;
     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l190_c7_cb26] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_cb26_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(43, 8));

     -- BIN_OP_EQ[uxn_device_h_l198_c20_1c69] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left <= VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_left;
     BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right <= VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output := BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d[uxn_device_h_l227_c7_825d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l227_c7_825d_return_output := result.is_vram_write;

     -- uint8_4_4[uxn_device_h_l209_c12_68cb] LATENCY=0
     VAR_uint8_4_4_uxn_device_h_l209_c12_68cb_return_output := uint8_4_4(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba[uxn_device_h_l175_c2_a72a] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l175_c2_a72a_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_56ba(
     result,
     to_unsigned(0, 1),
     to_unsigned(0, 1),
     to_unsigned(40, 8),
     to_unsigned(0, 1));

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l253_c7_a67d] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l253_c7_a67d_return_output := result.is_device_ram_write;

     -- result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d[uxn_device_h_l253_c7_a67d] LATENCY=0
     VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l253_c7_a67d_return_output := result.is_deo_done;

     -- CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b LATENCY=0
     -- Inputs
     CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x <= VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_x;
     -- Outputs
     VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output := CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output;

     -- result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d[uxn_device_h_l227_c7_825d] LATENCY=0
     VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l227_c7_825d_return_output := result.u16_addr;

     -- uint8_0_0[uxn_device_h_l229_c15_2ad2] LATENCY=0
     VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output := uint8_0_0(
     VAR_previous_device_ram_read);

     -- uint8_5_5[uxn_device_h_l208_c12_adef] LATENCY=0
     VAR_uint8_5_5_uxn_device_h_l208_c12_adef_return_output := uint8_5_5(
     VAR_previous_device_ram_read);

     -- uint8_7_0[uxn_device_h_l216_c44_6364] LATENCY=0
     VAR_uint8_7_0_uxn_device_h_l216_c44_6364_return_output := uint8_7_0(
     x);

     -- BIN_OP_EQ[uxn_device_h_l234_c50_fcb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left <= VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_left;
     BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right <= VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output := BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l201_l192_DUPLICATE_eaa6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l201_l192_DUPLICATE_eaa6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d[uxn_device_h_l253_c7_a67d] LATENCY=0
     VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l253_c7_a67d_return_output := result.u8_value;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l181_c7_d2ad] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_d2ad_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(41, 8));

     -- BIN_OP_PLUS[uxn_device_h_l242_c34_5520] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left <= VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_left;
     BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right <= VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output := BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l194_c7_692f] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l194_c7_692f_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(46, 8));

     -- uint8_1_0[uxn_device_h_l210_c11_1d0c] LATENCY=0
     VAR_uint8_1_0_uxn_device_h_l210_c11_1d0c_return_output := uint8_1_0(
     VAR_previous_device_ram_read);

     -- BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38 LATENCY=0
     -- Inputs
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_left;
     BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right <= VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_right;
     -- Outputs
     VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output := BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output;

     -- result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d[uxn_device_h_l253_c7_a67d] LATENCY=0
     VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l253_c7_a67d_return_output := result.device_ram_address;

     -- uint16_uint8_0[uxn_device_h_l219_c21_3de6] LATENCY=0
     VAR_uint16_uint8_0_uxn_device_h_l219_c21_3de6_return_output := uint16_uint8_0(
     resize(to_unsigned(0, 1), 16),
     x);

     -- BIN_OP_EQ[uxn_device_h_l235_c50_ec35] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left <= VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_left;
     BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right <= VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output := BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output;

     -- uint12_3_0[uxn_device_h_l173_c11_618b] LATENCY=0
     VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output := uint12_3_0(
     VAR_phase);

     -- MUX[uxn_device_h_l243_c31_2ee9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l243_c31_2ee9_cond <= VAR_MUX_uxn_device_h_l243_c31_2ee9_cond;
     MUX_uxn_device_h_l243_c31_2ee9_iftrue <= VAR_MUX_uxn_device_h_l243_c31_2ee9_iftrue;
     MUX_uxn_device_h_l243_c31_2ee9_iffalse <= VAR_MUX_uxn_device_h_l243_c31_2ee9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l243_c31_2ee9_return_output := MUX_uxn_device_h_l243_c31_2ee9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l188_c20_e733] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l188_c20_e733_left <= VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_left;
     BIN_OP_EQ_uxn_device_h_l188_c20_e733_right <= VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output := BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output;

     -- uint8_7_7[uxn_device_h_l206_c15_5955] LATENCY=0
     VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output := uint8_7_7(
     VAR_previous_device_ram_read);

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l200_c7_f986] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l200_c7_f986_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(38, 8));

     -- BIN_OP_PLUS[uxn_device_h_l242_c44_5276] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left <= VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_left;
     BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right <= VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output := BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a[uxn_device_h_l184_c7_e6b6] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l184_c7_e6b6_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_027a(
     result,
     to_unsigned(42, 8));

     -- BIN_OP_PLUS[uxn_device_h_l257_c21_183f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left <= VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_left;
     BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right <= VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output := BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output;

     -- uint8_6_6[uxn_device_h_l207_c11_e003] LATENCY=0
     VAR_uint8_6_6_uxn_device_h_l207_c11_e003_return_output := uint8_6_6(
     VAR_previous_device_ram_read);

     -- uint8_1_1[uxn_device_h_l230_c15_c31d] LATENCY=0
     VAR_uint8_1_1_uxn_device_h_l230_c15_c31d_return_output := uint8_1_1(
     VAR_previous_device_ram_read);

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l216_c26_f35a] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output := UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l250_c22_23ad] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output := UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output;

     -- Submodule level 1
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue := VAR_BIN_OP_AND_uint1_t_uint1_t_uxn_device_h_l255_l248_DUPLICATE_5e38_return_output;
     VAR_MUX_uxn_device_h_l188_c20_e690_cond := VAR_BIN_OP_EQ_uxn_device_h_l188_c20_e733_return_output;
     VAR_MUX_uxn_device_h_l198_c20_48da_cond := VAR_BIN_OP_EQ_uxn_device_h_l198_c20_1c69_return_output;
     VAR_MUX_uxn_device_h_l234_c50_b120_cond := VAR_BIN_OP_EQ_uxn_device_h_l234_c50_fcb7_return_output;
     VAR_MUX_uxn_device_h_l235_c50_2a76_cond := VAR_BIN_OP_EQ_uxn_device_h_l235_c50_ec35_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l241_l244_DUPLICATE_1f98_return_output;
     VAR_MUX_uxn_device_h_l242_c21_ddf7_iftrue := resize(VAR_BIN_OP_PLUS_uxn_device_h_l242_c34_5520_return_output, 8);
     VAR_MUX_uxn_device_h_l242_c21_ddf7_iffalse := resize(VAR_BIN_OP_PLUS_uxn_device_h_l242_c44_5276_return_output, 8);
     VAR_result_u8_value_uxn_device_h_l257_c3_57fb := resize(VAR_BIN_OP_PLUS_uxn_device_h_l257_c21_183f_return_output, 8);
     VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l201_l192_DUPLICATE_eaa6_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l201_l192_DUPLICATE_eaa6_return_output;
     VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output;
     VAR_y_MUX_uxn_device_h_l194_c7_692f_iftrue := VAR_CONST_SL_8_uint8_t_uxn_device_h_l187_l197_DUPLICATE_6f8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue := VAR_MUX_uxn_device_h_l243_c31_2ee9_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right := VAR_UNARY_OP_NOT_uxn_device_h_l216_c26_f35a_return_output;
     VAR_result_u8_value_uxn_device_h_l250_c3_cbc4 := resize(VAR_UNARY_OP_NOT_uxn_device_h_l250_c22_23ad_return_output, 8);
     VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_cb26_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l190_c7_cb26_return_output;
     VAR_result_MUX_uxn_device_h_l194_c7_692f_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l194_c7_692f_return_output;
     VAR_result_MUX_uxn_device_h_l200_c7_f986_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_027a_uxn_device_h_l200_c7_f986_return_output;
     VAR_result_MUX_uxn_device_h_l175_c2_a72a_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_56ba_uxn_device_h_l175_c2_a72a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse := VAR_result_device_ram_address_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse := VAR_result_is_deo_done_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l227_c7_825d_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_u16_addr_FALSE_INPUT_MUX_CONST_REF_RD_uint16_t_device_out_result_t_u16_addr_d41d_uxn_device_h_l227_c7_825d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse := VAR_result_u8_value_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l253_c7_a67d_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_left := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     REG_VAR_phase4 := VAR_uint12_3_0_uxn_device_h_l173_c11_618b_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left := VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left := VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output;
     VAR_MUX_uxn_device_h_l236_c22_e1ac_cond := VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output;
     VAR_MUX_uxn_device_h_l237_c31_07b7_cond := VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_uint8_0_0_uxn_device_h_l229_c15_2ad2_return_output;
     VAR_color_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_1_0_uxn_device_h_l210_c11_1d0c_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_left := VAR_uint8_1_1_uxn_device_h_l230_c15_c31d_return_output;
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right := VAR_uint8_1_1_uxn_device_h_l230_c15_c31d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_uint8_1_1_uxn_device_h_l230_c15_c31d_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_left := VAR_uint8_4_4_uxn_device_h_l209_c12_68cb_return_output;
     VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_4_4_uxn_device_h_l209_c12_68cb_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_left := VAR_uint8_5_5_uxn_device_h_l208_c12_adef_return_output;
     VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_5_5_uxn_device_h_l208_c12_adef_return_output;
     VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_6_6_uxn_device_h_l207_c11_e003_return_output;
     VAR_MUX_uxn_device_h_l216_c13_0677_iftrue := VAR_uint8_7_0_uxn_device_h_l216_c44_6364_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left := VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output;
     VAR_MUX_uxn_device_h_l217_c20_3b8f_cond := VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output;
     VAR_MUX_uxn_device_h_l218_c20_1cde_cond := VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue := VAR_result_u8_value_uxn_device_h_l250_c3_cbc4;
     VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue := VAR_result_u8_value_uxn_device_h_l257_c3_57fb;
     -- MUX[uxn_device_h_l234_c50_b120] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l234_c50_b120_cond <= VAR_MUX_uxn_device_h_l234_c50_b120_cond;
     MUX_uxn_device_h_l234_c50_b120_iftrue <= VAR_MUX_uxn_device_h_l234_c50_b120_iftrue;
     MUX_uxn_device_h_l234_c50_b120_iffalse <= VAR_MUX_uxn_device_h_l234_c50_b120_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l234_c50_b120_return_output := MUX_uxn_device_h_l234_c50_b120_return_output;

     -- BIN_OP_OR[uxn_device_h_l218_c33_9257] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l218_c33_9257_left <= VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_left;
     BIN_OP_OR_uxn_device_h_l218_c33_9257_right <= VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output := BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output;

     -- uint8_uint2_0[uxn_device_h_l212_c10_12bd] LATENCY=0
     VAR_uint8_uint2_0_uxn_device_h_l212_c10_12bd_return_output := uint8_uint2_0(
     resize(to_unsigned(0, 1), 8),
     VAR_uint8_1_0_uxn_device_h_l210_c11_1d0c_return_output);

     -- BIN_OP_EQ[uxn_device_h_l181_c11_7bf3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_left;
     BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right <= VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output := BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;

     -- MUX[uxn_device_h_l235_c50_2a76] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l235_c50_2a76_cond <= VAR_MUX_uxn_device_h_l235_c50_2a76_cond;
     MUX_uxn_device_h_l235_c50_2a76_iftrue <= VAR_MUX_uxn_device_h_l235_c50_2a76_iftrue;
     MUX_uxn_device_h_l235_c50_2a76_iffalse <= VAR_MUX_uxn_device_h_l235_c50_2a76_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l235_c50_2a76_return_output := MUX_uxn_device_h_l235_c50_2a76_return_output;

     -- BIN_OP_EQ[uxn_device_h_l190_c11_2a24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_left;
     BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right <= VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output := BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;

     -- uint16_uint8_8[uxn_device_h_l220_c21_b2c0] LATENCY=0
     VAR_uint16_uint8_8_uxn_device_h_l220_c21_b2c0_return_output := uint16_uint8_8(
     VAR_uint16_uint8_0_uxn_device_h_l219_c21_3de6_return_output,
     y);

     -- BIN_OP_OR[uxn_device_h_l192_c3_e826] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l192_c3_e826_left <= VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_left;
     BIN_OP_OR_uxn_device_h_l192_c3_e826_right <= VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output := BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output;

     -- BIN_OP_EQ[uxn_device_h_l227_c11_bcfd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left <= VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_left;
     BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right <= VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output := BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l246_c11_a5da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left <= VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_left;
     BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right <= VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output := BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output;

     -- BIN_OP_AND[uxn_device_h_l235_c20_2860] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l235_c20_2860_left <= VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_left;
     BIN_OP_AND_uxn_device_h_l235_c20_2860_right <= VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output := BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output;

     -- MUX[uxn_device_h_l237_c31_07b7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l237_c31_07b7_cond <= VAR_MUX_uxn_device_h_l237_c31_07b7_cond;
     MUX_uxn_device_h_l237_c31_07b7_iftrue <= VAR_MUX_uxn_device_h_l237_c31_07b7_iftrue;
     MUX_uxn_device_h_l237_c31_07b7_iffalse <= VAR_MUX_uxn_device_h_l237_c31_07b7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l237_c31_07b7_return_output := MUX_uxn_device_h_l237_c31_07b7_return_output;

     -- MUX[uxn_device_h_l198_c20_48da] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l198_c20_48da_cond <= VAR_MUX_uxn_device_h_l198_c20_48da_cond;
     MUX_uxn_device_h_l198_c20_48da_iftrue <= VAR_MUX_uxn_device_h_l198_c20_48da_iftrue;
     MUX_uxn_device_h_l198_c20_48da_iffalse <= VAR_MUX_uxn_device_h_l198_c20_48da_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l198_c20_48da_return_output := MUX_uxn_device_h_l198_c20_48da_return_output;

     -- BIN_OP_OR[uxn_device_h_l217_c33_3428] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l217_c33_3428_left <= VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_left;
     BIN_OP_OR_uxn_device_h_l217_c33_3428_right <= VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output := BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output;

     -- BIN_OP_EQ[uxn_device_h_l240_c11_49d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left <= VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_left;
     BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right <= VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output := BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output;

     -- BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3 LATENCY=0
     -- Inputs
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_left;
     BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right <= VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_right;
     -- Outputs
     VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output := BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l184_c11_595c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l184_c11_595c_left <= VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_left;
     BIN_OP_EQ_uxn_device_h_l184_c11_595c_right <= VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output := BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;

     -- BIN_OP_OR[uxn_device_h_l201_c3_4847] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l201_c3_4847_left <= VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_left;
     BIN_OP_OR_uxn_device_h_l201_c3_4847_right <= VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output := BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output;

     -- BIN_OP_EQ[uxn_device_h_l194_c11_f70b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left <= VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_left;
     BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right <= VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output := BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l204_c11_d72a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_left;
     BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right <= VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output := BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;

     -- BIN_OP_AND[uxn_device_h_l216_c13_d4e3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left <= VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_left;
     BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right <= VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output := BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output;

     -- MUX[uxn_device_h_l242_c21_ddf7] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l242_c21_ddf7_cond <= VAR_MUX_uxn_device_h_l242_c21_ddf7_cond;
     MUX_uxn_device_h_l242_c21_ddf7_iftrue <= VAR_MUX_uxn_device_h_l242_c21_ddf7_iftrue;
     MUX_uxn_device_h_l242_c21_ddf7_iffalse <= VAR_MUX_uxn_device_h_l242_c21_ddf7_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l242_c21_ddf7_return_output := MUX_uxn_device_h_l242_c21_ddf7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l175_c6_5839] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l175_c6_5839_left <= VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_left;
     BIN_OP_EQ_uxn_device_h_l175_c6_5839_right <= VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output := BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;

     -- MUX[uxn_device_h_l188_c20_e690] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l188_c20_e690_cond <= VAR_MUX_uxn_device_h_l188_c20_e690_cond;
     MUX_uxn_device_h_l188_c20_e690_iftrue <= VAR_MUX_uxn_device_h_l188_c20_e690_iftrue;
     MUX_uxn_device_h_l188_c20_e690_iffalse <= VAR_MUX_uxn_device_h_l188_c20_e690_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l188_c20_e690_return_output := MUX_uxn_device_h_l188_c20_e690_return_output;

     -- BIN_OP_EQ[uxn_device_h_l200_c11_3e37] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_left;
     BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right <= VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output := BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l244_c26_5e08] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output := UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output;

     -- BIN_OP_AND[uxn_device_h_l234_c20_a7e6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left <= VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_left;
     BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right <= VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output := BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l253_c11_682d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l253_c11_682d_left <= VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_left;
     BIN_OP_EQ_uxn_device_h_l253_c11_682d_right <= VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output := BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output;

     -- Submodule level 2
     VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr := VAR_BIN_OP_AND_uxn_device_h_l216_c13_d4e3_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_left := VAR_BIN_OP_AND_uxn_device_h_l234_c20_a7e6_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_left := VAR_BIN_OP_AND_uxn_device_h_l235_c20_2860_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_color_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_layer_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_result_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_x_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_y_MUX_uxn_device_h_l175_c2_a72a_cond := VAR_BIN_OP_EQ_uxn_device_h_l175_c6_5839_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_result_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_d2ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l181_c11_7bf3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_color_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_result_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_x_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_y_MUX_uxn_device_h_l184_c7_e6b6_cond := VAR_BIN_OP_EQ_uxn_device_h_l184_c11_595c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_color_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_layer_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_x_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_cb26_cond := VAR_BIN_OP_EQ_uxn_device_h_l190_c11_2a24_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_color_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_layer_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_result_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_y_MUX_uxn_device_h_l194_c7_692f_cond := VAR_BIN_OP_EQ_uxn_device_h_l194_c11_f70b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_color_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_layer_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_result_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_y_MUX_uxn_device_h_l200_c7_f986_cond := VAR_BIN_OP_EQ_uxn_device_h_l200_c11_3e37_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_color_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_layer_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond := VAR_BIN_OP_EQ_uxn_device_h_l204_c11_d72a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond := VAR_BIN_OP_EQ_uxn_device_h_l227_c11_bcfd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond := VAR_BIN_OP_EQ_uxn_device_h_l240_c11_49d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond := VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond := VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond := VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond := VAR_BIN_OP_EQ_uxn_device_h_l246_c11_a5da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond := VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond := VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond := VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond := VAR_BIN_OP_EQ_uxn_device_h_l253_c11_682d_return_output;
     VAR_x_uxn_device_h_l192_c3_5bbc := resize(VAR_BIN_OP_OR_uxn_device_h_l192_c3_e826_return_output, 8);
     VAR_y_uxn_device_h_l201_c3_32e6 := resize(VAR_BIN_OP_OR_uxn_device_h_l201_c3_4847_return_output, 8);
     VAR_MUX_uxn_device_h_l217_c20_3b8f_iftrue := VAR_BIN_OP_OR_uxn_device_h_l217_c33_3428_return_output;
     VAR_MUX_uxn_device_h_l218_c20_1cde_iftrue := VAR_BIN_OP_OR_uxn_device_h_l218_c33_9257_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_BIN_OP_OR_uint1_t_uint1_t_uxn_device_h_l238_l233_DUPLICATE_ead3_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue := VAR_MUX_uxn_device_h_l188_c20_e690_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue := VAR_MUX_uxn_device_h_l198_c20_48da_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_right := VAR_MUX_uxn_device_h_l234_c50_b120_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_right := VAR_MUX_uxn_device_h_l235_c50_2a76_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_MUX_uxn_device_h_l237_c31_07b7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue := VAR_MUX_uxn_device_h_l242_c21_ddf7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l244_c26_5e08_return_output;
     VAR_x_MUX_uxn_device_h_l190_c7_cb26_iftrue := VAR_x_uxn_device_h_l192_c3_5bbc;
     VAR_y_MUX_uxn_device_h_l200_c7_f986_iftrue := VAR_y_uxn_device_h_l201_c3_32e6;
     -- result_is_vram_write_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_cond;
     result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output := result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- MUX[uxn_device_h_l218_c20_1cde] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l218_c20_1cde_cond <= VAR_MUX_uxn_device_h_l218_c20_1cde_cond;
     MUX_uxn_device_h_l218_c20_1cde_iftrue <= VAR_MUX_uxn_device_h_l218_c20_1cde_iftrue;
     MUX_uxn_device_h_l218_c20_1cde_iffalse <= VAR_MUX_uxn_device_h_l218_c20_1cde_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l218_c20_1cde_return_output := MUX_uxn_device_h_l218_c20_1cde_return_output;

     -- uint8_uint1_2[uxn_device_h_l213_c10_c3ba] LATENCY=0
     VAR_uint8_uint1_2_uxn_device_h_l213_c10_c3ba_return_output := uint8_uint1_2(
     VAR_uint8_uint2_0_uxn_device_h_l212_c10_12bd_return_output,
     VAR_uint8_5_5_uxn_device_h_l208_c12_adef_return_output);

     -- UNARY_OP_NOT[uxn_device_h_l238_c26_cac0] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output := UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l253_c7_a67d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_cond;
     result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output := result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output;

     -- result_u16_addr_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_cond;
     result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output := result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_cond;
     ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output := ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- flip_x_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_cond;
     flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output := flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- flip_y_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_cond;
     flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output := flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- BIN_OP_AND[uxn_device_h_l234_c20_84fc] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l234_c20_84fc_left <= VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_left;
     BIN_OP_AND_uxn_device_h_l234_c20_84fc_right <= VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output := BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l216_c13_52ec] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output := UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output;

     -- is_auto_y_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_cond;
     is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iftrue;
     is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output := is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l253_c7_a67d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_cond;
     result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output := result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output;

     -- auto_advance_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_cond;
     auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iftrue;
     auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output := auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- is_auto_x_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_cond;
     is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iftrue;
     is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output := is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l253_c7_a67d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output;

     -- color_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_color_MUX_uxn_device_h_l204_c7_0b39_cond;
     color_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_color_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     color_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_color_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l204_c7_0b39_return_output := color_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- layer_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_layer_MUX_uxn_device_h_l204_c7_0b39_cond;
     layer_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     layer_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_layer_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l204_c7_0b39_return_output := layer_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- MUX[uxn_device_h_l217_c20_3b8f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l217_c20_3b8f_cond <= VAR_MUX_uxn_device_h_l217_c20_3b8f_cond;
     MUX_uxn_device_h_l217_c20_3b8f_iftrue <= VAR_MUX_uxn_device_h_l217_c20_3b8f_iftrue;
     MUX_uxn_device_h_l217_c20_3b8f_iffalse <= VAR_MUX_uxn_device_h_l217_c20_3b8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l217_c20_3b8f_return_output := MUX_uxn_device_h_l217_c20_3b8f_return_output;

     -- result_u8_value_MUX[uxn_device_h_l253_c7_a67d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_cond;
     result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iftrue;
     result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output := result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output;

     -- x_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_x_MUX_uxn_device_h_l190_c7_cb26_cond;
     x_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_x_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     x_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_x_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l190_c7_cb26_return_output := x_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- ctrl_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_cond;
     ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output := ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- BIN_OP_AND[uxn_device_h_l235_c20_043b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l235_c20_043b_left <= VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_left;
     BIN_OP_AND_uxn_device_h_l235_c20_043b_right <= VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output := BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output;

     -- y_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_y_MUX_uxn_device_h_l200_c7_f986_cond;
     y_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_y_MUX_uxn_device_h_l200_c7_f986_iftrue;
     y_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_y_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l200_c7_f986_return_output := y_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l234_c20_a3a0_cond := VAR_BIN_OP_AND_uxn_device_h_l234_c20_84fc_return_output;
     VAR_MUX_uxn_device_h_l235_c20_34c4_cond := VAR_BIN_OP_AND_uxn_device_h_l235_c20_043b_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_left := VAR_MUX_uxn_device_h_l217_c20_3b8f_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_MUX_uxn_device_h_l217_c20_3b8f_return_output;
     VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_right := VAR_MUX_uxn_device_h_l218_c20_1cde_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_MUX_uxn_device_h_l218_c20_1cde_return_output;
     VAR_MUX_uxn_device_h_l216_c13_0677_cond := VAR_UNARY_OP_NOT_uxn_device_h_l216_c13_52ec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_UNARY_OP_NOT_uxn_device_h_l238_c26_cac0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_auto_advance_MUX_uxn_device_h_l227_c7_825d_return_output;
     VAR_color_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_color_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_ctrl_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_flip_x_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_flip_y_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l227_c7_825d_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l227_c7_825d_return_output;
     VAR_layer_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_layer_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l253_c7_a67d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l253_c7_a67d_return_output;
     VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_x_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_y_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_y_MUX_uxn_device_h_l200_c7_f986_return_output;
     -- ctrl_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_cond;
     ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iftrue;
     ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_return_output := ctrl_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- auto_advance_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_cond;
     auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output := auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_cond;
     ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iftrue;
     ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output := ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- x_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_x_MUX_uxn_device_h_l184_c7_e6b6_cond;
     x_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     x_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l184_c7_e6b6_return_output := x_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- flip_y_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_cond;
     flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iftrue;
     flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_return_output := flip_y_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l246_c7_f91c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_cond;
     result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output := result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output;

     -- is_auto_y_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_cond;
     is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output := is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- MUX[uxn_device_h_l235_c20_34c4] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l235_c20_34c4_cond <= VAR_MUX_uxn_device_h_l235_c20_34c4_cond;
     MUX_uxn_device_h_l235_c20_34c4_iftrue <= VAR_MUX_uxn_device_h_l235_c20_34c4_iftrue;
     MUX_uxn_device_h_l235_c20_34c4_iffalse <= VAR_MUX_uxn_device_h_l235_c20_34c4_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l235_c20_34c4_return_output := MUX_uxn_device_h_l235_c20_34c4_return_output;

     -- result_u8_value_MUX[uxn_device_h_l246_c7_f91c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond <= VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_cond;
     result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iftrue;
     result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output := result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l246_c7_f91c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_cond;
     result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output := result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output;

     -- BIN_OP_AND[uxn_device_h_l223_c26_f29e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l223_c26_f29e_left <= VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_left;
     BIN_OP_AND_uxn_device_h_l223_c26_f29e_right <= VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output := BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output;

     -- MUX[uxn_device_h_l216_c13_0677] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l216_c13_0677_cond <= VAR_MUX_uxn_device_h_l216_c13_0677_cond;
     MUX_uxn_device_h_l216_c13_0677_iftrue <= VAR_MUX_uxn_device_h_l216_c13_0677_iftrue;
     MUX_uxn_device_h_l216_c13_0677_iffalse <= VAR_MUX_uxn_device_h_l216_c13_0677_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l216_c13_0677_return_output := MUX_uxn_device_h_l216_c13_0677_return_output;

     -- MUX[uxn_device_h_l234_c20_a3a0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l234_c20_a3a0_cond <= VAR_MUX_uxn_device_h_l234_c20_a3a0_cond;
     MUX_uxn_device_h_l234_c20_a3a0_iftrue <= VAR_MUX_uxn_device_h_l234_c20_a3a0_iftrue;
     MUX_uxn_device_h_l234_c20_a3a0_iffalse <= VAR_MUX_uxn_device_h_l234_c20_a3a0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l234_c20_a3a0_return_output := MUX_uxn_device_h_l234_c20_a3a0_return_output;

     -- uint8_uint1_3[uxn_device_h_l214_c10_e76b] LATENCY=0
     VAR_uint8_uint1_3_uxn_device_h_l214_c10_e76b_return_output := uint8_uint1_3(
     VAR_uint8_uint1_2_uxn_device_h_l213_c10_c3ba_return_output,
     VAR_uint8_4_4_uxn_device_h_l209_c12_68cb_return_output);

     -- is_auto_x_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_cond;
     is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output := is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- layer_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_layer_MUX_uxn_device_h_l200_c7_f986_cond;
     layer_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_layer_MUX_uxn_device_h_l200_c7_f986_iftrue;
     layer_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_layer_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l200_c7_f986_return_output := layer_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- y_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_y_MUX_uxn_device_h_l194_c7_692f_cond;
     y_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_y_MUX_uxn_device_h_l194_c7_692f_iftrue;
     y_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_y_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l194_c7_692f_return_output := y_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l246_c7_f91c] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output := result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output;

     -- flip_x_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_cond;
     flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iftrue;
     flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_return_output := flip_x_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- color_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_color_MUX_uxn_device_h_l200_c7_f986_cond;
     color_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_color_MUX_uxn_device_h_l200_c7_f986_iftrue;
     color_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_color_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l200_c7_f986_return_output := color_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- Submodule level 4
     VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_MUX_uxn_device_h_l216_c13_0677_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr := VAR_MUX_uxn_device_h_l234_c20_a3a0_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_MUX_uxn_device_h_l234_c20_a3a0_return_output;
     VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr := VAR_MUX_uxn_device_h_l235_c20_34c4_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_MUX_uxn_device_h_l235_c20_34c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_auto_advance_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_color_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_color_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_ctrl_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_flip_x_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_flip_y_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_layer_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_layer_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l246_c7_f91c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l246_c7_f91c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l246_c7_f91c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l246_c7_f91c_return_output;
     VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_x_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_y_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_y_MUX_uxn_device_h_l194_c7_692f_return_output;
     -- auto_advance_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_cond;
     auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iftrue;
     auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output := auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- flip_x_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_cond;
     flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iftrue;
     flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_return_output := flip_x_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- color_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_color_MUX_uxn_device_h_l194_c7_692f_cond;
     color_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_color_MUX_uxn_device_h_l194_c7_692f_iftrue;
     color_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_color_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l194_c7_692f_return_output := color_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l240_c7_e9a5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_cond;
     result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output := result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output;

     -- flip_y_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_cond;
     flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iftrue;
     flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_return_output := flip_y_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- layer_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_layer_MUX_uxn_device_h_l194_c7_692f_cond;
     layer_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_layer_MUX_uxn_device_h_l194_c7_692f_iftrue;
     layer_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_layer_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l194_c7_692f_return_output := layer_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond;
     is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output := is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- tmp8b_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_cond;
     tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output := tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l240_c7_e9a5] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output := result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output;

     -- x_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_x_MUX_uxn_device_h_l181_c7_d2ad_cond;
     x_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     x_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l181_c7_d2ad_return_output := x_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l240_c7_e9a5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_cond;
     result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output := result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output;

     -- is_auto_x_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_cond;
     is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iftrue;
     is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output := is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- is_auto_y_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_cond;
     is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iftrue;
     is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output := is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l236_c35_31f9] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output := UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_cond;
     ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iftrue;
     ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output := ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_cond;
     is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output := is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- ctrl_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_cond;
     ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iftrue;
     ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_return_output := ctrl_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- UNARY_OP_NOT[uxn_device_h_l236_c53_a92d] LATENCY=0
     -- Inputs
     UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr <= VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_expr;
     -- Outputs
     VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output := UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output;

     -- result_u8_value_MUX[uxn_device_h_l240_c7_e9a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_cond;
     result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iftrue;
     result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output := result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output;

     -- uint8_uint1_4[uxn_device_h_l215_c10_13bd] LATENCY=0
     VAR_uint8_uint1_4_uxn_device_h_l215_c10_13bd_return_output := uint8_uint1_4(
     VAR_uint8_uint1_3_uxn_device_h_l214_c10_e76b_return_output,
     VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output);

     -- y_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_y_MUX_uxn_device_h_l190_c7_cb26_cond;
     y_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_y_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     y_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_y_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l190_c7_cb26_return_output := y_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- Submodule level 5
     VAR_MUX_uxn_device_h_l236_c22_e1ac_iftrue := resize(VAR_UNARY_OP_NOT_uxn_device_h_l236_c35_31f9_return_output, 8);
     VAR_MUX_uxn_device_h_l236_c22_e1ac_iffalse := resize(VAR_UNARY_OP_NOT_uxn_device_h_l236_c53_a92d_return_output, 8);
     VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_color_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_color_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_ctrl_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_flip_x_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_flip_y_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l227_c7_825d_return_output;
     VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_layer_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l240_c7_e9a5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l240_c7_e9a5_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_is_device_ram_write_MUX_uxn_device_h_l240_c7_e9a5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l240_c7_e9a5_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_tmp8b_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_uint8_uint1_4_uxn_device_h_l215_c10_13bd_return_output;
     VAR_x_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_x_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_y_MUX_uxn_device_h_l190_c7_cb26_return_output;
     -- y_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_y_MUX_uxn_device_h_l184_c7_e6b6_cond;
     y_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     y_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l184_c7_e6b6_return_output := y_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- ctrl_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_cond;
     ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output := ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_cond;
     result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output := result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a[uxn_device_h_l204_c7_0b39] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l204_c7_0b39_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_f42a(
     result,
     VAR_uint16_uint8_8_uxn_device_h_l220_c21_b2c0_return_output,
     VAR_uint8_6_6_uxn_device_h_l207_c11_e003_return_output,
     VAR_result_device_ram_address_uxn_device_h_l222_c3_b171,
     VAR_BIN_OP_AND_uxn_device_h_l223_c26_f29e_return_output,
     VAR_uint8_7_7_uxn_device_h_l206_c15_5955_return_output,
     VAR_uint8_uint1_4_uxn_device_h_l215_c10_13bd_return_output);

     -- tmp8_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_cond;
     tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output := tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond;
     is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output := is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_cond;
     is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output := is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- flip_y_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_cond;
     flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output := flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- is_auto_y_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_cond;
     is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iftrue;
     is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output := is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- x_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_x_MUX_uxn_device_h_l175_c2_a72a_cond;
     x_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_x_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     x_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_x_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l175_c2_a72a_return_output := x_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- MUX[uxn_device_h_l236_c22_e1ac] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l236_c22_e1ac_cond <= VAR_MUX_uxn_device_h_l236_c22_e1ac_cond;
     MUX_uxn_device_h_l236_c22_e1ac_iftrue <= VAR_MUX_uxn_device_h_l236_c22_e1ac_iftrue;
     MUX_uxn_device_h_l236_c22_e1ac_iffalse <= VAR_MUX_uxn_device_h_l236_c22_e1ac_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l236_c22_e1ac_return_output := MUX_uxn_device_h_l236_c22_e1ac_return_output;

     -- is_auto_x_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_cond;
     is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iftrue;
     is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output := is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_cond;
     ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output := ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- color_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_color_MUX_uxn_device_h_l190_c7_cb26_cond;
     color_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_color_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     color_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_color_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l190_c7_cb26_return_output := color_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_cond;
     result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output := result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- flip_x_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_cond;
     flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output := flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- auto_advance_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_cond;
     auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iftrue;
     auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output := auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- layer_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_layer_MUX_uxn_device_h_l190_c7_cb26_cond;
     layer_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     layer_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_layer_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l190_c7_cb26_return_output := layer_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- tmp8b_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_cond;
     tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iftrue;
     tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output := tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue := VAR_MUX_uxn_device_h_l236_c22_e1ac_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_auto_advance_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_color_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_ctrl_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_flip_x_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_flip_y_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_layer_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_0b39_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_f42a_uxn_device_h_l204_c7_0b39_return_output;
     VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_tmp8_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_tmp8b_MUX_uxn_device_h_l200_c7_f986_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_y_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     -- is_auto_x_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_cond;
     is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output := is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- flip_y_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_cond;
     flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output := flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond;
     is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output := is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- auto_advance_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_cond;
     auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output := auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- layer_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_cond;
     layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_return_output := layer_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- y_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_y_MUX_uxn_device_h_l181_c7_d2ad_cond;
     y_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     y_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l181_c7_d2ad_return_output := y_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- is_auto_y_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_cond;
     is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output := is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- tmp8b_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_cond;
     tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iftrue;
     tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output := tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_cond;
     is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output := is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- tmp8_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_cond;
     tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iftrue;
     tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_return_output := tmp8_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- result_u8_value_MUX[uxn_device_h_l227_c7_825d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_cond;
     result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iftrue;
     result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output := result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output;

     -- color_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_color_MUX_uxn_device_h_l184_c7_e6b6_cond;
     color_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     color_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_color_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l184_c7_e6b6_return_output := color_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- flip_x_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_cond;
     flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output := flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_cond;
     ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output := ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- ctrl_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_cond;
     ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output := ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- Submodule level 7
     VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_color_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_ctrl_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_flip_x_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_flip_y_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_layer_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_tmp8_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_tmp8b_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_y_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_y_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     -- ctrl_mode_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_cond;
     ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output := ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond;
     is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output := is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- color_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_color_MUX_uxn_device_h_l181_c7_d2ad_cond;
     color_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     color_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_color_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l181_c7_d2ad_return_output := color_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- auto_advance_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_cond;
     auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output := auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- flip_y_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_cond;
     flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output := flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- tmp8_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_cond;
     tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iftrue;
     tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_return_output := tmp8_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- layer_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_cond;
     layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_return_output := layer_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_cond;
     is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output := is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc[uxn_device_h_l204_c7_0b39] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l204_c7_0b39_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l227_c7_825d_return_output,
     VAR_result_u16_addr_MUX_uxn_device_h_l227_c7_825d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l227_c7_825d_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l227_c7_825d_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l227_c7_825d_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l227_c7_825d_return_output);

     -- is_auto_y_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_cond;
     is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output := is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- flip_x_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_cond;
     flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output := flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- ctrl_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_cond;
     ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output := ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- y_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_y_MUX_uxn_device_h_l175_c2_a72a_cond;
     y_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_y_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     y_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_y_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l175_c2_a72a_return_output := y_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- tmp8b_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_cond;
     tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output := tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- is_auto_x_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_cond;
     is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output := is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- Submodule level 8
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_auto_advance_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_color_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_color_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_ctrl_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_ctrl_mode_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_flip_x_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_flip_y_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_layer_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_result_MUX_uxn_device_h_l204_c7_0b39_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_d9dc_uxn_device_h_l204_c7_0b39_return_output;
     VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_tmp8_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_tmp8b_MUX_uxn_device_h_l190_c7_cb26_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l175_c2_a72a_return_output;
     -- tmp8_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_cond;
     tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output := tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- flip_x_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     flip_x_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_cond;
     flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output := flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- tmp8b_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_cond;
     tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output := tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- ctrl_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     ctrl_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_cond;
     ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output := ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond;
     is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output := is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- auto_advance_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_cond;
     auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output := auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_cond;
     is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output := is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- color_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_color_MUX_uxn_device_h_l175_c2_a72a_cond;
     color_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_color_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     color_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_color_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l175_c2_a72a_return_output := color_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_auto_y_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_cond;
     is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output := is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- result_MUX[uxn_device_h_l204_c7_0b39] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l204_c7_0b39_cond <= VAR_result_MUX_uxn_device_h_l204_c7_0b39_cond;
     result_MUX_uxn_device_h_l204_c7_0b39_iftrue <= VAR_result_MUX_uxn_device_h_l204_c7_0b39_iftrue;
     result_MUX_uxn_device_h_l204_c7_0b39_iffalse <= VAR_result_MUX_uxn_device_h_l204_c7_0b39_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l204_c7_0b39_return_output := result_MUX_uxn_device_h_l204_c7_0b39_return_output;

     -- layer_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_layer_MUX_uxn_device_h_l175_c2_a72a_cond;
     layer_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     layer_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_layer_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l175_c2_a72a_return_output := layer_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_auto_x_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_cond;
     is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output := is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- ctrl_mode_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_cond;
     ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output := ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- flip_y_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     flip_y_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_cond;
     flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output := flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- Submodule level 9
     VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_ctrl := VAR_ctrl_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_ctrl_mode := VAR_ctrl_mode_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_flip_x := VAR_flip_x_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_flip_y := VAR_flip_y_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_is_auto_x_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_is_auto_y_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l190_c7_cb26_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_result_MUX_uxn_device_h_l200_c7_f986_iffalse := VAR_result_MUX_uxn_device_h_l204_c7_0b39_return_output;
     VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_tmp8_MUX_uxn_device_h_l190_c7_cb26_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_tmp8b_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     -- is_auto_y_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_cond;
     is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output := is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- result_MUX[uxn_device_h_l200_c7_f986] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l200_c7_f986_cond <= VAR_result_MUX_uxn_device_h_l200_c7_f986_cond;
     result_MUX_uxn_device_h_l200_c7_f986_iftrue <= VAR_result_MUX_uxn_device_h_l200_c7_f986_iftrue;
     result_MUX_uxn_device_h_l200_c7_f986_iffalse <= VAR_result_MUX_uxn_device_h_l200_c7_f986_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l200_c7_f986_return_output := result_MUX_uxn_device_h_l200_c7_f986_return_output;

     -- auto_advance_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_cond;
     auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output := auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond;
     is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output := is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- is_auto_x_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_cond;
     is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output := is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- tmp8b_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_cond;
     tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output := tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- tmp8_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_cond;
     tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output := tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_cond;
     is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output := is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- Submodule level 10
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_is_auto_x := VAR_is_auto_x_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_is_auto_y := VAR_is_auto_y_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_result_MUX_uxn_device_h_l194_c7_692f_iffalse := VAR_result_MUX_uxn_device_h_l200_c7_f986_return_output;
     VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_tmp8_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_tmp8b_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     -- result_MUX[uxn_device_h_l194_c7_692f] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l194_c7_692f_cond <= VAR_result_MUX_uxn_device_h_l194_c7_692f_cond;
     result_MUX_uxn_device_h_l194_c7_692f_iftrue <= VAR_result_MUX_uxn_device_h_l194_c7_692f_iftrue;
     result_MUX_uxn_device_h_l194_c7_692f_iffalse <= VAR_result_MUX_uxn_device_h_l194_c7_692f_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l194_c7_692f_return_output := result_MUX_uxn_device_h_l194_c7_692f_return_output;

     -- is_y_in_bounds_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output := is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- tmp8b_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_cond;
     tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output := tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_cond;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output := is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- tmp8_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_cond;
     tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output := tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- Submodule level 11
     VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_is_x_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_is_y_in_bounds_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     VAR_result_MUX_uxn_device_h_l190_c7_cb26_iffalse := VAR_result_MUX_uxn_device_h_l194_c7_692f_return_output;
     VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_tmp8_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     REG_VAR_tmp8b := VAR_tmp8b_MUX_uxn_device_h_l175_c2_a72a_return_output;
     -- is_y_in_bounds_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond;
     is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output := is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- is_x_in_bounds_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_cond;
     is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output := is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- result_MUX[uxn_device_h_l190_c7_cb26] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l190_c7_cb26_cond <= VAR_result_MUX_uxn_device_h_l190_c7_cb26_cond;
     result_MUX_uxn_device_h_l190_c7_cb26_iftrue <= VAR_result_MUX_uxn_device_h_l190_c7_cb26_iftrue;
     result_MUX_uxn_device_h_l190_c7_cb26_iffalse <= VAR_result_MUX_uxn_device_h_l190_c7_cb26_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l190_c7_cb26_return_output := result_MUX_uxn_device_h_l190_c7_cb26_return_output;

     -- tmp8_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_cond;
     tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output := tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- Submodule level 12
     REG_VAR_is_x_in_bounds := VAR_is_x_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output;
     REG_VAR_is_y_in_bounds := VAR_is_y_in_bounds_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iffalse := VAR_result_MUX_uxn_device_h_l190_c7_cb26_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_device_h_l175_c2_a72a_return_output;
     -- result_MUX[uxn_device_h_l184_c7_e6b6] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l184_c7_e6b6_cond <= VAR_result_MUX_uxn_device_h_l184_c7_e6b6_cond;
     result_MUX_uxn_device_h_l184_c7_e6b6_iftrue <= VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iftrue;
     result_MUX_uxn_device_h_l184_c7_e6b6_iffalse <= VAR_result_MUX_uxn_device_h_l184_c7_e6b6_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l184_c7_e6b6_return_output := result_MUX_uxn_device_h_l184_c7_e6b6_return_output;

     -- Submodule level 13
     VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iffalse := VAR_result_MUX_uxn_device_h_l184_c7_e6b6_return_output;
     -- result_MUX[uxn_device_h_l181_c7_d2ad] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l181_c7_d2ad_cond <= VAR_result_MUX_uxn_device_h_l181_c7_d2ad_cond;
     result_MUX_uxn_device_h_l181_c7_d2ad_iftrue <= VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iftrue;
     result_MUX_uxn_device_h_l181_c7_d2ad_iffalse <= VAR_result_MUX_uxn_device_h_l181_c7_d2ad_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l181_c7_d2ad_return_output := result_MUX_uxn_device_h_l181_c7_d2ad_return_output;

     -- Submodule level 14
     VAR_result_MUX_uxn_device_h_l175_c2_a72a_iffalse := VAR_result_MUX_uxn_device_h_l181_c7_d2ad_return_output;
     -- result_MUX[uxn_device_h_l175_c2_a72a] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l175_c2_a72a_cond <= VAR_result_MUX_uxn_device_h_l175_c2_a72a_cond;
     result_MUX_uxn_device_h_l175_c2_a72a_iftrue <= VAR_result_MUX_uxn_device_h_l175_c2_a72a_iftrue;
     result_MUX_uxn_device_h_l175_c2_a72a_iffalse <= VAR_result_MUX_uxn_device_h_l175_c2_a72a_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l175_c2_a72a_return_output := result_MUX_uxn_device_h_l175_c2_a72a_return_output;

     -- Submodule level 15
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l175_c2_a72a_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l175_c2_a72a_return_output;
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
