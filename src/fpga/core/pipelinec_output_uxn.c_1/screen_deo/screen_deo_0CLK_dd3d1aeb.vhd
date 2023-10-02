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
-- printf_uxn_device_h_l33_c2_f1a6[uxn_device_h_l33_c2_f1a6]
signal printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_f200]
signal BIN_OP_EQ_uxn_device_h_l35_c6_f200_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_f200_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_a976]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l35_c2_d738]
signal y_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_d738]
signal auto_advance_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_d738]
signal pixel_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_d738]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l35_c2_d738]
signal x_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_d738]
signal sprite_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l35_c2_d738]
signal color_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_d738]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_d738]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_d738]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_d738]
signal result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_d738]
signal result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(1 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_d738]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_d738]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_512a]
signal BIN_OP_EQ_uxn_device_h_l36_c7_512a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_512a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_59ef]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_59ef]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_59ef]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_59ef]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_5466]
signal BIN_OP_EQ_uxn_device_h_l45_c11_5466_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_5466_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_69ad]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l45_c7_a976]
signal y_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_a976]
signal auto_advance_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_a976]
signal pixel_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_a976]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l45_c7_a976]
signal x_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_a976]
signal sprite_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l45_c7_a976]
signal color_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_a976]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_a976]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_a976]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_a976]
signal result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_a976]
signal result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_a976]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_b420]
signal BIN_OP_EQ_uxn_device_h_l46_c7_b420_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_b420_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_e4ad]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_e4ad]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_e4ad]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_0992]
signal BIN_OP_EQ_uxn_device_h_l53_c11_0992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_0992_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2a38]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l53_c7_69ad]
signal y_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_69ad]
signal auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_69ad]
signal pixel_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_69ad]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l53_c7_69ad]
signal x_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_69ad]
signal sprite_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l53_c7_69ad]
signal color_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(1 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_69ad]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_69ad]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_69ad]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_69ad]
signal result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_69ad]
signal result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_69ad]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_31e4]
signal BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_5d49]
signal pixel_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_5d49]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_5d49]
signal color_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(1 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_5d49]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_5d49]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_5d49]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_b1ec]
signal BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_967b]
signal BIN_OP_EQ_uxn_device_h_l57_c20_967b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_967b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_089e]
signal MUX_uxn_device_h_l57_c20_089e_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_089e_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_089e_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_089e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_b79e]
signal BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c804]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l64_c7_2a38]
signal y_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_2a38]
signal auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l64_c7_2a38]
signal x_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_2a38]
signal sprite_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_2a38]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2a38]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_2a38]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_2a38]
signal result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_2a38]
signal result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_2a38]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_9cc7]
signal BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_8aa1]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_8aa1]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_8aa1]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_c2c2]
signal BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_807d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l72_c7_c804]
signal y_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_c804]
signal auto_advance_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l72_c7_c804]
signal x_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_c804]
signal sprite_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_c804]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c804]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_c804]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_c804]
signal result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_c804]
signal result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_c804]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_10e1]
signal BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_7cab]
signal sprite_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_7cab]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_7cab]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_7cab]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_2f7e]
signal BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_e53a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l81_c7_807d]
signal y_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_807d]
signal auto_advance_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_807d]
signal x_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_807d]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_807d]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_807d]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_807d]
signal result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_807d]
signal result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_807d]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_d755]
signal BIN_OP_EQ_uxn_device_h_l82_c7_d755_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_d755_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_7d54]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_7d54]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_7d54]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_74c0]
signal BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_d7a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l89_c7_e53a]
signal y_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_e53a]
signal auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l89_c7_e53a]
signal x_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_e53a]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_e53a]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_e53a]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_e53a]
signal result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_e53a]
signal result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_e53a]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_3af3]
signal BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c3_7f3c]
signal x_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_7f3c]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_7f3c]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_7f3c]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_f845]
signal BIN_OP_EQ_uxn_device_h_l99_c11_f845_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_f845_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_b420]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l99_c7_d7a4]
signal y_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_d7a4]
signal auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c7_d7a4]
signal x_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_d7a4]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_d7a4]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_d7a4]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_d7a4]
signal result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_d7a4]
signal result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_d7a4]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_6c92]
signal BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_0a0d]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_0a0d]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_0a0d]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_a541]
signal BIN_OP_EQ_uxn_device_h_l107_c11_a541_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_a541_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_5b3f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l107_c7_b420]
signal y_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_b420]
signal auto_advance_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c7_b420]
signal x_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(15 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_b420]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_b420]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_b420]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_b420]
signal result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_b420]
signal result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_b420]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_021e]
signal BIN_OP_EQ_uxn_device_h_l108_c7_021e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_021e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c3_9699]
signal x_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_9699]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_9699]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_9699]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_fbfc]
signal BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_d05e]
signal BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_9a8e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l116_c7_5b3f]
signal y_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_5b3f]
signal auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_5b3f]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_5b3f]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_5b3f]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_5b3f]
signal result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_5b3f]
signal result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_5b3f]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_f175]
signal BIN_OP_EQ_uxn_device_h_l117_c7_f175_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_f175_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_e22b]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_e22b]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_e22b]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_ebc7]
signal BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_4e11]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l124_c7_9a8e]
signal y_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_9a8e]
signal auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_9a8e]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_9a8e]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_9a8e]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_9a8e]
signal result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_9a8e]
signal result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_9a8e]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_413c]
signal BIN_OP_EQ_uxn_device_h_l125_c7_413c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_413c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_cdc9]
signal y_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_cdc9]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_cdc9]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_cdc9]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_37b0]
signal BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_bc10]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l134_c7_4e11]
signal y_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_4e11]
signal auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_4e11]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_4e11]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_4e11]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_4e11]
signal result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_4e11]
signal result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_4e11]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_5fd9]
signal BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_f33b]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_f33b]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_f33b]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_52bb]
signal BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_4a77]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l142_c7_bc10]
signal y_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_bc10]
signal auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_bc10]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_bc10]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_bc10]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_bc10]
signal result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_bc10]
signal result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_bc10]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_9c71]
signal BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_324a]
signal y_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_324a]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_324a]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_324a]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_ef55]
signal BIN_OP_OR_uxn_device_h_l144_c4_ef55_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_ef55_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_f8a6]
signal BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_1a0c]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_4a77]
signal auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_4a77]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_4a77]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_4a77]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_4a77]
signal result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_4a77]
signal result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_4a77]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_7af3]
signal BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_7b98]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_7b98]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_7b98]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_b6f5]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_a89b]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_bac9]
signal BIN_OP_GT_uxn_device_h_l153_c27_bac9_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_bac9_right : unsigned(16 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_9e8f]
signal MUX_uxn_device_h_l153_c27_9e8f_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9e8f_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9e8f_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9e8f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_88d3]
signal BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_6b9e]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_1a0c]
signal auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_1a0c]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_1a0c]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_1a0c]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_1a0c]
signal result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_1a0c]
signal result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_1a0c]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_710f]
signal BIN_OP_EQ_uxn_device_h_l161_c7_710f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_710f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_bde0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_f805]
signal auto_advance_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(7 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_f805]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_f805]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_f805]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_f805]
signal result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_f805]
signal result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_f805]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);

