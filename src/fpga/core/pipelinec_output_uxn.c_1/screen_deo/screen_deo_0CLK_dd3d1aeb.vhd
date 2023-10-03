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
-- printf_uxn_device_h_l33_c2_6d26[uxn_device_h_l33_c2_6d26]
signal printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_9992]
signal BIN_OP_EQ_uxn_device_h_l35_c6_9992_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_9992_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_01cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_ceac]
signal auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_ceac]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_ceac]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_ceac]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_ceac]
signal result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_ceac]
signal result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_ceac]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_ceac]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_ceac]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l35_c2_ceac]
signal x_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l35_c2_ceac]
signal color_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_ceac]
signal sprite_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_ceac]
signal pixel_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l35_c2_ceac]
signal y_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_9b60]
signal BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_bf85]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_bf85]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_bf85]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_bf85]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_a844]
signal BIN_OP_EQ_uxn_device_h_l45_c11_a844_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_a844_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_c641]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_01cc]
signal auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_01cc]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_01cc]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_01cc]
signal result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_01cc]
signal result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_01cc]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_01cc]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_01cc]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l45_c7_01cc]
signal x_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l45_c7_01cc]
signal color_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_01cc]
signal sprite_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_01cc]
signal pixel_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l45_c7_01cc]
signal y_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_ad1e]
signal BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_af1a]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_af1a]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_af1a]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_2d7a]
signal BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_cc26]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_c641]
signal auto_advance_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_c641]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_c641]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_c641]
signal result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_c641]
signal result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_c641]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_c641]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_c641]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l53_c7_c641]
signal x_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l53_c7_c641]
signal color_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(1 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_c641]
signal sprite_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_c641]
signal pixel_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l53_c7_c641]
signal y_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_b9c4]
signal BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_d2fb]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_d2fb]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_d2fb]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_d2fb]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c3_d2fb]
signal color_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_d2fb]
signal pixel_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_02f0]
signal BIN_OP_AND_uxn_device_h_l57_c20_02f0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_02f0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_4956]
signal BIN_OP_EQ_uxn_device_h_l57_c20_4956_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_4956_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_c69d]
signal MUX_uxn_device_h_l57_c20_c69d_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c69d_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c69d_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_c69d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_db82]
signal BIN_OP_EQ_uxn_device_h_l64_c11_db82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_db82_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_a4b9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_cc26]
signal auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_cc26]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_cc26]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_cc26]
signal result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_cc26]
signal result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_cc26]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_cc26]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l64_c7_cc26]
signal x_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_cc26]
signal sprite_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l64_c7_cc26]
signal y_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_d26d]
signal BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_fb80]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_fb80]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_fb80]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_0218]
signal BIN_OP_EQ_uxn_device_h_l72_c11_0218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_0218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_c315]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_a4b9]
signal auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_a4b9]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_a4b9]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_a4b9]
signal result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_a4b9]
signal result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_a4b9]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_a4b9]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l72_c7_a4b9]
signal x_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_a4b9]
signal sprite_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l72_c7_a4b9]
signal y_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_eac9]
signal BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_9c49]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_9c49]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_9c49]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_9c49]
signal sprite_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_eb95]
signal BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_7000]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_c315]
signal auto_advance_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_c315]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_c315]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_c315]
signal result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_c315]
signal result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_c315]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_c315]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_c315]
signal x_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l81_c7_c315]
signal y_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_cbcc]
signal BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_3b6d]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_3b6d]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_3b6d]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_754f]
signal BIN_OP_EQ_uxn_device_h_l89_c11_754f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_754f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_669f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_7000]
signal auto_advance_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_7000]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_7000]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_7000]
signal result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_7000]
signal result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_7000]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_7000]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l89_c7_7000]
signal x_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l89_c7_7000]
signal y_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_b787]
signal BIN_OP_EQ_uxn_device_h_l90_c7_b787_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_b787_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_eebf]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_eebf]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_eebf]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l90_c3_eebf]
signal x_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_71dd]
signal BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_1676]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_669f]
signal auto_advance_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_669f]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_669f]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_669f]
signal result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_669f]
signal result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_669f]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_669f]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l99_c7_669f]
signal x_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l99_c7_669f]
signal y_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_f588]
signal BIN_OP_EQ_uxn_device_h_l100_c7_f588_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_f588_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_d219]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_d219]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_d219]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_ad83]
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_469a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_1676]
signal auto_advance_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_1676]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_1676]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_1676]
signal result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_1676]
signal result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_1676]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_1676]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c7_1676]
signal x_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l107_c7_1676]
signal y_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_0d39]
signal BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_1b3a]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_1b3a]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_1b3a]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l108_c3_1b3a]
signal x_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_5830]
signal BIN_OP_OR_uxn_device_h_l109_c4_5830_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_5830_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_9fb9]
signal BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_cb6a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_469a]
signal auto_advance_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_469a]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_469a]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_469a]
signal result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_469a]
signal result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_469a]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_469a]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_469a]
signal y_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_850a]
signal BIN_OP_EQ_uxn_device_h_l117_c7_850a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_850a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_92d8]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_92d8]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_92d8]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_7122]
signal BIN_OP_EQ_uxn_device_h_l124_c11_7122_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_7122_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_d978]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_cb6a]
signal auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_cb6a]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_cb6a]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_cb6a]
signal result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_cb6a]
signal result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_cb6a]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_cb6a]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l124_c7_cb6a]
signal y_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_4894]
signal BIN_OP_EQ_uxn_device_h_l125_c7_4894_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_4894_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_caed]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_caed]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_caed]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l125_c3_caed]
signal y_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_fcb4]
signal BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_a1c4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_d978]
signal auto_advance_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_d978]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_d978]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_d978]
signal result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_d978]
signal result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_d978]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_d978]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l134_c7_d978]
signal y_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_43f2]
signal BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_930f]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_930f]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_930f]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_449b]
signal BIN_OP_EQ_uxn_device_h_l142_c11_449b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_449b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_f70d]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_a1c4]
signal auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_a1c4]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_a1c4]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_a1c4]
signal result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_a1c4]
signal result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_a1c4]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_a1c4]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l142_c7_a1c4]
signal y_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_9bd8]
signal BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_54ab]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_54ab]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_54ab]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l143_c3_54ab]
signal y_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_50eb]
signal BIN_OP_OR_uxn_device_h_l144_c4_50eb_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_50eb_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_daae]
signal BIN_OP_EQ_uxn_device_h_l151_c11_daae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_daae_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_331e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_f70d]
signal auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_f70d]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_f70d]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_f70d]
signal result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_f70d]
signal result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_f70d]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_f70d]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_efbb]
signal BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_3b1c]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_3b1c]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_3b1c]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_511a]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_84cd]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_35e7]
signal BIN_OP_GT_uxn_device_h_l153_c27_35e7_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_35e7_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_ff0c]
signal MUX_uxn_device_h_l153_c27_ff0c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_ff0c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_ff0c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_ff0c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_9aa8]
signal BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_24c7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_331e]
signal auto_advance_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_331e]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_331e]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_331e]
signal result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_331e]
signal result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_331e]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_331e]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_0954]
signal BIN_OP_EQ_uxn_device_h_l161_c7_0954_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_0954_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_c2d4]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_082a]
signal auto_advance_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_082a]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_082a]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_082a]
signal result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_082a]
signal result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_082a]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_082a]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(7 downto 0);

