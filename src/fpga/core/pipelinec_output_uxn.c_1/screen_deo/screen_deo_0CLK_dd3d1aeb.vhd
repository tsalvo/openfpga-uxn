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
-- Submodules: 275
entity screen_deo_0CLK_dd3d1aeb is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_dd3d1aeb;
architecture arch of screen_deo_0CLK_dd3d1aeb is
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
signal result : device_out_result_t := (
is_device_ram_write => to_unsigned(0, 1),
is_device_ram_read => to_unsigned(0, 1),
device_ram_address => to_unsigned(0, 8),
device_ram_value => to_unsigned(0, 8),
is_vram_write => to_unsigned(0, 1),
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
signal REG_COMB_result : device_out_result_t;

-- Each function instance gets signals
-- printf_uxn_device_h_l42_c2_3a00[uxn_device_h_l42_c2_3a00]
signal printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l44_c6_41df]
signal BIN_OP_EQ_uxn_device_h_l44_c6_41df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_41df_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_d708]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l44_c2_4244]
signal is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l44_c2_4244]
signal result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l44_c2_4244]
signal result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l44_c2_4244]
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l44_c2_4244]
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l44_c2_4244]
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_4244]
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_4244]
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l44_c2_4244]
signal x_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l44_c2_4244]
signal pixel_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l44_c2_4244]
signal auto_advance_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l44_c2_4244]
signal color_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l44_c2_4244]
signal y_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l44_c2_4244]
signal sprite_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c7_4033]
signal BIN_OP_EQ_uxn_device_h_l45_c7_4033_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_4033_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_0909]
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_0909]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c3_0909]
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c3_0909]
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c11_64a4]
signal BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_249a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c7_d708]
signal is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l54_c7_d708]
signal result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l54_c7_d708]
signal result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c7_d708]
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l54_c7_d708]
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c7_d708]
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_d708]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l54_c7_d708]
signal x_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l54_c7_d708]
signal pixel_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l54_c7_d708]
signal auto_advance_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l54_c7_d708]
signal color_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l54_c7_d708]
signal y_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l54_c7_d708]
signal sprite_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l55_c7_db17]
signal BIN_OP_EQ_uxn_device_h_l55_c7_db17_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_db17_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_76ff]
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l55_c3_76ff]
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l55_c3_76ff]
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l62_c11_f270]
signal BIN_OP_EQ_uxn_device_h_l62_c11_f270_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_f270_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_0ebe]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l62_c7_249a]
signal is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l62_c7_249a]
signal result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l62_c7_249a]
signal result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l62_c7_249a]
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l62_c7_249a]
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l62_c7_249a]
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_249a]
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l62_c7_249a]
signal x_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l62_c7_249a]
signal pixel_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);

-- auto_advance_MUX[uxn_device_h_l62_c7_249a]
signal auto_advance_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l62_c7_249a]
signal color_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(1 downto 0);

-- y_MUX[uxn_device_h_l62_c7_249a]
signal y_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l62_c7_249a]
signal sprite_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l63_c7_dda2]
signal BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l63_c3_8c39]
signal is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_8c39]
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l63_c3_8c39]
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l63_c3_8c39]
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l63_c3_8c39]
signal pixel_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l63_c3_8c39]
signal color_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(1 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c20_292a]
signal BIN_OP_AND_uxn_device_h_l66_c20_292a_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_292a_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l66_c20_74e7]
signal BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l66_c20_6039]
signal MUX_uxn_device_h_l66_c20_6039_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_6039_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_6039_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_6039_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c11_a028]
signal BIN_OP_EQ_uxn_device_h_l73_c11_a028_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_a028_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_61bf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l73_c7_0ebe]
signal result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l73_c7_0ebe]
signal result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c7_0ebe]
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l73_c7_0ebe]
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c7_0ebe]
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_0ebe]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l73_c7_0ebe]
signal x_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l73_c7_0ebe]
signal auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l73_c7_0ebe]
signal y_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l73_c7_0ebe]
signal sprite_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l74_c7_8b04]
signal BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_e8cc]
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l74_c3_e8cc]
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l74_c3_e8cc]
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_e4c7]
signal BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_dc56]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_61bf]
signal result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_61bf]
signal result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_61bf]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_61bf]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_61bf]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_61bf]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l81_c7_61bf]
signal x_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_61bf]
signal auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c7_61bf]
signal y_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l81_c7_61bf]
signal sprite_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_f34c]
signal BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_af4e]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_af4e]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_af4e]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l82_c3_af4e]
signal sprite_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_1f17]
signal BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_a543]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_dc56]
signal result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l90_c7_dc56]
signal result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_dc56]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_dc56]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_dc56]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_dc56]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c7_dc56]
signal x_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_dc56]
signal auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l90_c7_dc56]
signal y_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_6715]
signal BIN_OP_EQ_uxn_device_h_l91_c7_6715_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_6715_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_5046]
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_5046]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_5046]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c11_6cc2]
signal BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_7501]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l98_c7_a543]
signal result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l98_c7_a543]
signal result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l98_c7_a543]
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l98_c7_a543]
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l98_c7_a543]
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_a543]
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l98_c7_a543]
signal x_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l98_c7_a543]
signal auto_advance_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l98_c7_a543]
signal y_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c7_e5ca]
signal BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_c780]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c3_c780]
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c3_c780]
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c3_c780]
signal x_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c11_76f6]
signal BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_4239]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l108_c7_7501]
signal result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l108_c7_7501]
signal result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c7_7501]
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l108_c7_7501]
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c7_7501]
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_7501]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c7_7501]
signal x_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l108_c7_7501]
signal auto_advance_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l108_c7_7501]
signal y_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c7_938d]
signal BIN_OP_EQ_uxn_device_h_l109_c7_938d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_938d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_d65c]
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l109_c3_d65c]
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l109_c3_d65c]
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_d58d]
signal BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_9f5e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_4239]
signal result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_4239]
signal result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_4239]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_4239]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_4239]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_4239]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l116_c7_4239]
signal x_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_4239]
signal auto_advance_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_4239]
signal y_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_a993]
signal BIN_OP_EQ_uxn_device_h_l117_c7_a993_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_a993_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_ae46]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_ae46]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_ae46]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l117_c3_ae46]
signal x_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l118_c4_b001]
signal BIN_OP_OR_uxn_device_h_l118_c4_b001_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_b001_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_cf7a]
signal BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_d195]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l125_c7_9f5e]
signal result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l125_c7_9f5e]
signal result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c7_9f5e]
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l125_c7_9f5e]
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c7_9f5e]
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_9f5e]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_9f5e]
signal auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l125_c7_9f5e]
signal y_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l126_c7_9507]
signal BIN_OP_EQ_uxn_device_h_l126_c7_9507_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_9507_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_7be0]
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l126_c3_7be0]
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_7be0]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_7cef]
signal BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_b3ee]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l133_c7_d195]
signal result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l133_c7_d195]
signal result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l133_c7_d195]
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l133_c7_d195]
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c7_d195]
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_d195]
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l133_c7_d195]
signal auto_advance_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l133_c7_d195]
signal y_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c7_a633]
signal BIN_OP_EQ_uxn_device_h_l134_c7_a633_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_a633_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_0187]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c3_0187]
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c3_0187]
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l134_c3_0187]
signal y_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c11_2da0]
signal BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_0131]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l143_c7_b3ee]
signal result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l143_c7_b3ee]
signal result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c7_b3ee]
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l143_c7_b3ee]
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c7_b3ee]
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_b3ee]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l143_c7_b3ee]
signal auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l143_c7_b3ee]
signal y_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c7_599f]
signal BIN_OP_EQ_uxn_device_h_l144_c7_599f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_599f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_b27e]
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c3_b27e]
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c3_b27e]
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_7e1b]
signal BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_0842]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_0131]
signal result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_0131]
signal result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_0131]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_0131]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_0131]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_0131]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_0131]
signal auto_advance_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l151_c7_0131]
signal y_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_0b1a]
signal BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_bbb2]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_bbb2]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_bbb2]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l152_c3_bbb2]
signal y_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c4_9436]
signal BIN_OP_OR_uxn_device_h_l153_c4_9436_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_9436_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_5a81]
signal BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_1de2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_0842]
signal result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_0842]
signal result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_0842]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_0842]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_0842]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_0842]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_0842]
signal auto_advance_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_4a8b]
signal BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_baa7]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_baa7]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_baa7]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_9f6a]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l162_c27_0de9]
signal BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l162_c27_1ba6]
signal BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l162_c27_b03d]
signal MUX_uxn_device_h_l162_c27_b03d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_b03d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_b03d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_b03d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l169_c11_62f2]
signal BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_d9f1]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l169_c7_1de2]
signal result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l169_c7_1de2]
signal result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l169_c7_1de2]
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l169_c7_1de2]
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c7_1de2]
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_1de2]
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c7_1de2]
signal auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c7_c1bc]
signal BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_4e36]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l170_c3_f0ed]
signal result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l170_c3_f0ed]
signal result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l170_c3_f0ed]
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l170_c3_f0ed]
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l170_c3_f0ed]
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_f0ed]
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l170_c3_f0ed]
signal auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(7 downto 0);