-- printf_uxn_device_h_l162_c4_2658[uxn_device_h_l162_c4_2658]
signal printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_5a4d]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_f5b4]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_35d5]
signal BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_223a]
signal result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_223a]
signal result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_223a]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_223a]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_4ad2]
signal BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_1486]
signal result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_1486]
signal result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_1486]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_09c7( ref_toks_0 : device_out_result_t;
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
      base.device_ram_address := ref_toks_1;
      base.is_device_ram_read := ref_toks_2;
      base.is_deo_done := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.vram_value := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.is_vram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6
printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6 : entity work.printf_uxn_device_h_l33_c2_f1a6_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0,
printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_f200
BIN_OP_EQ_uxn_device_h_l35_c6_f200 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_f200_left,
BIN_OP_EQ_uxn_device_h_l35_c6_f200_right,
BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output);

-- y_MUX_uxn_device_h_l35_c2_d738
y_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_d738_cond,
y_MUX_uxn_device_h_l35_c2_d738_iftrue,
y_MUX_uxn_device_h_l35_c2_d738_iffalse,
y_MUX_uxn_device_h_l35_c2_d738_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_d738
auto_advance_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_d738_cond,
auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_d738
pixel_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_d738_cond,
pixel_MUX_uxn_device_h_l35_c2_d738_iftrue,
pixel_MUX_uxn_device_h_l35_c2_d738_iffalse,
pixel_MUX_uxn_device_h_l35_c2_d738_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_d738
is_fill_mode_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output);

-- x_MUX_uxn_device_h_l35_c2_d738
x_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_d738_cond,
x_MUX_uxn_device_h_l35_c2_d738_iftrue,
x_MUX_uxn_device_h_l35_c2_d738_iffalse,
x_MUX_uxn_device_h_l35_c2_d738_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_d738
sprite_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_d738_cond,
sprite_MUX_uxn_device_h_l35_c2_d738_iftrue,
sprite_MUX_uxn_device_h_l35_c2_d738_iffalse,
sprite_MUX_uxn_device_h_l35_c2_d738_return_output);

-- color_MUX_uxn_device_h_l35_c2_d738
color_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_d738_cond,
color_MUX_uxn_device_h_l35_c2_d738_iftrue,
color_MUX_uxn_device_h_l35_c2_d738_iffalse,
color_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_d738
result_device_ram_address_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_d738
result_is_deo_done_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_d738
result_vram_address_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_d738
result_vram_value_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_d738
result_is_vram_write_MUX_uxn_device_h_l35_c2_d738 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_512a
BIN_OP_EQ_uxn_device_h_l36_c7_512a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_512a_left,
BIN_OP_EQ_uxn_device_h_l36_c7_512a_right,
BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef
result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef
result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_5466
BIN_OP_EQ_uxn_device_h_l45_c11_5466 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_5466_left,
BIN_OP_EQ_uxn_device_h_l45_c11_5466_right,
BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- y_MUX_uxn_device_h_l45_c7_a976
y_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_a976_cond,
y_MUX_uxn_device_h_l45_c7_a976_iftrue,
y_MUX_uxn_device_h_l45_c7_a976_iffalse,
y_MUX_uxn_device_h_l45_c7_a976_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_a976
auto_advance_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_a976_cond,
auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_a976
pixel_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_a976_cond,
pixel_MUX_uxn_device_h_l45_c7_a976_iftrue,
pixel_MUX_uxn_device_h_l45_c7_a976_iffalse,
pixel_MUX_uxn_device_h_l45_c7_a976_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_a976
is_fill_mode_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output);

-- x_MUX_uxn_device_h_l45_c7_a976
x_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_a976_cond,
x_MUX_uxn_device_h_l45_c7_a976_iftrue,
x_MUX_uxn_device_h_l45_c7_a976_iffalse,
x_MUX_uxn_device_h_l45_c7_a976_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_a976
sprite_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_a976_cond,
sprite_MUX_uxn_device_h_l45_c7_a976_iftrue,
sprite_MUX_uxn_device_h_l45_c7_a976_iffalse,
sprite_MUX_uxn_device_h_l45_c7_a976_return_output);