-- printf_uxn_device_h_l162_c4_4faa[uxn_device_h_l162_c4_4faa]
signal printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_aae5]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_923b]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_9e56]
signal BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_30e5]
signal result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_30e5]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_30e5]
signal result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_30e5]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_5416]
signal BIN_OP_EQ_uxn_device_h_l174_c7_5416_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_5416_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_167d]
signal result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_167d]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_167d]
signal result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(31 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6( ref_toks_0 : device_out_result_t;
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
      base.is_device_ram_read := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_device_ram_write := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.vram_value := ref_toks_5;
      base.is_deo_done := ref_toks_6;
      base.device_ram_address := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26
printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26 : entity work.printf_uxn_device_h_l33_c2_6d26_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0,
printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_9992
BIN_OP_EQ_uxn_device_h_l35_c6_9992 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_9992_left,
BIN_OP_EQ_uxn_device_h_l35_c6_9992_right,
BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_ceac
auto_advance_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond,
auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac
result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_ceac
result_vram_address_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_ceac
result_vram_value_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac
result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac
result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_ceac
is_fill_mode_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- x_MUX_uxn_device_h_l35_c2_ceac
x_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_ceac_cond,
x_MUX_uxn_device_h_l35_c2_ceac_iftrue,
x_MUX_uxn_device_h_l35_c2_ceac_iffalse,
x_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- color_MUX_uxn_device_h_l35_c2_ceac
color_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_ceac_cond,
color_MUX_uxn_device_h_l35_c2_ceac_iftrue,
color_MUX_uxn_device_h_l35_c2_ceac_iffalse,
color_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_ceac
sprite_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_ceac_cond,
sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue,
sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse,
sprite_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_ceac
pixel_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_ceac_cond,
pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue,
pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse,
pixel_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- y_MUX_uxn_device_h_l35_c2_ceac
y_MUX_uxn_device_h_l35_c2_ceac : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_ceac_cond,
y_MUX_uxn_device_h_l35_c2_ceac_iftrue,
y_MUX_uxn_device_h_l35_c2_ceac_iffalse,
y_MUX_uxn_device_h_l35_c2_ceac_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_9b60
BIN_OP_EQ_uxn_device_h_l36_c7_9b60 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left,
BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right,
BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85
result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85
result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_a844
BIN_OP_EQ_uxn_device_h_l45_c11_a844 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_a844_left,
BIN_OP_EQ_uxn_device_h_l45_c11_a844_right,
BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_01cc
auto_advance_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond,
auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc
result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_01cc
result_vram_address_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_01cc
result_vram_value_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc
result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc
result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_01cc
is_fill_mode_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- x_MUX_uxn_device_h_l45_c7_01cc
x_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_01cc_cond,
x_MUX_uxn_device_h_l45_c7_01cc_iftrue,
x_MUX_uxn_device_h_l45_c7_01cc_iffalse,
x_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- color_MUX_uxn_device_h_l45_c7_01cc
color_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_01cc_cond,
color_MUX_uxn_device_h_l45_c7_01cc_iftrue,
color_MUX_uxn_device_h_l45_c7_01cc_iffalse,
color_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_01cc
sprite_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_01cc_cond,
sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue,
sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse,
sprite_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_01cc
pixel_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_01cc_cond,
pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue,
pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse,
pixel_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- y_MUX_uxn_device_h_l45_c7_01cc
y_MUX_uxn_device_h_l45_c7_01cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_01cc_cond,
y_MUX_uxn_device_h_l45_c7_01cc_iftrue,
y_MUX_uxn_device_h_l45_c7_01cc_iffalse,
y_MUX_uxn_device_h_l45_c7_01cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_ad1e
BIN_OP_EQ_uxn_device_h_l46_c7_ad1e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left,
BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right,
BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a
result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a
result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_2d7a
BIN_OP_EQ_uxn_device_h_l53_c11_2d7a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left,
BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right,
BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_c641
auto_advance_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_c641_cond,
auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_c641
result_is_vram_write_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_c641
result_vram_address_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_c641
result_vram_value_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_c641
result_is_deo_done_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_c641
result_device_ram_address_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_c641
is_fill_mode_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output);

-- x_MUX_uxn_device_h_l53_c7_c641
x_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_c641_cond,
x_MUX_uxn_device_h_l53_c7_c641_iftrue,
x_MUX_uxn_device_h_l53_c7_c641_iffalse,
x_MUX_uxn_device_h_l53_c7_c641_return_output);

-- color_MUX_uxn_device_h_l53_c7_c641
color_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_c641_cond,
color_MUX_uxn_device_h_l53_c7_c641_iftrue,
color_MUX_uxn_device_h_l53_c7_c641_iffalse,
color_MUX_uxn_device_h_l53_c7_c641_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_c641
sprite_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_c641_cond,
sprite_MUX_uxn_device_h_l53_c7_c641_iftrue,
sprite_MUX_uxn_device_h_l53_c7_c641_iffalse,
sprite_MUX_uxn_device_h_l53_c7_c641_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_c641
pixel_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_c641_cond,
pixel_MUX_uxn_device_h_l53_c7_c641_iftrue,
pixel_MUX_uxn_device_h_l53_c7_c641_iffalse,
pixel_MUX_uxn_device_h_l53_c7_c641_return_output);