-- printf_uxn_device_h_l171_c4_9cc6[uxn_device_h_l171_c4_9cc6]
signal printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_0427]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l176_c27_7e80]
signal BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l182_c11_6db7]
signal BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l182_c7_acbb]
signal result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l182_c7_acbb]
signal result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l182_c7_acbb]
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l182_c7_acbb]
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l183_c7_7217]
signal BIN_OP_EQ_uxn_device_h_l183_c7_7217_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_7217_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l183_c3_c928]
signal result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l183_c3_c928]
signal result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l183_c3_c928]
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1( ref_toks_0 : device_out_result_t;
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
      base.vram_value := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.device_ram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_device_ram_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00
printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00 : entity work.printf_uxn_device_h_l42_c2_3a00_0CLK_de264c78 port map (
printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE,
printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0,
printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1);

-- BIN_OP_EQ_uxn_device_h_l44_c6_41df
BIN_OP_EQ_uxn_device_h_l44_c6_41df : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l44_c6_41df_left,
BIN_OP_EQ_uxn_device_h_l44_c6_41df_right,
BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output);

-- is_fill_mode_MUX_uxn_device_h_l44_c2_4244
is_fill_mode_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond,
is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue,
is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse,
is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_vram_address_MUX_uxn_device_h_l44_c2_4244
result_vram_address_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond,
result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_vram_value_MUX_uxn_device_h_l44_c2_4244
result_vram_value_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond,
result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l44_c2_4244
result_is_deo_done_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond,
result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l44_c2_4244
result_is_vram_write_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond,
result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l44_c2_4244
result_device_ram_address_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond,
result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output);

-- x_MUX_uxn_device_h_l44_c2_4244
x_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l44_c2_4244_cond,
x_MUX_uxn_device_h_l44_c2_4244_iftrue,
x_MUX_uxn_device_h_l44_c2_4244_iffalse,
x_MUX_uxn_device_h_l44_c2_4244_return_output);

-- pixel_MUX_uxn_device_h_l44_c2_4244
pixel_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l44_c2_4244_cond,
pixel_MUX_uxn_device_h_l44_c2_4244_iftrue,
pixel_MUX_uxn_device_h_l44_c2_4244_iffalse,
pixel_MUX_uxn_device_h_l44_c2_4244_return_output);

-- auto_advance_MUX_uxn_device_h_l44_c2_4244
auto_advance_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l44_c2_4244_cond,
auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue,
auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse,
auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output);

-- color_MUX_uxn_device_h_l44_c2_4244
color_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l44_c2_4244_cond,
color_MUX_uxn_device_h_l44_c2_4244_iftrue,
color_MUX_uxn_device_h_l44_c2_4244_iffalse,
color_MUX_uxn_device_h_l44_c2_4244_return_output);

-- y_MUX_uxn_device_h_l44_c2_4244
y_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l44_c2_4244_cond,
y_MUX_uxn_device_h_l44_c2_4244_iftrue,
y_MUX_uxn_device_h_l44_c2_4244_iffalse,
y_MUX_uxn_device_h_l44_c2_4244_return_output);

-- sprite_MUX_uxn_device_h_l44_c2_4244
sprite_MUX_uxn_device_h_l44_c2_4244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l44_c2_4244_cond,
sprite_MUX_uxn_device_h_l44_c2_4244_iftrue,
sprite_MUX_uxn_device_h_l44_c2_4244_iffalse,
sprite_MUX_uxn_device_h_l44_c2_4244_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c7_4033
BIN_OP_EQ_uxn_device_h_l45_c7_4033 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c7_4033_left,
BIN_OP_EQ_uxn_device_h_l45_c7_4033_right,
BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c3_0909
result_is_deo_done_MUX_uxn_device_h_l45_c3_0909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c3_0909
result_device_ram_address_MUX_uxn_device_h_l45_c3_0909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c11_64a4
BIN_OP_EQ_uxn_device_h_l54_c11_64a4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left,
BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right,
BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c7_d708
is_fill_mode_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond,
is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_vram_address_MUX_uxn_device_h_l54_c7_d708
result_vram_address_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond,
result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_vram_value_MUX_uxn_device_h_l54_c7_d708
result_vram_value_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond,
result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c7_d708
result_is_deo_done_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l54_c7_d708
result_is_vram_write_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond,
result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c7_d708
result_device_ram_address_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output);

-- x_MUX_uxn_device_h_l54_c7_d708
x_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l54_c7_d708_cond,
x_MUX_uxn_device_h_l54_c7_d708_iftrue,
x_MUX_uxn_device_h_l54_c7_d708_iffalse,
x_MUX_uxn_device_h_l54_c7_d708_return_output);

-- pixel_MUX_uxn_device_h_l54_c7_d708
pixel_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c7_d708_cond,
pixel_MUX_uxn_device_h_l54_c7_d708_iftrue,
pixel_MUX_uxn_device_h_l54_c7_d708_iffalse,
pixel_MUX_uxn_device_h_l54_c7_d708_return_output);

-- auto_advance_MUX_uxn_device_h_l54_c7_d708
auto_advance_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l54_c7_d708_cond,
auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue,
auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse,
auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output);

-- color_MUX_uxn_device_h_l54_c7_d708
color_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c7_d708_cond,
color_MUX_uxn_device_h_l54_c7_d708_iftrue,
color_MUX_uxn_device_h_l54_c7_d708_iffalse,
color_MUX_uxn_device_h_l54_c7_d708_return_output);

-- y_MUX_uxn_device_h_l54_c7_d708
y_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l54_c7_d708_cond,
y_MUX_uxn_device_h_l54_c7_d708_iftrue,
y_MUX_uxn_device_h_l54_c7_d708_iffalse,
y_MUX_uxn_device_h_l54_c7_d708_return_output);

-- sprite_MUX_uxn_device_h_l54_c7_d708
sprite_MUX_uxn_device_h_l54_c7_d708 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l54_c7_d708_cond,
sprite_MUX_uxn_device_h_l54_c7_d708_iftrue,
sprite_MUX_uxn_device_h_l54_c7_d708_iffalse,
sprite_MUX_uxn_device_h_l54_c7_d708_return_output);

-- BIN_OP_EQ_uxn_device_h_l55_c7_db17
BIN_OP_EQ_uxn_device_h_l55_c7_db17 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l55_c7_db17_left,
BIN_OP_EQ_uxn_device_h_l55_c7_db17_right,
BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff
result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond,
result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue,
result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse,
result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff
result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond,
result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue,
result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse,
result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output);

-- BIN_OP_EQ_uxn_device_h_l62_c11_f270
BIN_OP_EQ_uxn_device_h_l62_c11_f270 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l62_c11_f270_left,
BIN_OP_EQ_uxn_device_h_l62_c11_f270_right,
BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- is_fill_mode_MUX_uxn_device_h_l62_c7_249a
is_fill_mode_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond,
is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue,
is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse,
is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_vram_address_MUX_uxn_device_h_l62_c7_249a
result_vram_address_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond,
result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_vram_value_MUX_uxn_device_h_l62_c7_249a
result_vram_value_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond,
result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l62_c7_249a
result_is_deo_done_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond,
result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l62_c7_249a
result_is_vram_write_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond,
result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l62_c7_249a
result_device_ram_address_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond,
result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output);

-- x_MUX_uxn_device_h_l62_c7_249a
x_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l62_c7_249a_cond,
x_MUX_uxn_device_h_l62_c7_249a_iftrue,
x_MUX_uxn_device_h_l62_c7_249a_iffalse,
x_MUX_uxn_device_h_l62_c7_249a_return_output);

-- pixel_MUX_uxn_device_h_l62_c7_249a
pixel_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l62_c7_249a_cond,
pixel_MUX_uxn_device_h_l62_c7_249a_iftrue,
pixel_MUX_uxn_device_h_l62_c7_249a_iffalse,
pixel_MUX_uxn_device_h_l62_c7_249a_return_output);

-- auto_advance_MUX_uxn_device_h_l62_c7_249a
auto_advance_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l62_c7_249a_cond,
auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue,
auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse,
auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output);

-- color_MUX_uxn_device_h_l62_c7_249a
color_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l62_c7_249a_cond,
color_MUX_uxn_device_h_l62_c7_249a_iftrue,
color_MUX_uxn_device_h_l62_c7_249a_iffalse,
color_MUX_uxn_device_h_l62_c7_249a_return_output);