-- color_MUX_uxn_device_h_l45_c7_a976
color_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_a976_cond,
color_MUX_uxn_device_h_l45_c7_a976_iftrue,
color_MUX_uxn_device_h_l45_c7_a976_iffalse,
color_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_a976
result_device_ram_address_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_a976
result_is_deo_done_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_a976
result_vram_address_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_a976
result_vram_value_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_a976
result_is_vram_write_MUX_uxn_device_h_l45_c7_a976 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_b420
BIN_OP_EQ_uxn_device_h_l46_c7_b420 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_b420_left,
BIN_OP_EQ_uxn_device_h_l46_c7_b420_right,
BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad
result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad
result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_0992
BIN_OP_EQ_uxn_device_h_l53_c11_0992 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_0992_left,
BIN_OP_EQ_uxn_device_h_l53_c11_0992_right,
BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- y_MUX_uxn_device_h_l53_c7_69ad
y_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_69ad_cond,
y_MUX_uxn_device_h_l53_c7_69ad_iftrue,
y_MUX_uxn_device_h_l53_c7_69ad_iffalse,
y_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_69ad
auto_advance_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond,
auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_69ad
pixel_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_69ad_cond,
pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue,
pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse,
pixel_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_69ad
is_fill_mode_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- x_MUX_uxn_device_h_l53_c7_69ad
x_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_69ad_cond,
x_MUX_uxn_device_h_l53_c7_69ad_iftrue,
x_MUX_uxn_device_h_l53_c7_69ad_iffalse,
x_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_69ad
sprite_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_69ad_cond,
sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue,
sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse,
sprite_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- color_MUX_uxn_device_h_l53_c7_69ad
color_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_69ad_cond,
color_MUX_uxn_device_h_l53_c7_69ad_iftrue,
color_MUX_uxn_device_h_l53_c7_69ad_iffalse,
color_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad
result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad
result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_69ad
result_vram_address_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_69ad
result_vram_value_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad
result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_31e4
BIN_OP_EQ_uxn_device_h_l54_c7_31e4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left,
BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right,
BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_5d49
pixel_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_5d49_cond,
pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue,
pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse,
pixel_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_5d49
is_fill_mode_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- color_MUX_uxn_device_h_l54_c3_5d49
color_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_5d49_cond,
color_MUX_uxn_device_h_l54_c3_5d49_iftrue,
color_MUX_uxn_device_h_l54_c3_5d49_iffalse,
color_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49
result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49
result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_b1ec
BIN_OP_AND_uxn_device_h_l57_c20_b1ec : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left,
BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right,
BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_967b
BIN_OP_EQ_uxn_device_h_l57_c20_967b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_967b_left,
BIN_OP_EQ_uxn_device_h_l57_c20_967b_right,
BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output);

-- MUX_uxn_device_h_l57_c20_089e
MUX_uxn_device_h_l57_c20_089e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_089e_cond,
MUX_uxn_device_h_l57_c20_089e_iftrue,
MUX_uxn_device_h_l57_c20_089e_iffalse,
MUX_uxn_device_h_l57_c20_089e_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_b79e
BIN_OP_EQ_uxn_device_h_l64_c11_b79e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left,
BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right,
BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output);

-- y_MUX_uxn_device_h_l64_c7_2a38
y_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_2a38_cond,
y_MUX_uxn_device_h_l64_c7_2a38_iftrue,
y_MUX_uxn_device_h_l64_c7_2a38_iffalse,
y_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_2a38
auto_advance_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond,
auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- x_MUX_uxn_device_h_l64_c7_2a38
x_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_2a38_cond,
x_MUX_uxn_device_h_l64_c7_2a38_iftrue,
x_MUX_uxn_device_h_l64_c7_2a38_iffalse,
x_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_2a38
sprite_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_2a38_cond,
sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue,
sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse,
sprite_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38
result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38
result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_2a38
result_vram_address_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_2a38
result_vram_value_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38
result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_9cc7
BIN_OP_EQ_uxn_device_h_l65_c7_9cc7 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left,
BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right,
BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1
result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1
result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_c2c2
BIN_OP_EQ_uxn_device_h_l72_c11_c2c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left,
BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right,
BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output);

-- y_MUX_uxn_device_h_l72_c7_c804
y_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_c804_cond,
y_MUX_uxn_device_h_l72_c7_c804_iftrue,
y_MUX_uxn_device_h_l72_c7_c804_iffalse,
y_MUX_uxn_device_h_l72_c7_c804_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_c804
auto_advance_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_c804_cond,
auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output);

-- x_MUX_uxn_device_h_l72_c7_c804
x_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_c804_cond,
x_MUX_uxn_device_h_l72_c7_c804_iftrue,
x_MUX_uxn_device_h_l72_c7_c804_iffalse,
x_MUX_uxn_device_h_l72_c7_c804_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_c804
sprite_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_c804_cond,
sprite_MUX_uxn_device_h_l72_c7_c804_iftrue,
sprite_MUX_uxn_device_h_l72_c7_c804_iffalse,
sprite_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_c804
result_device_ram_address_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_c804
result_is_deo_done_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_c804
result_vram_address_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_c804
result_vram_value_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_c804
result_is_vram_write_MUX_uxn_device_h_l72_c7_c804 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_10e1
BIN_OP_EQ_uxn_device_h_l73_c7_10e1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left,
BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right,
BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_7cab
sprite_MUX_uxn_device_h_l73_c3_7cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_7cab_cond,
sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue,
sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse,
sprite_MUX_uxn_device_h_l73_c3_7cab_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab
result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab
result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_2f7e
BIN_OP_EQ_uxn_device_h_l81_c11_2f7e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left,
BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right,
BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- y_MUX_uxn_device_h_l81_c7_807d
y_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_807d_cond,
y_MUX_uxn_device_h_l81_c7_807d_iftrue,
y_MUX_uxn_device_h_l81_c7_807d_iffalse,
y_MUX_uxn_device_h_l81_c7_807d_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_807d
auto_advance_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_807d_cond,
auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output);

