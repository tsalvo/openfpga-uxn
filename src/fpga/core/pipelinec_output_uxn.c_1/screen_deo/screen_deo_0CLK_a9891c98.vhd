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
-- Submodules: 267
entity screen_deo_0CLK_a9891c98 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_a9891c98;
architecture arch of screen_deo_0CLK_a9891c98 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal ctrl_none : unsigned(15 downto 0) := to_unsigned(0, 16);
signal x : unsigned(15 downto 0) := to_unsigned(0, 16);
signal y : unsigned(15 downto 0) := to_unsigned(0, 16);
signal pixel : unsigned(7 downto 0) := to_unsigned(0, 8);
signal sprite : unsigned(7 downto 0) := to_unsigned(0, 8);
signal auto_advance : unsigned(7 downto 0) := to_unsigned(0, 8);
signal color : unsigned(1 downto 0) := to_unsigned(0, 2);
signal is_fill_mode : unsigned(0 downto 0) := to_unsigned(0, 1);
signal layer : unsigned(0 downto 0) := to_unsigned(0, 1);
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
vram_value => to_unsigned(0, 2),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_ctrl_none : unsigned(15 downto 0);
signal REG_COMB_x : unsigned(15 downto 0);
signal REG_COMB_y : unsigned(15 downto 0);
signal REG_COMB_pixel : unsigned(7 downto 0);
signal REG_COMB_sprite : unsigned(7 downto 0);
signal REG_COMB_auto_advance : unsigned(7 downto 0);
signal REG_COMB_color : unsigned(1 downto 0);
signal REG_COMB_is_fill_mode : unsigned(0 downto 0);
signal REG_COMB_layer : unsigned(0 downto 0);
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- printf_uxn_device_h_l41_c2_4fca[uxn_device_h_l41_c2_4fca]
signal printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l43_c6_9b04]
signal BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l52_c7_ab7d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l43_c2_ce6d]
signal y_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l43_c2_ce6d]
signal layer_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l43_c2_ce6d]
signal x_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l43_c2_ce6d]
signal is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l43_c2_ce6d]
signal auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l43_c2_ce6d]
signal result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l43_c2_ce6d]
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l43_c2_ce6d]
signal result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l43_c2_ce6d]
signal result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l43_c2_ce6d]
signal result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l43_c2_ce6d]
signal result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l43_c2_ce6d]
signal result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l43_c2_ce6d]
signal pixel_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l43_c2_ce6d]
signal color_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l43_c2_ce6d]
signal sprite_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l44_c7_2599]
signal BIN_OP_EQ_uxn_device_h_l44_c7_2599_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c7_2599_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l44_c3_3147]
signal result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l44_c3_3147]
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l44_c3_3147]
signal result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l52_c11_bf1f]
signal BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l59_c7_5f78]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l52_c7_ab7d]
signal y_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l52_c7_ab7d]
signal layer_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l52_c7_ab7d]
signal x_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l52_c7_ab7d]
signal is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l52_c7_ab7d]
signal auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l52_c7_ab7d]
signal result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l52_c7_ab7d]
signal result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l52_c7_ab7d]
signal result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l52_c7_ab7d]
signal result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l52_c7_ab7d]
signal result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l52_c7_ab7d]
signal result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l52_c7_ab7d]
signal pixel_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l52_c7_ab7d]
signal color_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l52_c7_ab7d]
signal sprite_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c7_bd4a]
signal BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c3_a5bb]
signal result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c3_a5bb]
signal result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l59_c11_a5bb]
signal BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l70_c7_c08e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l59_c7_5f78]
signal y_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(15 downto 0);

-- layer_MUX[uxn_device_h_l59_c7_5f78]
signal layer_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l59_c7_5f78]
signal x_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l59_c7_5f78]
signal is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l59_c7_5f78]
signal auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l59_c7_5f78]
signal result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l59_c7_5f78]
signal result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l59_c7_5f78]
signal result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l59_c7_5f78]
signal result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l59_c7_5f78]
signal result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l59_c7_5f78]
signal result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l59_c7_5f78]
signal pixel_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l59_c7_5f78]
signal color_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l59_c7_5f78]
signal sprite_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l60_c7_ac24]
signal BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l60_c3_f433]
signal layer_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l60_c3_f433]
signal is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l60_c3_f433]
signal result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l60_c3_f433]
signal result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l60_c3_f433]
signal pixel_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l60_c3_f433]
signal color_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_device_h_l63_c20_a54b]
signal BIN_OP_AND_uxn_device_h_l63_c20_a54b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l63_c20_a54b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l63_c20_aea7]
signal BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l63_c20_371b]
signal MUX_uxn_device_h_l63_c20_371b_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l63_c20_371b_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l63_c20_371b_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l63_c20_371b_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l64_c13_943e]
signal BIN_OP_AND_uxn_device_h_l64_c13_943e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l64_c13_943e_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l64_c13_7c6f]
signal MUX_uxn_device_h_l64_c13_7c6f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l64_c13_7c6f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l64_c13_7c6f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l64_c13_7c6f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l70_c11_74ef]
signal BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l77_c7_6f0a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l70_c7_c08e]
signal y_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l70_c7_c08e]
signal x_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l70_c7_c08e]
signal auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l70_c7_c08e]
signal result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l70_c7_c08e]
signal result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l70_c7_c08e]
signal result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l70_c7_c08e]
signal result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l70_c7_c08e]
signal result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l70_c7_c08e]
signal result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l70_c7_c08e]
signal sprite_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l71_c7_031d]
signal BIN_OP_EQ_uxn_device_h_l71_c7_031d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c7_031d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l71_c3_2c9b]
signal result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l71_c3_2c9b]
signal result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l77_c11_8aa7]
signal BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l85_c7_0a29]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l77_c7_6f0a]
signal y_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l77_c7_6f0a]
signal x_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l77_c7_6f0a]
signal auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l77_c7_6f0a]
signal result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l77_c7_6f0a]
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l77_c7_6f0a]
signal result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l77_c7_6f0a]
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l77_c7_6f0a]
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l77_c7_6f0a]
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l77_c7_6f0a]
signal sprite_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l78_c7_0efc]
signal BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l78_c3_f82b]
signal result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l78_c3_f82b]
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l78_c3_f82b]
signal sprite_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l85_c11_dbbd]
signal BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l92_c7_61f4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l85_c7_0a29]
signal y_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l85_c7_0a29]
signal x_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l85_c7_0a29]
signal auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l85_c7_0a29]
signal result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l85_c7_0a29]
signal result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l85_c7_0a29]
signal result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l85_c7_0a29]
signal result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l85_c7_0a29]
signal result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l85_c7_0a29]
signal result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l86_c7_0536]
signal BIN_OP_EQ_uxn_device_h_l86_c7_0536_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_0536_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l86_c3_e302]
signal result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l86_c3_e302]
signal result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l92_c11_db8d]
signal BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_8064]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l92_c7_61f4]
signal y_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l92_c7_61f4]
signal x_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l92_c7_61f4]
signal auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l92_c7_61f4]
signal result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l92_c7_61f4]
signal result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l92_c7_61f4]
signal result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l92_c7_61f4]
signal result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l92_c7_61f4]
signal result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l92_c7_61f4]
signal result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l93_c7_a149]
signal BIN_OP_EQ_uxn_device_h_l93_c7_a149_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c7_a149_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l93_c3_a397]
signal x_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l93_c3_a397]
signal result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l93_c3_a397]
signal result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l101_c11_9568]
signal BIN_OP_EQ_uxn_device_h_l101_c11_9568_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_9568_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_636c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l101_c7_8064]
signal y_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l101_c7_8064]
signal x_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l101_c7_8064]
signal auto_advance_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l101_c7_8064]
signal result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l101_c7_8064]
signal result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l101_c7_8064]
signal result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l101_c7_8064]
signal result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l101_c7_8064]
signal result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l101_c7_8064]
signal result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l102_c7_8571]
signal BIN_OP_EQ_uxn_device_h_l102_c7_8571_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c7_8571_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l102_c3_d991]
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l102_c3_d991]
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c11_816c]
signal BIN_OP_EQ_uxn_device_h_l108_c11_816c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_816c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_c157]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l108_c7_636c]
signal y_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l108_c7_636c]
signal x_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l108_c7_636c]
signal auto_advance_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l108_c7_636c]
signal result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l108_c7_636c]
signal result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l108_c7_636c]
signal result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l108_c7_636c]
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c7_636c]
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c7_636c]
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c7_f52b]
signal BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l109_c3_d2ac]
signal x_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l109_c3_d2ac]
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l109_c3_d2ac]
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l110_c4_c183]
signal BIN_OP_OR_uxn_device_h_l110_c4_c183_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l110_c4_c183_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_0f5a]
signal BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l123_c7_6d72]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l116_c7_c157]
signal y_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_c157]
signal auto_advance_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_c157]
signal result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l116_c7_c157]
signal result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_c157]
signal result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_c157]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_c157]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_c157]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_52fb]
signal BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_edd3]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_edd3]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l123_c11_4eff]
signal BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_90e8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l123_c7_6d72]
signal y_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l123_c7_6d72]
signal auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l123_c7_6d72]
signal result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l123_c7_6d72]
signal result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l123_c7_6d72]
signal result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l123_c7_6d72]
signal result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l123_c7_6d72]
signal result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l123_c7_6d72]
signal result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c7_d3c2]
signal BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c3_83fb]
signal y_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c3_83fb]
signal result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c3_83fb]
signal result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l132_c11_c809]
signal BIN_OP_EQ_uxn_device_h_l132_c11_c809_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_c809_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_abec]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l132_c7_90e8]
signal y_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l132_c7_90e8]
signal auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l132_c7_90e8]
signal result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l132_c7_90e8]
signal result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l132_c7_90e8]
signal result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l132_c7_90e8]
signal result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l132_c7_90e8]
signal result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l132_c7_90e8]
signal result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c7_415e]
signal BIN_OP_EQ_uxn_device_h_l133_c7_415e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c7_415e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l133_c3_bcff]
signal result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c3_bcff]
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l139_c11_f921]
signal BIN_OP_EQ_uxn_device_h_l139_c11_f921_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_f921_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l147_c7_567a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l139_c7_abec]
signal y_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l139_c7_abec]
signal auto_advance_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l139_c7_abec]
signal result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l139_c7_abec]
signal result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l139_c7_abec]
signal result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l139_c7_abec]
signal result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l139_c7_abec]
signal result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l139_c7_abec]
signal result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l140_c7_27a3]
signal BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l140_c3_93c6]
signal y_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l140_c3_93c6]
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l140_c3_93c6]
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l141_c4_df61]
signal BIN_OP_OR_uxn_device_h_l141_c4_df61_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l141_c4_df61_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l147_c11_f1a6]
signal BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l155_c7_2782]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l147_c7_567a]
signal auto_advance_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l147_c7_567a]
signal result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l147_c7_567a]
signal result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l147_c7_567a]
signal result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l147_c7_567a]
signal result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l147_c7_567a]
signal result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l147_c7_567a]
signal result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l148_c7_31c7]
signal BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l148_c3_e4b4]
signal result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l148_c3_e4b4]
signal result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l149_c27_deb6]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l149_c27_7fd7]
signal BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l149_c27_0aa9]
signal BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l149_c27_10b0]
signal MUX_uxn_device_h_l149_c27_10b0_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c27_10b0_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c27_10b0_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l149_c27_10b0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l155_c11_bb4c]
signal BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l155_c1_1fcc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l155_c7_2782]
signal auto_advance_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l155_c7_2782]
signal result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l155_c7_2782]
signal result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l155_c7_2782]
signal result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l155_c7_2782]
signal result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l155_c7_2782]
signal result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l155_c7_2782]
signal result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l156_c7_f866]
signal BIN_OP_EQ_uxn_device_h_l156_c7_f866_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c7_f866_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l156_c1_5b14]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l156_c3_e3c8]
signal auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l156_c3_e3c8]
signal result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l156_c3_e3c8]
signal result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l156_c3_e3c8]
signal result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l156_c3_e3c8]
signal result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l156_c3_e3c8]
signal result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l156_c3_e3c8]
signal result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);