-- y_MUX_uxn_device_h_l53_c7_c641
y_MUX_uxn_device_h_l53_c7_c641 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_c641_cond,
y_MUX_uxn_device_h_l53_c7_c641_iftrue,
y_MUX_uxn_device_h_l53_c7_c641_iffalse,
y_MUX_uxn_device_h_l53_c7_c641_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_b9c4
BIN_OP_EQ_uxn_device_h_l54_c7_b9c4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left,
BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right,
BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb
result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb
result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb
is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- color_MUX_uxn_device_h_l54_c3_d2fb
color_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_d2fb_cond,
color_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
color_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
color_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_d2fb
pixel_MUX_uxn_device_h_l54_c3_d2fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_d2fb_cond,
pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue,
pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse,
pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_02f0
BIN_OP_AND_uxn_device_h_l57_c20_02f0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_02f0_left,
BIN_OP_AND_uxn_device_h_l57_c20_02f0_right,
BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_4956
BIN_OP_EQ_uxn_device_h_l57_c20_4956 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_4956_left,
BIN_OP_EQ_uxn_device_h_l57_c20_4956_right,
BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output);

-- MUX_uxn_device_h_l57_c20_c69d
MUX_uxn_device_h_l57_c20_c69d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_c69d_cond,
MUX_uxn_device_h_l57_c20_c69d_iftrue,
MUX_uxn_device_h_l57_c20_c69d_iffalse,
MUX_uxn_device_h_l57_c20_c69d_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_db82
BIN_OP_EQ_uxn_device_h_l64_c11_db82 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_db82_left,
BIN_OP_EQ_uxn_device_h_l64_c11_db82_right,
BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_cc26
auto_advance_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond,
auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26
result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_cc26
result_vram_address_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_cc26
result_vram_value_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26
result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26
result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- x_MUX_uxn_device_h_l64_c7_cc26
x_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_cc26_cond,
x_MUX_uxn_device_h_l64_c7_cc26_iftrue,
x_MUX_uxn_device_h_l64_c7_cc26_iffalse,
x_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_cc26
sprite_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_cc26_cond,
sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue,
sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse,
sprite_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- y_MUX_uxn_device_h_l64_c7_cc26
y_MUX_uxn_device_h_l64_c7_cc26 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_cc26_cond,
y_MUX_uxn_device_h_l64_c7_cc26_iftrue,
y_MUX_uxn_device_h_l64_c7_cc26_iffalse,
y_MUX_uxn_device_h_l64_c7_cc26_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_d26d
BIN_OP_EQ_uxn_device_h_l65_c7_d26d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left,
BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right,
BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_0218
BIN_OP_EQ_uxn_device_h_l72_c11_0218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_0218_left,
BIN_OP_EQ_uxn_device_h_l72_c11_0218_right,
BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_a4b9
auto_advance_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond,
auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9
result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_a4b9
result_vram_address_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_a4b9
result_vram_value_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9
result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9
result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- x_MUX_uxn_device_h_l72_c7_a4b9
x_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_a4b9_cond,
x_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
x_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
x_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_a4b9
sprite_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_a4b9_cond,
sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- y_MUX_uxn_device_h_l72_c7_a4b9
y_MUX_uxn_device_h_l72_c7_a4b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_a4b9_cond,
y_MUX_uxn_device_h_l72_c7_a4b9_iftrue,
y_MUX_uxn_device_h_l72_c7_a4b9_iffalse,
y_MUX_uxn_device_h_l72_c7_a4b9_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_eac9
BIN_OP_EQ_uxn_device_h_l73_c7_eac9 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left,
BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right,
BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49
result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49
result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_9c49
sprite_MUX_uxn_device_h_l73_c3_9c49 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_9c49_cond,
sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue,
sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse,
sprite_MUX_uxn_device_h_l73_c3_9c49_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_eb95
BIN_OP_EQ_uxn_device_h_l81_c11_eb95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left,
BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right,
BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_c315
auto_advance_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_c315_cond,
auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_c315
result_is_vram_write_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_c315
result_vram_address_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_c315
result_vram_value_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_c315
result_is_deo_done_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_c315
result_device_ram_address_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output);

-- x_MUX_uxn_device_h_l81_c7_c315
x_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_c315_cond,
x_MUX_uxn_device_h_l81_c7_c315_iftrue,
x_MUX_uxn_device_h_l81_c7_c315_iffalse,
x_MUX_uxn_device_h_l81_c7_c315_return_output);

-- y_MUX_uxn_device_h_l81_c7_c315
y_MUX_uxn_device_h_l81_c7_c315 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_c315_cond,
y_MUX_uxn_device_h_l81_c7_c315_iftrue,
y_MUX_uxn_device_h_l81_c7_c315_iffalse,
y_MUX_uxn_device_h_l81_c7_c315_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_cbcc
BIN_OP_EQ_uxn_device_h_l82_c7_cbcc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left,
BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right,
BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d
result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d
result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_754f
BIN_OP_EQ_uxn_device_h_l89_c11_754f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_754f_left,
BIN_OP_EQ_uxn_device_h_l89_c11_754f_right,
BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_7000
auto_advance_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_7000_cond,
auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_7000
result_is_vram_write_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_7000
result_vram_address_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_7000
result_vram_value_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_7000
result_is_deo_done_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_7000
result_device_ram_address_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output);

-- x_MUX_uxn_device_h_l89_c7_7000
x_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_7000_cond,
x_MUX_uxn_device_h_l89_c7_7000_iftrue,
x_MUX_uxn_device_h_l89_c7_7000_iffalse,
x_MUX_uxn_device_h_l89_c7_7000_return_output);

-- y_MUX_uxn_device_h_l89_c7_7000
y_MUX_uxn_device_h_l89_c7_7000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_7000_cond,
y_MUX_uxn_device_h_l89_c7_7000_iftrue,
y_MUX_uxn_device_h_l89_c7_7000_iffalse,
y_MUX_uxn_device_h_l89_c7_7000_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_b787
BIN_OP_EQ_uxn_device_h_l90_c7_b787 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_b787_left,
BIN_OP_EQ_uxn_device_h_l90_c7_b787_right,
BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf
result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf
result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output);