-- x_MUX_uxn_device_h_l81_c7_807d
x_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_807d_cond,
x_MUX_uxn_device_h_l81_c7_807d_iftrue,
x_MUX_uxn_device_h_l81_c7_807d_iffalse,
x_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_807d
result_device_ram_address_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_807d
result_is_deo_done_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_807d
result_vram_address_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_807d
result_vram_value_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_807d
result_is_vram_write_MUX_uxn_device_h_l81_c7_807d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_d755
BIN_OP_EQ_uxn_device_h_l82_c7_d755 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_d755_left,
BIN_OP_EQ_uxn_device_h_l82_c7_d755_right,
BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54
result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54
result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_74c0
BIN_OP_EQ_uxn_device_h_l89_c11_74c0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left,
BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right,
BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- y_MUX_uxn_device_h_l89_c7_e53a
y_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_e53a_cond,
y_MUX_uxn_device_h_l89_c7_e53a_iftrue,
y_MUX_uxn_device_h_l89_c7_e53a_iffalse,
y_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_e53a
auto_advance_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond,
auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- x_MUX_uxn_device_h_l89_c7_e53a
x_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_e53a_cond,
x_MUX_uxn_device_h_l89_c7_e53a_iftrue,
x_MUX_uxn_device_h_l89_c7_e53a_iffalse,
x_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a
result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a
result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_e53a
result_vram_address_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_e53a
result_vram_value_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a
result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_3af3
BIN_OP_EQ_uxn_device_h_l90_c7_3af3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left,
BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right,
BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output);

-- x_MUX_uxn_device_h_l90_c3_7f3c
x_MUX_uxn_device_h_l90_c3_7f3c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_7f3c_cond,
x_MUX_uxn_device_h_l90_c3_7f3c_iftrue,
x_MUX_uxn_device_h_l90_c3_7f3c_iffalse,
x_MUX_uxn_device_h_l90_c3_7f3c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c
result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c
result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_f845
BIN_OP_EQ_uxn_device_h_l99_c11_f845 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_f845_left,
BIN_OP_EQ_uxn_device_h_l99_c11_f845_right,
BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output);

-- y_MUX_uxn_device_h_l99_c7_d7a4
y_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_d7a4_cond,
y_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
y_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
y_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_d7a4
auto_advance_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond,
auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- x_MUX_uxn_device_h_l99_c7_d7a4
x_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_d7a4_cond,
x_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
x_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
x_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4
result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4
result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_d7a4
result_vram_address_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_d7a4
result_vram_value_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4
result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_6c92
BIN_OP_EQ_uxn_device_h_l100_c7_6c92 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left,
BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right,
BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d
result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d
result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_a541
BIN_OP_EQ_uxn_device_h_l107_c11_a541 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_a541_left,
BIN_OP_EQ_uxn_device_h_l107_c11_a541_right,
BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- y_MUX_uxn_device_h_l107_c7_b420
y_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_b420_cond,
y_MUX_uxn_device_h_l107_c7_b420_iftrue,
y_MUX_uxn_device_h_l107_c7_b420_iffalse,
y_MUX_uxn_device_h_l107_c7_b420_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_b420
auto_advance_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_b420_cond,
auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output);

-- x_MUX_uxn_device_h_l107_c7_b420
x_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_b420_cond,
x_MUX_uxn_device_h_l107_c7_b420_iftrue,
x_MUX_uxn_device_h_l107_c7_b420_iffalse,
x_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_b420
result_device_ram_address_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_b420
result_is_deo_done_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_b420
result_vram_address_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_b420
result_vram_value_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_b420
result_is_vram_write_MUX_uxn_device_h_l107_c7_b420 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_021e
BIN_OP_EQ_uxn_device_h_l108_c7_021e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_021e_left,
BIN_OP_EQ_uxn_device_h_l108_c7_021e_right,
BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output);

-- x_MUX_uxn_device_h_l108_c3_9699
x_MUX_uxn_device_h_l108_c3_9699 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_9699_cond,
x_MUX_uxn_device_h_l108_c3_9699_iftrue,
x_MUX_uxn_device_h_l108_c3_9699_iffalse,
x_MUX_uxn_device_h_l108_c3_9699_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_9699
result_is_deo_done_MUX_uxn_device_h_l108_c3_9699 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_9699
result_device_ram_address_MUX_uxn_device_h_l108_c3_9699 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_fbfc
BIN_OP_OR_uxn_device_h_l109_c4_fbfc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left,
BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right,
BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_d05e
BIN_OP_EQ_uxn_device_h_l116_c11_d05e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left,
BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right,
BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- y_MUX_uxn_device_h_l116_c7_5b3f
y_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_5b3f_cond,
y_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
y_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
y_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_5b3f
auto_advance_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond,
auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f
result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f
result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_5b3f
result_vram_address_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_5b3f
result_vram_value_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f
result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_f175
BIN_OP_EQ_uxn_device_h_l117_c7_f175 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_f175_left,
BIN_OP_EQ_uxn_device_h_l117_c7_f175_right,
BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b
result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b
result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_ebc7
BIN_OP_EQ_uxn_device_h_l124_c11_ebc7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left,
BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right,
BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- y_MUX_uxn_device_h_l124_c7_9a8e
y_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_9a8e_cond,
y_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
y_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
y_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_9a8e
auto_advance_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond,
auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e
result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e
result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_9a8e
result_vram_address_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_9a8e
result_vram_value_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e
result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_413c
BIN_OP_EQ_uxn_device_h_l125_c7_413c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_413c_left,
BIN_OP_EQ_uxn_device_h_l125_c7_413c_right,
BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output);