-- printf_uxn_device_h_l157_c4_794c[uxn_device_h_l157_c4_794c]
signal printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_0245]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l162_c27_6b61]
signal BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l168_c11_63d6]
signal BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l168_c7_1373]
signal result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l168_c7_1373]
signal result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l168_c7_1373]
signal result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l168_c7_1373]
signal result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l169_c7_58b9]
signal BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l169_c3_6de2]
signal result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l169_c3_6de2]
signal result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l169_c3_6de2]
signal result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7
signal CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output : unsigned(15 downto 0);

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint4_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_d164( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.vram_address := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.vram_write_layer := ref_toks_3;
      base.vram_value := ref_toks_4;
      base.is_vram_write := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_deo_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca
printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca : entity work.printf_uxn_device_h_l41_c2_4fca_0CLK_de264c78 port map (
printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE,
printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0,
printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1);

-- BIN_OP_EQ_uxn_device_h_l43_c6_9b04
BIN_OP_EQ_uxn_device_h_l43_c6_9b04 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left,
BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right,
BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- y_MUX_uxn_device_h_l43_c2_ce6d
y_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l43_c2_ce6d_cond,
y_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
y_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
y_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- layer_MUX_uxn_device_h_l43_c2_ce6d
layer_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l43_c2_ce6d_cond,
layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
layer_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- x_MUX_uxn_device_h_l43_c2_ce6d
x_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l43_c2_ce6d_cond,
x_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
x_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
x_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d
is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond,
is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- auto_advance_MUX_uxn_device_h_l43_c2_ce6d
auto_advance_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond,
auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_vram_address_MUX_uxn_device_h_l43_c2_ce6d
result_vram_address_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d
result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d
result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_vram_value_MUX_uxn_device_h_l43_c2_ce6d
result_vram_value_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d
result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d
result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d
result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond,
result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- pixel_MUX_uxn_device_h_l43_c2_ce6d
pixel_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l43_c2_ce6d_cond,
pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- color_MUX_uxn_device_h_l43_c2_ce6d
color_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l43_c2_ce6d_cond,
color_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
color_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
color_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- sprite_MUX_uxn_device_h_l43_c2_ce6d
sprite_MUX_uxn_device_h_l43_c2_ce6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l43_c2_ce6d_cond,
sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue,
sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse,
sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output);

-- BIN_OP_EQ_uxn_device_h_l44_c7_2599
BIN_OP_EQ_uxn_device_h_l44_c7_2599 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l44_c7_2599_left,
BIN_OP_EQ_uxn_device_h_l44_c7_2599_right,
BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l44_c3_3147
result_is_deo_done_MUX_uxn_device_h_l44_c3_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond,
result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue,
result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse,
result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147
result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond,
result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l44_c3_3147
result_device_ram_address_MUX_uxn_device_h_l44_c3_3147 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond,
result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue,
result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse,
result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output);

-- BIN_OP_EQ_uxn_device_h_l52_c11_bf1f
BIN_OP_EQ_uxn_device_h_l52_c11_bf1f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left,
BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right,
BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- y_MUX_uxn_device_h_l52_c7_ab7d
y_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l52_c7_ab7d_cond,
y_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
y_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
y_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- layer_MUX_uxn_device_h_l52_c7_ab7d
layer_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l52_c7_ab7d_cond,
layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
layer_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- x_MUX_uxn_device_h_l52_c7_ab7d
x_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l52_c7_ab7d_cond,
x_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
x_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
x_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d
is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond,
is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- auto_advance_MUX_uxn_device_h_l52_c7_ab7d
auto_advance_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond,
auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_vram_address_MUX_uxn_device_h_l52_c7_ab7d
result_vram_address_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d
result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_vram_value_MUX_uxn_device_h_l52_c7_ab7d
result_vram_value_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d
result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d
result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d
result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond,
result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- pixel_MUX_uxn_device_h_l52_c7_ab7d
pixel_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l52_c7_ab7d_cond,
pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- color_MUX_uxn_device_h_l52_c7_ab7d
color_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l52_c7_ab7d_cond,
color_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
color_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
color_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- sprite_MUX_uxn_device_h_l52_c7_ab7d
sprite_MUX_uxn_device_h_l52_c7_ab7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l52_c7_ab7d_cond,
sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue,
sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse,
sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c7_bd4a
BIN_OP_EQ_uxn_device_h_l53_c7_bd4a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left,
BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right,
BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb
result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb
result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output);

-- BIN_OP_EQ_uxn_device_h_l59_c11_a5bb
BIN_OP_EQ_uxn_device_h_l59_c11_a5bb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left,
BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right,
BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- y_MUX_uxn_device_h_l59_c7_5f78
y_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l59_c7_5f78_cond,
y_MUX_uxn_device_h_l59_c7_5f78_iftrue,
y_MUX_uxn_device_h_l59_c7_5f78_iffalse,
y_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- layer_MUX_uxn_device_h_l59_c7_5f78
layer_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l59_c7_5f78_cond,
layer_MUX_uxn_device_h_l59_c7_5f78_iftrue,
layer_MUX_uxn_device_h_l59_c7_5f78_iffalse,
layer_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- x_MUX_uxn_device_h_l59_c7_5f78
x_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l59_c7_5f78_cond,
x_MUX_uxn_device_h_l59_c7_5f78_iftrue,
x_MUX_uxn_device_h_l59_c7_5f78_iffalse,
x_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- is_fill_mode_MUX_uxn_device_h_l59_c7_5f78
is_fill_mode_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond,
is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue,
is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse,
is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- auto_advance_MUX_uxn_device_h_l59_c7_5f78
auto_advance_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond,
auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue,
auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse,
auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_vram_address_MUX_uxn_device_h_l59_c7_5f78
result_vram_address_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond,
result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78
result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond,
result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_vram_value_MUX_uxn_device_h_l59_c7_5f78
result_vram_value_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond,
result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78
result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond,
result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78
result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond,
result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78
result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond,
result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue,
result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse,
result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- pixel_MUX_uxn_device_h_l59_c7_5f78
pixel_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l59_c7_5f78_cond,
pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue,
pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse,
pixel_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- color_MUX_uxn_device_h_l59_c7_5f78
color_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l59_c7_5f78_cond,
color_MUX_uxn_device_h_l59_c7_5f78_iftrue,
color_MUX_uxn_device_h_l59_c7_5f78_iffalse,
color_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- sprite_MUX_uxn_device_h_l59_c7_5f78
sprite_MUX_uxn_device_h_l59_c7_5f78 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l59_c7_5f78_cond,
sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue,
sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse,
sprite_MUX_uxn_device_h_l59_c7_5f78_return_output);

-- BIN_OP_EQ_uxn_device_h_l60_c7_ac24
BIN_OP_EQ_uxn_device_h_l60_c7_ac24 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left,
BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right,
BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output);

-- layer_MUX_uxn_device_h_l60_c3_f433
layer_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l60_c3_f433_cond,
layer_MUX_uxn_device_h_l60_c3_f433_iftrue,
layer_MUX_uxn_device_h_l60_c3_f433_iffalse,
layer_MUX_uxn_device_h_l60_c3_f433_return_output);

-- is_fill_mode_MUX_uxn_device_h_l60_c3_f433
is_fill_mode_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond,
is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue,
is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse,
is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l60_c3_f433
result_is_deo_done_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond,
result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue,
result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse,
result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l60_c3_f433
result_device_ram_address_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond,
result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue,
result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse,
result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output);

-- pixel_MUX_uxn_device_h_l60_c3_f433
pixel_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l60_c3_f433_cond,
pixel_MUX_uxn_device_h_l60_c3_f433_iftrue,
pixel_MUX_uxn_device_h_l60_c3_f433_iffalse,
pixel_MUX_uxn_device_h_l60_c3_f433_return_output);

-- color_MUX_uxn_device_h_l60_c3_f433
color_MUX_uxn_device_h_l60_c3_f433 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l60_c3_f433_cond,
color_MUX_uxn_device_h_l60_c3_f433_iftrue,
color_MUX_uxn_device_h_l60_c3_f433_iffalse,
color_MUX_uxn_device_h_l60_c3_f433_return_output);

-- BIN_OP_AND_uxn_device_h_l63_c20_a54b
BIN_OP_AND_uxn_device_h_l63_c20_a54b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l63_c20_a54b_left,
BIN_OP_AND_uxn_device_h_l63_c20_a54b_right,
BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output);

-- BIN_OP_EQ_uxn_device_h_l63_c20_aea7
BIN_OP_EQ_uxn_device_h_l63_c20_aea7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left,
BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right,
BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output);