-- y_MUX_uxn_device_h_l62_c7_249a
y_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l62_c7_249a_cond,
y_MUX_uxn_device_h_l62_c7_249a_iftrue,
y_MUX_uxn_device_h_l62_c7_249a_iffalse,
y_MUX_uxn_device_h_l62_c7_249a_return_output);

-- sprite_MUX_uxn_device_h_l62_c7_249a
sprite_MUX_uxn_device_h_l62_c7_249a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l62_c7_249a_cond,
sprite_MUX_uxn_device_h_l62_c7_249a_iftrue,
sprite_MUX_uxn_device_h_l62_c7_249a_iffalse,
sprite_MUX_uxn_device_h_l62_c7_249a_return_output);

-- BIN_OP_EQ_uxn_device_h_l63_c7_dda2
BIN_OP_EQ_uxn_device_h_l63_c7_dda2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left,
BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right,
BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output);

-- is_fill_mode_MUX_uxn_device_h_l63_c3_8c39
is_fill_mode_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond,
is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue,
is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse,
is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39
result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond,
result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue,
result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse,
result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39
result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond,
result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue,
result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse,
result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- pixel_MUX_uxn_device_h_l63_c3_8c39
pixel_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l63_c3_8c39_cond,
pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue,
pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse,
pixel_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- color_MUX_uxn_device_h_l63_c3_8c39
color_MUX_uxn_device_h_l63_c3_8c39 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l63_c3_8c39_cond,
color_MUX_uxn_device_h_l63_c3_8c39_iftrue,
color_MUX_uxn_device_h_l63_c3_8c39_iffalse,
color_MUX_uxn_device_h_l63_c3_8c39_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c20_292a
BIN_OP_AND_uxn_device_h_l66_c20_292a : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c20_292a_left,
BIN_OP_AND_uxn_device_h_l66_c20_292a_right,
BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output);

-- BIN_OP_EQ_uxn_device_h_l66_c20_74e7
BIN_OP_EQ_uxn_device_h_l66_c20_74e7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left,
BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right,
BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output);

-- MUX_uxn_device_h_l66_c20_6039
MUX_uxn_device_h_l66_c20_6039 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l66_c20_6039_cond,
MUX_uxn_device_h_l66_c20_6039_iftrue,
MUX_uxn_device_h_l66_c20_6039_iffalse,
MUX_uxn_device_h_l66_c20_6039_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c11_a028
BIN_OP_EQ_uxn_device_h_l73_c11_a028 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c11_a028_left,
BIN_OP_EQ_uxn_device_h_l73_c11_a028_right,
BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_vram_address_MUX_uxn_device_h_l73_c7_0ebe
result_vram_address_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- result_vram_value_MUX_uxn_device_h_l73_c7_0ebe
result_vram_value_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe
result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe
result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe
result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- x_MUX_uxn_device_h_l73_c7_0ebe
x_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l73_c7_0ebe_cond,
x_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
x_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
x_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- auto_advance_MUX_uxn_device_h_l73_c7_0ebe
auto_advance_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond,
auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- y_MUX_uxn_device_h_l73_c7_0ebe
y_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l73_c7_0ebe_cond,
y_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
y_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
y_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- sprite_MUX_uxn_device_h_l73_c7_0ebe
sprite_MUX_uxn_device_h_l73_c7_0ebe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c7_0ebe_cond,
sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue,
sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse,
sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output);

-- BIN_OP_EQ_uxn_device_h_l74_c7_8b04
BIN_OP_EQ_uxn_device_h_l74_c7_8b04 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left,
BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right,
BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc
result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond,
result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc
result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond,
result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_e4c7
BIN_OP_EQ_uxn_device_h_l81_c11_e4c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left,
BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right,
BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_61bf
result_vram_address_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_61bf
result_vram_value_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf
result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf
result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf
result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- x_MUX_uxn_device_h_l81_c7_61bf
x_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_61bf_cond,
x_MUX_uxn_device_h_l81_c7_61bf_iftrue,
x_MUX_uxn_device_h_l81_c7_61bf_iffalse,
x_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_61bf
auto_advance_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond,
auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- y_MUX_uxn_device_h_l81_c7_61bf
y_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_61bf_cond,
y_MUX_uxn_device_h_l81_c7_61bf_iftrue,
y_MUX_uxn_device_h_l81_c7_61bf_iffalse,
y_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- sprite_MUX_uxn_device_h_l81_c7_61bf
sprite_MUX_uxn_device_h_l81_c7_61bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l81_c7_61bf_cond,
sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue,
sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse,
sprite_MUX_uxn_device_h_l81_c7_61bf_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_f34c
BIN_OP_EQ_uxn_device_h_l82_c7_f34c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left,
BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right,
BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e
result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e
result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output);

-- sprite_MUX_uxn_device_h_l82_c3_af4e
sprite_MUX_uxn_device_h_l82_c3_af4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l82_c3_af4e_cond,
sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue,
sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse,
sprite_MUX_uxn_device_h_l82_c3_af4e_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_1f17
BIN_OP_EQ_uxn_device_h_l90_c11_1f17 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left,
BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right,
BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_dc56
result_vram_address_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_vram_value_MUX_uxn_device_h_l90_c7_dc56
result_vram_value_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond,
result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56
result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56
result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56
result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- x_MUX_uxn_device_h_l90_c7_dc56
x_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_dc56_cond,
x_MUX_uxn_device_h_l90_c7_dc56_iftrue,
x_MUX_uxn_device_h_l90_c7_dc56_iffalse,
x_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_dc56
auto_advance_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond,
auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- y_MUX_uxn_device_h_l90_c7_dc56
y_MUX_uxn_device_h_l90_c7_dc56 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_dc56_cond,
y_MUX_uxn_device_h_l90_c7_dc56_iftrue,
y_MUX_uxn_device_h_l90_c7_dc56_iffalse,
y_MUX_uxn_device_h_l90_c7_dc56_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_6715
BIN_OP_EQ_uxn_device_h_l91_c7_6715 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_6715_left,
BIN_OP_EQ_uxn_device_h_l91_c7_6715_right,
BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_5046
result_is_deo_done_MUX_uxn_device_h_l91_c3_5046 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_5046
result_device_ram_address_MUX_uxn_device_h_l91_c3_5046 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c11_6cc2
BIN_OP_EQ_uxn_device_h_l98_c11_6cc2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left,
BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right,
BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_vram_address_MUX_uxn_device_h_l98_c7_a543
result_vram_address_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond,
result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_vram_value_MUX_uxn_device_h_l98_c7_a543
result_vram_value_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond,
result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l98_c7_a543
result_is_deo_done_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond,
result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l98_c7_a543
result_is_vram_write_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond,
result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l98_c7_a543
result_device_ram_address_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond,
result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output);

-- x_MUX_uxn_device_h_l98_c7_a543
x_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l98_c7_a543_cond,
x_MUX_uxn_device_h_l98_c7_a543_iftrue,
x_MUX_uxn_device_h_l98_c7_a543_iffalse,
x_MUX_uxn_device_h_l98_c7_a543_return_output);

-- auto_advance_MUX_uxn_device_h_l98_c7_a543
auto_advance_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l98_c7_a543_cond,
auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue,
auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse,
auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output);

-- y_MUX_uxn_device_h_l98_c7_a543
y_MUX_uxn_device_h_l98_c7_a543 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l98_c7_a543_cond,
y_MUX_uxn_device_h_l98_c7_a543_iftrue,
y_MUX_uxn_device_h_l98_c7_a543_iffalse,
y_MUX_uxn_device_h_l98_c7_a543_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c7_e5ca
BIN_OP_EQ_uxn_device_h_l99_c7_e5ca : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left,
BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right,
BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c3_c780
result_is_deo_done_MUX_uxn_device_h_l99_c3_c780 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c3_c780
result_device_ram_address_MUX_uxn_device_h_l99_c3_c780 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output);

-- x_MUX_uxn_device_h_l99_c3_c780
x_MUX_uxn_device_h_l99_c3_c780 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c3_c780_cond,
x_MUX_uxn_device_h_l99_c3_c780_iftrue,
x_MUX_uxn_device_h_l99_c3_c780_iffalse,
x_MUX_uxn_device_h_l99_c3_c780_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c11_76f6
BIN_OP_EQ_uxn_device_h_l108_c11_76f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left,
BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right,
BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_vram_address_MUX_uxn_device_h_l108_c7_7501
result_vram_address_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond,
result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_vram_value_MUX_uxn_device_h_l108_c7_7501
result_vram_value_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond,
result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c7_7501
result_is_deo_done_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l108_c7_7501
result_is_vram_write_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond,
result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c7_7501
result_device_ram_address_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output);

-- x_MUX_uxn_device_h_l108_c7_7501
x_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c7_7501_cond,
x_MUX_uxn_device_h_l108_c7_7501_iftrue,
x_MUX_uxn_device_h_l108_c7_7501_iffalse,
x_MUX_uxn_device_h_l108_c7_7501_return_output);