-- x_MUX_uxn_device_h_l90_c3_eebf
x_MUX_uxn_device_h_l90_c3_eebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_eebf_cond,
x_MUX_uxn_device_h_l90_c3_eebf_iftrue,
x_MUX_uxn_device_h_l90_c3_eebf_iffalse,
x_MUX_uxn_device_h_l90_c3_eebf_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_71dd
BIN_OP_EQ_uxn_device_h_l99_c11_71dd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left,
BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right,
BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_669f
auto_advance_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_669f_cond,
auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_669f
result_is_vram_write_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_669f
result_vram_address_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_669f
result_vram_value_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_669f
result_is_deo_done_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_669f
result_device_ram_address_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output);

-- x_MUX_uxn_device_h_l99_c7_669f
x_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_669f_cond,
x_MUX_uxn_device_h_l99_c7_669f_iftrue,
x_MUX_uxn_device_h_l99_c7_669f_iffalse,
x_MUX_uxn_device_h_l99_c7_669f_return_output);

-- y_MUX_uxn_device_h_l99_c7_669f
y_MUX_uxn_device_h_l99_c7_669f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_669f_cond,
y_MUX_uxn_device_h_l99_c7_669f_iftrue,
y_MUX_uxn_device_h_l99_c7_669f_iffalse,
y_MUX_uxn_device_h_l99_c7_669f_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_f588
BIN_OP_EQ_uxn_device_h_l100_c7_f588 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_f588_left,
BIN_OP_EQ_uxn_device_h_l100_c7_f588_right,
BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_d219
result_is_deo_done_MUX_uxn_device_h_l100_c3_d219 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_d219
result_device_ram_address_MUX_uxn_device_h_l100_c3_d219 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_ad83
BIN_OP_EQ_uxn_device_h_l107_c11_ad83 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left,
BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right,
BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_1676
auto_advance_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_1676_cond,
auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_1676
result_is_vram_write_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_1676
result_vram_address_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_1676
result_vram_value_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_1676
result_is_deo_done_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_1676
result_device_ram_address_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output);

-- x_MUX_uxn_device_h_l107_c7_1676
x_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_1676_cond,
x_MUX_uxn_device_h_l107_c7_1676_iftrue,
x_MUX_uxn_device_h_l107_c7_1676_iffalse,
x_MUX_uxn_device_h_l107_c7_1676_return_output);

-- y_MUX_uxn_device_h_l107_c7_1676
y_MUX_uxn_device_h_l107_c7_1676 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_1676_cond,
y_MUX_uxn_device_h_l107_c7_1676_iftrue,
y_MUX_uxn_device_h_l107_c7_1676_iffalse,
y_MUX_uxn_device_h_l107_c7_1676_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_0d39
BIN_OP_EQ_uxn_device_h_l108_c7_0d39 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left,
BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right,
BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a
result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a
result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output);

-- x_MUX_uxn_device_h_l108_c3_1b3a
x_MUX_uxn_device_h_l108_c3_1b3a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_1b3a_cond,
x_MUX_uxn_device_h_l108_c3_1b3a_iftrue,
x_MUX_uxn_device_h_l108_c3_1b3a_iffalse,
x_MUX_uxn_device_h_l108_c3_1b3a_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_5830
BIN_OP_OR_uxn_device_h_l109_c4_5830 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_5830_left,
BIN_OP_OR_uxn_device_h_l109_c4_5830_right,
BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_9fb9
BIN_OP_EQ_uxn_device_h_l116_c11_9fb9 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left,
BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right,
BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_469a
auto_advance_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_469a_cond,
auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_469a
result_is_vram_write_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_469a
result_vram_address_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_469a
result_vram_value_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_469a
result_is_deo_done_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_469a
result_device_ram_address_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output);

-- y_MUX_uxn_device_h_l116_c7_469a
y_MUX_uxn_device_h_l116_c7_469a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_469a_cond,
y_MUX_uxn_device_h_l116_c7_469a_iftrue,
y_MUX_uxn_device_h_l116_c7_469a_iffalse,
y_MUX_uxn_device_h_l116_c7_469a_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_850a
BIN_OP_EQ_uxn_device_h_l117_c7_850a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_850a_left,
BIN_OP_EQ_uxn_device_h_l117_c7_850a_right,
BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8
result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8
result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_7122
BIN_OP_EQ_uxn_device_h_l124_c11_7122 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_7122_left,
BIN_OP_EQ_uxn_device_h_l124_c11_7122_right,
BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_cb6a
auto_advance_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond,
auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a
result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_cb6a
result_vram_address_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_cb6a
result_vram_value_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a
result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a
result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- y_MUX_uxn_device_h_l124_c7_cb6a
y_MUX_uxn_device_h_l124_c7_cb6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_cb6a_cond,
y_MUX_uxn_device_h_l124_c7_cb6a_iftrue,
y_MUX_uxn_device_h_l124_c7_cb6a_iffalse,
y_MUX_uxn_device_h_l124_c7_cb6a_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_4894
BIN_OP_EQ_uxn_device_h_l125_c7_4894 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_4894_left,
BIN_OP_EQ_uxn_device_h_l125_c7_4894_right,
BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_caed
result_is_deo_done_MUX_uxn_device_h_l125_c3_caed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_caed
result_device_ram_address_MUX_uxn_device_h_l125_c3_caed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output);

-- y_MUX_uxn_device_h_l125_c3_caed
y_MUX_uxn_device_h_l125_c3_caed : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_caed_cond,
y_MUX_uxn_device_h_l125_c3_caed_iftrue,
y_MUX_uxn_device_h_l125_c3_caed_iffalse,
y_MUX_uxn_device_h_l125_c3_caed_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_fcb4
BIN_OP_EQ_uxn_device_h_l134_c11_fcb4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left,
BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right,
BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_d978
auto_advance_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_d978_cond,
auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_d978
result_is_vram_write_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_d978
result_vram_address_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_d978
result_vram_value_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_d978
result_is_deo_done_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_d978
result_device_ram_address_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output);