-- MUX_uxn_device_h_l63_c20_371b
MUX_uxn_device_h_l63_c20_371b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l63_c20_371b_cond,
MUX_uxn_device_h_l63_c20_371b_iftrue,
MUX_uxn_device_h_l63_c20_371b_iffalse,
MUX_uxn_device_h_l63_c20_371b_return_output);

-- BIN_OP_AND_uxn_device_h_l64_c13_943e
BIN_OP_AND_uxn_device_h_l64_c13_943e : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l64_c13_943e_left,
BIN_OP_AND_uxn_device_h_l64_c13_943e_right,
BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output);

-- MUX_uxn_device_h_l64_c13_7c6f
MUX_uxn_device_h_l64_c13_7c6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l64_c13_7c6f_cond,
MUX_uxn_device_h_l64_c13_7c6f_iftrue,
MUX_uxn_device_h_l64_c13_7c6f_iffalse,
MUX_uxn_device_h_l64_c13_7c6f_return_output);

-- BIN_OP_EQ_uxn_device_h_l70_c11_74ef
BIN_OP_EQ_uxn_device_h_l70_c11_74ef : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left,
BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right,
BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- y_MUX_uxn_device_h_l70_c7_c08e
y_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l70_c7_c08e_cond,
y_MUX_uxn_device_h_l70_c7_c08e_iftrue,
y_MUX_uxn_device_h_l70_c7_c08e_iffalse,
y_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- x_MUX_uxn_device_h_l70_c7_c08e
x_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l70_c7_c08e_cond,
x_MUX_uxn_device_h_l70_c7_c08e_iftrue,
x_MUX_uxn_device_h_l70_c7_c08e_iffalse,
x_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- auto_advance_MUX_uxn_device_h_l70_c7_c08e
auto_advance_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond,
auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue,
auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse,
auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_vram_address_MUX_uxn_device_h_l70_c7_c08e
result_vram_address_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond,
result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e
result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond,
result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_vram_value_MUX_uxn_device_h_l70_c7_c08e
result_vram_value_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond,
result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e
result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond,
result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e
result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond,
result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e
result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond,
result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- sprite_MUX_uxn_device_h_l70_c7_c08e
sprite_MUX_uxn_device_h_l70_c7_c08e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l70_c7_c08e_cond,
sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue,
sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse,
sprite_MUX_uxn_device_h_l70_c7_c08e_return_output);

-- BIN_OP_EQ_uxn_device_h_l71_c7_031d
BIN_OP_EQ_uxn_device_h_l71_c7_031d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l71_c7_031d_left,
BIN_OP_EQ_uxn_device_h_l71_c7_031d_right,
BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b
result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond,
result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b
result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond,
result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output);

-- BIN_OP_EQ_uxn_device_h_l77_c11_8aa7
BIN_OP_EQ_uxn_device_h_l77_c11_8aa7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left,
BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right,
BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- y_MUX_uxn_device_h_l77_c7_6f0a
y_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l77_c7_6f0a_cond,
y_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
y_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
y_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- x_MUX_uxn_device_h_l77_c7_6f0a
x_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l77_c7_6f0a_cond,
x_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
x_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
x_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- auto_advance_MUX_uxn_device_h_l77_c7_6f0a
auto_advance_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond,
auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_vram_address_MUX_uxn_device_h_l77_c7_6f0a
result_vram_address_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a
result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_vram_value_MUX_uxn_device_h_l77_c7_6f0a
result_vram_value_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a
result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a
result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a
result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond,
result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- sprite_MUX_uxn_device_h_l77_c7_6f0a
sprite_MUX_uxn_device_h_l77_c7_6f0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l77_c7_6f0a_cond,
sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue,
sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse,
sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output);

-- BIN_OP_EQ_uxn_device_h_l78_c7_0efc
BIN_OP_EQ_uxn_device_h_l78_c7_0efc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left,
BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right,
BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b
result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond,
result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b
result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond,
result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output);

-- sprite_MUX_uxn_device_h_l78_c3_f82b
sprite_MUX_uxn_device_h_l78_c3_f82b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l78_c3_f82b_cond,
sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue,
sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse,
sprite_MUX_uxn_device_h_l78_c3_f82b_return_output);

-- BIN_OP_EQ_uxn_device_h_l85_c11_dbbd
BIN_OP_EQ_uxn_device_h_l85_c11_dbbd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left,
BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right,
BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- y_MUX_uxn_device_h_l85_c7_0a29
y_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l85_c7_0a29_cond,
y_MUX_uxn_device_h_l85_c7_0a29_iftrue,
y_MUX_uxn_device_h_l85_c7_0a29_iffalse,
y_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- x_MUX_uxn_device_h_l85_c7_0a29
x_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l85_c7_0a29_cond,
x_MUX_uxn_device_h_l85_c7_0a29_iftrue,
x_MUX_uxn_device_h_l85_c7_0a29_iffalse,
x_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- auto_advance_MUX_uxn_device_h_l85_c7_0a29
auto_advance_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond,
auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue,
auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse,
auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_vram_address_MUX_uxn_device_h_l85_c7_0a29
result_vram_address_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond,
result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29
result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond,
result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_vram_value_MUX_uxn_device_h_l85_c7_0a29
result_vram_value_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond,
result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29
result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond,
result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29
result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond,
result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29
result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond,
result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue,
result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse,
result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output);

-- BIN_OP_EQ_uxn_device_h_l86_c7_0536
BIN_OP_EQ_uxn_device_h_l86_c7_0536 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l86_c7_0536_left,
BIN_OP_EQ_uxn_device_h_l86_c7_0536_right,
BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l86_c3_e302
result_is_deo_done_MUX_uxn_device_h_l86_c3_e302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond,
result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue,
result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse,
result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l86_c3_e302
result_device_ram_address_MUX_uxn_device_h_l86_c3_e302 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond,
result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue,
result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse,
result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output);

-- BIN_OP_EQ_uxn_device_h_l92_c11_db8d
BIN_OP_EQ_uxn_device_h_l92_c11_db8d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left,
BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right,
BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output);

-- y_MUX_uxn_device_h_l92_c7_61f4
y_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l92_c7_61f4_cond,
y_MUX_uxn_device_h_l92_c7_61f4_iftrue,
y_MUX_uxn_device_h_l92_c7_61f4_iffalse,
y_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- x_MUX_uxn_device_h_l92_c7_61f4
x_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l92_c7_61f4_cond,
x_MUX_uxn_device_h_l92_c7_61f4_iftrue,
x_MUX_uxn_device_h_l92_c7_61f4_iffalse,
x_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- auto_advance_MUX_uxn_device_h_l92_c7_61f4
auto_advance_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond,
auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue,
auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse,
auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_vram_address_MUX_uxn_device_h_l92_c7_61f4
result_vram_address_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond,
result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4
result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond,
result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_vram_value_MUX_uxn_device_h_l92_c7_61f4
result_vram_value_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond,
result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4
result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond,
result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4
result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond,
result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4
result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond,
result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output);

-- BIN_OP_EQ_uxn_device_h_l93_c7_a149
BIN_OP_EQ_uxn_device_h_l93_c7_a149 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l93_c7_a149_left,
BIN_OP_EQ_uxn_device_h_l93_c7_a149_right,
BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output);

-- x_MUX_uxn_device_h_l93_c3_a397
x_MUX_uxn_device_h_l93_c3_a397 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l93_c3_a397_cond,
x_MUX_uxn_device_h_l93_c3_a397_iftrue,
x_MUX_uxn_device_h_l93_c3_a397_iffalse,
x_MUX_uxn_device_h_l93_c3_a397_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l93_c3_a397
result_is_deo_done_MUX_uxn_device_h_l93_c3_a397 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond,
result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue,
result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse,
result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l93_c3_a397
result_device_ram_address_MUX_uxn_device_h_l93_c3_a397 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond,
result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue,
result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse,
result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output);

-- BIN_OP_EQ_uxn_device_h_l101_c11_9568
BIN_OP_EQ_uxn_device_h_l101_c11_9568 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l101_c11_9568_left,
BIN_OP_EQ_uxn_device_h_l101_c11_9568_right,
BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output);

-- y_MUX_uxn_device_h_l101_c7_8064
y_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l101_c7_8064_cond,
y_MUX_uxn_device_h_l101_c7_8064_iftrue,
y_MUX_uxn_device_h_l101_c7_8064_iffalse,
y_MUX_uxn_device_h_l101_c7_8064_return_output);

-- x_MUX_uxn_device_h_l101_c7_8064
x_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l101_c7_8064_cond,
x_MUX_uxn_device_h_l101_c7_8064_iftrue,
x_MUX_uxn_device_h_l101_c7_8064_iffalse,
x_MUX_uxn_device_h_l101_c7_8064_return_output);

-- auto_advance_MUX_uxn_device_h_l101_c7_8064
auto_advance_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l101_c7_8064_cond,
auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue,
auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse,
auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_vram_address_MUX_uxn_device_h_l101_c7_8064
result_vram_address_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond,
result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064
result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond,
result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_vram_value_MUX_uxn_device_h_l101_c7_8064
result_vram_value_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond,
result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l101_c7_8064
result_is_vram_write_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond,
result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l101_c7_8064
result_device_ram_address_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond,
result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l101_c7_8064
result_is_deo_done_MUX_uxn_device_h_l101_c7_8064 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond,
result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue,
result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse,
result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output);

-- BIN_OP_EQ_uxn_device_h_l102_c7_8571
BIN_OP_EQ_uxn_device_h_l102_c7_8571 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l102_c7_8571_left,
BIN_OP_EQ_uxn_device_h_l102_c7_8571_right,
BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l102_c3_d991
result_is_deo_done_MUX_uxn_device_h_l102_c3_d991 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond,
result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue,
result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse,
result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l102_c3_d991
result_device_ram_address_MUX_uxn_device_h_l102_c3_d991 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond,
result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue,
result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse,
result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c11_816c
BIN_OP_EQ_uxn_device_h_l108_c11_816c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c11_816c_left,
BIN_OP_EQ_uxn_device_h_l108_c11_816c_right,
BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output);

-- y_MUX_uxn_device_h_l108_c7_636c
y_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l108_c7_636c_cond,
y_MUX_uxn_device_h_l108_c7_636c_iftrue,
y_MUX_uxn_device_h_l108_c7_636c_iffalse,
y_MUX_uxn_device_h_l108_c7_636c_return_output);