-- y_MUX_uxn_device_h_l125_c3_cdc9
y_MUX_uxn_device_h_l125_c3_cdc9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_cdc9_cond,
y_MUX_uxn_device_h_l125_c3_cdc9_iftrue,
y_MUX_uxn_device_h_l125_c3_cdc9_iffalse,
y_MUX_uxn_device_h_l125_c3_cdc9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9
result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9
result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_37b0
BIN_OP_EQ_uxn_device_h_l134_c11_37b0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left,
BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right,
BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- y_MUX_uxn_device_h_l134_c7_4e11
y_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_4e11_cond,
y_MUX_uxn_device_h_l134_c7_4e11_iftrue,
y_MUX_uxn_device_h_l134_c7_4e11_iffalse,
y_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_4e11
auto_advance_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond,
auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11
result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11
result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_4e11
result_vram_address_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_4e11
result_vram_value_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11
result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_5fd9
BIN_OP_EQ_uxn_device_h_l135_c7_5fd9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left,
BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right,
BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b
result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b
result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_52bb
BIN_OP_EQ_uxn_device_h_l142_c11_52bb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left,
BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right,
BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- y_MUX_uxn_device_h_l142_c7_bc10
y_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_bc10_cond,
y_MUX_uxn_device_h_l142_c7_bc10_iftrue,
y_MUX_uxn_device_h_l142_c7_bc10_iffalse,
y_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_bc10
auto_advance_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond,
auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10
result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10
result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_bc10
result_vram_address_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_bc10
result_vram_value_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10
result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_9c71
BIN_OP_EQ_uxn_device_h_l143_c7_9c71 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left,
BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right,
BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output);

-- y_MUX_uxn_device_h_l143_c3_324a
y_MUX_uxn_device_h_l143_c3_324a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_324a_cond,
y_MUX_uxn_device_h_l143_c3_324a_iftrue,
y_MUX_uxn_device_h_l143_c3_324a_iffalse,
y_MUX_uxn_device_h_l143_c3_324a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_324a
result_is_deo_done_MUX_uxn_device_h_l143_c3_324a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_324a
result_device_ram_address_MUX_uxn_device_h_l143_c3_324a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_ef55
BIN_OP_OR_uxn_device_h_l144_c4_ef55 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_ef55_left,
BIN_OP_OR_uxn_device_h_l144_c4_ef55_right,
BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_f8a6
BIN_OP_EQ_uxn_device_h_l151_c11_f8a6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left,
BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right,
BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_4a77
auto_advance_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond,
auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77
result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77
result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_4a77
result_vram_address_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_4a77
result_vram_value_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77
result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_7af3
BIN_OP_EQ_uxn_device_h_l152_c7_7af3 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left,
BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right,
BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98
result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98
result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_a89b
BIN_OP_PLUS_uxn_device_h_l153_c27_a89b : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_bac9
BIN_OP_GT_uxn_device_h_l153_c27_bac9 : entity work.BIN_OP_GT_uint26_t_uint17_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_bac9_left,
BIN_OP_GT_uxn_device_h_l153_c27_bac9_right,
BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output);

-- MUX_uxn_device_h_l153_c27_9e8f
MUX_uxn_device_h_l153_c27_9e8f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_9e8f_cond,
MUX_uxn_device_h_l153_c27_9e8f_iftrue,
MUX_uxn_device_h_l153_c27_9e8f_iffalse,
MUX_uxn_device_h_l153_c27_9e8f_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_88d3
BIN_OP_EQ_uxn_device_h_l160_c11_88d3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left,
BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right,
BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_1a0c
auto_advance_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond,
auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c
result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c
result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_1a0c
result_vram_address_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_1a0c
result_vram_value_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c
result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_710f
BIN_OP_EQ_uxn_device_h_l161_c7_710f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_710f_left,
BIN_OP_EQ_uxn_device_h_l161_c7_710f_right,
BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_f805
auto_advance_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_f805_cond,
auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_f805
result_device_ram_address_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_f805
result_is_deo_done_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_f805
result_vram_address_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_f805
result_vram_value_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_f805
result_is_vram_write_MUX_uxn_device_h_l161_c3_f805 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output);

-- printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658
printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658 : entity work.printf_uxn_device_h_l162_c4_2658_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0,
printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1,
printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4
BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_35d5
BIN_OP_EQ_uxn_device_h_l173_c11_35d5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left,
BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right,
BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_223a
result_vram_address_MUX_uxn_device_h_l173_c7_223a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_223a
result_vram_value_MUX_uxn_device_h_l173_c7_223a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_223a
result_is_deo_done_MUX_uxn_device_h_l173_c7_223a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_223a
result_is_vram_write_MUX_uxn_device_h_l173_c7_223a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_4ad2
BIN_OP_EQ_uxn_device_h_l174_c7_4ad2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left,
BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right,
BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_1486
result_vram_address_MUX_uxn_device_h_l174_c3_1486 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_1486
result_vram_value_MUX_uxn_device_h_l174_c3_1486 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_1486
result_is_vram_write_MUX_uxn_device_h_l174_c3_1486 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x,
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output,
 y_MUX_uxn_device_h_l35_c2_d738_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output,
 pixel_MUX_uxn_device_h_l35_c2_d738_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output,
 x_MUX_uxn_device_h_l35_c2_d738_return_output,
 sprite_MUX_uxn_device_h_l35_c2_d738_return_output,
 color_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output,
 y_MUX_uxn_device_h_l45_c7_a976_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output,
 pixel_MUX_uxn_device_h_l45_c7_a976_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output,
 x_MUX_uxn_device_h_l45_c7_a976_return_output,
 sprite_MUX_uxn_device_h_l45_c7_a976_return_output,
 color_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output,
 y_MUX_uxn_device_h_l53_c7_69ad_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output,
 pixel_MUX_uxn_device_h_l53_c7_69ad_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output,
 x_MUX_uxn_device_h_l53_c7_69ad_return_output,
 sprite_MUX_uxn_device_h_l53_c7_69ad_return_output,
 color_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output,
 pixel_MUX_uxn_device_h_l54_c3_5d49_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output,
 color_MUX_uxn_device_h_l54_c3_5d49_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output,
 MUX_uxn_device_h_l57_c20_089e_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output,
 y_MUX_uxn_device_h_l64_c7_2a38_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output,
 x_MUX_uxn_device_h_l64_c7_2a38_return_output,
 sprite_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output,
 y_MUX_uxn_device_h_l72_c7_c804_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output,
 x_MUX_uxn_device_h_l72_c7_c804_return_output,
 sprite_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output,
 sprite_MUX_uxn_device_h_l73_c3_7cab_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output,
 y_MUX_uxn_device_h_l81_c7_807d_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output,
 x_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 y_MUX_uxn_device_h_l89_c7_e53a_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output,
 x_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output,
 x_MUX_uxn_device_h_l90_c3_7f3c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output,
 y_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 x_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 y_MUX_uxn_device_h_l107_c7_b420_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output,
 x_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output,
 x_MUX_uxn_device_h_l108_c3_9699_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 y_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output,
 y_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output,
 y_MUX_uxn_device_h_l125_c3_cdc9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output,
 y_MUX_uxn_device_h_l134_c7_4e11_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output,
 y_MUX_uxn_device_h_l142_c7_bc10_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output,
 y_MUX_uxn_device_h_l143_c3_324a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output,
 MUX_uxn_device_h_l153_c27_9e8f_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_3918 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_129d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_346e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_125d_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_089e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_089e_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_089e_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_089e_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_cab2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_f4c1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_6548 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_ffa1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_bc85 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_6d1c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_dc0a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_6990 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_7cdb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_6406 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_f2f0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9e8f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9e8f_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9e8f_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_right : unsigned(16 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9e8f_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_6f3a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_24d7 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_add0_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_5fa4_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_9e1b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_8602 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_c998 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_20b0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_09c7_uxn_device_h_l26_l187_DUPLICATE_1482_return_output : device_out_result_t;
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
     VAR_result_vram_address_uxn_device_h_l177_c4_8602 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_8602;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right := to_unsigned(3, 2);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_cab2 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_cab2;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_6406 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_6406;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right := to_unsigned(320, 9);
     VAR_MUX_uxn_device_h_l57_c20_089e_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right := to_unsigned(11, 4);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_bc85 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_bc85;
     VAR_result_device_ram_address_uxn_device_h_l111_c4_6d1c := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_6d1c;
     VAR_result_device_ram_address_uxn_device_h_l137_c4_7cdb := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_7cdb;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_right := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_f2f0 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_f2f0;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right := to_unsigned(320, 32);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_f4c1 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_f4c1;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right := to_unsigned(9, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right := to_unsigned(5, 3);
     VAR_result_vram_value_uxn_device_h_l178_c4_c998 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_c998;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_6f3a := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_6f3a;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_3918 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_3918;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l153_c27_9e8f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_ffa1 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_ffa1;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l153_c27_9e8f_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right := to_unsigned(15, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_6548 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_6548;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_6990 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_6990;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right := to_unsigned(128, 8);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l57_c20_089e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right := to_unsigned(10, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_129d := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_129d;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_dc0a := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_dc0a;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_right := to_unsigned(76799, 17);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_346e := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_346e;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right := to_unsigned(6, 3);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_d738_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_a976_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_69ad_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_5d49_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right := x;
     VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_b420_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_9699_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_d738_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_a976_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_69ad_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_2a38_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_c804_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_807d_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_left := y;
     VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_b420_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_4e11_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_bc10_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_324a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_d738_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_a976_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_69ad_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_2a38_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_c804_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_807d_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_e53a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l89_c11_74c0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_88d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_2f7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_c2c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_f8a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_0992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_0992_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_0992_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;

     -- BIN_OP_EQ[uxn_device_h_l65_c7_9cc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_5fa4] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_5fa4_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l73_c7_10e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_5466] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_5466_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_5466_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_f175] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_f175_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_f175_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output;

     -- BIN_OP_EQ[uxn_device_h_l36_c7_512a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_512a_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_512a_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_f200] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_f200_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_f200_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_9e1b] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_9e1b_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l82_c7_d755] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_d755_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_d755_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output;

     -- printf_uxn_device_h_l33_c2_f1a6[uxn_device_h_l33_c2_f1a6] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0 <= VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg0;
     printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1 <= VAR_printf_uxn_device_h_l33_c2_f1a6_uxn_device_h_l33_c2_f1a6_arg1;
     -- Outputs

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output := result.vram_address;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_b6f5] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_a541] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_a541_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_a541_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c7_413c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_413c_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_413c_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_31e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_52bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_add0] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_add0_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l100_c7_6c92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output;

     -- BIN_OP_EQ[uxn_device_h_l64_c11_b79e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_9c71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output;

     -- BIN_OP_EQ[uxn_device_h_l173_c11_35d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l46_c7_b420] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_b420_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_b420_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_b1ec] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_left;
     BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output := BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output := result.is_deo_done;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_125d] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_125d_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l108_c7_021e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_021e_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_021e_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_7af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_710f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_710f_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_710f_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_f845] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_f845_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_f845_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_3af3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_4ad2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_5fd9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_d05e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_20b0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_20b0_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_37b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_ebc7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_b1ec_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_6c92_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_a541_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_9699_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_021e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_5b3f_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_d05e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_f175_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_9a8e_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_ebc7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_cdc9_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_413c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_4e11_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_37b0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_5fd9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_bc10_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_52bb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_324a_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9c71_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_f8a6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_7af3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_88d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_710f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_35d5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_4ad2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_d738_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_f200_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_512a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_a976_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_5466_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_b420_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_69ad_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_0992_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_31e4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2a38_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_b79e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_9cc7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c804_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_c2c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_10e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_807d_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_2f7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d755_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_e53a_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_74c0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_7f3c_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_3af3_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_d7a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_f845_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_b6f5_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_4604_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_5d49_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_125d_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_5fa4_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_9e1b_return_output;
     VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_add0_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_c7f2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_e70d_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_20b0_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_20b0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_5eda_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_fbe0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_0f49_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_c595_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_324a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_59ef] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_8aa1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_e22b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_9699] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_324a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_7f3c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_a89b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_cdc9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_7d54] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_7f3c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_7cab] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_7cab_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_cond;
     sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_return_output := sprite_MUX_uxn_device_h_l73_c3_7cab_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_324a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_7cab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_cdc9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_e4ad] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_9699] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_59ef] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_f33b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_5a4d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_cond;
     pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_return_output := pixel_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_7b98] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_ef55] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_ef55_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_left;
     BIN_OP_OR_uxn_device_h_l144_c4_ef55_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output := BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_e4ad] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_e22b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_7cab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_cdc9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_7b98] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_1486] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output := auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output := CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_fbfc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_left;
     BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output := BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_f33b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_e22b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_7cab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_1486] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_7d54] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_7d54] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_8aa1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_1486] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_59ef] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_7f3c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output;

     -- color_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_color_MUX_uxn_device_h_l54_c3_5d49_cond;
     color_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     color_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_5d49_return_output := color_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_0a0d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_f33b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_0a0d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_9699] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_223a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_0a0d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_8aa1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_e4ad] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_59ef] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_967b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_967b_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_967b_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_089e_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_967b_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_5a4d_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_9699_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_fbfc_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_324a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_ef55_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a89b_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_ecf1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_0a0d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_9699_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_e22b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_cdc9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_f33b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_324a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_7b98_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_59ef_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_e4ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_8aa1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_7cab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_7d54_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_7f3c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_0a0d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_9699_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_e22b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_cdc9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_f33b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_324a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_223a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_59ef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_e4ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_8aa1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_7cab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_7d54_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_7f3c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_0a0d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_9699_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_e22b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_cdc9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_f33b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_324a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_7b98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_59ef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_e4ad_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_8aa1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_7cab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_7d54_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_7f3c_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_59ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_1486_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_1486_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_1486_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_7cab_return_output;
     -- y_MUX[uxn_device_h_l143_c3_324a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_324a_cond <= VAR_y_MUX_uxn_device_h_l143_c3_324a_cond;
     y_MUX_uxn_device_h_l143_c3_324a_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_324a_iftrue;
     y_MUX_uxn_device_h_l143_c3_324a_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_324a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_324a_return_output := y_MUX_uxn_device_h_l143_c3_324a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_bac9] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_bac9_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_left;
     BIN_OP_GT_uxn_device_h_l153_c27_bac9_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output := BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output;

     -- x_MUX[uxn_device_h_l90_c3_7f3c] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_7f3c_cond <= VAR_x_MUX_uxn_device_h_l90_c3_7f3c_cond;
     x_MUX_uxn_device_h_l90_c3_7f3c_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iftrue;
     x_MUX_uxn_device_h_l90_c3_7f3c_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_7f3c_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_7f3c_return_output := x_MUX_uxn_device_h_l90_c3_7f3c_return_output;

     -- MUX[uxn_device_h_l57_c20_089e] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_089e_cond <= VAR_MUX_uxn_device_h_l57_c20_089e_cond;
     MUX_uxn_device_h_l57_c20_089e_iftrue <= VAR_MUX_uxn_device_h_l57_c20_089e_iftrue;
     MUX_uxn_device_h_l57_c20_089e_iffalse <= VAR_MUX_uxn_device_h_l57_c20_089e_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_089e_return_output := MUX_uxn_device_h_l57_c20_089e_return_output;

     -- x_MUX[uxn_device_h_l108_c3_9699] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_9699_cond <= VAR_x_MUX_uxn_device_h_l108_c3_9699_cond;
     x_MUX_uxn_device_h_l108_c3_9699_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_9699_iftrue;
     x_MUX_uxn_device_h_l108_c3_9699_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_9699_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_9699_return_output := x_MUX_uxn_device_h_l108_c3_9699_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_cond;
     pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_return_output := pixel_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_223a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_f5b4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output := auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_223a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_223a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output;

     -- y_MUX[uxn_device_h_l125_c3_cdc9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_cdc9_cond <= VAR_y_MUX_uxn_device_h_l125_c3_cdc9_cond;
     y_MUX_uxn_device_h_l125_c3_cdc9_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iftrue;
     y_MUX_uxn_device_h_l125_c3_cdc9_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_cdc9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_cdc9_return_output := y_MUX_uxn_device_h_l125_c3_cdc9_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_c804_cond;
     sprite_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_c804_return_output := sprite_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- color_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_color_MUX_uxn_device_h_l53_c7_69ad_cond;
     color_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     color_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_69ad_return_output := color_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_9e8f_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_bac9_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_24d7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_f5b4_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue := VAR_MUX_uxn_device_h_l57_c20_089e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_223a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_223a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_223a_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_b420_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_9699_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_e53a_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_7f3c_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_cdc9_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_bc10_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_324a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_24d7;
     -- pixel_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_a976_cond;
     pixel_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_a976_return_output := pixel_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- y_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_y_MUX_uxn_device_h_l142_c7_bc10_cond;
     y_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     y_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_bc10_return_output := y_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_5d49] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_f805] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output := auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- color_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_color_MUX_uxn_device_h_l45_c7_a976_cond;
     color_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_a976_iftrue;
     color_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_a976_return_output := color_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_cond;
     sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_return_output := sprite_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- MUX[uxn_device_h_l153_c27_9e8f] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_9e8f_cond <= VAR_MUX_uxn_device_h_l153_c27_9e8f_cond;
     MUX_uxn_device_h_l153_c27_9e8f_iftrue <= VAR_MUX_uxn_device_h_l153_c27_9e8f_iftrue;
     MUX_uxn_device_h_l153_c27_9e8f_iffalse <= VAR_MUX_uxn_device_h_l153_c27_9e8f_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_9e8f_return_output := MUX_uxn_device_h_l153_c27_9e8f_return_output;

     -- x_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_x_MUX_uxn_device_h_l107_c7_b420_cond;
     x_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_b420_iftrue;
     x_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_b420_return_output := x_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue := VAR_MUX_uxn_device_h_l153_c27_9e8f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_5d49_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_f805_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_bc10_return_output;
     -- result_vram_value_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_cond;
     sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_return_output := sprite_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- x_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_x_MUX_uxn_device_h_l99_c7_d7a4_cond;
     x_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     x_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_d7a4_return_output := x_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- y_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_y_MUX_uxn_device_h_l134_c7_4e11_cond;
     y_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     y_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_4e11_return_output := y_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- color_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_color_MUX_uxn_device_h_l35_c2_d738_cond;
     color_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_d738_iftrue;
     color_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_d738_return_output := color_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_7b98] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_d738_cond;
     pixel_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_d738_return_output := pixel_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output := auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_bc10_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_69ad_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_7b98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_4e11_return_output;
     -- x_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_x_MUX_uxn_device_h_l89_c7_e53a_cond;
     x_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     x_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_e53a_return_output := x_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_a976_cond;
     sprite_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_a976_return_output := sprite_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- y_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_y_MUX_uxn_device_h_l124_c7_9a8e_cond;
     y_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     y_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_9a8e_return_output := y_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output := auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output := auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- x_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_x_MUX_uxn_device_h_l81_c7_807d_cond;
     x_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_807d_iftrue;
     x_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_807d_return_output := x_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_d738_cond;
     sprite_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_d738_return_output := sprite_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- y_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_y_MUX_uxn_device_h_l116_c7_5b3f_cond;
     y_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     y_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_5b3f_return_output := y_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_4e11_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- y_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_y_MUX_uxn_device_h_l107_c7_b420_cond;
     y_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_b420_iftrue;
     y_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_b420_return_output := y_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output := auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- x_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_x_MUX_uxn_device_h_l72_c7_c804_cond;
     x_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_c804_iftrue;
     x_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_c804_return_output := x_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_b420_return_output;
     -- result_vram_value_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output := auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- y_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_y_MUX_uxn_device_h_l99_c7_d7a4_cond;
     y_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     y_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_d7a4_return_output := y_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- x_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_x_MUX_uxn_device_h_l64_c7_2a38_cond;
     x_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     x_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_2a38_return_output := x_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     -- y_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_y_MUX_uxn_device_h_l89_c7_e53a_cond;
     y_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     y_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_e53a_return_output := y_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- x_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_x_MUX_uxn_device_h_l53_c7_69ad_cond;
     x_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     x_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_69ad_return_output := x_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output := auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_5b3f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_5b3f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_e53a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_9a8e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output := auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- x_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_x_MUX_uxn_device_h_l45_c7_a976_cond;
     x_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_a976_iftrue;
     x_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_a976_return_output := x_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_b420] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output;

     -- y_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_y_MUX_uxn_device_h_l81_c7_807d_cond;
     y_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_807d_iftrue;
     y_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_807d_return_output := y_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_9a8e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_b420_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_807d_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_4e11] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- y_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_y_MUX_uxn_device_h_l72_c7_c804_cond;
     y_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_c804_iftrue;
     y_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_c804_return_output := y_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_d7a4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output := auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- x_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_x_MUX_uxn_device_h_l35_c2_d738_cond;
     x_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_d738_iftrue;
     x_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_d738_return_output := x_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_4e11_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_d7a4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_e53a_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_c804_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_bc10] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_e53a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- y_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_y_MUX_uxn_device_h_l64_c7_2a38_cond;
     y_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     y_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_2a38_return_output := y_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output := auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_bc10_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_e53a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_2a38_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_4a77] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- y_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_y_MUX_uxn_device_h_l53_c7_69ad_cond;
     y_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     y_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_69ad_return_output := y_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output := auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_807d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_4a77_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_807d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_69ad_return_output;
     -- result_vram_address_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_c804] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_1a0c] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output := auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- y_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_y_MUX_uxn_device_h_l45_c7_a976_cond;
     y_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_a976_iftrue;
     y_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_a976_return_output := y_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_1a0c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_c804_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_a976_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_6b9e] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- y_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_y_MUX_uxn_device_h_l35_c2_d738_cond;
     y_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_d738_iftrue;
     y_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_d738_return_output := y_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_2a38] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output := auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_6b9e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_2a38_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_69ad_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_d738_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output := auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_bde0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_69ad] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_bde0_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_d738_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_69ad_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_a976_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_a976] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output;

     -- printf_uxn_device_h_l162_c4_2658[uxn_device_h_l162_c4_2658] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0 <= VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg0;
     printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1 <= VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg1;
     printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2 <= VAR_printf_uxn_device_h_l162_c4_2658_uxn_device_h_l162_c4_2658_arg2;
     -- Outputs

     -- result_vram_value_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_a976_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_a976_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- result_vram_address_MUX[uxn_device_h_l35_c2_d738] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_09c7_uxn_device_h_l26_l187_DUPLICATE_1482 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_09c7_uxn_device_h_l26_l187_DUPLICATE_1482_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_09c7(
     result,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_d738_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_d738_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_09c7_uxn_device_h_l26_l187_DUPLICATE_1482_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_09c7_uxn_device_h_l26_l187_DUPLICATE_1482_return_output;
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