-- y_MUX_uxn_device_h_l134_c7_d978
y_MUX_uxn_device_h_l134_c7_d978 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_d978_cond,
y_MUX_uxn_device_h_l134_c7_d978_iftrue,
y_MUX_uxn_device_h_l134_c7_d978_iffalse,
y_MUX_uxn_device_h_l134_c7_d978_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_43f2
BIN_OP_EQ_uxn_device_h_l135_c7_43f2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left,
BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right,
BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_930f
result_is_deo_done_MUX_uxn_device_h_l135_c3_930f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_930f
result_device_ram_address_MUX_uxn_device_h_l135_c3_930f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_449b
BIN_OP_EQ_uxn_device_h_l142_c11_449b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_449b_left,
BIN_OP_EQ_uxn_device_h_l142_c11_449b_right,
BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_a1c4
auto_advance_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond,
auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4
result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_a1c4
result_vram_address_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_a1c4
result_vram_value_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4
result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4
result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- y_MUX_uxn_device_h_l142_c7_a1c4
y_MUX_uxn_device_h_l142_c7_a1c4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_a1c4_cond,
y_MUX_uxn_device_h_l142_c7_a1c4_iftrue,
y_MUX_uxn_device_h_l142_c7_a1c4_iffalse,
y_MUX_uxn_device_h_l142_c7_a1c4_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_9bd8
BIN_OP_EQ_uxn_device_h_l143_c7_9bd8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left,
BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right,
BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab
result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab
result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output);

-- y_MUX_uxn_device_h_l143_c3_54ab
y_MUX_uxn_device_h_l143_c3_54ab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_54ab_cond,
y_MUX_uxn_device_h_l143_c3_54ab_iftrue,
y_MUX_uxn_device_h_l143_c3_54ab_iffalse,
y_MUX_uxn_device_h_l143_c3_54ab_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_50eb
BIN_OP_OR_uxn_device_h_l144_c4_50eb : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_50eb_left,
BIN_OP_OR_uxn_device_h_l144_c4_50eb_right,
BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_daae
BIN_OP_EQ_uxn_device_h_l151_c11_daae : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_daae_left,
BIN_OP_EQ_uxn_device_h_l151_c11_daae_right,
BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_f70d
auto_advance_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond,
auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d
result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_f70d
result_vram_address_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_f70d
result_vram_value_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d
result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d
result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_efbb
BIN_OP_EQ_uxn_device_h_l152_c7_efbb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left,
BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right,
BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c
result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c
result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_84cd
BIN_OP_PLUS_uxn_device_h_l153_c27_84cd : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_35e7
BIN_OP_GT_uxn_device_h_l153_c27_35e7 : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_35e7_left,
BIN_OP_GT_uxn_device_h_l153_c27_35e7_right,
BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output);

-- MUX_uxn_device_h_l153_c27_ff0c
MUX_uxn_device_h_l153_c27_ff0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_ff0c_cond,
MUX_uxn_device_h_l153_c27_ff0c_iftrue,
MUX_uxn_device_h_l153_c27_ff0c_iffalse,
MUX_uxn_device_h_l153_c27_ff0c_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_9aa8
BIN_OP_EQ_uxn_device_h_l160_c11_9aa8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left,
BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right,
BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_331e
auto_advance_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_331e_cond,
auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_331e
result_is_vram_write_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_331e
result_vram_address_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_331e
result_vram_value_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_331e
result_is_deo_done_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_331e
result_device_ram_address_MUX_uxn_device_h_l160_c7_331e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_0954
BIN_OP_EQ_uxn_device_h_l161_c7_0954 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_0954_left,
BIN_OP_EQ_uxn_device_h_l161_c7_0954_right,
BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_082a
auto_advance_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_082a_cond,
auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_082a
result_is_vram_write_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_082a
result_vram_address_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_082a
result_vram_value_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_082a
result_is_deo_done_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_082a
result_device_ram_address_MUX_uxn_device_h_l161_c3_082a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output);

-- printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa
printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa : entity work.printf_uxn_device_h_l162_c4_4faa_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0,
printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1,
printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_923b
BIN_OP_PLUS_uxn_device_h_l167_c27_923b : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_9e56
BIN_OP_EQ_uxn_device_h_l173_c11_9e56 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left,
BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right,
BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_30e5
result_vram_value_MUX_uxn_device_h_l173_c7_30e5 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5
result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_30e5
result_vram_address_MUX_uxn_device_h_l173_c7_30e5 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5
result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_5416
BIN_OP_EQ_uxn_device_h_l174_c7_5416 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_5416_left,
BIN_OP_EQ_uxn_device_h_l174_c7_5416_right,
BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_167d
result_vram_value_MUX_uxn_device_h_l174_c3_167d : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_167d
result_is_vram_write_MUX_uxn_device_h_l174_c3_167d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_167d
result_vram_address_MUX_uxn_device_h_l174_c3_167d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x,
CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output,
 x_MUX_uxn_device_h_l35_c2_ceac_return_output,
 color_MUX_uxn_device_h_l35_c2_ceac_return_output,
 sprite_MUX_uxn_device_h_l35_c2_ceac_return_output,
 pixel_MUX_uxn_device_h_l35_c2_ceac_return_output,
 y_MUX_uxn_device_h_l35_c2_ceac_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output,
 x_MUX_uxn_device_h_l45_c7_01cc_return_output,
 color_MUX_uxn_device_h_l45_c7_01cc_return_output,
 sprite_MUX_uxn_device_h_l45_c7_01cc_return_output,
 pixel_MUX_uxn_device_h_l45_c7_01cc_return_output,
 y_MUX_uxn_device_h_l45_c7_01cc_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output,
 x_MUX_uxn_device_h_l53_c7_c641_return_output,
 color_MUX_uxn_device_h_l53_c7_c641_return_output,
 sprite_MUX_uxn_device_h_l53_c7_c641_return_output,
 pixel_MUX_uxn_device_h_l53_c7_c641_return_output,
 y_MUX_uxn_device_h_l53_c7_c641_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 color_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output,
 MUX_uxn_device_h_l57_c20_c69d_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output,
 x_MUX_uxn_device_h_l64_c7_cc26_return_output,
 sprite_MUX_uxn_device_h_l64_c7_cc26_return_output,
 y_MUX_uxn_device_h_l64_c7_cc26_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 x_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 y_MUX_uxn_device_h_l72_c7_a4b9_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output,
 sprite_MUX_uxn_device_h_l73_c3_9c49_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output,
 x_MUX_uxn_device_h_l81_c7_c315_return_output,
 y_MUX_uxn_device_h_l81_c7_c315_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output,
 x_MUX_uxn_device_h_l89_c7_7000_return_output,
 y_MUX_uxn_device_h_l89_c7_7000_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output,
 x_MUX_uxn_device_h_l90_c3_eebf_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output,
 x_MUX_uxn_device_h_l99_c7_669f_return_output,
 y_MUX_uxn_device_h_l99_c7_669f_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output,
 x_MUX_uxn_device_h_l107_c7_1676_return_output,
 y_MUX_uxn_device_h_l107_c7_1676_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output,
 x_MUX_uxn_device_h_l108_c3_1b3a_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output,
 y_MUX_uxn_device_h_l116_c7_469a_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 y_MUX_uxn_device_h_l124_c7_cb6a_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output,
 y_MUX_uxn_device_h_l125_c3_caed_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output,
 y_MUX_uxn_device_h_l134_c7_d978_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 y_MUX_uxn_device_h_l142_c7_a1c4_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output,
 y_MUX_uxn_device_h_l143_c3_54ab_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output,
 MUX_uxn_device_h_l153_c27_ff0c_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_ceac_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_ceac_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_01cc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_ceac_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_ceac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_4a76 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_01cc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_01cc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_c641_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_01cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_ee5f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_c641_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_c641_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_cc26_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_c641_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_e01f : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_ce8f_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c69d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c69d_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c69d_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_c69d_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_cc26_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_cc26_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_a4b9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_cc26_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_7606 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_c315_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_a4b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_d9fc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_c315_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_c315_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_7000_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_c315_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_bdff : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_eebf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_7000_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_7000_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_669f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_7000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_2c55 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_eebf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_eebf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_eebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_669f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_669f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_1676_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_669f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_ccc2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_1b3a_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_1676_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_1676_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_469a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_1676_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_f6b3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_1b3a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_469a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_469a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cb6a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_469a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_827e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_caed_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_d978_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_cb6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_1c4e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_caed_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_caed_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_caed_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_d978_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_d978_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_a1c4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_d978_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_8340 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_54ab_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_a1c4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_e720 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_54ab_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_54ab_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_54ab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_81bb : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_ff0c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_ff0c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_ff0c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_ff0c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_897f : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_83c3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_de29_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_f149_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_c6a8_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_3047 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_d473 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_690f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6_uxn_device_h_l26_l187_DUPLICATE_5e4e_return_output : device_out_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_ccc2 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_ccc2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l153_c27_ff0c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l57_c20_c69d_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_2c55 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_2c55;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l137_c4_8340 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_8340;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right := to_unsigned(9, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right := to_unsigned(11, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right := to_unsigned(800, 10);
     VAR_MUX_uxn_device_h_l153_c27_ff0c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right := to_unsigned(800, 32);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_right := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_4a76 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_4a76;
     VAR_result_vram_address_uxn_device_h_l177_c4_d473 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_d473;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_e01f := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_e01f;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_right := to_unsigned(10, 4);
     VAR_MUX_uxn_device_h_l57_c20_c69d_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_right := to_unsigned(3, 2);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_83c3 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_83c3;
     VAR_result_device_ram_address_uxn_device_h_l84_c4_bdff := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_bdff;
     VAR_result_device_ram_address_uxn_device_h_l76_c4_d9fc := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_d9fc;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_827e := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_827e;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_right := to_unsigned(4, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_f6b3 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_f6b3;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_right := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_1c4e := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_1c4e;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_right := to_unsigned(575999, 20);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_81bb := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_81bb;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_e720 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_e720;
     VAR_result_device_ram_address_uxn_device_h_l67_c4_7606 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_7606;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l178_c4_3047 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_3047;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_right := to_unsigned(128, 8);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_ee5f := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_ee5f;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_right := to_unsigned(14, 4);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_ceac_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_01cc_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_c641_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right := x;
     VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_1676_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_ceac_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_01cc_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_c641_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_cc26_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_c315_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_eebf_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_669f_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_left := y;
     VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_1676_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_469a_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_caed_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_d978_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_54ab_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_ceac_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_01cc_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_c641_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_cc26_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_c315_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_7000_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_669f_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l116_c11_9fb9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l173_c11_9e56] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_0954] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_0954_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_0954_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c11_754f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_754f_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_754f_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_daae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_daae_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_daae_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_f149] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_f149_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_EQ[uxn_device_h_l73_c7_eac9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l64_c11_db82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_db82_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_db82_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_f588] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_f588_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_f588_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_9992] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_9992_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_9992_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c7_0d39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output;

     -- printf_uxn_device_h_l33_c2_6d26[uxn_device_h_l33_c2_6d26] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0 <= VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg0;
     printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1 <= VAR_printf_uxn_device_h_l33_c2_6d26_uxn_device_h_l33_c2_6d26_arg1;
     -- Outputs

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_ce8f] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_ce8f_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l45_c11_a844] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_a844_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_a844_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_cbcc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_b9c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_511a] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_9aa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_de29] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_de29_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l143_c7_9bd8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l90_c7_b787] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_b787_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_b787_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_0218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_0218_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_0218_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;

     -- BIN_OP_EQ[uxn_device_h_l36_c7_9b60] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output := result.device_ram_address;

     -- BIN_OP_AND[uxn_device_h_l57_c20_02f0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_02f0_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_left;
     BIN_OP_AND_uxn_device_h_l57_c20_02f0_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output := BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_850a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_850a_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_850a_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_fcb4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l46_c7_ad1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_43f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c7_4894] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_4894_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_4894_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_efbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_eb95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_71dd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;

     -- BIN_OP_EQ[uxn_device_h_l65_c7_d26d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_690f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_690f_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_2d7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_ad83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_c6a8] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_c6a8_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_449b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_449b_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_449b_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_5416] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_5416_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_5416_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_7122] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_7122_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_7122_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_02f0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_f588_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_ad83_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_1b3a_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_0d39_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_469a_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_9fb9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_850a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_cb6a_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_7122_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_caed_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_4894_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_d978_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_fcb4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_43f2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_a1c4_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_449b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_54ab_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9bd8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_daae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_efbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_9aa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_0954_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_9e56_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_5416_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_ceac_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_9992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_9b60_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_01cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_a844_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_ad1e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_c641_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_2d7a_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_b9c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_cc26_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_db82_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_d26d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_a4b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_0218_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_eac9_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_c315_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_eb95_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_cbcc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_7000_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_754f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_eebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_b787_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_669f_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_71dd_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_511a_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l109_l126_l144_DUPLICATE_c592_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_ce8f_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_f149_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_c6a8_return_output;
     VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_de29_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l82_l100_l65_l46_l73_l117_l161_l90_l54_l108_l135_l125_l143_DUPLICATE_99d1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_31fa_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_690f_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l36_l35_DUPLICATE_690f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_73a3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_856f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l53_l107_l174_l45_l151_l99_l35_l142_l89_l161_l173_l134_l81_l124_l72_l116_l64_DUPLICATE_7ab6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l82_l160_l100_l65_l73_l46_l117_l161_l90_l54_l36_l108_l135_l152_l125_l143_DUPLICATE_3594_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_eebf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_9c49] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_9c49_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_cond;
     sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_return_output := sprite_MUX_uxn_device_h_l73_c3_9c49_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_9c49] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_bf85] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_3b1c] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_1b3a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_1b3a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_d219] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_5830] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_5830_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_left;
     BIN_OP_OR_uxn_device_h_l109_c4_5830_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output := BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output;

     -- color_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_color_MUX_uxn_device_h_l54_c3_d2fb_cond;
     color_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     color_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_d2fb_return_output := color_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_af1a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_9c49] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output := CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_84cd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_9c49] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_caed] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_af1a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_167d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_fb80] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_d219] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_930f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_30e5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_af1a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_54ab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_50eb] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_50eb_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_left;
     BIN_OP_OR_uxn_device_h_l144_c4_50eb_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output := BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_167d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_bf85] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_bf85] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_54ab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_167d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_eebf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_92d8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_fb80] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_fb80] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_92d8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_bf85] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_3b6d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_eebf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_92d8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_3b6d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_caed] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output := auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_54ab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_930f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_aae5] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_930f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_caed] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_1b3a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_cond;
     pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output := pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_3b6d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_3b1c] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_4956] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_4956_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_4956_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_d219] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_c69d_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_4956_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_aae5_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_5830_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_54ab_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_50eb_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_84cd_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_eebf_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_caed_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l127_l92_DUPLICATE_e589_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_d219_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_1b3a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_92d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_caed_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_930f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_54ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_3b1c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_bf85_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_af1a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_fb80_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_9c49_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_3b6d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_eebf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_d219_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_1b3a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_92d8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_caed_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_930f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_54ab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_30e5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_bf85_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_af1a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_fb80_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_9c49_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_3b6d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_eebf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_d219_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_1b3a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_92d8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_caed_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_930f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_54ab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_3b1c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_bf85_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_af1a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_fb80_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_9c49_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_3b6d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_eebf_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_bf85_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_167d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_167d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_167d_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_9c49_return_output;
     -- x_MUX[uxn_device_h_l90_c3_eebf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_eebf_cond <= VAR_x_MUX_uxn_device_h_l90_c3_eebf_cond;
     x_MUX_uxn_device_h_l90_c3_eebf_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_eebf_iftrue;
     x_MUX_uxn_device_h_l90_c3_eebf_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_eebf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_eebf_return_output := x_MUX_uxn_device_h_l90_c3_eebf_return_output;

     -- y_MUX[uxn_device_h_l125_c3_caed] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_caed_cond <= VAR_y_MUX_uxn_device_h_l125_c3_caed_cond;
     y_MUX_uxn_device_h_l125_c3_caed_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_caed_iftrue;
     y_MUX_uxn_device_h_l125_c3_caed_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_caed_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_caed_return_output := y_MUX_uxn_device_h_l125_c3_caed_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_923b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_35e7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_35e7_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_left;
     BIN_OP_GT_uxn_device_h_l153_c27_35e7_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output := BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output := auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_30e5] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output;

     -- MUX[uxn_device_h_l57_c20_c69d] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_c69d_cond <= VAR_MUX_uxn_device_h_l57_c20_c69d_cond;
     MUX_uxn_device_h_l57_c20_c69d_iftrue <= VAR_MUX_uxn_device_h_l57_c20_c69d_iftrue;
     MUX_uxn_device_h_l57_c20_c69d_iffalse <= VAR_MUX_uxn_device_h_l57_c20_c69d_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_c69d_return_output := MUX_uxn_device_h_l57_c20_c69d_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_cond;
     sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output := sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_30e5] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_30e5] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output;

     -- x_MUX[uxn_device_h_l108_c3_1b3a] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_1b3a_cond <= VAR_x_MUX_uxn_device_h_l108_c3_1b3a_cond;
     x_MUX_uxn_device_h_l108_c3_1b3a_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iftrue;
     x_MUX_uxn_device_h_l108_c3_1b3a_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_1b3a_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_1b3a_return_output := x_MUX_uxn_device_h_l108_c3_1b3a_return_output;

     -- y_MUX[uxn_device_h_l143_c3_54ab] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_54ab_cond <= VAR_y_MUX_uxn_device_h_l143_c3_54ab_cond;
     y_MUX_uxn_device_h_l143_c3_54ab_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_54ab_iftrue;
     y_MUX_uxn_device_h_l143_c3_54ab_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_54ab_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_54ab_return_output := y_MUX_uxn_device_h_l143_c3_54ab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_c641_cond;
     pixel_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_c641_return_output := pixel_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- color_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_color_MUX_uxn_device_h_l53_c7_c641_cond;
     color_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_c641_iftrue;
     color_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_c641_return_output := color_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_ff0c_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_35e7_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_897f := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_923b_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue := VAR_MUX_uxn_device_h_l57_c20_c69d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_30e5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_30e5_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_30e5_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_1676_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_1b3a_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_7000_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_eebf_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_caed_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_54ab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_897f;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_d2fb] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_cond;
     sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_return_output := sprite_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- MUX[uxn_device_h_l153_c27_ff0c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_ff0c_cond <= VAR_MUX_uxn_device_h_l153_c27_ff0c_cond;
     MUX_uxn_device_h_l153_c27_ff0c_iftrue <= VAR_MUX_uxn_device_h_l153_c27_ff0c_iftrue;
     MUX_uxn_device_h_l153_c27_ff0c_iffalse <= VAR_MUX_uxn_device_h_l153_c27_ff0c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_ff0c_return_output := MUX_uxn_device_h_l153_c27_ff0c_return_output;

     -- x_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_x_MUX_uxn_device_h_l107_c7_1676_cond;
     x_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_1676_iftrue;
     x_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_1676_return_output := x_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- pixel_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_cond;
     pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_return_output := pixel_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- color_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_color_MUX_uxn_device_h_l45_c7_01cc_cond;
     color_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     color_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_01cc_return_output := color_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- y_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_y_MUX_uxn_device_h_l142_c7_a1c4_cond;
     y_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     y_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_a1c4_return_output := y_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_082a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output := auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue := VAR_MUX_uxn_device_h_l153_c27_ff0c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_d2fb_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_082a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     -- auto_advance_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output := auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_cond;
     pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_return_output := pixel_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- y_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_y_MUX_uxn_device_h_l134_c7_d978_cond;
     y_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_d978_iftrue;
     y_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_d978_return_output := y_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_3b1c] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- color_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_color_MUX_uxn_device_h_l35_c2_ceac_cond;
     color_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     color_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_ceac_return_output := color_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_c641_cond;
     sprite_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_c641_return_output := sprite_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- x_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_x_MUX_uxn_device_h_l99_c7_669f_cond;
     x_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_669f_iftrue;
     x_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_669f_return_output := x_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_c641_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_3b1c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_d978_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- y_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_y_MUX_uxn_device_h_l124_c7_cb6a_cond;
     y_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     y_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_cb6a_return_output := y_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_cond;
     sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_return_output := sprite_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- x_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_x_MUX_uxn_device_h_l89_c7_7000_cond;
     x_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_7000_iftrue;
     x_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_7000_return_output := x_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output := auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- auto_advance_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output := auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- x_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_x_MUX_uxn_device_h_l81_c7_c315_cond;
     x_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_c315_iftrue;
     x_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_c315_return_output := x_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_cond;
     sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_return_output := sprite_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- y_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_y_MUX_uxn_device_h_l116_c7_469a_cond;
     y_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_469a_iftrue;
     y_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_469a_return_output := y_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_d978_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_469a_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- x_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_x_MUX_uxn_device_h_l72_c7_a4b9_cond;
     x_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     x_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_a4b9_return_output := x_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output := auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_vram_value_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- y_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_y_MUX_uxn_device_h_l107_c7_1676_cond;
     y_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_1676_iftrue;
     y_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_1676_return_output := y_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_1676_return_output;
     -- result_vram_address_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output := auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- x_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_x_MUX_uxn_device_h_l64_c7_cc26_cond;
     x_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     x_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_cc26_return_output := x_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- y_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_y_MUX_uxn_device_h_l99_c7_669f_cond;
     y_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_669f_iftrue;
     y_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_669f_return_output := y_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_669f_return_output;
     -- auto_advance_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output := auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- y_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_y_MUX_uxn_device_h_l89_c7_7000_cond;
     y_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_7000_iftrue;
     y_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_7000_return_output := y_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_469a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output;

     -- x_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_x_MUX_uxn_device_h_l53_c7_c641_cond;
     x_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_c641_iftrue;
     x_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_c641_return_output := x_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_469a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_7000_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_cb6a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- y_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_y_MUX_uxn_device_h_l81_c7_c315_cond;
     y_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_c315_iftrue;
     y_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_c315_return_output := y_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output := auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- x_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_x_MUX_uxn_device_h_l45_c7_01cc_cond;
     x_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     x_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_01cc_return_output := x_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_1676] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_cb6a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_1676_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_c315_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- x_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_x_MUX_uxn_device_h_l35_c2_ceac_cond;
     x_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     x_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_ceac_return_output := x_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output := auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_d978] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_669f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output;

     -- y_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_y_MUX_uxn_device_h_l72_c7_a4b9_cond;
     y_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     y_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_a4b9_return_output := y_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_d978_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_669f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_7000_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_a1c4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_7000] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- y_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_y_MUX_uxn_device_h_l64_c7_cc26_cond;
     y_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     y_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_cc26_return_output := y_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output := auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_a1c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_7000_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_cc26_return_output;
     -- auto_advance_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output := auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_c315] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- y_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_y_MUX_uxn_device_h_l53_c7_c641_cond;
     y_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_c641_iftrue;
     y_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_c641_return_output := y_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_f70d] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_f70d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_c315_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_c641_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_331e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output;

     -- y_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_y_MUX_uxn_device_h_l45_c7_01cc_cond;
     y_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     y_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_01cc_return_output := y_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_a4b9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output;

     -- auto_advance_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output := auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_331e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_a4b9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_01cc_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_24c7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output;

     -- y_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_y_MUX_uxn_device_h_l35_c2_ceac_cond;
     y_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     y_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_ceac_return_output := y_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_cc26] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output := auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_24c7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_cc26_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_c641_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_ceac_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_c2d4] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_c641] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output := auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_c2d4_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_ceac_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_c641_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_01cc_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_vram_value_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_01cc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output;

     -- printf_uxn_device_h_l162_c4_4faa[uxn_device_h_l162_c4_4faa] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0 <= VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg0;
     printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1 <= VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg1;
     printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2 <= VAR_printf_uxn_device_h_l162_c4_4faa_uxn_device_h_l162_c4_4faa_arg2;
     -- Outputs

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_01cc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_01cc_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- result_vram_address_MUX[uxn_device_h_l35_c2_ceac] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6_uxn_device_h_l26_l187_DUPLICATE_5e4e LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6_uxn_device_h_l26_l187_DUPLICATE_5e4e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6(
     result,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_ceac_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_ceac_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6_uxn_device_h_l26_l187_DUPLICATE_5e4e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_1ac6_uxn_device_h_l26_l187_DUPLICATE_5e4e_return_output;
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