-- x_MUX_uxn_device_h_l108_c7_636c
x_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c7_636c_cond,
x_MUX_uxn_device_h_l108_c7_636c_iftrue,
x_MUX_uxn_device_h_l108_c7_636c_iffalse,
x_MUX_uxn_device_h_l108_c7_636c_return_output);

-- auto_advance_MUX_uxn_device_h_l108_c7_636c
auto_advance_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l108_c7_636c_cond,
auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue,
auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse,
auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_vram_address_MUX_uxn_device_h_l108_c7_636c
result_vram_address_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond,
result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c
result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond,
result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_vram_value_MUX_uxn_device_h_l108_c7_636c
result_vram_value_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond,
result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l108_c7_636c
result_is_vram_write_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond,
result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c7_636c
result_device_ram_address_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c7_636c
result_is_deo_done_MUX_uxn_device_h_l108_c7_636c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c7_f52b
BIN_OP_EQ_uxn_device_h_l109_c7_f52b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left,
BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right,
BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output);

-- x_MUX_uxn_device_h_l109_c3_d2ac
x_MUX_uxn_device_h_l109_c3_d2ac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l109_c3_d2ac_cond,
x_MUX_uxn_device_h_l109_c3_d2ac_iftrue,
x_MUX_uxn_device_h_l109_c3_d2ac_iffalse,
x_MUX_uxn_device_h_l109_c3_d2ac_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac
result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac
result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output);

-- BIN_OP_OR_uxn_device_h_l110_c4_c183
BIN_OP_OR_uxn_device_h_l110_c4_c183 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l110_c4_c183_left,
BIN_OP_OR_uxn_device_h_l110_c4_c183_right,
BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_0f5a
BIN_OP_EQ_uxn_device_h_l116_c11_0f5a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left,
BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right,
BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- y_MUX_uxn_device_h_l116_c7_c157
y_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_c157_cond,
y_MUX_uxn_device_h_l116_c7_c157_iftrue,
y_MUX_uxn_device_h_l116_c7_c157_iffalse,
y_MUX_uxn_device_h_l116_c7_c157_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_c157
auto_advance_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_c157_cond,
auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_c157
result_vram_address_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157
result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond,
result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_c157
result_vram_value_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_c157
result_is_vram_write_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_c157
result_device_ram_address_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_c157
result_is_deo_done_MUX_uxn_device_h_l116_c7_c157 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_52fb
BIN_OP_EQ_uxn_device_h_l117_c7_52fb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left,
BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right,
BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3
result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3
result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output);

-- BIN_OP_EQ_uxn_device_h_l123_c11_4eff
BIN_OP_EQ_uxn_device_h_l123_c11_4eff : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left,
BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right,
BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- y_MUX_uxn_device_h_l123_c7_6d72
y_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l123_c7_6d72_cond,
y_MUX_uxn_device_h_l123_c7_6d72_iftrue,
y_MUX_uxn_device_h_l123_c7_6d72_iffalse,
y_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- auto_advance_MUX_uxn_device_h_l123_c7_6d72
auto_advance_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond,
auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue,
auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse,
auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_vram_address_MUX_uxn_device_h_l123_c7_6d72
result_vram_address_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond,
result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72
result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond,
result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_vram_value_MUX_uxn_device_h_l123_c7_6d72
result_vram_value_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond,
result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72
result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond,
result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72
result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond,
result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72
result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond,
result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue,
result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse,
result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c7_d3c2
BIN_OP_EQ_uxn_device_h_l124_c7_d3c2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left,
BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right,
BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output);

-- y_MUX_uxn_device_h_l124_c3_83fb
y_MUX_uxn_device_h_l124_c3_83fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c3_83fb_cond,
y_MUX_uxn_device_h_l124_c3_83fb_iftrue,
y_MUX_uxn_device_h_l124_c3_83fb_iffalse,
y_MUX_uxn_device_h_l124_c3_83fb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb
result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb
result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output);

-- BIN_OP_EQ_uxn_device_h_l132_c11_c809
BIN_OP_EQ_uxn_device_h_l132_c11_c809 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l132_c11_c809_left,
BIN_OP_EQ_uxn_device_h_l132_c11_c809_right,
BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output);

-- y_MUX_uxn_device_h_l132_c7_90e8
y_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l132_c7_90e8_cond,
y_MUX_uxn_device_h_l132_c7_90e8_iftrue,
y_MUX_uxn_device_h_l132_c7_90e8_iffalse,
y_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- auto_advance_MUX_uxn_device_h_l132_c7_90e8
auto_advance_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond,
auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue,
auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse,
auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_vram_address_MUX_uxn_device_h_l132_c7_90e8
result_vram_address_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond,
result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8
result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond,
result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_vram_value_MUX_uxn_device_h_l132_c7_90e8
result_vram_value_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond,
result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8
result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond,
result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8
result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond,
result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8
result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond,
result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output);

-- BIN_OP_EQ_uxn_device_h_l133_c7_415e
BIN_OP_EQ_uxn_device_h_l133_c7_415e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c7_415e_left,
BIN_OP_EQ_uxn_device_h_l133_c7_415e_right,
BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff
result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond,
result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue,
result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse,
result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff
result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output);

-- BIN_OP_EQ_uxn_device_h_l139_c11_f921
BIN_OP_EQ_uxn_device_h_l139_c11_f921 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l139_c11_f921_left,
BIN_OP_EQ_uxn_device_h_l139_c11_f921_right,
BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output);

-- y_MUX_uxn_device_h_l139_c7_abec
y_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l139_c7_abec_cond,
y_MUX_uxn_device_h_l139_c7_abec_iftrue,
y_MUX_uxn_device_h_l139_c7_abec_iffalse,
y_MUX_uxn_device_h_l139_c7_abec_return_output);

-- auto_advance_MUX_uxn_device_h_l139_c7_abec
auto_advance_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l139_c7_abec_cond,
auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue,
auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse,
auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_vram_address_MUX_uxn_device_h_l139_c7_abec
result_vram_address_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond,
result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec
result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond,
result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_vram_value_MUX_uxn_device_h_l139_c7_abec
result_vram_value_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond,
result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l139_c7_abec
result_is_vram_write_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond,
result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l139_c7_abec
result_device_ram_address_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond,
result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l139_c7_abec
result_is_deo_done_MUX_uxn_device_h_l139_c7_abec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond,
result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue,
result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse,
result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output);

-- BIN_OP_EQ_uxn_device_h_l140_c7_27a3
BIN_OP_EQ_uxn_device_h_l140_c7_27a3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left,
BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right,
BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output);

-- y_MUX_uxn_device_h_l140_c3_93c6
y_MUX_uxn_device_h_l140_c3_93c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l140_c3_93c6_cond,
y_MUX_uxn_device_h_l140_c3_93c6_iftrue,
y_MUX_uxn_device_h_l140_c3_93c6_iffalse,
y_MUX_uxn_device_h_l140_c3_93c6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6
result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond,
result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6
result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond,
result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output);

-- BIN_OP_OR_uxn_device_h_l141_c4_df61
BIN_OP_OR_uxn_device_h_l141_c4_df61 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l141_c4_df61_left,
BIN_OP_OR_uxn_device_h_l141_c4_df61_right,
BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output);

-- BIN_OP_EQ_uxn_device_h_l147_c11_f1a6
BIN_OP_EQ_uxn_device_h_l147_c11_f1a6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left,
BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right,
BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output);

-- auto_advance_MUX_uxn_device_h_l147_c7_567a
auto_advance_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l147_c7_567a_cond,
auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue,
auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse,
auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_vram_address_MUX_uxn_device_h_l147_c7_567a
result_vram_address_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond,
result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a
result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond,
result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_vram_value_MUX_uxn_device_h_l147_c7_567a
result_vram_value_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond,
result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l147_c7_567a
result_is_vram_write_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond,
result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l147_c7_567a
result_device_ram_address_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond,
result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l147_c7_567a
result_is_deo_done_MUX_uxn_device_h_l147_c7_567a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond,
result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output);

-- BIN_OP_EQ_uxn_device_h_l148_c7_31c7
BIN_OP_EQ_uxn_device_h_l148_c7_31c7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left,
BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right,
BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4
result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond,
result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4
result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond,
result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7
BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left,
BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right,
BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output);

-- BIN_OP_GT_uxn_device_h_l149_c27_0aa9
BIN_OP_GT_uxn_device_h_l149_c27_0aa9 : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left,
BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right,
BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output);

-- MUX_uxn_device_h_l149_c27_10b0
MUX_uxn_device_h_l149_c27_10b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l149_c27_10b0_cond,
MUX_uxn_device_h_l149_c27_10b0_iftrue,
MUX_uxn_device_h_l149_c27_10b0_iffalse,
MUX_uxn_device_h_l149_c27_10b0_return_output);

-- BIN_OP_EQ_uxn_device_h_l155_c11_bb4c
BIN_OP_EQ_uxn_device_h_l155_c11_bb4c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left,
BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right,
BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output);

-- auto_advance_MUX_uxn_device_h_l155_c7_2782
auto_advance_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l155_c7_2782_cond,
auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue,
auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse,
auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_vram_address_MUX_uxn_device_h_l155_c7_2782
result_vram_address_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond,
result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782
result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond,
result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_vram_value_MUX_uxn_device_h_l155_c7_2782
result_vram_value_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond,
result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l155_c7_2782
result_is_vram_write_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond,
result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l155_c7_2782
result_device_ram_address_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond,
result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l155_c7_2782
result_is_deo_done_MUX_uxn_device_h_l155_c7_2782 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond,
result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue,
result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse,
result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output);

-- BIN_OP_EQ_uxn_device_h_l156_c7_f866
BIN_OP_EQ_uxn_device_h_l156_c7_f866 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l156_c7_f866_left,
BIN_OP_EQ_uxn_device_h_l156_c7_f866_right,
BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output);

-- auto_advance_MUX_uxn_device_h_l156_c3_e3c8
auto_advance_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond,
auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_vram_address_MUX_uxn_device_h_l156_c3_e3c8
result_vram_address_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8
result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_vram_value_MUX_uxn_device_h_l156_c3_e3c8
result_vram_value_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8
result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8
result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8
result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond,
result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output);

-- printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c
printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c : entity work.printf_uxn_device_h_l157_c4_794c_0CLK_de264c78 port map (
printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE,
printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0,
printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1,
printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output);

-- BIN_OP_PLUS_uxn_device_h_l162_c27_6b61
BIN_OP_PLUS_uxn_device_h_l162_c27_6b61 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left,
BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right,
BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output);