-- auto_advance_MUX_uxn_device_h_l108_c7_7501
auto_advance_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l108_c7_7501_cond,
auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue,
auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse,
auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output);

-- y_MUX_uxn_device_h_l108_c7_7501
y_MUX_uxn_device_h_l108_c7_7501 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l108_c7_7501_cond,
y_MUX_uxn_device_h_l108_c7_7501_iftrue,
y_MUX_uxn_device_h_l108_c7_7501_iffalse,
y_MUX_uxn_device_h_l108_c7_7501_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c7_938d
BIN_OP_EQ_uxn_device_h_l109_c7_938d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c7_938d_left,
BIN_OP_EQ_uxn_device_h_l109_c7_938d_right,
BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c
result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c
result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_d58d
BIN_OP_EQ_uxn_device_h_l116_c11_d58d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left,
BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right,
BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_4239
result_vram_address_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_4239
result_vram_value_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_4239
result_is_deo_done_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_4239
result_is_vram_write_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_4239
result_device_ram_address_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output);

-- x_MUX_uxn_device_h_l116_c7_4239
x_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l116_c7_4239_cond,
x_MUX_uxn_device_h_l116_c7_4239_iftrue,
x_MUX_uxn_device_h_l116_c7_4239_iffalse,
x_MUX_uxn_device_h_l116_c7_4239_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_4239
auto_advance_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_4239_cond,
auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output);

-- y_MUX_uxn_device_h_l116_c7_4239
y_MUX_uxn_device_h_l116_c7_4239 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_4239_cond,
y_MUX_uxn_device_h_l116_c7_4239_iftrue,
y_MUX_uxn_device_h_l116_c7_4239_iffalse,
y_MUX_uxn_device_h_l116_c7_4239_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_a993
BIN_OP_EQ_uxn_device_h_l117_c7_a993 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_a993_left,
BIN_OP_EQ_uxn_device_h_l117_c7_a993_right,
BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46
result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46
result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output);

-- x_MUX_uxn_device_h_l117_c3_ae46
x_MUX_uxn_device_h_l117_c3_ae46 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c3_ae46_cond,
x_MUX_uxn_device_h_l117_c3_ae46_iftrue,
x_MUX_uxn_device_h_l117_c3_ae46_iffalse,
x_MUX_uxn_device_h_l117_c3_ae46_return_output);

-- BIN_OP_OR_uxn_device_h_l118_c4_b001
BIN_OP_OR_uxn_device_h_l118_c4_b001 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l118_c4_b001_left,
BIN_OP_OR_uxn_device_h_l118_c4_b001_right,
BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_cf7a
BIN_OP_EQ_uxn_device_h_l125_c11_cf7a : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left,
BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right,
BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_vram_address_MUX_uxn_device_h_l125_c7_9f5e
result_vram_address_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_vram_value_MUX_uxn_device_h_l125_c7_9f5e
result_vram_value_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e
result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e
result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e
result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_9f5e
auto_advance_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond,
auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- y_MUX_uxn_device_h_l125_c7_9f5e
y_MUX_uxn_device_h_l125_c7_9f5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_9f5e_cond,
y_MUX_uxn_device_h_l125_c7_9f5e_iftrue,
y_MUX_uxn_device_h_l125_c7_9f5e_iffalse,
y_MUX_uxn_device_h_l125_c7_9f5e_return_output);

-- BIN_OP_EQ_uxn_device_h_l126_c7_9507
BIN_OP_EQ_uxn_device_h_l126_c7_9507 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l126_c7_9507_left,
BIN_OP_EQ_uxn_device_h_l126_c7_9507_right,
BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0
result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond,
result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0
result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output);

-- BIN_OP_EQ_uxn_device_h_l133_c11_7cef
BIN_OP_EQ_uxn_device_h_l133_c11_7cef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left,
BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right,
BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_vram_address_MUX_uxn_device_h_l133_c7_d195
result_vram_address_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond,
result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_vram_value_MUX_uxn_device_h_l133_c7_d195
result_vram_value_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond,
result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l133_c7_d195
result_is_deo_done_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond,
result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l133_c7_d195
result_is_vram_write_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond,
result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c7_d195
result_device_ram_address_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output);

-- auto_advance_MUX_uxn_device_h_l133_c7_d195
auto_advance_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l133_c7_d195_cond,
auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue,
auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse,
auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output);

-- y_MUX_uxn_device_h_l133_c7_d195
y_MUX_uxn_device_h_l133_c7_d195 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l133_c7_d195_cond,
y_MUX_uxn_device_h_l133_c7_d195_iftrue,
y_MUX_uxn_device_h_l133_c7_d195_iffalse,
y_MUX_uxn_device_h_l133_c7_d195_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c7_a633
BIN_OP_EQ_uxn_device_h_l134_c7_a633 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c7_a633_left,
BIN_OP_EQ_uxn_device_h_l134_c7_a633_right,
BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c3_0187
result_is_deo_done_MUX_uxn_device_h_l134_c3_0187 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c3_0187
result_device_ram_address_MUX_uxn_device_h_l134_c3_0187 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output);

-- y_MUX_uxn_device_h_l134_c3_0187
y_MUX_uxn_device_h_l134_c3_0187 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c3_0187_cond,
y_MUX_uxn_device_h_l134_c3_0187_iftrue,
y_MUX_uxn_device_h_l134_c3_0187_iffalse,
y_MUX_uxn_device_h_l134_c3_0187_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c11_2da0
BIN_OP_EQ_uxn_device_h_l143_c11_2da0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left,
BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right,
BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_vram_address_MUX_uxn_device_h_l143_c7_b3ee
result_vram_address_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_vram_value_MUX_uxn_device_h_l143_c7_b3ee
result_vram_value_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee
result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee
result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee
result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- auto_advance_MUX_uxn_device_h_l143_c7_b3ee
auto_advance_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond,
auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- y_MUX_uxn_device_h_l143_c7_b3ee
y_MUX_uxn_device_h_l143_c7_b3ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c7_b3ee_cond,
y_MUX_uxn_device_h_l143_c7_b3ee_iftrue,
y_MUX_uxn_device_h_l143_c7_b3ee_iffalse,
y_MUX_uxn_device_h_l143_c7_b3ee_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c7_599f
BIN_OP_EQ_uxn_device_h_l144_c7_599f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c7_599f_left,
BIN_OP_EQ_uxn_device_h_l144_c7_599f_right,
BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e
result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e
result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_7e1b
BIN_OP_EQ_uxn_device_h_l151_c11_7e1b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left,
BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right,
BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_0131
result_vram_address_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_0131
result_vram_value_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_0131
result_is_deo_done_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_0131
result_is_vram_write_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_0131
result_device_ram_address_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_0131
auto_advance_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_0131_cond,
auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output);

-- y_MUX_uxn_device_h_l151_c7_0131
y_MUX_uxn_device_h_l151_c7_0131 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l151_c7_0131_cond,
y_MUX_uxn_device_h_l151_c7_0131_iftrue,
y_MUX_uxn_device_h_l151_c7_0131_iffalse,
y_MUX_uxn_device_h_l151_c7_0131_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_0b1a
BIN_OP_EQ_uxn_device_h_l152_c7_0b1a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left,
BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right,
BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2
result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2
result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output);

-- y_MUX_uxn_device_h_l152_c3_bbb2
y_MUX_uxn_device_h_l152_c3_bbb2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l152_c3_bbb2_cond,
y_MUX_uxn_device_h_l152_c3_bbb2_iftrue,
y_MUX_uxn_device_h_l152_c3_bbb2_iffalse,
y_MUX_uxn_device_h_l152_c3_bbb2_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c4_9436
BIN_OP_OR_uxn_device_h_l153_c4_9436 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c4_9436_left,
BIN_OP_OR_uxn_device_h_l153_c4_9436_right,
BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_5a81
BIN_OP_EQ_uxn_device_h_l160_c11_5a81 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left,
BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right,
BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_0842
result_vram_address_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_0842
result_vram_value_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_0842
result_is_deo_done_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_0842
result_is_vram_write_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_0842
result_device_ram_address_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_0842
auto_advance_MUX_uxn_device_h_l160_c7_0842 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_0842_cond,
auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_4a8b
BIN_OP_EQ_uxn_device_h_l161_c7_4a8b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left,
BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right,
BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7
result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7
result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l162_c27_0de9
BIN_OP_PLUS_uxn_device_h_l162_c27_0de9 : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left,
BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right,
BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output);

-- BIN_OP_GT_uxn_device_h_l162_c27_1ba6
BIN_OP_GT_uxn_device_h_l162_c27_1ba6 : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left,
BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right,
BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output);