-- BIN_OP_EQ_uxn_device_h_l168_c11_63d6
BIN_OP_EQ_uxn_device_h_l168_c11_63d6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left,
BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right,
BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output);

-- result_vram_value_MUX_uxn_device_h_l168_c7_1373
result_vram_value_MUX_uxn_device_h_l168_c7_1373 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond,
result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue,
result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse,
result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output);

-- result_vram_address_MUX_uxn_device_h_l168_c7_1373
result_vram_address_MUX_uxn_device_h_l168_c7_1373 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond,
result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue,
result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse,
result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l168_c7_1373
result_is_vram_write_MUX_uxn_device_h_l168_c7_1373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond,
result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue,
result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse,
result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l168_c7_1373
result_is_deo_done_MUX_uxn_device_h_l168_c7_1373 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond,
result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue,
result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse,
result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output);

-- BIN_OP_EQ_uxn_device_h_l169_c7_58b9
BIN_OP_EQ_uxn_device_h_l169_c7_58b9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left,
BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right,
BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output);

-- result_vram_value_MUX_uxn_device_h_l169_c3_6de2
result_vram_value_MUX_uxn_device_h_l169_c3_6de2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond,
result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue,
result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse,
result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output);

-- result_vram_address_MUX_uxn_device_h_l169_c3_6de2
result_vram_address_MUX_uxn_device_h_l169_c3_6de2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond,
result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue,
result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse,
result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2
result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond,
result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7
CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x,
CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 -- Registers
 ctrl_none,
 x,
 y,
 pixel,
 sprite,
 auto_advance,
 color,
 is_fill_mode,
 layer,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 y_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 layer_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 x_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 color_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output,
 BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output,
 result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output,
 result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output,
 BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output,
 y_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 layer_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 x_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 color_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output,
 BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output,
 y_MUX_uxn_device_h_l59_c7_5f78_return_output,
 layer_MUX_uxn_device_h_l59_c7_5f78_return_output,
 x_MUX_uxn_device_h_l59_c7_5f78_return_output,
 is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output,
 auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output,
 result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output,
 pixel_MUX_uxn_device_h_l59_c7_5f78_return_output,
 color_MUX_uxn_device_h_l59_c7_5f78_return_output,
 sprite_MUX_uxn_device_h_l59_c7_5f78_return_output,
 BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output,
 layer_MUX_uxn_device_h_l60_c3_f433_return_output,
 is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output,
 result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output,
 result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output,
 pixel_MUX_uxn_device_h_l60_c3_f433_return_output,
 color_MUX_uxn_device_h_l60_c3_f433_return_output,
 BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output,
 BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output,
 MUX_uxn_device_h_l63_c20_371b_return_output,
 BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output,
 MUX_uxn_device_h_l64_c13_7c6f_return_output,
 BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 y_MUX_uxn_device_h_l70_c7_c08e_return_output,
 x_MUX_uxn_device_h_l70_c7_c08e_return_output,
 auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output,
 sprite_MUX_uxn_device_h_l70_c7_c08e_return_output,
 BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output,
 BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output,
 y_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 x_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output,
 BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output,
 sprite_MUX_uxn_device_h_l78_c3_f82b_return_output,
 BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output,
 y_MUX_uxn_device_h_l85_c7_0a29_return_output,
 x_MUX_uxn_device_h_l85_c7_0a29_return_output,
 auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output,
 result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output,
 BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output,
 result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output,
 result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output,
 BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output,
 y_MUX_uxn_device_h_l92_c7_61f4_return_output,
 x_MUX_uxn_device_h_l92_c7_61f4_return_output,
 auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output,
 BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output,
 x_MUX_uxn_device_h_l93_c3_a397_return_output,
 result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output,
 result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output,
 BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output,
 y_MUX_uxn_device_h_l101_c7_8064_return_output,
 x_MUX_uxn_device_h_l101_c7_8064_return_output,
 auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output,
 result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output,
 BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output,
 result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output,
 result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output,
 y_MUX_uxn_device_h_l108_c7_636c_return_output,
 x_MUX_uxn_device_h_l108_c7_636c_return_output,
 auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output,
 x_MUX_uxn_device_h_l109_c3_d2ac_return_output,
 result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output,
 result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output,
 BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output,
 y_MUX_uxn_device_h_l116_c7_c157_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output,
 BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output,
 y_MUX_uxn_device_h_l123_c7_6d72_return_output,
 auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output,
 result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output,
 y_MUX_uxn_device_h_l124_c3_83fb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output,
 BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output,
 y_MUX_uxn_device_h_l132_c7_90e8_return_output,
 auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output,
 BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output,
 y_MUX_uxn_device_h_l139_c7_abec_return_output,
 auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output,
 result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output,
 BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output,
 y_MUX_uxn_device_h_l140_c3_93c6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output,
 BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output,
 BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output,
 auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output,
 BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output,
 BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output,
 BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output,
 MUX_uxn_device_h_l149_c27_10b0_return_output,
 BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output,
 auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output,
 result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output,
 BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output,
 auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output,
 BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output,
 BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output,
 result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output,
 result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output,
 result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output,
 result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output,
 BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output,
 result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output,
 result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l46_c4_e6f8 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l54_c4_783b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l60_c3_f433_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l65_c4_d21b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l60_c3_f433_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l60_c3_f433_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l60_c3_f433_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l62_c12_1872_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c20_371b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c20_371b_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c20_371b_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l63_c20_371b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c13_7c6f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c13_7c6f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c13_7c6f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l64_c13_7c6f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l72_c4_1ff5 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l80_c4_ebdf : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l87_c4_44d3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l96_c4_ea09 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l103_c4_8f28 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_7769 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l118_c4_6c8b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l127_c4_90af : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l134_c4_4f78 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l142_c4_686e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l150_c4_71cb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c27_10b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c27_10b0_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c27_10b0_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l149_c27_10b0_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l162_c4_74a8 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l159_c4_2029 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l157_c91_ad16_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l162_c27_10ce_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l162_c63_f508_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l173_c4_9fb5 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l172_c4_9b02 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l43_DUPLICATE_414f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d164_uxn_device_h_l182_l34_DUPLICATE_6ec2_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_ctrl_none : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_pixel : unsigned(7 downto 0);
variable REG_VAR_sprite : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_mode : unsigned(0 downto 0);
variable REG_VAR_layer : unsigned(0 downto 0);
variable REG_VAR_result : device_out_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_ctrl_none := ctrl_none;
  REG_VAR_x := x;
  REG_VAR_y := y;
  REG_VAR_pixel := pixel;
  REG_VAR_sprite := sprite;
  REG_VAR_auto_advance := auto_advance;
  REG_VAR_color := color;
  REG_VAR_is_fill_mode := is_fill_mode;
  REG_VAR_layer := layer;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l173_c4_9fb5 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue := VAR_result_vram_value_uxn_device_h_l173_c4_9fb5;
     VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_right := to_unsigned(7, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l72_c4_1ff5 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue := VAR_result_device_ram_address_uxn_device_h_l72_c4_1ff5;
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right := to_unsigned(10, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l134_c4_4f78 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue := VAR_result_device_ram_address_uxn_device_h_l134_c4_4f78;
     VAR_MUX_uxn_device_h_l63_c20_371b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l149_c27_10b0_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_right := to_unsigned(64, 7);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l64_c13_7c6f_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l54_c4_783b := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue := VAR_result_device_ram_address_uxn_device_h_l54_c4_783b;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right := to_unsigned(13, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l96_c4_ea09 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue := VAR_result_device_ram_address_uxn_device_h_l96_c4_ea09;
     VAR_result_device_ram_address_uxn_device_h_l46_c4_e6f8 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue := VAR_result_device_ram_address_uxn_device_h_l46_c4_e6f8;
     VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l103_c4_8f28 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue := VAR_result_device_ram_address_uxn_device_h_l103_c4_8f28;
     VAR_result_device_ram_address_uxn_device_h_l118_c4_6c8b := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue := VAR_result_device_ram_address_uxn_device_h_l118_c4_6c8b;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l65_c4_d21b := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_result_device_ram_address_uxn_device_h_l65_c4_d21b;
     VAR_result_device_ram_address_uxn_device_h_l127_c4_90af := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue := VAR_result_device_ram_address_uxn_device_h_l127_c4_90af;
     VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l142_c4_686e := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue := VAR_result_device_ram_address_uxn_device_h_l142_c4_686e;
     VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_7769 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_7769;
     VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l64_c13_7c6f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right := to_unsigned(400, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right := to_unsigned(5, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l80_c4_ebdf := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue := VAR_result_device_ram_address_uxn_device_h_l80_c4_ebdf;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l63_c20_371b_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l150_c4_71cb := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue := VAR_result_device_ram_address_uxn_device_h_l150_c4_71cb;
     VAR_result_vram_address_uxn_device_h_l172_c4_9b02 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue := VAR_result_vram_address_uxn_device_h_l172_c4_9b02;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l159_c4_2029 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue := VAR_result_device_ram_address_uxn_device_h_l159_c4_2029;
     VAR_MUX_uxn_device_h_l149_c27_10b0_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_right := to_unsigned(12, 4);
     VAR_result_device_ram_address_uxn_device_h_l87_c4_44d3 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue := VAR_result_device_ram_address_uxn_device_h_l87_c4_44d3;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iftrue := color;
     VAR_color_MUX_uxn_device_h_l59_c7_5f78_iffalse := color;
     VAR_color_MUX_uxn_device_h_l60_c3_f433_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_left := VAR_device_port;
     VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse := is_fill_mode;
     VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l60_c3_f433_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left := VAR_phase;
     VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right := x;
     VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l101_c7_8064_iftrue := x;
     VAR_x_MUX_uxn_device_h_l108_c7_636c_iffalse := x;
     VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iffalse := x;
     VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l59_c7_5f78_iftrue := x;
     VAR_x_MUX_uxn_device_h_l70_c7_c08e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l85_c7_0a29_iftrue := x;
     VAR_x_MUX_uxn_device_h_l93_c3_a397_iffalse := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_left := y;
     VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l101_c7_8064_iftrue := y;
     VAR_y_MUX_uxn_device_h_l108_c7_636c_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_c157_iftrue := y;
     VAR_y_MUX_uxn_device_h_l124_c3_83fb_iffalse := y;
     VAR_y_MUX_uxn_device_h_l132_c7_90e8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l139_c7_abec_iffalse := y;
     VAR_y_MUX_uxn_device_h_l140_c3_93c6_iffalse := y;
     VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l59_c7_5f78_iftrue := y;
     VAR_y_MUX_uxn_device_h_l70_c7_c08e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l85_c7_0a29_iftrue := y;
     VAR_y_MUX_uxn_device_h_l92_c7_61f4_iftrue := y;
     -- CAST_TO_uint32_t[uxn_device_h_l162_c27_10ce] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l162_c27_10ce_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l140_c7_27a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left <= VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_left;
     BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right <= VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output := BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l169_c7_58b9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left <= VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_left;
     BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right <= VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output := BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l43_c6_9b04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left <= VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_left;
     BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right <= VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output := BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;

     -- BIN_OP_EQ[uxn_device_h_l53_c7_bd4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_left;
     BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output := BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l147_c11_f1a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left <= VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_left;
     BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right <= VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output := BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l85_c11_dbbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left <= VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_left;
     BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right <= VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output := BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c11_816c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c11_816c_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_left;
     BIN_OP_EQ_uxn_device_h_l108_c11_816c_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output := BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l139_c11_f921] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l139_c11_f921_left <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_left;
     BIN_OP_EQ_uxn_device_h_l139_c11_f921_right <= VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output := BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l62_c12_1872] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l62_c12_1872_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l117_c7_52fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l162_c63_f508] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l162_c63_f508_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l168_c11_63d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left <= VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_left;
     BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right <= VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output := BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l93_c7_a149] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l93_c7_a149_left <= VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_left;
     BIN_OP_EQ_uxn_device_h_l93_c7_a149_right <= VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output := BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output;

     -- BIN_OP_EQ[uxn_device_h_l71_c7_031d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l71_c7_031d_left <= VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_left;
     BIN_OP_EQ_uxn_device_h_l71_c7_031d_right <= VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output := BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l70_c11_74ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left <= VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_left;
     BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right <= VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output := BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;

     -- BIN_OP_EQ[uxn_device_h_l60_c7_ac24] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left <= VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_left;
     BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right <= VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output := BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;

     -- BIN_OP_EQ[uxn_device_h_l52_c11_bf1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left <= VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_left;
     BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right <= VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output := BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l43_DUPLICATE_414f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l43_DUPLICATE_414f_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l77_c11_8aa7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left <= VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_left;
     BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right <= VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output := BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l78_c7_0efc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left <= VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_left;
     BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right <= VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output := BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c7_d3c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_left;
     BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output := BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output;

     -- BIN_OP_AND[uxn_device_h_l63_c20_a54b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l63_c20_a54b_left <= VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_left;
     BIN_OP_AND_uxn_device_h_l63_c20_a54b_right <= VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output := BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l101_c11_9568] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l101_c11_9568_left <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_left;
     BIN_OP_EQ_uxn_device_h_l101_c11_9568_right <= VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output := BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;

     -- BIN_OP_EQ[uxn_device_h_l155_c11_bb4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left <= VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_left;
     BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right <= VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output := BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l102_c7_8571] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l102_c7_8571_left <= VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_left;
     BIN_OP_EQ_uxn_device_h_l102_c7_8571_right <= VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output := BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output;

     -- BIN_OP_EQ[uxn_device_h_l156_c7_f866] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l156_c7_f866_left <= VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_left;
     BIN_OP_EQ_uxn_device_h_l156_c7_f866_right <= VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output := BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_0f5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output := result.vram_value;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l132_c11_c809] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l132_c11_c809_left <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_left;
     BIN_OP_EQ_uxn_device_h_l132_c11_c809_right <= VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output := BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;

     -- BIN_OP_EQ[uxn_device_h_l86_c7_0536] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l86_c7_0536_left <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_left;
     BIN_OP_EQ_uxn_device_h_l86_c7_0536_right <= VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output := BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c7_415e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c7_415e_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_left;
     BIN_OP_EQ_uxn_device_h_l133_c7_415e_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output := BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c7_f52b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_left;
     BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output := BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l92_c11_db8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left <= VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_left;
     BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right <= VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output := BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l149_c27_deb6] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l157_c91_ad16] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l157_c91_ad16_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l44_c7_2599] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l44_c7_2599_left <= VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_left;
     BIN_OP_EQ_uxn_device_h_l44_c7_2599_right <= VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output := BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output;

     -- printf_uxn_device_h_l41_c2_4fca[uxn_device_h_l41_c2_4fca] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0 <= VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg0;
     printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1 <= VAR_printf_uxn_device_h_l41_c2_4fca_uxn_device_h_l41_c2_4fca_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l59_c11_a5bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left <= VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_left;
     BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right <= VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output := BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;

     -- BIN_OP_AND[uxn_device_h_l64_c13_943e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l64_c13_943e_left <= VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_left;
     BIN_OP_AND_uxn_device_h_l64_c13_943e_right <= VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output := BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output := result.vram_address;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l123_c11_4eff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left <= VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_left;
     BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right <= VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output := BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l148_c7_31c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_left;
     BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right <= VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output := BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left := VAR_BIN_OP_AND_uxn_device_h_l63_c20_a54b_return_output;
     VAR_MUX_uxn_device_h_l64_c13_7c6f_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l64_c13_943e_return_output, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l101_c11_9568_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond := VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond := VAR_BIN_OP_EQ_uxn_device_h_l102_c7_8571_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_636c_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_816c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output;
     VAR_x_MUX_uxn_device_h_l109_c3_d2ac_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_f52b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_c157_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0f5a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_52fb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_y_MUX_uxn_device_h_l123_c7_6d72_cond := VAR_BIN_OP_EQ_uxn_device_h_l123_c11_4eff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output;
     VAR_y_MUX_uxn_device_h_l124_c3_83fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c7_d3c2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_90e8_cond := VAR_BIN_OP_EQ_uxn_device_h_l132_c11_c809_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c7_415e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_y_MUX_uxn_device_h_l139_c7_abec_cond := VAR_BIN_OP_EQ_uxn_device_h_l139_c11_f921_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_93c6_cond := VAR_BIN_OP_EQ_uxn_device_h_l140_c7_27a3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond := VAR_BIN_OP_EQ_uxn_device_h_l147_c11_f1a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond := VAR_BIN_OP_EQ_uxn_device_h_l148_c7_31c7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond := VAR_BIN_OP_EQ_uxn_device_h_l155_c11_bb4c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l156_c7_f866_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond := VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond := VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond := VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond := VAR_BIN_OP_EQ_uxn_device_h_l168_c11_63d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c7_58b9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_color_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_x_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_y_MUX_uxn_device_h_l43_c2_ce6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l43_c6_9b04_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c7_2599_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_color_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_x_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_y_MUX_uxn_device_h_l52_c7_ab7d_cond := VAR_BIN_OP_EQ_uxn_device_h_l52_c11_bf1f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c7_bd4a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_color_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_layer_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_x_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_y_MUX_uxn_device_h_l59_c7_5f78_cond := VAR_BIN_OP_EQ_uxn_device_h_l59_c11_a5bb_return_output;
     VAR_color_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_layer_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_pixel_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond := VAR_BIN_OP_EQ_uxn_device_h_l60_c7_ac24_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_x_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_y_MUX_uxn_device_h_l70_c7_c08e_cond := VAR_BIN_OP_EQ_uxn_device_h_l70_c11_74ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond := VAR_BIN_OP_EQ_uxn_device_h_l71_c7_031d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_x_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_y_MUX_uxn_device_h_l77_c7_6f0a_cond := VAR_BIN_OP_EQ_uxn_device_h_l77_c11_8aa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond := VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond := VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output;
     VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_cond := VAR_BIN_OP_EQ_uxn_device_h_l78_c7_0efc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_x_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_y_MUX_uxn_device_h_l85_c7_0a29_cond := VAR_BIN_OP_EQ_uxn_device_h_l85_c11_dbbd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond := VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond := VAR_BIN_OP_EQ_uxn_device_h_l86_c7_0536_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_x_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_y_MUX_uxn_device_h_l92_c7_61f4_cond := VAR_BIN_OP_EQ_uxn_device_h_l92_c11_db8d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output;
     VAR_x_MUX_uxn_device_h_l93_c3_a397_cond := VAR_BIN_OP_EQ_uxn_device_h_l93_c7_a149_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l149_c27_deb6_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l110_l94_l125_l141_DUPLICATE_18a7_return_output;
     VAR_color_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l62_c12_1872_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left := VAR_CAST_TO_uint32_t_uxn_device_h_l162_c27_10ce_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right := VAR_CAST_TO_uint32_t_uxn_device_h_l162_c63_f508_return_output;
     VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l157_c91_ad16_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l124_l140_l156_l133_l78_l53_l60_l86_l93_l109_l71_l102_l117_DUPLICATE_69a7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l43_DUPLICATE_414f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l43_DUPLICATE_414f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_60c8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l59_l108_l155_l52_l101_l147_DUPLICATE_8c70_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_cdd1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l92_l43_l139_l156_l85_l132_l77_l123_l70_l116_l168_l59_l108_l52_l169_l101_l147_DUPLICATE_6c12_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l124_l44_l140_l156_l133_l78_l148_l53_l60_l86_l93_l109_l71_l155_l102_l117_DUPLICATE_8d93_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l53_c3_a5bb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l44_c3_3147] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output := result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_edd3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l93_c3_a397] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_cond;
     result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output := result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l109_c3_d2ac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_cond;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output := result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_0245] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l86_c3_e302] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_cond;
     result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output := result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l109_c3_d2ac] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_cond;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output := result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l71_c3_2c9b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_cond;
     result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output := result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_cond;
     result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output := result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c3_bcff] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l78_c3_f82b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_cond;
     result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output := result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output;

     -- BIN_OP_OR[uxn_device_h_l110_c4_c183] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l110_c4_c183_left <= VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_left;
     BIN_OP_OR_uxn_device_h_l110_c4_c183_right <= VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output := BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output;

     -- sprite_MUX[uxn_device_h_l78_c3_f82b] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l78_c3_f82b_cond <= VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_cond;
     sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue <= VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iftrue;
     sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse <= VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_return_output := sprite_MUX_uxn_device_h_l78_c3_f82b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l93_c3_a397] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_cond;
     result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output := result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output;

     -- BIN_OP_OR[uxn_device_h_l141_c4_df61] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l141_c4_df61_left <= VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_left;
     BIN_OP_OR_uxn_device_h_l141_c4_df61_right <= VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output := BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output;

     -- result_vram_address_MUX[uxn_device_h_l169_c3_6de2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_cond;
     result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iftrue;
     result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output := result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output;

     -- color_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_color_MUX_uxn_device_h_l60_c3_f433_cond;
     color_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_color_MUX_uxn_device_h_l60_c3_f433_iftrue;
     color_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_color_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l60_c3_f433_return_output := color_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l44_c3_3147] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_cond;
     result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output := result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l168_c7_1373] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_cond;
     result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output := result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l140_c3_93c6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_cond;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output := result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l53_c3_a5bb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_edd3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l78_c3_f82b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_cond;
     result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output := result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l71_c3_2c9b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_cond;
     result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output := result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l86_c3_e302] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_cond;
     result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output := result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l169_c3_6de2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_cond;
     result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output := result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l102_c3_d991] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_cond;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output := result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l140_c3_93c6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_cond;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output := result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l149_c27_7fd7] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_left;
     BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right <= VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output := BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l63_c20_aea7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left <= VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_left;
     BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right <= VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output := BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l169_c3_6de2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_cond;
     result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iftrue;
     result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output := result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l102_c3_d991] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_cond;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output := result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output;

     -- pixel_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_pixel_MUX_uxn_device_h_l60_c3_f433_cond;
     pixel_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iftrue;
     pixel_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_pixel_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l60_c3_f433_return_output := pixel_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_cond;
     result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output := result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c3_83fb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output;

     -- MUX[uxn_device_h_l64_c13_7c6f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l64_c13_7c6f_cond <= VAR_MUX_uxn_device_h_l64_c13_7c6f_cond;
     MUX_uxn_device_h_l64_c13_7c6f_iftrue <= VAR_MUX_uxn_device_h_l64_c13_7c6f_iftrue;
     MUX_uxn_device_h_l64_c13_7c6f_iffalse <= VAR_MUX_uxn_device_h_l64_c13_7c6f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l64_c13_7c6f_return_output := MUX_uxn_device_h_l64_c13_7c6f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l148_c3_e4b4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_cond;
     result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output := result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l133_c3_bcff] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_cond;
     result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output := result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output;

     -- auto_advance_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_cond;
     auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output := auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l44_c3_3147] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_cond;
     result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output := result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output := CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c3_83fb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output;

     -- result_vram_value_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l63_c20_371b_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c20_aea7_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_0245_return_output;
     VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iftrue := VAR_BIN_OP_OR_uxn_device_h_l110_c4_c183_return_output;
     VAR_y_MUX_uxn_device_h_l140_c3_93c6_iftrue := VAR_BIN_OP_OR_uxn_device_h_l141_c4_df61_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left := VAR_BIN_OP_PLUS_uxn_device_h_l149_c27_7fd7_return_output;
     VAR_x_MUX_uxn_device_h_l93_c3_a397_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output;
     VAR_y_MUX_uxn_device_h_l124_c3_83fb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l126_l95_DUPLICATE_21e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_layer_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_MUX_uxn_device_h_l64_c13_7c6f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_auto_advance_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_color_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_color_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_pixel_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l102_c3_d991_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d2ac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_edd3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c3_83fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l133_c3_bcff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l140_c3_93c6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l148_c3_e4b4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l44_c3_3147_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c3_a5bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l71_c3_2c9b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l78_c3_f82b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l86_c3_e302_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l93_c3_a397_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l102_c3_d991_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d2ac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_edd3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c3_83fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l133_c3_bcff_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l140_c3_93c6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l168_c7_1373_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l44_c3_3147_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c3_a5bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l71_c3_2c9b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l78_c3_f82b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l86_c3_e302_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l93_c3_a397_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c3_3147_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l169_c3_6de2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l169_c3_6de2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l169_c3_6de2_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue := VAR_sprite_MUX_uxn_device_h_l78_c3_f82b_return_output;
     -- color_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_color_MUX_uxn_device_h_l59_c7_5f78_cond;
     color_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_color_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     color_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_color_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l59_c7_5f78_return_output := color_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- y_MUX[uxn_device_h_l140_c3_93c6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l140_c3_93c6_cond <= VAR_y_MUX_uxn_device_h_l140_c3_93c6_cond;
     y_MUX_uxn_device_h_l140_c3_93c6_iftrue <= VAR_y_MUX_uxn_device_h_l140_c3_93c6_iftrue;
     y_MUX_uxn_device_h_l140_c3_93c6_iffalse <= VAR_y_MUX_uxn_device_h_l140_c3_93c6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l140_c3_93c6_return_output := y_MUX_uxn_device_h_l140_c3_93c6_return_output;

     -- BIN_OP_GT[uxn_device_h_l149_c27_0aa9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left <= VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_left;
     BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right <= VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output := BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_cond;
     result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output := result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l168_c7_1373] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_cond;
     result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output := result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output;

     -- result_vram_value_MUX[uxn_device_h_l168_c7_1373] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond <= VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_cond;
     result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iftrue;
     result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output := result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output;

     -- result_vram_address_MUX[uxn_device_h_l168_c7_1373] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond <= VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_cond;
     result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iftrue;
     result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output := result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output;

     -- pixel_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_cond;
     pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_return_output := pixel_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_cond;
     result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output := result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_cond;
     result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output := result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- sprite_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_cond;
     sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output := sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- auto_advance_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_cond;
     auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iftrue;
     auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output := auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- layer_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_layer_MUX_uxn_device_h_l60_c3_f433_cond;
     layer_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_layer_MUX_uxn_device_h_l60_c3_f433_iftrue;
     layer_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_layer_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l60_c3_f433_return_output := layer_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- y_MUX[uxn_device_h_l124_c3_83fb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c3_83fb_cond <= VAR_y_MUX_uxn_device_h_l124_c3_83fb_cond;
     y_MUX_uxn_device_h_l124_c3_83fb_iftrue <= VAR_y_MUX_uxn_device_h_l124_c3_83fb_iftrue;
     y_MUX_uxn_device_h_l124_c3_83fb_iffalse <= VAR_y_MUX_uxn_device_h_l124_c3_83fb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c3_83fb_return_output := y_MUX_uxn_device_h_l124_c3_83fb_return_output;

     -- x_MUX[uxn_device_h_l109_c3_d2ac] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l109_c3_d2ac_cond <= VAR_x_MUX_uxn_device_h_l109_c3_d2ac_cond;
     x_MUX_uxn_device_h_l109_c3_d2ac_iftrue <= VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iftrue;
     x_MUX_uxn_device_h_l109_c3_d2ac_iffalse <= VAR_x_MUX_uxn_device_h_l109_c3_d2ac_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l109_c3_d2ac_return_output := x_MUX_uxn_device_h_l109_c3_d2ac_return_output;

     -- x_MUX[uxn_device_h_l93_c3_a397] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l93_c3_a397_cond <= VAR_x_MUX_uxn_device_h_l93_c3_a397_cond;
     x_MUX_uxn_device_h_l93_c3_a397_iftrue <= VAR_x_MUX_uxn_device_h_l93_c3_a397_iftrue;
     x_MUX_uxn_device_h_l93_c3_a397_iffalse <= VAR_x_MUX_uxn_device_h_l93_c3_a397_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l93_c3_a397_return_output := x_MUX_uxn_device_h_l93_c3_a397_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l162_c27_6b61] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_left;
     BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output := BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output;

     -- MUX[uxn_device_h_l63_c20_371b] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l63_c20_371b_cond <= VAR_MUX_uxn_device_h_l63_c20_371b_cond;
     MUX_uxn_device_h_l63_c20_371b_iftrue <= VAR_MUX_uxn_device_h_l63_c20_371b_iftrue;
     MUX_uxn_device_h_l63_c20_371b_iffalse <= VAR_MUX_uxn_device_h_l63_c20_371b_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l63_c20_371b_return_output := MUX_uxn_device_h_l63_c20_371b_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l149_c27_10b0_cond := VAR_BIN_OP_GT_uxn_device_h_l149_c27_0aa9_return_output;
     VAR_result_vram_address_uxn_device_h_l162_c4_74a8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_6b61_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue := VAR_MUX_uxn_device_h_l63_c20_371b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_color_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_layer_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_pixel_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l168_c7_1373_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l168_c7_1373_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l168_c7_1373_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_sprite_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_636c_iftrue := VAR_x_MUX_uxn_device_h_l109_c3_d2ac_return_output;
     VAR_x_MUX_uxn_device_h_l92_c7_61f4_iftrue := VAR_x_MUX_uxn_device_h_l93_c3_a397_return_output;
     VAR_y_MUX_uxn_device_h_l123_c7_6d72_iftrue := VAR_y_MUX_uxn_device_h_l124_c3_83fb_return_output;
     VAR_y_MUX_uxn_device_h_l139_c7_abec_iftrue := VAR_y_MUX_uxn_device_h_l140_c3_93c6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue := VAR_result_vram_address_uxn_device_h_l162_c4_74a8;
     -- MUX[uxn_device_h_l149_c27_10b0] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l149_c27_10b0_cond <= VAR_MUX_uxn_device_h_l149_c27_10b0_cond;
     MUX_uxn_device_h_l149_c27_10b0_iftrue <= VAR_MUX_uxn_device_h_l149_c27_10b0_iftrue;
     MUX_uxn_device_h_l149_c27_10b0_iffalse <= VAR_MUX_uxn_device_h_l149_c27_10b0_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l149_c27_10b0_return_output := MUX_uxn_device_h_l149_c27_10b0_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l60_c3_f433] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_cond;
     is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iftrue;
     is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output := is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output := result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- y_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_y_MUX_uxn_device_h_l139_c7_abec_cond;
     y_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_y_MUX_uxn_device_h_l139_c7_abec_iftrue;
     y_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_y_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l139_c7_abec_return_output := y_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- pixel_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_cond;
     pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output := pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- color_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_color_MUX_uxn_device_h_l52_c7_ab7d_cond;
     color_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     color_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_color_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l52_c7_ab7d_return_output := color_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_cond;
     result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output := result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- sprite_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_cond;
     sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_return_output := sprite_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_cond;
     result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output := result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- x_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_x_MUX_uxn_device_h_l108_c7_636c_cond;
     x_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_x_MUX_uxn_device_h_l108_c7_636c_iftrue;
     x_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_x_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c7_636c_return_output := x_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- result_vram_value_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_cond;
     result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output := result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- layer_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_layer_MUX_uxn_device_h_l59_c7_5f78_cond;
     layer_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     layer_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l59_c7_5f78_return_output := layer_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- auto_advance_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_cond;
     auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iftrue;
     auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output := auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l156_c3_e3c8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_cond;
     result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iftrue;
     result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output := result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue := VAR_MUX_uxn_device_h_l149_c27_10b0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_auto_advance_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_color_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l60_c3_f433_return_output;
     VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_layer_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_pixel_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l156_c3_e3c8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_sprite_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_x_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_x_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_y_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_y_MUX_uxn_device_h_l139_c7_abec_return_output;
     -- x_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_x_MUX_uxn_device_h_l101_c7_8064_cond;
     x_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_x_MUX_uxn_device_h_l101_c7_8064_iftrue;
     x_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_x_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l101_c7_8064_return_output := x_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_cond;
     result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output := result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- sprite_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_cond;
     sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_return_output := sprite_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- auto_advance_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_cond;
     auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iftrue;
     auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output := auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- layer_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_cond;
     layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output := layer_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- y_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_y_MUX_uxn_device_h_l132_c7_90e8_cond;
     y_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_y_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     y_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_y_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l132_c7_90e8_return_output := y_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- pixel_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_cond;
     pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output := pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_cond;
     result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output := result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- result_vram_address_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_cond;
     result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iftrue;
     result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output := result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l148_c3_e4b4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_cond;
     result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output := result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output;

     -- color_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_color_MUX_uxn_device_h_l43_c2_ce6d_cond;
     color_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     color_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_color_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l43_c2_ce6d_return_output := color_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_cond;
     is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output := is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_cond;
     result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output := result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- result_vram_value_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_cond;
     result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output := result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l139_c7_abec_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l148_c3_e4b4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_sprite_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_x_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_x_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_y_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_y_MUX_uxn_device_h_l132_c7_90e8_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_cond;
     is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output := is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output := result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- y_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_y_MUX_uxn_device_h_l123_c7_6d72_cond;
     y_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_y_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     y_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_y_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l123_c7_6d72_return_output := y_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- result_vram_address_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_cond;
     result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output := result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- sprite_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_cond;
     sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output := sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- auto_advance_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_cond;
     auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output := auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output := result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- layer_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_cond;
     layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output := layer_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_cond;
     result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output := result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- x_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_x_MUX_uxn_device_h_l92_c7_61f4_cond;
     x_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_x_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     x_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_x_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l92_c7_61f4_return_output := x_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_cond;
     result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output := result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_cond;
     result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output := result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_auto_advance_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_sprite_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_x_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_x_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_y_MUX_uxn_device_h_l123_c7_6d72_return_output;
     -- result_vram_address_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_cond;
     result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output := result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output := result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- y_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_y_MUX_uxn_device_h_l116_c7_c157_cond;
     y_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_c157_iftrue;
     y_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_c157_return_output := y_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output := result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- x_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_x_MUX_uxn_device_h_l85_c7_0a29_cond;
     x_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_x_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     x_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_x_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l85_c7_0a29_return_output := x_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_cond;
     is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output := is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output := result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_cond;
     result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output := result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- sprite_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_cond;
     sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output := sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- auto_advance_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_cond;
     auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output := auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output := result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_auto_advance_MUX_uxn_device_h_l123_c7_6d72_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l123_c7_6d72_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_x_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_c157_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_cond;
     result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output := result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_vram_value_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output := result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output := auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output := result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- x_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_x_MUX_uxn_device_h_l77_c7_6f0a_cond;
     x_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     x_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_x_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l77_c7_6f0a_return_output := x_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_cond;
     result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output := result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- y_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_y_MUX_uxn_device_h_l108_c7_636c_cond;
     y_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_y_MUX_uxn_device_h_l108_c7_636c_iftrue;
     y_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_y_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l108_c7_636c_return_output := y_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output := result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_x_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_x_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_y_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_y_MUX_uxn_device_h_l108_c7_636c_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_cond;
     result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output := result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- x_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_x_MUX_uxn_device_h_l70_c7_c08e_cond;
     x_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_x_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     x_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_x_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l70_c7_c08e_return_output := x_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output := result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- auto_advance_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_cond;
     auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iftrue;
     auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output := auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- result_vram_address_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_cond;
     result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output := result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- y_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_y_MUX_uxn_device_h_l101_c7_8064_cond;
     y_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_y_MUX_uxn_device_h_l101_c7_8064_iftrue;
     y_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_y_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l101_c7_8064_return_output := y_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_auto_advance_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_x_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_x_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_y_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_y_MUX_uxn_device_h_l101_c7_8064_return_output;
     -- result_vram_value_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_cond;
     result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output := result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_cond;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output := result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- auto_advance_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_cond;
     auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iftrue;
     auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output := auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_cond;
     result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output := result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- x_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_x_MUX_uxn_device_h_l59_c7_5f78_cond;
     x_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_x_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     x_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_x_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l59_c7_5f78_return_output := x_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- y_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_y_MUX_uxn_device_h_l92_c7_61f4_cond;
     y_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_y_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     y_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_y_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l92_c7_61f4_return_output := y_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_cond;
     result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output := result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_c157] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_c157_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_x_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_y_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_y_MUX_uxn_device_h_l92_c7_61f4_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output := result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_cond;
     result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output := result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l123_c7_6d72] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output;

     -- y_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_y_MUX_uxn_device_h_l85_c7_0a29_cond;
     y_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_y_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     y_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_y_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l85_c7_0a29_return_output := y_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c7_636c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output;

     -- auto_advance_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_cond;
     auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output := auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output := result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_cond;
     result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output := result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_cond;
     result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output := result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- x_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_x_MUX_uxn_device_h_l52_c7_ab7d_cond;
     x_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     x_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_x_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l52_c7_ab7d_return_output := x_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l123_c7_6d72_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_auto_advance_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l108_c7_636c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_x_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_y_MUX_uxn_device_h_l85_c7_0a29_return_output;
     -- result_vram_write_layer_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output := result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- x_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_x_MUX_uxn_device_h_l43_c2_ce6d_cond;
     x_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     x_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_x_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l43_c2_ce6d_return_output := x_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output := result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_cond;
     result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output := result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l132_c7_90e8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output := result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output := result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l101_c7_8064] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_cond;
     result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output := result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output;

     -- y_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_y_MUX_uxn_device_h_l77_c7_6f0a_cond;
     y_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     y_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_y_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l77_c7_6f0a_return_output := y_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- auto_advance_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_cond;
     auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output := auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l132_c7_90e8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l101_c7_8064_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l85_c7_0a29_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_y_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_y_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     -- y_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_y_MUX_uxn_device_h_l70_c7_c08e_cond;
     y_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_y_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     y_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_y_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l70_c7_c08e_return_output := y_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output := result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output := result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- auto_advance_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_cond;
     auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output := auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l139_c7_abec] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output;

     -- result_vram_address_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output := result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l92_c7_61f4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_cond;
     result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output := result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l139_c7_abec_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l92_c7_61f4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_y_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_y_MUX_uxn_device_h_l70_c7_c08e_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output := result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- y_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_y_MUX_uxn_device_h_l59_c7_5f78_cond;
     y_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_y_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     y_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_y_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l59_c7_5f78_return_output := y_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output := result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output := result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- auto_advance_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_cond;
     auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output := auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l147_c7_567a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l85_c7_0a29] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond <= VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_cond;
     result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iftrue;
     result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output := result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l147_c7_567a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_auto_advance_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l85_c7_0a29_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_y_MUX_uxn_device_h_l59_c7_5f78_return_output;
     -- result_vram_address_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l77_c7_6f0a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_cond;
     result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output := result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output := result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output := result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- auto_advance_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_cond;
     auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output := auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l155_c7_2782] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output;

     -- y_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_y_MUX_uxn_device_h_l52_c7_ab7d_cond;
     y_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     y_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_y_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l52_c7_ab7d_return_output := y_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output := result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output := result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c7_2782_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l77_c7_6f0a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_y_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output := result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- y_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_y_MUX_uxn_device_h_l43_c2_ce6d_cond;
     y_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     y_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_y_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l43_c2_ce6d_return_output := y_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output := result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- auto_advance_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_cond;
     auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output := auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l70_c7_c08e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_cond;
     result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output := result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l155_c1_1fcc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output;

     -- result_vram_value_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output := result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l155_c1_1fcc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l70_c7_c08e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output := result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_vram_value_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l156_c1_5b14] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- auto_advance_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_cond;
     auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output := auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l59_c7_5f78] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond <= VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_cond;
     result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iftrue;
     result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output := result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l156_c1_5b14_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l43_c2_ce6d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l59_c7_5f78_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     -- result_vram_value_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- printf_uxn_device_h_l157_c4_794c[uxn_device_h_l157_c4_794c] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0 <= VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg0;
     printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1 <= VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg1;
     printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2 <= VAR_printf_uxn_device_h_l157_c4_794c_uxn_device_h_l157_c4_794c_arg2;
     -- Outputs

     -- result_vram_address_MUX[uxn_device_h_l52_c7_ab7d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_cond;
     result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iftrue;
     result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output := result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l52_c7_ab7d_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l43_c2_ce6d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_cond;
     result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iftrue;
     result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output := result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_d164_uxn_device_h_l182_l34_DUPLICATE_6ec2 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d164_uxn_device_h_l182_l34_DUPLICATE_6ec2_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_d164(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l43_c2_ce6d_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l43_c2_ce6d_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d164_uxn_device_h_l182_l34_DUPLICATE_6ec2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_d164_uxn_device_h_l182_l34_DUPLICATE_6ec2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_ctrl_none <= REG_VAR_ctrl_none;
REG_COMB_x <= REG_VAR_x;
REG_COMB_y <= REG_VAR_y;
REG_COMB_pixel <= REG_VAR_pixel;
REG_COMB_sprite <= REG_VAR_sprite;
REG_COMB_auto_advance <= REG_VAR_auto_advance;
REG_COMB_color <= REG_VAR_color;
REG_COMB_is_fill_mode <= REG_VAR_is_fill_mode;
REG_COMB_layer <= REG_VAR_layer;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     ctrl_none <= REG_COMB_ctrl_none;
     x <= REG_COMB_x;
     y <= REG_COMB_y;
     pixel <= REG_COMB_pixel;
     sprite <= REG_COMB_sprite;
     auto_advance <= REG_COMB_auto_advance;
     color <= REG_COMB_color;
     is_fill_mode <= REG_COMB_is_fill_mode;
     layer <= REG_COMB_layer;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