-- MUX_uxn_device_h_l162_c27_b03d
MUX_uxn_device_h_l162_c27_b03d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l162_c27_b03d_cond,
MUX_uxn_device_h_l162_c27_b03d_iftrue,
MUX_uxn_device_h_l162_c27_b03d_iffalse,
MUX_uxn_device_h_l162_c27_b03d_return_output);

-- BIN_OP_EQ_uxn_device_h_l169_c11_62f2
BIN_OP_EQ_uxn_device_h_l169_c11_62f2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left,
BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right,
BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output);

-- result_vram_address_MUX_uxn_device_h_l169_c7_1de2
result_vram_address_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond,
result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_vram_value_MUX_uxn_device_h_l169_c7_1de2
result_vram_value_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond,
result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2
result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2
result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2
result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c7_1de2
auto_advance_MUX_uxn_device_h_l169_c7_1de2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond,
auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue,
auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse,
auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c7_c1bc
BIN_OP_EQ_uxn_device_h_l170_c7_c1bc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left,
BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right,
BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output);

-- result_vram_address_MUX_uxn_device_h_l170_c3_f0ed
result_vram_address_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- result_vram_value_MUX_uxn_device_h_l170_c3_f0ed
result_vram_value_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed
result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed
result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed
result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- auto_advance_MUX_uxn_device_h_l170_c3_f0ed
auto_advance_MUX_uxn_device_h_l170_c3_f0ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond,
auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue,
auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse,
auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output);

-- printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6
printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6 : entity work.printf_uxn_device_h_l171_c4_9cc6_0CLK_de264c78 port map (
printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE,
printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0,
printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1,
printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output);

-- BIN_OP_PLUS_uxn_device_h_l176_c27_7e80
BIN_OP_PLUS_uxn_device_h_l176_c27_7e80 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left,
BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right,
BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output);

-- BIN_OP_EQ_uxn_device_h_l182_c11_6db7
BIN_OP_EQ_uxn_device_h_l182_c11_6db7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left,
BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right,
BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output);

-- result_vram_address_MUX_uxn_device_h_l182_c7_acbb
result_vram_address_MUX_uxn_device_h_l182_c7_acbb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond,
result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue,
result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse,
result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output);

-- result_vram_value_MUX_uxn_device_h_l182_c7_acbb
result_vram_value_MUX_uxn_device_h_l182_c7_acbb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond,
result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue,
result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse,
result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb
result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond,
result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb
result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond,
result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output);

-- BIN_OP_EQ_uxn_device_h_l183_c7_7217
BIN_OP_EQ_uxn_device_h_l183_c7_7217 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l183_c7_7217_left,
BIN_OP_EQ_uxn_device_h_l183_c7_7217_right,
BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output);

-- result_vram_address_MUX_uxn_device_h_l183_c3_c928
result_vram_address_MUX_uxn_device_h_l183_c3_c928 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond,
result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue,
result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse,
result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output);

-- result_vram_value_MUX_uxn_device_h_l183_c3_c928
result_vram_value_MUX_uxn_device_h_l183_c3_c928 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond,
result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue,
result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse,
result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l183_c3_c928
result_is_vram_write_MUX_uxn_device_h_l183_c3_c928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond,
result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue,
result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse,
result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x,
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output,
 is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output,
 x_MUX_uxn_device_h_l44_c2_4244_return_output,
 pixel_MUX_uxn_device_h_l44_c2_4244_return_output,
 auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output,
 color_MUX_uxn_device_h_l44_c2_4244_return_output,
 y_MUX_uxn_device_h_l44_c2_4244_return_output,
 sprite_MUX_uxn_device_h_l44_c2_4244_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output,
 x_MUX_uxn_device_h_l54_c7_d708_return_output,
 pixel_MUX_uxn_device_h_l54_c7_d708_return_output,
 auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output,
 color_MUX_uxn_device_h_l54_c7_d708_return_output,
 y_MUX_uxn_device_h_l54_c7_d708_return_output,
 sprite_MUX_uxn_device_h_l54_c7_d708_return_output,
 BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output,
 result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output,
 result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output,
 BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output,
 x_MUX_uxn_device_h_l62_c7_249a_return_output,
 pixel_MUX_uxn_device_h_l62_c7_249a_return_output,
 auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output,
 color_MUX_uxn_device_h_l62_c7_249a_return_output,
 y_MUX_uxn_device_h_l62_c7_249a_return_output,
 sprite_MUX_uxn_device_h_l62_c7_249a_return_output,
 BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output,
 is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output,
 result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output,
 result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output,
 pixel_MUX_uxn_device_h_l63_c3_8c39_return_output,
 color_MUX_uxn_device_h_l63_c3_8c39_return_output,
 BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output,
 BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output,
 MUX_uxn_device_h_l66_c20_6039_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 x_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 y_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output,
 BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output,
 x_MUX_uxn_device_h_l81_c7_61bf_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output,
 y_MUX_uxn_device_h_l81_c7_61bf_return_output,
 sprite_MUX_uxn_device_h_l81_c7_61bf_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output,
 sprite_MUX_uxn_device_h_l82_c3_af4e_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output,
 x_MUX_uxn_device_h_l90_c7_dc56_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output,
 y_MUX_uxn_device_h_l90_c7_dc56_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output,
 x_MUX_uxn_device_h_l98_c7_a543_return_output,
 auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output,
 y_MUX_uxn_device_h_l98_c7_a543_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output,
 x_MUX_uxn_device_h_l99_c3_c780_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output,
 x_MUX_uxn_device_h_l108_c7_7501_return_output,
 auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output,
 y_MUX_uxn_device_h_l108_c7_7501_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output,
 x_MUX_uxn_device_h_l116_c7_4239_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output,
 y_MUX_uxn_device_h_l116_c7_4239_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output,
 x_MUX_uxn_device_h_l117_c3_ae46_return_output,
 BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 y_MUX_uxn_device_h_l125_c7_9f5e_return_output,
 BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output,
 auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output,
 y_MUX_uxn_device_h_l133_c7_d195_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output,
 y_MUX_uxn_device_h_l134_c3_0187_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 y_MUX_uxn_device_h_l143_c7_b3ee_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output,
 y_MUX_uxn_device_h_l151_c7_0131_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output,
 y_MUX_uxn_device_h_l152_c3_bbb2_return_output,
 BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output,
 BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output,
 BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output,
 MUX_uxn_device_h_l162_c27_b03d_return_output,
 BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output,
 result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output,
 auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output,
 result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output,
 BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output,
 BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output,
 result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output,
 result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output,
 BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output,
 result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output,
 result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output,
 result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_d708_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_4244_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_4244_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_db12 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_249a_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_d708_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l57_c4_8173 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_8c39_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_249a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l68_c4_2883 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_8c39_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_8c39_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_8c39_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_4fba_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_6039_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_6039_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_6039_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_6039_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_03e6 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_dc56_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_111d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_dc56_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_dc56_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_a543_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_dc56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l93_c4_27a0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_c780_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_a543_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_a543_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_7501_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_a543_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l103_c4_d28a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_c780_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_c780_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_c780_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_7501_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_7501_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4239_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_7501_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_490d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_ae46_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4239_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4239_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_9f5e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_4239_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_26bb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_ae46_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_ae46_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_ae46_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_d195_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_9f5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l128_c4_1948 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_d195_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_0187_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_d195_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_b3ee_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_d195_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l138_c4_f481 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_0187_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_0187_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_0187_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_0131_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_b3ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_a4ae : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_0131_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_bbb2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_0131_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_0131_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_5a68 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_bbb2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l164_c4_9a68 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_b03d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_b03d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_b03d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_b03d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l176_c4_39d6 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l174_c4_beff : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_221d_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_9369_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_b38c_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l186_c4_da0a : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l187_c4_ab19 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_a368_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1_uxn_device_h_l196_l35_DUPLICATE_d5dc_return_output : device_out_result_t;
 -- State registers comb logic variables
variable REG_VAR_ctrl_none : unsigned(15 downto 0);
variable REG_VAR_x : unsigned(15 downto 0);
variable REG_VAR_y : unsigned(15 downto 0);
variable REG_VAR_pixel : unsigned(7 downto 0);
variable REG_VAR_sprite : unsigned(7 downto 0);
variable REG_VAR_auto_advance : unsigned(7 downto 0);
variable REG_VAR_color : unsigned(1 downto 0);
variable REG_VAR_is_fill_mode : unsigned(0 downto 0);
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
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right := to_unsigned(13, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l66_c20_6039_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_5a68 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_5a68;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l103_c4_d28a := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue := VAR_result_device_ram_address_uxn_device_h_l103_c4_d28a;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right := to_unsigned(7, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l57_c4_8173 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue := VAR_result_device_ram_address_uxn_device_h_l57_c4_8173;
     VAR_MUX_uxn_device_h_l66_c20_6039_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l93_c4_27a0 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue := VAR_result_device_ram_address_uxn_device_h_l93_c4_27a0;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_26bb := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_26bb;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_490d := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_490d;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_right := to_unsigned(14, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right := to_unsigned(800, 32);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_a4ae := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_a4ae;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l138_c4_f481 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue := VAR_result_device_ram_address_uxn_device_h_l138_c4_f481;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l164_c4_9a68 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue := VAR_result_device_ram_address_uxn_device_h_l164_c4_9a68;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_111d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_111d;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l68_c4_2883 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue := VAR_result_device_ram_address_uxn_device_h_l68_c4_2883;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_right := to_unsigned(128, 8);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right := to_unsigned(10, 4);
     VAR_MUX_uxn_device_h_l162_c27_b03d_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l128_c4_1948 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue := VAR_result_device_ram_address_uxn_device_h_l128_c4_1948;
     VAR_result_device_ram_address_uxn_device_h_l174_c4_beff := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue := VAR_result_device_ram_address_uxn_device_h_l174_c4_beff;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_db12 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_db12;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right := to_unsigned(11, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l162_c27_b03d_iffalse := to_unsigned(0, 1);
     VAR_result_vram_address_uxn_device_h_l186_c4_da0a := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue := VAR_result_vram_address_uxn_device_h_l186_c4_da0a;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right := to_unsigned(800, 10);
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right := to_unsigned(575999, 20);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue := to_unsigned(1, 1);
     VAR_result_vram_value_uxn_device_h_l187_c4_ab19 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue := VAR_result_vram_value_uxn_device_h_l187_c4_ab19;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_right := to_unsigned(2, 2);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_03e6 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_03e6;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right := to_unsigned(14, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l44_c2_4244_iftrue := color;
     VAR_color_MUX_uxn_device_h_l54_c7_d708_iftrue := color;
     VAR_color_MUX_uxn_device_h_l62_c7_249a_iffalse := color;
     VAR_color_MUX_uxn_device_h_l63_c3_8c39_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left := VAR_device_port;
     VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left := VAR_phase;
     VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right := x;
     VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l108_c7_7501_iftrue := x;
     VAR_x_MUX_uxn_device_h_l116_c7_4239_iffalse := x;
     VAR_x_MUX_uxn_device_h_l117_c3_ae46_iffalse := x;
     VAR_x_MUX_uxn_device_h_l44_c2_4244_iftrue := x;
     VAR_x_MUX_uxn_device_h_l54_c7_d708_iftrue := x;
     VAR_x_MUX_uxn_device_h_l62_c7_249a_iftrue := x;
     VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_61bf_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c7_dc56_iftrue := x;
     VAR_x_MUX_uxn_device_h_l99_c3_c780_iffalse := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_left := y;
     VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l108_c7_7501_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_4239_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l134_c3_0187_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iftrue := y;
     VAR_y_MUX_uxn_device_h_l151_c7_0131_iffalse := y;
     VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l44_c2_4244_iftrue := y;
     VAR_y_MUX_uxn_device_h_l54_c7_d708_iftrue := y;
     VAR_y_MUX_uxn_device_h_l62_c7_249a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_61bf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_dc56_iftrue := y;
     VAR_y_MUX_uxn_device_h_l98_c7_a543_iftrue := y;
     -- printf_uxn_device_h_l42_c2_3a00[uxn_device_h_l42_c2_3a00] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0 <= VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg0;
     printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1 <= VAR_printf_uxn_device_h_l42_c2_3a00_uxn_device_h_l42_c2_3a00_arg1;
     -- Outputs

     -- CAST_TO_uint2_t[uxn_device_h_l65_c12_4fba] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_4fba_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l90_c11_1f17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_7e1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l62_c11_f270] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l62_c11_f270_left <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_left;
     BIN_OP_EQ_uxn_device_h_l62_c11_f270_right <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output := BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_e4c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l55_c7_db17] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l55_c7_db17_left <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_left;
     BIN_OP_EQ_uxn_device_h_l55_c7_db17_right <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output := BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_5a81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;

     -- BIN_OP_EQ[uxn_device_h_l98_c11_6cc2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_left;
     BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output := BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output := result.is_vram_write;

     -- CAST_TO_uint4_t[uxn_device_h_l171_c91_221d] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_221d_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l152_c7_0b1a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c11_2da0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_left;
     BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output := BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l169_c11_62f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_left;
     BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output := BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l63_c7_dda2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_left;
     BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output := BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_a993] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_a993_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_a993_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_7cef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- CAST_TO_uint32_t[uxn_device_h_l176_c27_9369] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_9369_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l144_c7_599f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c7_599f_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_left;
     BIN_OP_EQ_uxn_device_h_l144_c7_599f_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output := BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_4a8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l176_c63_b38c] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_b38c_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l116_c11_d58d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c7_a633] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c7_a633_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_left;
     BIN_OP_EQ_uxn_device_h_l134_c7_a633_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output := BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l170_c7_c1bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_left;
     BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output := BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_cf7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_a368 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_a368_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_f34c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l74_c7_8b04] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_left;
     BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output := BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output;

     -- BIN_OP_EQ[uxn_device_h_l183_c7_7217] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l183_c7_7217_left <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_left;
     BIN_OP_EQ_uxn_device_h_l183_c7_7217_right <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output := BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output;

     -- BIN_OP_EQ[uxn_device_h_l182_c11_6db7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_left;
     BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output := BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c11_76f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_left;
     BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output := BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l126_c7_9507] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l126_c7_9507_left <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_left;
     BIN_OP_EQ_uxn_device_h_l126_c7_9507_right <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output := BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output := result.is_deo_done;

     -- BIN_OP_AND[uxn_device_h_l66_c20_292a] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c20_292a_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_left;
     BIN_OP_AND_uxn_device_h_l66_c20_292a_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output := BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c7_938d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c7_938d_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_left;
     BIN_OP_EQ_uxn_device_h_l109_c7_938d_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output := BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c11_a028] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c11_a028_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_left;
     BIN_OP_EQ_uxn_device_h_l73_c11_a028_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output := BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_9f6a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c7_4033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c7_4033_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_left;
     BIN_OP_EQ_uxn_device_h_l45_c7_4033_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output := BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c11_64a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_left;
     BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output := BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c7_e5ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_left;
     BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output := BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_6715] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_6715_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_6715_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output;

     -- BIN_OP_EQ[uxn_device_h_l44_c6_41df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l44_c6_41df_left <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_left;
     BIN_OP_EQ_uxn_device_h_l44_c6_41df_right <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output := BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left := VAR_BIN_OP_AND_uxn_device_h_l66_c20_292a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_76f6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_938d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_4239_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d58d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_ae46_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_a993_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_9f5e_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_cf7a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_9507_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_d195_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_7cef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_0187_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_a633_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_b3ee_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_2da0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_599f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_0131_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_7e1b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_bbb2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0b1a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_5a81_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_4a8b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_62f2_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_c1bc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_6db7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_7217_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_4244_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_41df_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4033_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_d708_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_64a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_db17_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_249a_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_f270_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_dda2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_0ebe_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_a028_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_8b04_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_61bf_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_e4c7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output;
     VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_f34c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_dc56_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_1f17_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_6715_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_a543_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_6cc2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_c780_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_e5ca_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_9f6a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l100_l118_DUPLICATE_c896_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_8c39_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_4fba_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_9369_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_b38c_return_output;
     VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_221d_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l55_l126_l99_l63_l152_l170_l144_l134_l91_l117_l109_l74_DUPLICATE_a43c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_d4c9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_a368_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_a368_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_7e71_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_ddc1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l116_l151_l54_l73_l98_l81_l125_l170_l62_l44_l133_l183_l160_l182_l90_l143_l108_DUPLICATE_774d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l55_l126_l99_l63_l45_l152_l170_l144_l161_l134_l169_l91_l117_l109_l74_DUPLICATE_f422_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l74_c3_e8cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_cond;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output := result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_bbb2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c3_c780] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l109_c3_d65c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_cond;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output := result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_ae46] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l55_c3_76ff] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_cond;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output := result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_af4e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l126_c3_7be0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_cond;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output := result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_cond;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output := result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_0187] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_af4e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c3_0187] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output;

     -- sprite_MUX[uxn_device_h_l82_c3_af4e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l82_c3_af4e_cond <= VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_cond;
     sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue <= VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iftrue;
     sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse <= VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_return_output := sprite_MUX_uxn_device_h_l82_c3_af4e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c3_b27e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c4_9436] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c4_9436_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_left;
     BIN_OP_OR_uxn_device_h_l153_c4_9436_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output := BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_ae46] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_5046] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output := result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_e8cc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output := result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c3_0909] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_5046] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l55_c3_76ff] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_cond;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output := result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_cond;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output := result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- result_vram_value_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output := CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_bbb2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_d65c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output := result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output := result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_baa7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l182_c7_acbb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_cond;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output := result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_7be0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_b27e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_7be0] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output := result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output;

     -- BIN_OP_OR[uxn_device_h_l118_c4_b001] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l118_c4_b001_left <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_left;
     BIN_OP_OR_uxn_device_h_l118_c4_b001_right <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output := BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_bbb2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c3_0187] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_76ff] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output := result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_ae46] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_baa7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_0427] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c3_b27e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output;

     -- color_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_color_MUX_uxn_device_h_l63_c3_8c39_cond;
     color_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_color_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     color_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_color_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l63_c3_8c39_return_output := color_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- result_vram_value_MUX[uxn_device_h_l183_c3_c928] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_cond;
     result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iftrue;
     result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output := result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l74_c3_e8cc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_cond;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output := result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_0909] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output;

     -- auto_advance_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_cond;
     auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output := auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- result_vram_address_MUX[uxn_device_h_l183_c3_c928] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_cond;
     result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iftrue;
     result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output := result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_c780] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_5046] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c3_0909] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_0909] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output := result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output;

     -- pixel_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_cond;
     pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_return_output := pixel_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- BIN_OP_EQ[uxn_device_h_l66_c20_74e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_left;
     BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output := BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c3_c780] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l109_c3_d65c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_cond;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output := result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l162_c27_0de9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_left;
     BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output := BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l183_c3_c928] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_cond;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output := result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_af4e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l66_c20_6039_cond := VAR_BIN_OP_EQ_uxn_device_h_l66_c20_74e7_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_0427_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_ae46_iftrue := VAR_BIN_OP_OR_uxn_device_h_l118_c4_b001_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iftrue := VAR_BIN_OP_OR_uxn_device_h_l153_c4_9436_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left := VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_0de9_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_c780_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_0187_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_e7a9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_auto_advance_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_color_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_pixel_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_d65c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_ae46_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_7be0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_0187_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_b27e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_bbb2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_baa7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_0909_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_76ff_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_e8cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_af4e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_5046_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_c780_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_d65c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_ae46_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_7be0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_0187_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_b27e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_bbb2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_acbb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_0909_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_76ff_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_e8cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_af4e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_5046_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_c780_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_d65c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_ae46_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_7be0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_0187_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_b27e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_bbb2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_baa7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_0909_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_76ff_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_e8cc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_af4e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_5046_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_c780_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_0909_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_c928_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l183_c3_c928_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l183_c3_c928_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue := VAR_sprite_MUX_uxn_device_h_l82_c3_af4e_return_output;
     -- BIN_OP_PLUS[uxn_device_h_l176_c27_7e80] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_left;
     BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output := BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output := result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- x_MUX[uxn_device_h_l99_c3_c780] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c3_c780_cond <= VAR_x_MUX_uxn_device_h_l99_c3_c780_cond;
     x_MUX_uxn_device_h_l99_c3_c780_iftrue <= VAR_x_MUX_uxn_device_h_l99_c3_c780_iftrue;
     x_MUX_uxn_device_h_l99_c3_c780_iffalse <= VAR_x_MUX_uxn_device_h_l99_c3_c780_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c3_c780_return_output := x_MUX_uxn_device_h_l99_c3_c780_return_output;

     -- color_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_color_MUX_uxn_device_h_l62_c7_249a_cond;
     color_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_color_MUX_uxn_device_h_l62_c7_249a_iftrue;
     color_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_color_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l62_c7_249a_return_output := color_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l182_c7_acbb] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_cond;
     result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iftrue;
     result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output := result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- pixel_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_pixel_MUX_uxn_device_h_l62_c7_249a_cond;
     pixel_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iftrue;
     pixel_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_pixel_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l62_c7_249a_return_output := pixel_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- BIN_OP_GT[uxn_device_h_l162_c27_1ba6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_left;
     BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output := BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output;

     -- x_MUX[uxn_device_h_l117_c3_ae46] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c3_ae46_cond <= VAR_x_MUX_uxn_device_h_l117_c3_ae46_cond;
     x_MUX_uxn_device_h_l117_c3_ae46_iftrue <= VAR_x_MUX_uxn_device_h_l117_c3_ae46_iftrue;
     x_MUX_uxn_device_h_l117_c3_ae46_iffalse <= VAR_x_MUX_uxn_device_h_l117_c3_ae46_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c3_ae46_return_output := x_MUX_uxn_device_h_l117_c3_ae46_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output := result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- sprite_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_cond;
     sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_return_output := sprite_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- y_MUX[uxn_device_h_l134_c3_0187] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c3_0187_cond <= VAR_y_MUX_uxn_device_h_l134_c3_0187_cond;
     y_MUX_uxn_device_h_l134_c3_0187_iftrue <= VAR_y_MUX_uxn_device_h_l134_c3_0187_iftrue;
     y_MUX_uxn_device_h_l134_c3_0187_iffalse <= VAR_y_MUX_uxn_device_h_l134_c3_0187_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c3_0187_return_output := y_MUX_uxn_device_h_l134_c3_0187_return_output;

     -- y_MUX[uxn_device_h_l152_c3_bbb2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l152_c3_bbb2_cond <= VAR_y_MUX_uxn_device_h_l152_c3_bbb2_cond;
     y_MUX_uxn_device_h_l152_c3_bbb2_iftrue <= VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iftrue;
     y_MUX_uxn_device_h_l152_c3_bbb2_iffalse <= VAR_y_MUX_uxn_device_h_l152_c3_bbb2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l152_c3_bbb2_return_output := y_MUX_uxn_device_h_l152_c3_bbb2_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_cond;
     auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output := auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- MUX[uxn_device_h_l66_c20_6039] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l66_c20_6039_cond <= VAR_MUX_uxn_device_h_l66_c20_6039_cond;
     MUX_uxn_device_h_l66_c20_6039_iftrue <= VAR_MUX_uxn_device_h_l66_c20_6039_iftrue;
     MUX_uxn_device_h_l66_c20_6039_iffalse <= VAR_MUX_uxn_device_h_l66_c20_6039_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l66_c20_6039_return_output := MUX_uxn_device_h_l66_c20_6039_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l182_c7_acbb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_cond;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output := result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output;

     -- result_vram_address_MUX[uxn_device_h_l182_c7_acbb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_cond;
     result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iftrue;
     result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output := result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l162_c27_b03d_cond := VAR_BIN_OP_GT_uxn_device_h_l162_c27_1ba6_return_output;
     VAR_result_vram_address_uxn_device_h_l176_c4_39d6 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_7e80_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue := VAR_MUX_uxn_device_h_l66_c20_6039_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_color_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_pixel_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_acbb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l182_c7_acbb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l182_c7_acbb_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_sprite_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_4239_iftrue := VAR_x_MUX_uxn_device_h_l117_c3_ae46_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_a543_iftrue := VAR_x_MUX_uxn_device_h_l99_c3_c780_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_d195_iftrue := VAR_y_MUX_uxn_device_h_l134_c3_0187_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_0131_iftrue := VAR_y_MUX_uxn_device_h_l152_c3_bbb2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue := VAR_result_vram_address_uxn_device_h_l176_c4_39d6;
     -- y_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_y_MUX_uxn_device_h_l151_c7_0131_cond;
     y_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_y_MUX_uxn_device_h_l151_c7_0131_iftrue;
     y_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_y_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l151_c7_0131_return_output := y_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output := auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- pixel_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_pixel_MUX_uxn_device_h_l54_c7_d708_cond;
     pixel_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iftrue;
     pixel_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c7_d708_return_output := pixel_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_vram_address_MUX[uxn_device_h_l170_c3_f0ed] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_cond;
     result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iftrue;
     result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output := result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l63_c3_8c39] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_cond;
     is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iftrue;
     is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output := is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output := result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- MUX[uxn_device_h_l162_c27_b03d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l162_c27_b03d_cond <= VAR_MUX_uxn_device_h_l162_c27_b03d_cond;
     MUX_uxn_device_h_l162_c27_b03d_iftrue <= VAR_MUX_uxn_device_h_l162_c27_b03d_iftrue;
     MUX_uxn_device_h_l162_c27_b03d_iffalse <= VAR_MUX_uxn_device_h_l162_c27_b03d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l162_c27_b03d_return_output := MUX_uxn_device_h_l162_c27_b03d_return_output;

     -- sprite_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_cond;
     sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output := sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- color_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_color_MUX_uxn_device_h_l54_c7_d708_cond;
     color_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_color_MUX_uxn_device_h_l54_c7_d708_iftrue;
     color_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_color_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c7_d708_return_output := color_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_vram_value_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output := result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- x_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_x_MUX_uxn_device_h_l116_c7_4239_cond;
     x_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_x_MUX_uxn_device_h_l116_c7_4239_iftrue;
     x_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_x_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l116_c7_4239_return_output := x_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue := VAR_MUX_uxn_device_h_l162_c27_b03d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_color_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_8c39_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_pixel_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l170_c3_f0ed_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_sprite_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_x_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_y_MUX_uxn_device_h_l151_c7_0131_return_output;
     -- result_vram_address_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_cond;
     result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output := result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_cond;
     is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iftrue;
     is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output := is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_baa7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output;

     -- y_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_y_MUX_uxn_device_h_l143_c7_b3ee_cond;
     y_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     y_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_y_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c7_b3ee_return_output := y_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output := auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- x_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_x_MUX_uxn_device_h_l108_c7_7501_cond;
     x_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_x_MUX_uxn_device_h_l108_c7_7501_iftrue;
     x_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_x_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c7_7501_return_output := x_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- color_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_color_MUX_uxn_device_h_l44_c2_4244_cond;
     color_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_color_MUX_uxn_device_h_l44_c2_4244_iftrue;
     color_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_color_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l44_c2_4244_return_output := color_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- sprite_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_sprite_MUX_uxn_device_h_l62_c7_249a_cond;
     sprite_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iftrue;
     sprite_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_sprite_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l62_c7_249a_return_output := sprite_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- pixel_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_pixel_MUX_uxn_device_h_l44_c2_4244_cond;
     pixel_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iftrue;
     pixel_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_pixel_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l44_c2_4244_return_output := pixel_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_0131_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_249a_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_baa7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_sprite_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_x_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_y_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- sprite_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_sprite_MUX_uxn_device_h_l54_c7_d708_cond;
     sprite_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iftrue;
     sprite_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_sprite_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l54_c7_d708_return_output := sprite_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- auto_advance_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_cond;
     auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output := auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output := is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- y_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_y_MUX_uxn_device_h_l133_c7_d195_cond;
     y_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_y_MUX_uxn_device_h_l133_c7_d195_iftrue;
     y_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_y_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l133_c7_d195_return_output := y_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- x_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_x_MUX_uxn_device_h_l98_c7_a543_cond;
     x_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_x_MUX_uxn_device_h_l98_c7_a543_iftrue;
     x_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_x_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l98_c7_a543_return_output := x_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_auto_advance_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_sprite_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_x_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_y_MUX_uxn_device_h_l133_c7_d195_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- sprite_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_sprite_MUX_uxn_device_h_l44_c2_4244_cond;
     sprite_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iftrue;
     sprite_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_sprite_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l44_c2_4244_return_output := sprite_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- auto_advance_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_cond;
     auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iftrue;
     auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output := auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- result_vram_value_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- y_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_y_MUX_uxn_device_h_l125_c7_9f5e_cond;
     y_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     y_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_9f5e_return_output := y_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- x_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_x_MUX_uxn_device_h_l90_c7_dc56_cond;
     x_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     x_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_dc56_return_output := x_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output := result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_cond;
     is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iftrue;
     is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output := is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l133_c7_d195_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     -- auto_advance_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output := auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_cond;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output := result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_cond;
     result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output := result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- y_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_y_MUX_uxn_device_h_l116_c7_4239_cond;
     y_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_4239_iftrue;
     y_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_4239_return_output := y_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- x_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_x_MUX_uxn_device_h_l81_c7_61bf_cond;
     x_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     x_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_61bf_return_output := x_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_cond;
     result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output := result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_4239_return_output;
     -- y_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_y_MUX_uxn_device_h_l108_c7_7501_cond;
     y_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_y_MUX_uxn_device_h_l108_c7_7501_iftrue;
     y_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_y_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l108_c7_7501_return_output := y_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_cond;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output := result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output := auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- result_vram_address_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_cond;
     result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iftrue;
     result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output := result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- x_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_x_MUX_uxn_device_h_l73_c7_0ebe_cond;
     x_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     x_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_x_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l73_c7_0ebe_return_output := x_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_vram_value_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_x_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_y_MUX_uxn_device_h_l108_c7_7501_return_output;
     -- result_vram_address_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- y_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_y_MUX_uxn_device_h_l98_c7_a543_cond;
     y_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_y_MUX_uxn_device_h_l98_c7_a543_iftrue;
     y_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_y_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l98_c7_a543_return_output := y_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c7_9f5e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output;

     -- auto_advance_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_cond;
     auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iftrue;
     auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output := auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- x_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_x_MUX_uxn_device_h_l62_c7_249a_cond;
     x_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_x_MUX_uxn_device_h_l62_c7_249a_iftrue;
     x_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_x_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l62_c7_249a_return_output := x_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_auto_advance_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l125_c7_9f5e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_x_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_y_MUX_uxn_device_h_l98_c7_a543_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_cond;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output := result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_d195] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_4239] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output;

     -- y_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_y_MUX_uxn_device_h_l90_c7_dc56_cond;
     y_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     y_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_dc56_return_output := y_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output := result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_cond;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output := result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- auto_advance_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_cond;
     auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iftrue;
     auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output := auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- x_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_x_MUX_uxn_device_h_l54_c7_d708_cond;
     x_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_x_MUX_uxn_device_h_l54_c7_d708_iftrue;
     x_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_x_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l54_c7_d708_return_output := x_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_vram_value_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_cond;
     result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output := result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_d195_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_auto_advance_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_4239_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_x_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_dc56_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_cond;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output := result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output := auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_b3ee] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- y_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_y_MUX_uxn_device_h_l81_c7_61bf_cond;
     y_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     y_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_61bf_return_output := y_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- x_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_x_MUX_uxn_device_h_l44_c2_4244_cond;
     x_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_x_MUX_uxn_device_h_l44_c2_4244_iftrue;
     x_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_x_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l44_c2_4244_return_output := x_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_vram_value_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_cond;
     result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output := result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_vram_address_MUX[uxn_device_h_l108_c7_7501] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_cond;
     result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iftrue;
     result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output := result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_b3ee_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l108_c7_7501_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l98_c7_a543_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_61bf_return_output;
     -- y_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_y_MUX_uxn_device_h_l73_c7_0ebe_cond;
     y_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     y_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_y_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l73_c7_0ebe_return_output := y_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output := auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_vram_value_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output := result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_cond;
     result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output := result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l98_c7_a543] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_cond;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output := result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_0131] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_0131_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l98_c7_a543_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_y_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     -- auto_advance_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_cond;
     auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output := auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- y_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_y_MUX_uxn_device_h_l62_c7_249a_cond;
     y_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_y_MUX_uxn_device_h_l62_c7_249a_iftrue;
     y_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_y_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l62_c7_249a_return_output := y_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_0842] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_dc56] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_0842_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_dc56_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_y_MUX_uxn_device_h_l62_c7_249a_return_output;
     -- y_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_y_MUX_uxn_device_h_l54_c7_d708_cond;
     y_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_y_MUX_uxn_device_h_l54_c7_d708_iftrue;
     y_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_y_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l54_c7_d708_return_output := y_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- auto_advance_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_cond;
     auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iftrue;
     auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output := auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_cond;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output := result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_vram_value_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_1de2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_61bf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1de2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_auto_advance_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_61bf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_y_MUX_uxn_device_h_l54_c7_d708_return_output;
     -- result_vram_value_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_cond;
     result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output := result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_d9f1] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output;

     -- y_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_y_MUX_uxn_device_h_l44_c2_4244_cond;
     y_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_y_MUX_uxn_device_h_l44_c2_4244_iftrue;
     y_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_y_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l44_c2_4244_return_output := y_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- auto_advance_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_cond;
     auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iftrue;
     auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output := auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c7_0ebe] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_cond;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output := result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_d9f1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_auto_advance_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l73_c7_0ebe_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l62_c7_249a_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l44_c2_4244_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_4e36] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_cond;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output := result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- auto_advance_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_cond;
     auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iftrue;
     auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output := auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_cond;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output := result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output := result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_cond;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output := result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_vram_address_MUX[uxn_device_h_l62_c7_249a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_cond;
     result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iftrue;
     result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output := result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_cond;
     result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output := result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_4e36_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l44_c2_4244_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l62_c7_249a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l54_c7_d708_return_output;
     -- printf_uxn_device_h_l171_c4_9cc6[uxn_device_h_l171_c4_9cc6] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0 <= VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg0;
     printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1 <= VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg1;
     printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2 <= VAR_printf_uxn_device_h_l171_c4_9cc6_uxn_device_h_l171_c4_9cc6_arg2;
     -- Outputs

     -- result_is_vram_write_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_cond;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output := result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_vram_address_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_cond;
     result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output := result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- result_vram_value_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_cond;
     result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output := result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c7_d708] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_d708_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l54_c7_d708_return_output;
     -- result_vram_address_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_cond;
     result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output := result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l44_c2_4244] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_cond;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output := result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1_uxn_device_h_l196_l35_DUPLICATE_d5dc LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1_uxn_device_h_l196_l35_DUPLICATE_d5dc_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_4244_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_4244_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1_uxn_device_h_l196_l35_DUPLICATE_d5dc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_9ce1_uxn_device_h_l196_l35_DUPLICATE_d5dc_return_output;
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
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
