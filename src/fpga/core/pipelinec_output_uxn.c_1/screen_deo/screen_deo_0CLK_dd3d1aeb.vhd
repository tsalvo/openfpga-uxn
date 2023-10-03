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
-- printf_uxn_device_h_l33_c2_61c2[uxn_device_h_l33_c2_61c2]
signal printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l35_c6_0739]
signal BIN_OP_EQ_uxn_device_h_l35_c6_0739_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_0739_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_1a20]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l35_c2_2af4]
signal auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l35_c2_2af4]
signal sprite_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l35_c2_2af4]
signal y_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l35_c2_2af4]
signal pixel_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l35_c2_2af4]
signal x_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l35_c2_2af4]
signal color_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l35_c2_2af4]
signal is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l35_c2_2af4]
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l35_c2_2af4]
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_2af4]
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l35_c2_2af4]
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l35_c2_2af4]
signal result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(31 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_2af4]
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l35_c2_2af4]
signal result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l36_c7_0fe6]
signal BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_932d]
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l36_c3_932d]
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_932d]
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l36_c3_932d]
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c11_b972]
signal BIN_OP_EQ_uxn_device_h_l45_c11_b972_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_b972_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_4b5b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l45_c7_1a20]
signal auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l45_c7_1a20]
signal sprite_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l45_c7_1a20]
signal y_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l45_c7_1a20]
signal pixel_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l45_c7_1a20]
signal x_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l45_c7_1a20]
signal color_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l45_c7_1a20]
signal is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l45_c7_1a20]
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c7_1a20]
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_1a20]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c7_1a20]
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l45_c7_1a20]
signal result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l45_c7_1a20]
signal result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l46_c7_7ca6]
signal BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l46_c3_5f01]
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_5f01]
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l46_c3_5f01]
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l53_c11_c632]
signal BIN_OP_EQ_uxn_device_h_l53_c11_c632_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_c632_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_aebf]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l53_c7_4b5b]
signal auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l53_c7_4b5b]
signal sprite_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l53_c7_4b5b]
signal y_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l53_c7_4b5b]
signal pixel_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l53_c7_4b5b]
signal x_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(15 downto 0);

-- color_MUX[uxn_device_h_l53_c7_4b5b]
signal color_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l53_c7_4b5b]
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l53_c7_4b5b]
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l53_c7_4b5b]
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_4b5b]
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l53_c7_4b5b]
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l53_c7_4b5b]
signal result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l53_c7_4b5b]
signal result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c7_2f09]
signal BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l54_c3_98e1]
signal pixel_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(7 downto 0);

-- color_MUX[uxn_device_h_l54_c3_98e1]
signal color_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(1 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c3_98e1]
signal is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c3_98e1]
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_98e1]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c3_98e1]
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l57_c20_b078]
signal BIN_OP_AND_uxn_device_h_l57_c20_b078_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_b078_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c20_f771]
signal BIN_OP_EQ_uxn_device_h_l57_c20_f771_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_f771_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l57_c20_0138]
signal MUX_uxn_device_h_l57_c20_0138_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0138_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0138_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l57_c20_0138_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l64_c11_959d]
signal BIN_OP_EQ_uxn_device_h_l64_c11_959d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_959d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_ab68]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l64_c7_aebf]
signal auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l64_c7_aebf]
signal sprite_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l64_c7_aebf]
signal y_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l64_c7_aebf]
signal x_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l64_c7_aebf]
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l64_c7_aebf]
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_aebf]
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l64_c7_aebf]
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l64_c7_aebf]
signal result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l64_c7_aebf]
signal result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l65_c7_1874]
signal BIN_OP_EQ_uxn_device_h_l65_c7_1874_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_1874_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l65_c3_6ded]
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_6ded]
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l65_c3_6ded]
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l72_c11_ed1d]
signal BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_6c28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l72_c7_ab68]
signal auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l72_c7_ab68]
signal sprite_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l72_c7_ab68]
signal y_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l72_c7_ab68]
signal x_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l72_c7_ab68]
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l72_c7_ab68]
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_ab68]
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l72_c7_ab68]
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l72_c7_ab68]
signal result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l72_c7_ab68]
signal result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c7_c3c4]
signal BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c3_a7e9]
signal sprite_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c3_a7e9]
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_a7e9]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c3_a7e9]
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_be51]
signal BIN_OP_EQ_uxn_device_h_l81_c11_be51_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_be51_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_814f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_6c28]
signal auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c7_6c28]
signal y_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l81_c7_6c28]
signal x_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_6c28]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_6c28]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_6c28]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_6c28]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_6c28]
signal result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_6c28]
signal result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_089f]
signal BIN_OP_EQ_uxn_device_h_l82_c7_089f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_089f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_fbb9]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_fbb9]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_fbb9]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l89_c11_65c2]
signal BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_9eae]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l89_c7_814f]
signal auto_advance_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l89_c7_814f]
signal y_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l89_c7_814f]
signal x_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l89_c7_814f]
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l89_c7_814f]
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_814f]
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l89_c7_814f]
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l89_c7_814f]
signal result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l89_c7_814f]
signal result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c7_841a]
signal BIN_OP_EQ_uxn_device_h_l90_c7_841a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_841a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c3_bfd4]
signal x_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c3_bfd4]
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_bfd4]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c3_bfd4]
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_332d]
signal BIN_OP_EQ_uxn_device_h_l99_c11_332d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_332d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_6d1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_9eae]
signal auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l99_c7_9eae]
signal y_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l99_c7_9eae]
signal x_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_9eae]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_9eae]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_9eae]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_9eae]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_9eae]
signal result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l99_c7_9eae]
signal result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_4195]
signal BIN_OP_EQ_uxn_device_h_l100_c7_4195_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_4195_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_9c66]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_9c66]
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_9c66]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c11_2ffc]
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_8a80]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l107_c7_6d1e]
signal auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l107_c7_6d1e]
signal y_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l107_c7_6d1e]
signal x_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l107_c7_6d1e]
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c7_6d1e]
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_6d1e]
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c7_6d1e]
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l107_c7_6d1e]
signal result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l107_c7_6d1e]
signal result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c7_b40d]
signal BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c3_eaa5]
signal x_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c3_eaa5]
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_eaa5]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c3_eaa5]
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l109_c4_0f5f]
signal BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_0769]
signal BIN_OP_EQ_uxn_device_h_l116_c11_0769_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_0769_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_f0b7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_8a80]
signal auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_8a80]
signal y_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_8a80]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_8a80]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_8a80]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_8a80]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_8a80]
signal result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_8a80]
signal result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_3236]
signal BIN_OP_EQ_uxn_device_h_l117_c7_3236_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_3236_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_405f]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_405f]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_405f]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l124_c11_11d0]
signal BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_df9f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l124_c7_f0b7]
signal auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l124_c7_f0b7]
signal y_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l124_c7_f0b7]
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l124_c7_f0b7]
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_f0b7]
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l124_c7_f0b7]
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l124_c7_f0b7]
signal result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l124_c7_f0b7]
signal result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c7_b123]
signal BIN_OP_EQ_uxn_device_h_l125_c7_b123_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_b123_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c3_e511]
signal y_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c3_e511]
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_e511]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c3_e511]
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c11_d6fa]
signal BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_d5f0]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l134_c7_df9f]
signal auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l134_c7_df9f]
signal y_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l134_c7_df9f]
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c7_df9f]
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_df9f]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c7_df9f]
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l134_c7_df9f]
signal result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l134_c7_df9f]
signal result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l135_c7_faf4]
signal BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l135_c3_b7b8]
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_b7b8]
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l135_c3_b7b8]
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l142_c11_935c]
signal BIN_OP_EQ_uxn_device_h_l142_c11_935c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_935c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_43c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l142_c7_d5f0]
signal auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l142_c7_d5f0]
signal y_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(15 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l142_c7_d5f0]
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l142_c7_d5f0]
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_d5f0]
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l142_c7_d5f0]
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l142_c7_d5f0]
signal result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l142_c7_d5f0]
signal result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c7_9fd5]
signal BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c3_2412]
signal y_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c3_2412]
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_2412]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c3_2412]
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l144_c4_8dd3]
signal BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_c96b]
signal BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_6f50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_43c8]
signal auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_43c8]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_43c8]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_43c8]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_43c8]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_43c8]
signal result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_43c8]
signal result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_9d98]
signal BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_4189]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_4189]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_4189]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_831f]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l153_c27_a6cb]
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l153_c27_53eb]
signal BIN_OP_GT_uxn_device_h_l153_c27_53eb_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_53eb_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l153_c27_9dad]
signal MUX_uxn_device_h_l153_c27_9dad_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9dad_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9dad_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l153_c27_9dad_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_c817]
signal BIN_OP_EQ_uxn_device_h_l160_c11_c817_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_c817_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_8f69]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_6f50]
signal auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_6f50]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_6f50]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_6f50]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_6f50]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_6f50]
signal result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_6f50]
signal result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_ba1e]
signal BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_16da]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l161_c3_7e7a]
signal auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l161_c3_7e7a]
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_7e7a]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_7e7a]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_7e7a]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l161_c3_7e7a]
signal result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l161_c3_7e7a]
signal result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(1 downto 0);

-- printf_uxn_device_h_l162_c4_6dc0[uxn_device_h_l162_c4_6dc0]
signal printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_436d]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l167_c27_29ad]
signal BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l173_c11_ca3f]
signal BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l173_c7_7593]
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l173_c7_7593]
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l173_c7_7593]
signal result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l173_c7_7593]
signal result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l174_c7_82f1]
signal BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l174_c3_bffa]
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l174_c3_bffa]
signal result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l174_c3_bffa]
signal result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(31 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_535e( ref_toks_0 : device_out_result_t;
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
      base.is_vram_write := ref_toks_1;
      base.is_deo_done := ref_toks_2;
      base.is_device_ram_read := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.vram_address := ref_toks_5;
      base.is_device_ram_write := ref_toks_6;
      base.vram_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2
printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2 : entity work.printf_uxn_device_h_l33_c2_61c2_0CLK_de264c78 port map (
printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE,
printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0,
printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1);

-- BIN_OP_EQ_uxn_device_h_l35_c6_0739
BIN_OP_EQ_uxn_device_h_l35_c6_0739 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l35_c6_0739_left,
BIN_OP_EQ_uxn_device_h_l35_c6_0739_right,
BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- auto_advance_MUX_uxn_device_h_l35_c2_2af4
auto_advance_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond,
auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue,
auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse,
auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- sprite_MUX_uxn_device_h_l35_c2_2af4
sprite_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l35_c2_2af4_cond,
sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue,
sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse,
sprite_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- y_MUX_uxn_device_h_l35_c2_2af4
y_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l35_c2_2af4_cond,
y_MUX_uxn_device_h_l35_c2_2af4_iftrue,
y_MUX_uxn_device_h_l35_c2_2af4_iffalse,
y_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- pixel_MUX_uxn_device_h_l35_c2_2af4
pixel_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l35_c2_2af4_cond,
pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue,
pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse,
pixel_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- x_MUX_uxn_device_h_l35_c2_2af4
x_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l35_c2_2af4_cond,
x_MUX_uxn_device_h_l35_c2_2af4_iftrue,
x_MUX_uxn_device_h_l35_c2_2af4_iffalse,
x_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- color_MUX_uxn_device_h_l35_c2_2af4
color_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l35_c2_2af4_cond,
color_MUX_uxn_device_h_l35_c2_2af4_iftrue,
color_MUX_uxn_device_h_l35_c2_2af4_iffalse,
color_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- is_fill_mode_MUX_uxn_device_h_l35_c2_2af4
is_fill_mode_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond,
is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue,
is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse,
is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4
result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond,
result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4
result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond,
result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4
result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond,
result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_vram_address_MUX_uxn_device_h_l35_c2_2af4
result_vram_address_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond,
result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- result_vram_value_MUX_uxn_device_h_l35_c2_2af4
result_vram_value_MUX_uxn_device_h_l35_c2_2af4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond,
result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue,
result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse,
result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output);

-- BIN_OP_EQ_uxn_device_h_l36_c7_0fe6
BIN_OP_EQ_uxn_device_h_l36_c7_0fe6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left,
BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right,
BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l36_c3_932d
result_is_deo_done_MUX_uxn_device_h_l36_c3_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond,
result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l36_c3_932d
result_device_ram_address_MUX_uxn_device_h_l36_c3_932d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond,
result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue,
result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse,
result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c11_b972
BIN_OP_EQ_uxn_device_h_l45_c11_b972 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c11_b972_left,
BIN_OP_EQ_uxn_device_h_l45_c11_b972_right,
BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- auto_advance_MUX_uxn_device_h_l45_c7_1a20
auto_advance_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond,
auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue,
auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse,
auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- sprite_MUX_uxn_device_h_l45_c7_1a20
sprite_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l45_c7_1a20_cond,
sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue,
sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse,
sprite_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- y_MUX_uxn_device_h_l45_c7_1a20
y_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l45_c7_1a20_cond,
y_MUX_uxn_device_h_l45_c7_1a20_iftrue,
y_MUX_uxn_device_h_l45_c7_1a20_iffalse,
y_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- pixel_MUX_uxn_device_h_l45_c7_1a20
pixel_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l45_c7_1a20_cond,
pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue,
pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse,
pixel_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- x_MUX_uxn_device_h_l45_c7_1a20
x_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l45_c7_1a20_cond,
x_MUX_uxn_device_h_l45_c7_1a20_iftrue,
x_MUX_uxn_device_h_l45_c7_1a20_iffalse,
x_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- color_MUX_uxn_device_h_l45_c7_1a20
color_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l45_c7_1a20_cond,
color_MUX_uxn_device_h_l45_c7_1a20_iftrue,
color_MUX_uxn_device_h_l45_c7_1a20_iffalse,
color_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- is_fill_mode_MUX_uxn_device_h_l45_c7_1a20
is_fill_mode_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond,
is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue,
is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse,
is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20
result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond,
result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20
result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20
result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_vram_address_MUX_uxn_device_h_l45_c7_1a20
result_vram_address_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond,
result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- result_vram_value_MUX_uxn_device_h_l45_c7_1a20
result_vram_value_MUX_uxn_device_h_l45_c7_1a20 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond,
result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue,
result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse,
result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output);

-- BIN_OP_EQ_uxn_device_h_l46_c7_7ca6
BIN_OP_EQ_uxn_device_h_l46_c7_7ca6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left,
BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right,
BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01
result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond,
result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue,
result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse,
result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01
result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond,
result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue,
result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse,
result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output);

-- BIN_OP_EQ_uxn_device_h_l53_c11_c632
BIN_OP_EQ_uxn_device_h_l53_c11_c632 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l53_c11_c632_left,
BIN_OP_EQ_uxn_device_h_l53_c11_c632_right,
BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- auto_advance_MUX_uxn_device_h_l53_c7_4b5b
auto_advance_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond,
auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- sprite_MUX_uxn_device_h_l53_c7_4b5b
sprite_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l53_c7_4b5b_cond,
sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- y_MUX_uxn_device_h_l53_c7_4b5b
y_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l53_c7_4b5b_cond,
y_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
y_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
y_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- pixel_MUX_uxn_device_h_l53_c7_4b5b
pixel_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l53_c7_4b5b_cond,
pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- x_MUX_uxn_device_h_l53_c7_4b5b
x_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l53_c7_4b5b_cond,
x_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
x_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
x_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- color_MUX_uxn_device_h_l53_c7_4b5b
color_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l53_c7_4b5b_cond,
color_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
color_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
color_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b
is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond,
is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b
result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b
result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b
result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_vram_address_MUX_uxn_device_h_l53_c7_4b5b
result_vram_address_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- result_vram_value_MUX_uxn_device_h_l53_c7_4b5b
result_vram_value_MUX_uxn_device_h_l53_c7_4b5b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond,
result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue,
result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse,
result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c7_2f09
BIN_OP_EQ_uxn_device_h_l54_c7_2f09 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left,
BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right,
BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output);

-- pixel_MUX_uxn_device_h_l54_c3_98e1
pixel_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c3_98e1_cond,
pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue,
pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse,
pixel_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- color_MUX_uxn_device_h_l54_c3_98e1
color_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c3_98e1_cond,
color_MUX_uxn_device_h_l54_c3_98e1_iftrue,
color_MUX_uxn_device_h_l54_c3_98e1_iffalse,
color_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c3_98e1
is_fill_mode_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond,
is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1
result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1
result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output);

-- BIN_OP_AND_uxn_device_h_l57_c20_b078
BIN_OP_AND_uxn_device_h_l57_c20_b078 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l57_c20_b078_left,
BIN_OP_AND_uxn_device_h_l57_c20_b078_right,
BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c20_f771
BIN_OP_EQ_uxn_device_h_l57_c20_f771 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c20_f771_left,
BIN_OP_EQ_uxn_device_h_l57_c20_f771_right,
BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output);

-- MUX_uxn_device_h_l57_c20_0138
MUX_uxn_device_h_l57_c20_0138 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l57_c20_0138_cond,
MUX_uxn_device_h_l57_c20_0138_iftrue,
MUX_uxn_device_h_l57_c20_0138_iffalse,
MUX_uxn_device_h_l57_c20_0138_return_output);

-- BIN_OP_EQ_uxn_device_h_l64_c11_959d
BIN_OP_EQ_uxn_device_h_l64_c11_959d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l64_c11_959d_left,
BIN_OP_EQ_uxn_device_h_l64_c11_959d_right,
BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- auto_advance_MUX_uxn_device_h_l64_c7_aebf
auto_advance_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond,
auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue,
auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse,
auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- sprite_MUX_uxn_device_h_l64_c7_aebf
sprite_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l64_c7_aebf_cond,
sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue,
sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse,
sprite_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- y_MUX_uxn_device_h_l64_c7_aebf
y_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l64_c7_aebf_cond,
y_MUX_uxn_device_h_l64_c7_aebf_iftrue,
y_MUX_uxn_device_h_l64_c7_aebf_iffalse,
y_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- x_MUX_uxn_device_h_l64_c7_aebf
x_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l64_c7_aebf_cond,
x_MUX_uxn_device_h_l64_c7_aebf_iftrue,
x_MUX_uxn_device_h_l64_c7_aebf_iffalse,
x_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf
result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond,
result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf
result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond,
result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf
result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond,
result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_vram_address_MUX_uxn_device_h_l64_c7_aebf
result_vram_address_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond,
result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- result_vram_value_MUX_uxn_device_h_l64_c7_aebf
result_vram_value_MUX_uxn_device_h_l64_c7_aebf : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond,
result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue,
result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse,
result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output);

-- BIN_OP_EQ_uxn_device_h_l65_c7_1874
BIN_OP_EQ_uxn_device_h_l65_c7_1874 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l65_c7_1874_left,
BIN_OP_EQ_uxn_device_h_l65_c7_1874_right,
BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded
result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond,
result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue,
result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse,
result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded
result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond,
result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue,
result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse,
result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output);

-- BIN_OP_EQ_uxn_device_h_l72_c11_ed1d
BIN_OP_EQ_uxn_device_h_l72_c11_ed1d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left,
BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right,
BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- auto_advance_MUX_uxn_device_h_l72_c7_ab68
auto_advance_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond,
auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue,
auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse,
auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- sprite_MUX_uxn_device_h_l72_c7_ab68
sprite_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l72_c7_ab68_cond,
sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue,
sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse,
sprite_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- y_MUX_uxn_device_h_l72_c7_ab68
y_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l72_c7_ab68_cond,
y_MUX_uxn_device_h_l72_c7_ab68_iftrue,
y_MUX_uxn_device_h_l72_c7_ab68_iffalse,
y_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- x_MUX_uxn_device_h_l72_c7_ab68
x_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l72_c7_ab68_cond,
x_MUX_uxn_device_h_l72_c7_ab68_iftrue,
x_MUX_uxn_device_h_l72_c7_ab68_iffalse,
x_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68
result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond,
result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68
result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond,
result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68
result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond,
result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_vram_address_MUX_uxn_device_h_l72_c7_ab68
result_vram_address_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond,
result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- result_vram_value_MUX_uxn_device_h_l72_c7_ab68
result_vram_value_MUX_uxn_device_h_l72_c7_ab68 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond,
result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue,
result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse,
result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c7_c3c4
BIN_OP_EQ_uxn_device_h_l73_c7_c3c4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left,
BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right,
BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output);

-- sprite_MUX_uxn_device_h_l73_c3_a7e9
sprite_MUX_uxn_device_h_l73_c3_a7e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c3_a7e9_cond,
sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue,
sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse,
sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9
result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9
result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_be51
BIN_OP_EQ_uxn_device_h_l81_c11_be51 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_be51_left,
BIN_OP_EQ_uxn_device_h_l81_c11_be51_right,
BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_6c28
auto_advance_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond,
auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- y_MUX_uxn_device_h_l81_c7_6c28
y_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_6c28_cond,
y_MUX_uxn_device_h_l81_c7_6c28_iftrue,
y_MUX_uxn_device_h_l81_c7_6c28_iffalse,
y_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- x_MUX_uxn_device_h_l81_c7_6c28
x_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_6c28_cond,
x_MUX_uxn_device_h_l81_c7_6c28_iftrue,
x_MUX_uxn_device_h_l81_c7_6c28_iffalse,
x_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28
result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28
result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28
result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_6c28
result_vram_address_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_6c28
result_vram_value_MUX_uxn_device_h_l81_c7_6c28 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_089f
BIN_OP_EQ_uxn_device_h_l82_c7_089f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_089f_left,
BIN_OP_EQ_uxn_device_h_l82_c7_089f_right,
BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9
result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9
result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output);

-- BIN_OP_EQ_uxn_device_h_l89_c11_65c2
BIN_OP_EQ_uxn_device_h_l89_c11_65c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left,
BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right,
BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- auto_advance_MUX_uxn_device_h_l89_c7_814f
auto_advance_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l89_c7_814f_cond,
auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue,
auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse,
auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output);

-- y_MUX_uxn_device_h_l89_c7_814f
y_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l89_c7_814f_cond,
y_MUX_uxn_device_h_l89_c7_814f_iftrue,
y_MUX_uxn_device_h_l89_c7_814f_iffalse,
y_MUX_uxn_device_h_l89_c7_814f_return_output);

-- x_MUX_uxn_device_h_l89_c7_814f
x_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l89_c7_814f_cond,
x_MUX_uxn_device_h_l89_c7_814f_iftrue,
x_MUX_uxn_device_h_l89_c7_814f_iffalse,
x_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l89_c7_814f
result_is_vram_write_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond,
result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l89_c7_814f
result_is_deo_done_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond,
result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l89_c7_814f
result_device_ram_address_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond,
result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_vram_address_MUX_uxn_device_h_l89_c7_814f
result_vram_address_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond,
result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output);

-- result_vram_value_MUX_uxn_device_h_l89_c7_814f
result_vram_value_MUX_uxn_device_h_l89_c7_814f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond,
result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue,
result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse,
result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c7_841a
BIN_OP_EQ_uxn_device_h_l90_c7_841a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c7_841a_left,
BIN_OP_EQ_uxn_device_h_l90_c7_841a_right,
BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output);

-- x_MUX_uxn_device_h_l90_c3_bfd4
x_MUX_uxn_device_h_l90_c3_bfd4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c3_bfd4_cond,
x_MUX_uxn_device_h_l90_c3_bfd4_iftrue,
x_MUX_uxn_device_h_l90_c3_bfd4_iffalse,
x_MUX_uxn_device_h_l90_c3_bfd4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4
result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4
result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_332d
BIN_OP_EQ_uxn_device_h_l99_c11_332d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_332d_left,
BIN_OP_EQ_uxn_device_h_l99_c11_332d_right,
BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_9eae
auto_advance_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond,
auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- y_MUX_uxn_device_h_l99_c7_9eae
y_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_9eae_cond,
y_MUX_uxn_device_h_l99_c7_9eae_iftrue,
y_MUX_uxn_device_h_l99_c7_9eae_iffalse,
y_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- x_MUX_uxn_device_h_l99_c7_9eae
x_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_9eae_cond,
x_MUX_uxn_device_h_l99_c7_9eae_iftrue,
x_MUX_uxn_device_h_l99_c7_9eae_iffalse,
x_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae
result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae
result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae
result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_9eae
result_vram_address_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- result_vram_value_MUX_uxn_device_h_l99_c7_9eae
result_vram_value_MUX_uxn_device_h_l99_c7_9eae : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond,
result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue,
result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse,
result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_4195
BIN_OP_EQ_uxn_device_h_l100_c7_4195 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_4195_left,
BIN_OP_EQ_uxn_device_h_l100_c7_4195_right,
BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66
result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66
result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c11_2ffc
BIN_OP_EQ_uxn_device_h_l107_c11_2ffc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left,
BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right,
BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- auto_advance_MUX_uxn_device_h_l107_c7_6d1e
auto_advance_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond,
auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- y_MUX_uxn_device_h_l107_c7_6d1e
y_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l107_c7_6d1e_cond,
y_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
y_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
y_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- x_MUX_uxn_device_h_l107_c7_6d1e
x_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c7_6d1e_cond,
x_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
x_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
x_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e
result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e
result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e
result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_vram_address_MUX_uxn_device_h_l107_c7_6d1e
result_vram_address_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- result_vram_value_MUX_uxn_device_h_l107_c7_6d1e
result_vram_value_MUX_uxn_device_h_l107_c7_6d1e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond,
result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue,
result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse,
result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c7_b40d
BIN_OP_EQ_uxn_device_h_l108_c7_b40d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left,
BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right,
BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output);

-- x_MUX_uxn_device_h_l108_c3_eaa5
x_MUX_uxn_device_h_l108_c3_eaa5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c3_eaa5_cond,
x_MUX_uxn_device_h_l108_c3_eaa5_iftrue,
x_MUX_uxn_device_h_l108_c3_eaa5_iffalse,
x_MUX_uxn_device_h_l108_c3_eaa5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5
result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5
result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output);

-- BIN_OP_OR_uxn_device_h_l109_c4_0f5f
BIN_OP_OR_uxn_device_h_l109_c4_0f5f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left,
BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right,
BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_0769
BIN_OP_EQ_uxn_device_h_l116_c11_0769 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_0769_left,
BIN_OP_EQ_uxn_device_h_l116_c11_0769_right,
BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_8a80
auto_advance_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond,
auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- y_MUX_uxn_device_h_l116_c7_8a80
y_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_8a80_cond,
y_MUX_uxn_device_h_l116_c7_8a80_iftrue,
y_MUX_uxn_device_h_l116_c7_8a80_iffalse,
y_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80
result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80
result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80
result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_8a80
result_vram_address_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_8a80
result_vram_value_MUX_uxn_device_h_l116_c7_8a80 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_3236
BIN_OP_EQ_uxn_device_h_l117_c7_3236 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_3236_left,
BIN_OP_EQ_uxn_device_h_l117_c7_3236_right,
BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_405f
result_is_deo_done_MUX_uxn_device_h_l117_c3_405f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_405f
result_device_ram_address_MUX_uxn_device_h_l117_c3_405f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output);

-- BIN_OP_EQ_uxn_device_h_l124_c11_11d0
BIN_OP_EQ_uxn_device_h_l124_c11_11d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left,
BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right,
BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- auto_advance_MUX_uxn_device_h_l124_c7_f0b7
auto_advance_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond,
auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- y_MUX_uxn_device_h_l124_c7_f0b7
y_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l124_c7_f0b7_cond,
y_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
y_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
y_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7
result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7
result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7
result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_vram_address_MUX_uxn_device_h_l124_c7_f0b7
result_vram_address_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- result_vram_value_MUX_uxn_device_h_l124_c7_f0b7
result_vram_value_MUX_uxn_device_h_l124_c7_f0b7 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond,
result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue,
result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse,
result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c7_b123
BIN_OP_EQ_uxn_device_h_l125_c7_b123 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c7_b123_left,
BIN_OP_EQ_uxn_device_h_l125_c7_b123_right,
BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output);

-- y_MUX_uxn_device_h_l125_c3_e511
y_MUX_uxn_device_h_l125_c3_e511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c3_e511_cond,
y_MUX_uxn_device_h_l125_c3_e511_iftrue,
y_MUX_uxn_device_h_l125_c3_e511_iffalse,
y_MUX_uxn_device_h_l125_c3_e511_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c3_e511
result_is_deo_done_MUX_uxn_device_h_l125_c3_e511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c3_e511
result_device_ram_address_MUX_uxn_device_h_l125_c3_e511 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c11_d6fa
BIN_OP_EQ_uxn_device_h_l134_c11_d6fa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left,
BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right,
BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- auto_advance_MUX_uxn_device_h_l134_c7_df9f
auto_advance_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond,
auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue,
auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse,
auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- y_MUX_uxn_device_h_l134_c7_df9f
y_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c7_df9f_cond,
y_MUX_uxn_device_h_l134_c7_df9f_iftrue,
y_MUX_uxn_device_h_l134_c7_df9f_iffalse,
y_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f
result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond,
result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f
result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f
result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_vram_address_MUX_uxn_device_h_l134_c7_df9f
result_vram_address_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond,
result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- result_vram_value_MUX_uxn_device_h_l134_c7_df9f
result_vram_value_MUX_uxn_device_h_l134_c7_df9f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond,
result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue,
result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse,
result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output);

-- BIN_OP_EQ_uxn_device_h_l135_c7_faf4
BIN_OP_EQ_uxn_device_h_l135_c7_faf4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left,
BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right,
BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8
result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond,
result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8
result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond,
result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output);

-- BIN_OP_EQ_uxn_device_h_l142_c11_935c
BIN_OP_EQ_uxn_device_h_l142_c11_935c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l142_c11_935c_left,
BIN_OP_EQ_uxn_device_h_l142_c11_935c_right,
BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- auto_advance_MUX_uxn_device_h_l142_c7_d5f0
auto_advance_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond,
auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- y_MUX_uxn_device_h_l142_c7_d5f0
y_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l142_c7_d5f0_cond,
y_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
y_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
y_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0
result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0
result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0
result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_vram_address_MUX_uxn_device_h_l142_c7_d5f0
result_vram_address_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- result_vram_value_MUX_uxn_device_h_l142_c7_d5f0
result_vram_value_MUX_uxn_device_h_l142_c7_d5f0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond,
result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue,
result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse,
result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c7_9fd5
BIN_OP_EQ_uxn_device_h_l143_c7_9fd5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left,
BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right,
BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output);

-- y_MUX_uxn_device_h_l143_c3_2412
y_MUX_uxn_device_h_l143_c3_2412 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c3_2412_cond,
y_MUX_uxn_device_h_l143_c3_2412_iftrue,
y_MUX_uxn_device_h_l143_c3_2412_iffalse,
y_MUX_uxn_device_h_l143_c3_2412_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c3_2412
result_is_deo_done_MUX_uxn_device_h_l143_c3_2412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c3_2412
result_device_ram_address_MUX_uxn_device_h_l143_c3_2412 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output);

-- BIN_OP_OR_uxn_device_h_l144_c4_8dd3
BIN_OP_OR_uxn_device_h_l144_c4_8dd3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left,
BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right,
BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_c96b
BIN_OP_EQ_uxn_device_h_l151_c11_c96b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left,
BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right,
BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_43c8
auto_advance_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond,
auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8
result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8
result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8
result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_43c8
result_vram_address_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_43c8
result_vram_value_MUX_uxn_device_h_l151_c7_43c8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_9d98
BIN_OP_EQ_uxn_device_h_l152_c7_9d98 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left,
BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right,
BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_4189
result_is_deo_done_MUX_uxn_device_h_l152_c3_4189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_4189
result_device_ram_address_MUX_uxn_device_h_l152_c3_4189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output);

-- BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb
BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left,
BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right,
BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output);

-- BIN_OP_GT_uxn_device_h_l153_c27_53eb
BIN_OP_GT_uxn_device_h_l153_c27_53eb : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l153_c27_53eb_left,
BIN_OP_GT_uxn_device_h_l153_c27_53eb_right,
BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output);

-- MUX_uxn_device_h_l153_c27_9dad
MUX_uxn_device_h_l153_c27_9dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l153_c27_9dad_cond,
MUX_uxn_device_h_l153_c27_9dad_iftrue,
MUX_uxn_device_h_l153_c27_9dad_iffalse,
MUX_uxn_device_h_l153_c27_9dad_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_c817
BIN_OP_EQ_uxn_device_h_l160_c11_c817 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_c817_left,
BIN_OP_EQ_uxn_device_h_l160_c11_c817_right,
BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_6f50
auto_advance_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond,
auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50
result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50
result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50
result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_6f50
result_vram_address_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_6f50
result_vram_value_MUX_uxn_device_h_l160_c7_6f50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_ba1e
BIN_OP_EQ_uxn_device_h_l161_c7_ba1e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left,
BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right,
BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output);

-- auto_advance_MUX_uxn_device_h_l161_c3_7e7a
auto_advance_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond,
auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a
result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a
result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a
result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_vram_address_MUX_uxn_device_h_l161_c3_7e7a
result_vram_address_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- result_vram_value_MUX_uxn_device_h_l161_c3_7e7a
result_vram_value_MUX_uxn_device_h_l161_c3_7e7a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond,
result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue,
result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse,
result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output);

-- printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0
printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0 : entity work.printf_uxn_device_h_l162_c4_6dc0_0CLK_de264c78 port map (
printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE,
printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0,
printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1,
printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output);

-- BIN_OP_PLUS_uxn_device_h_l167_c27_29ad
BIN_OP_PLUS_uxn_device_h_l167_c27_29ad : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left,
BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right,
BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output);

-- BIN_OP_EQ_uxn_device_h_l173_c11_ca3f
BIN_OP_EQ_uxn_device_h_l173_c11_ca3f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left,
BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right,
BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l173_c7_7593
result_is_vram_write_MUX_uxn_device_h_l173_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond,
result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue,
result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse,
result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l173_c7_7593
result_is_deo_done_MUX_uxn_device_h_l173_c7_7593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond,
result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue,
result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse,
result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output);

-- result_vram_value_MUX_uxn_device_h_l173_c7_7593
result_vram_value_MUX_uxn_device_h_l173_c7_7593 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond,
result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue,
result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse,
result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output);

-- result_vram_address_MUX_uxn_device_h_l173_c7_7593
result_vram_address_MUX_uxn_device_h_l173_c7_7593 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond,
result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue,
result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse,
result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output);

-- BIN_OP_EQ_uxn_device_h_l174_c7_82f1
BIN_OP_EQ_uxn_device_h_l174_c7_82f1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left,
BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right,
BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa
result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond,
result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue,
result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse,
result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output);

-- result_vram_value_MUX_uxn_device_h_l174_c3_bffa
result_vram_value_MUX_uxn_device_h_l174_c3_bffa : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond,
result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue,
result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse,
result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output);

-- result_vram_address_MUX_uxn_device_h_l174_c3_bffa
result_vram_address_MUX_uxn_device_h_l174_c3_bffa : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond,
result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue,
result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse,
result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x,
CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output);



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
 BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output,
 auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output,
 sprite_MUX_uxn_device_h_l35_c2_2af4_return_output,
 y_MUX_uxn_device_h_l35_c2_2af4_return_output,
 pixel_MUX_uxn_device_h_l35_c2_2af4_return_output,
 x_MUX_uxn_device_h_l35_c2_2af4_return_output,
 color_MUX_uxn_device_h_l35_c2_2af4_return_output,
 is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output,
 result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output,
 BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output,
 result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output,
 sprite_MUX_uxn_device_h_l45_c7_1a20_return_output,
 y_MUX_uxn_device_h_l45_c7_1a20_return_output,
 pixel_MUX_uxn_device_h_l45_c7_1a20_return_output,
 x_MUX_uxn_device_h_l45_c7_1a20_return_output,
 color_MUX_uxn_device_h_l45_c7_1a20_return_output,
 is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output,
 result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output,
 BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output,
 result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output,
 BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output,
 auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 y_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 x_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 color_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output,
 pixel_MUX_uxn_device_h_l54_c3_98e1_return_output,
 color_MUX_uxn_device_h_l54_c3_98e1_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output,
 BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output,
 MUX_uxn_device_h_l57_c20_0138_return_output,
 BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output,
 auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output,
 sprite_MUX_uxn_device_h_l64_c7_aebf_return_output,
 y_MUX_uxn_device_h_l64_c7_aebf_return_output,
 x_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output,
 result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output,
 BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output,
 result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output,
 result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output,
 BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output,
 auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output,
 sprite_MUX_uxn_device_h_l72_c7_ab68_return_output,
 y_MUX_uxn_device_h_l72_c7_ab68_return_output,
 x_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output,
 result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output,
 sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output,
 y_MUX_uxn_device_h_l81_c7_6c28_return_output,
 x_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output,
 BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output,
 auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output,
 y_MUX_uxn_device_h_l89_c7_814f_return_output,
 x_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output,
 result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output,
 x_MUX_uxn_device_h_l90_c3_bfd4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output,
 y_MUX_uxn_device_h_l99_c7_9eae_return_output,
 x_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output,
 result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output,
 auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 y_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 x_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output,
 x_MUX_uxn_device_h_l108_c3_eaa5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output,
 BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output,
 y_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output,
 BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output,
 auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 y_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output,
 y_MUX_uxn_device_h_l125_c3_e511_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output,
 y_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output,
 result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output,
 BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output,
 BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output,
 auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 y_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output,
 y_MUX_uxn_device_h_l143_c3_2412_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output,
 BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output,
 BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output,
 BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output,
 MUX_uxn_device_h_l153_c27_9dad_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output,
 auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output,
 BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output,
 BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output,
 result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output,
 result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output,
 result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output,
 BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output,
 result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output,
 result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l39_c4_c951 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_5455 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l59_c4_b6ba : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_1397_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0138_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0138_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0138_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l57_c20_0138_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l67_c4_a506 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_f0ec : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l84_c4_c0af : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_9224 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l102_c4_01e9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_c64e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l119_c4_0df2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l129_c4_a404 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l137_c4_b42a : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_0998 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_0a75 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9dad_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9dad_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9dad_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l153_c27_9dad_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l165_c4_b57b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l167_c4_62a3 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_9600_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_4daa_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_56f1_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l178_c4_7d06 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l177_c4_6caf : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_e077_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_535e_uxn_device_h_l26_l187_DUPLICATE_9bc3_return_output : device_out_result_t;
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
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_right := to_unsigned(7, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right := to_unsigned(14, 4);
     VAR_result_vram_value_uxn_device_h_l178_c4_7d06 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue := VAR_result_vram_value_uxn_device_h_l178_c4_7d06;
     VAR_result_device_ram_address_uxn_device_h_l48_c4_5455 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_5455;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right := to_unsigned(13, 4);
     VAR_result_device_ram_address_uxn_device_h_l129_c4_a404 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue := VAR_result_device_ram_address_uxn_device_h_l129_c4_a404;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_c64e := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_c64e;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l84_c4_c0af := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue := VAR_result_device_ram_address_uxn_device_h_l84_c4_c0af;
     VAR_MUX_uxn_device_h_l57_c20_0138_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l94_c4_9224 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_9224;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue := to_unsigned(1, 1);
     VAR_result_vram_address_uxn_device_h_l177_c4_6caf := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue := VAR_result_vram_address_uxn_device_h_l177_c4_6caf;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_0998 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_0998;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_right := to_unsigned(5, 3);
     VAR_result_device_ram_address_uxn_device_h_l39_c4_c951 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue := VAR_result_device_ram_address_uxn_device_h_l39_c4_c951;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right := to_unsigned(800, 32);
     VAR_result_device_ram_address_uxn_device_h_l59_c4_b6ba := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue := VAR_result_device_ram_address_uxn_device_h_l59_c4_b6ba;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_right := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l67_c4_a506 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue := VAR_result_device_ram_address_uxn_device_h_l67_c4_a506;
     VAR_MUX_uxn_device_h_l57_c20_0138_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_right := to_unsigned(9, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_f0ec := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_f0ec;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l119_c4_0df2 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue := VAR_result_device_ram_address_uxn_device_h_l119_c4_0df2;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l102_c4_01e9 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue := VAR_result_device_ram_address_uxn_device_h_l102_c4_01e9;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_right := to_unsigned(575999, 20);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l137_c4_b42a := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue := VAR_result_device_ram_address_uxn_device_h_l137_c4_b42a;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l153_c27_9dad_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l165_c4_b57b := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue := VAR_result_device_ram_address_uxn_device_h_l165_c4_b57b;
     VAR_result_device_ram_address_uxn_device_h_l155_c4_0a75 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_0a75;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right := to_unsigned(10, 4);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right := to_unsigned(800, 10);
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_right := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l153_c27_9dad_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse := to_unsigned(1, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l35_c2_2af4_iftrue := color;
     VAR_color_MUX_uxn_device_h_l45_c7_1a20_iftrue := color;
     VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iffalse := color;
     VAR_color_MUX_uxn_device_h_l54_c3_98e1_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_left := VAR_device_port;
     VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_left := VAR_phase;
     VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right := x;
     VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iffalse := x;
     VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iffalse := x;
     VAR_x_MUX_uxn_device_h_l35_c2_2af4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l45_c7_1a20_iftrue := x;
     VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l64_c7_aebf_iftrue := x;
     VAR_x_MUX_uxn_device_h_l72_c7_ab68_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_6c28_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_9eae_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left := y;
     VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_8a80_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c3_e511_iffalse := y;
     VAR_y_MUX_uxn_device_h_l134_c7_df9f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c3_2412_iffalse := y;
     VAR_y_MUX_uxn_device_h_l35_c2_2af4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l45_c7_1a20_iftrue := y;
     VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l64_c7_aebf_iftrue := y;
     VAR_y_MUX_uxn_device_h_l72_c7_ab68_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_6c28_iftrue := y;
     VAR_y_MUX_uxn_device_h_l89_c7_814f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_9eae_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l173_c11_ca3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_left;
     BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right <= VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output := BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l162_c91_9600] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_9600_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l161_c7_ba1e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l65_c7_1874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l65_c7_1874_left <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_left;
     BIN_OP_EQ_uxn_device_h_l65_c7_1874_right <= VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output := BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_c96b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_c817] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_c817_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_c817_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;

     -- BIN_OP_EQ[uxn_device_h_l89_c11_65c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_left;
     BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right <= VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output := BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l72_c11_ed1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_left;
     BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right <= VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output := BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l174_c7_82f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_left;
     BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right <= VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output := BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l46_c7_7ca6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_left;
     BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right <= VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output := BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l142_c11_935c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l142_c11_935c_left <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_left;
     BIN_OP_EQ_uxn_device_h_l142_c11_935c_right <= VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output := BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c7_841a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c7_841a_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_left;
     BIN_OP_EQ_uxn_device_h_l90_c7_841a_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output := BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_e077 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_e077_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l125_c7_b123] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c7_b123_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_left;
     BIN_OP_EQ_uxn_device_h_l125_c7_b123_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output := BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l124_c11_11d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_left;
     BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output := BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_089f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_089f_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_089f_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c11_b972] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c11_b972_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_left;
     BIN_OP_EQ_uxn_device_h_l45_c11_b972_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output := BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;

     -- BIN_OP_EQ[uxn_device_h_l35_c6_0739] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l35_c6_0739_left <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_left;
     BIN_OP_EQ_uxn_device_h_l35_c6_0739_right <= VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output := BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_9d98] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c63_56f1] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_56f1_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l108_c7_b40d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_left;
     BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output := BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output;

     -- printf_uxn_device_h_l33_c2_61c2[uxn_device_h_l33_c2_61c2] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0 <= VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg0;
     printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1 <= VAR_printf_uxn_device_h_l33_c2_61c2_uxn_device_h_l33_c2_61c2_arg1;
     -- Outputs

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l153_c27_831f] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l36_c7_0fe6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_left;
     BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right <= VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output := BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c7_2f09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_left;
     BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output := BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_4195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_4195_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_4195_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_be51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_be51_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_be51_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_0769] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_0769_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_0769_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;

     -- BIN_OP_AND[uxn_device_h_l57_c20_b078] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l57_c20_b078_left <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_left;
     BIN_OP_AND_uxn_device_h_l57_c20_b078_right <= VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output := BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_3236] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_3236_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_3236_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c11_2ffc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_left;
     BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output := BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l167_c27_4daa] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_4daa_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l143_c7_9fd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_left;
     BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output := BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l56_c12_1397] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_1397_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l64_c11_959d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l64_c11_959d_left <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_left;
     BIN_OP_EQ_uxn_device_h_l64_c11_959d_right <= VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output := BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l53_c11_c632] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l53_c11_c632_left <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_left;
     BIN_OP_EQ_uxn_device_h_l53_c11_c632_right <= VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output := BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c7_c3c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_left;
     BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output := BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c11_d6fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_left;
     BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output := BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2 LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l135_c7_faf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_left;
     BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right <= VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output := BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_332d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_332d_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_332d_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output := result.device_ram_address;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_left := VAR_BIN_OP_AND_uxn_device_h_l57_c20_b078_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_4195_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c11_2ffc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_eaa5_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c7_b40d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_8a80_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_0769_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_3236_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_f0b7_cond := VAR_BIN_OP_EQ_uxn_device_h_l124_c11_11d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_e511_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c7_b123_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_df9f_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c11_d6fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond := VAR_BIN_OP_EQ_uxn_device_h_l135_c7_faf4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_d5f0_cond := VAR_BIN_OP_EQ_uxn_device_h_l142_c11_935c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_2412_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c7_9fd5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_c96b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_9d98_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_c817_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_ba1e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond := VAR_BIN_OP_EQ_uxn_device_h_l173_c11_ca3f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond := VAR_BIN_OP_EQ_uxn_device_h_l174_c7_82f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_2af4_cond := VAR_BIN_OP_EQ_uxn_device_h_l35_c6_0739_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond := VAR_BIN_OP_EQ_uxn_device_h_l36_c7_0fe6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_1a20_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c11_b972_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond := VAR_BIN_OP_EQ_uxn_device_h_l46_c7_7ca6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_4b5b_cond := VAR_BIN_OP_EQ_uxn_device_h_l53_c11_c632_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c7_2f09_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_aebf_cond := VAR_BIN_OP_EQ_uxn_device_h_l64_c11_959d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond := VAR_BIN_OP_EQ_uxn_device_h_l65_c7_1874_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_ab68_cond := VAR_BIN_OP_EQ_uxn_device_h_l72_c11_ed1d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c7_c3c4_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_6c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_be51_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_089f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_814f_cond := VAR_BIN_OP_EQ_uxn_device_h_l89_c11_65c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_bfd4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c7_841a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_9eae_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_332d_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l153_c27_831f_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l91_l144_l109_l126_DUPLICATE_3737_return_output;
     VAR_color_MUX_uxn_device_h_l54_c3_98e1_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l56_c12_1397_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c27_4daa_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right := VAR_CAST_TO_uint32_t_uxn_device_h_l167_c63_56f1_return_output;
     VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l162_c91_9600_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l108_l135_l125_l143_l82_DUPLICATE_7622_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_742e_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_e077_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l35_l36_DUPLICATE_e077_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_db44_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_e3cd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l174_l99_l151_l35_l89_l142_l161_l81_l134_l72_l124_l64_l116_l173_l53_l107_l45_DUPLICATE_b9c2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l100_l65_l73_l117_l46_l161_l90_l54_l36_l108_l135_l152_l125_l143_l82_l160_DUPLICATE_a58b_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l46_c3_5f01] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_cond;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output := result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output;

     -- BIN_OP_OR[uxn_device_h_l109_c4_0f5f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_left;
     BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right <= VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output := BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c3_e511] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c3_a7e9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l36_c3_932d] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output := result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l135_c3_b7b8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c3_eaa5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output;

     -- result_vram_value_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l36_c3_932d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_cond;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output := result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_9c66] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c3_bfd4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l174_c3_bffa] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_cond;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output := result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c3_eaa5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_405f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c3_a7e9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output;

     -- auto_advance_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_cond;
     auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output := auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l167_c27_436d] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output;

     -- result_vram_value_MUX[uxn_device_h_l174_c3_bffa] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_cond;
     result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iftrue;
     result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output := result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c3_2412] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output;

     -- result_vram_address_MUX[uxn_device_h_l174_c3_bffa] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_cond;
     result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iftrue;
     result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output := result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c3_2412] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output := CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output;

     -- pixel_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_cond;
     pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_return_output := pixel_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l135_c3_b7b8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_cond;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output := result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_9c66] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c20_f771] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c20_f771_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_left;
     BIN_OP_EQ_uxn_device_h_l57_c20_f771_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output := BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output;

     -- color_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_color_MUX_uxn_device_h_l54_c3_98e1_cond;
     color_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_color_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     color_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_color_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c3_98e1_return_output := color_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l173_c7_7593] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_cond;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output := result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l46_c3_5f01] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output := result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l46_c3_5f01] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_cond;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output := result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_4189] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l36_c3_932d] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output := result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_4189] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c3_eaa5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c3_e511] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l135_c3_b7b8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_cond;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output := result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l65_c3_6ded] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output := result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output;

     -- sprite_MUX[uxn_device_h_l73_c3_a7e9] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c3_a7e9_cond <= VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_cond;
     sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iftrue;
     sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output := sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_fbb9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c3_2412] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c3_bfd4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output;

     -- BIN_OP_OR[uxn_device_h_l144_c4_8dd3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_left;
     BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right <= VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output := BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_405f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c3_bfd4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l153_c27_a6cb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_left;
     BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right <= VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output := BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_fbb9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l65_c3_6ded] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_cond;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output := result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_fbb9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_405f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l100_c3_9c66] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output := result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c3_a7e9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l65_c3_6ded] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_cond;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output := result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l36_c3_932d] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_cond;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output := result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c3_e511] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l57_c20_0138_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c20_f771_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l167_c27_436d_return_output;
     VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l109_c4_0f5f_return_output;
     VAR_y_MUX_uxn_device_h_l143_c3_2412_iftrue := VAR_BIN_OP_OR_uxn_device_h_l144_c4_8dd3_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_left := VAR_BIN_OP_PLUS_uxn_device_h_l153_c27_a6cb_return_output;
     VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output;
     VAR_y_MUX_uxn_device_h_l125_c3_e511_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l92_l127_DUPLICATE_e72c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_auto_advance_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_color_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_pixel_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_9c66_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c3_eaa5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_405f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c3_e511_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l135_c3_b7b8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c3_2412_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_4189_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l36_c3_932d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l46_c3_5f01_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l65_c3_6ded_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c3_a7e9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_fbb9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c3_bfd4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_9c66_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c3_eaa5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_405f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c3_e511_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l135_c3_b7b8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c3_2412_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l173_c7_7593_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l36_c3_932d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l46_c3_5f01_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l65_c3_6ded_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c3_a7e9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_fbb9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c3_bfd4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l100_c3_9c66_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c3_eaa5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_405f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c3_e511_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l135_c3_b7b8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c3_2412_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_4189_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l36_c3_932d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l46_c3_5f01_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l65_c3_6ded_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c3_a7e9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_fbb9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c3_bfd4_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l36_c3_932d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l174_c3_bffa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l174_c3_bffa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l174_c3_bffa_return_output;
     VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue := VAR_sprite_MUX_uxn_device_h_l73_c3_a7e9_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- x_MUX[uxn_device_h_l90_c3_bfd4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c3_bfd4_cond <= VAR_x_MUX_uxn_device_h_l90_c3_bfd4_cond;
     x_MUX_uxn_device_h_l90_c3_bfd4_iftrue <= VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iftrue;
     x_MUX_uxn_device_h_l90_c3_bfd4_iffalse <= VAR_x_MUX_uxn_device_h_l90_c3_bfd4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c3_bfd4_return_output := x_MUX_uxn_device_h_l90_c3_bfd4_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output := result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- MUX[uxn_device_h_l57_c20_0138] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l57_c20_0138_cond <= VAR_MUX_uxn_device_h_l57_c20_0138_cond;
     MUX_uxn_device_h_l57_c20_0138_iftrue <= VAR_MUX_uxn_device_h_l57_c20_0138_iftrue;
     MUX_uxn_device_h_l57_c20_0138_iffalse <= VAR_MUX_uxn_device_h_l57_c20_0138_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l57_c20_0138_return_output := MUX_uxn_device_h_l57_c20_0138_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output := auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l167_c27_29ad] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_left;
     BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right <= VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output := BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output;

     -- x_MUX[uxn_device_h_l108_c3_eaa5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c3_eaa5_cond <= VAR_x_MUX_uxn_device_h_l108_c3_eaa5_cond;
     x_MUX_uxn_device_h_l108_c3_eaa5_iftrue <= VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iftrue;
     x_MUX_uxn_device_h_l108_c3_eaa5_iffalse <= VAR_x_MUX_uxn_device_h_l108_c3_eaa5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c3_eaa5_return_output := x_MUX_uxn_device_h_l108_c3_eaa5_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l173_c7_7593] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_cond;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output := result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output;

     -- y_MUX[uxn_device_h_l143_c3_2412] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c3_2412_cond <= VAR_y_MUX_uxn_device_h_l143_c3_2412_cond;
     y_MUX_uxn_device_h_l143_c3_2412_iftrue <= VAR_y_MUX_uxn_device_h_l143_c3_2412_iftrue;
     y_MUX_uxn_device_h_l143_c3_2412_iffalse <= VAR_y_MUX_uxn_device_h_l143_c3_2412_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c3_2412_return_output := y_MUX_uxn_device_h_l143_c3_2412_return_output;

     -- color_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_color_MUX_uxn_device_h_l53_c7_4b5b_cond;
     color_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     color_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_color_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l53_c7_4b5b_return_output := color_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- pixel_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_cond;
     pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output := pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- result_vram_address_MUX[uxn_device_h_l173_c7_7593] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_cond;
     result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iftrue;
     result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output := result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output;

     -- sprite_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_cond;
     sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_return_output := sprite_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- y_MUX[uxn_device_h_l125_c3_e511] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c3_e511_cond <= VAR_y_MUX_uxn_device_h_l125_c3_e511_cond;
     y_MUX_uxn_device_h_l125_c3_e511_iftrue <= VAR_y_MUX_uxn_device_h_l125_c3_e511_iftrue;
     y_MUX_uxn_device_h_l125_c3_e511_iffalse <= VAR_y_MUX_uxn_device_h_l125_c3_e511_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c3_e511_return_output := y_MUX_uxn_device_h_l125_c3_e511_return_output;

     -- result_vram_value_MUX[uxn_device_h_l173_c7_7593] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_cond;
     result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iftrue;
     result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output := result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output;

     -- BIN_OP_GT[uxn_device_h_l153_c27_53eb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l153_c27_53eb_left <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_left;
     BIN_OP_GT_uxn_device_h_l153_c27_53eb_right <= VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output := BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l153_c27_9dad_cond := VAR_BIN_OP_GT_uxn_device_h_l153_c27_53eb_return_output;
     VAR_result_vram_address_uxn_device_h_l167_c4_62a3 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l167_c27_29ad_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue := VAR_MUX_uxn_device_h_l57_c20_0138_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_color_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_color_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_pixel_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l173_c7_7593_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l173_c7_7593_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l173_c7_7593_return_output;
     VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_sprite_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iftrue := VAR_x_MUX_uxn_device_h_l108_c3_eaa5_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_814f_iftrue := VAR_x_MUX_uxn_device_h_l90_c3_bfd4_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iftrue := VAR_y_MUX_uxn_device_h_l125_c3_e511_return_output;
     VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iftrue := VAR_y_MUX_uxn_device_h_l143_c3_2412_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue := VAR_result_vram_address_uxn_device_h_l167_c4_62a3;
     -- pixel_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_cond;
     pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_return_output := pixel_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- MUX[uxn_device_h_l153_c27_9dad] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l153_c27_9dad_cond <= VAR_MUX_uxn_device_h_l153_c27_9dad_cond;
     MUX_uxn_device_h_l153_c27_9dad_iftrue <= VAR_MUX_uxn_device_h_l153_c27_9dad_iftrue;
     MUX_uxn_device_h_l153_c27_9dad_iffalse <= VAR_MUX_uxn_device_h_l153_c27_9dad_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l153_c27_9dad_return_output := MUX_uxn_device_h_l153_c27_9dad_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- sprite_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_cond;
     sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_return_output := sprite_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l161_c3_7e7a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_cond;
     result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iftrue;
     result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output := result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- color_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_color_MUX_uxn_device_h_l45_c7_1a20_cond;
     color_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_color_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     color_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_color_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l45_c7_1a20_return_output := color_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- x_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_x_MUX_uxn_device_h_l107_c7_6d1e_cond;
     x_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     x_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_x_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c7_6d1e_return_output := x_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- y_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_y_MUX_uxn_device_h_l142_c7_d5f0_cond;
     y_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     y_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_y_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l142_c7_d5f0_return_output := y_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- result_vram_value_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c3_98e1] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output := is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output := auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue := VAR_MUX_uxn_device_h_l153_c27_9dad_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_color_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_color_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l54_c3_98e1_return_output;
     VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_pixel_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l161_c3_7e7a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_sprite_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_x_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_y_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_y_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- sprite_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_cond;
     sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output := sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_cond;
     is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output := is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- color_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_color_MUX_uxn_device_h_l35_c2_2af4_cond;
     color_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_color_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     color_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_color_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l35_c2_2af4_return_output := color_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- y_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_y_MUX_uxn_device_h_l134_c7_df9f_cond;
     y_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_y_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     y_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_y_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c7_df9f_return_output := y_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- x_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_x_MUX_uxn_device_h_l99_c7_9eae_cond;
     x_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     x_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_9eae_return_output := x_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_4189] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output;

     -- auto_advance_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_cond;
     auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output := auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- pixel_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_cond;
     pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_return_output := pixel_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_4189_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_sprite_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_x_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_y_MUX_uxn_device_h_l134_c7_df9f_return_output;
     -- y_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_y_MUX_uxn_device_h_l124_c7_f0b7_cond;
     y_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     y_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_y_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l124_c7_f0b7_return_output := y_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- sprite_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_cond;
     sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_return_output := sprite_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- x_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_x_MUX_uxn_device_h_l89_c7_814f_cond;
     x_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_x_MUX_uxn_device_h_l89_c7_814f_iftrue;
     x_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_x_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l89_c7_814f_return_output := x_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- auto_advance_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_cond;
     auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output := auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_cond;
     is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output := is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- result_vram_value_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_sprite_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_x_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_y_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     -- auto_advance_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_cond;
     auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output := auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_cond;
     is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output := is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- x_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_x_MUX_uxn_device_h_l81_c7_6c28_cond;
     x_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     x_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_6c28_return_output := x_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output := result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- y_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_y_MUX_uxn_device_h_l116_c7_8a80_cond;
     y_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     y_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_8a80_return_output := y_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- sprite_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_cond;
     sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_return_output := sprite_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output := result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_vram_address_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_cond;
     result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output := result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_auto_advance_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l134_c7_df9f_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_x_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_8a80_return_output;
     -- result_vram_value_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output := auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- y_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_y_MUX_uxn_device_h_l107_c7_6d1e_cond;
     y_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     y_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_y_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l107_c7_6d1e_return_output := y_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output := result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- x_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_x_MUX_uxn_device_h_l72_c7_ab68_cond;
     x_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_x_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     x_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_x_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l72_c7_ab68_return_output := x_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_x_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_x_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_y_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- auto_advance_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_cond;
     auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output := auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- y_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_y_MUX_uxn_device_h_l99_c7_9eae_cond;
     y_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     y_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_9eae_return_output := y_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- x_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_x_MUX_uxn_device_h_l64_c7_aebf_cond;
     x_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_x_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     x_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_x_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l64_c7_aebf_return_output := x_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_cond;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output := result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_auto_advance_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_x_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_y_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_9eae_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- x_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_x_MUX_uxn_device_h_l53_c7_4b5b_cond;
     x_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     x_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_x_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l53_c7_4b5b_return_output := x_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output := auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- result_vram_value_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- y_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_y_MUX_uxn_device_h_l89_c7_814f_cond;
     y_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_y_MUX_uxn_device_h_l89_c7_814f_iftrue;
     y_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_y_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l89_c7_814f_return_output := y_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_8a80] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_8a80_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_x_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_x_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_y_MUX_uxn_device_h_l89_c7_814f_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l124_c7_f0b7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_cond;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output := result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- auto_advance_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_cond;
     auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iftrue;
     auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output := auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output := result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- y_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_y_MUX_uxn_device_h_l81_c7_6c28_cond;
     y_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     y_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_6c28_return_output := y_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- x_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_x_MUX_uxn_device_h_l45_c7_1a20_cond;
     x_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_x_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     x_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_x_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l45_c7_1a20_return_output := x_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_vram_address_MUX[uxn_device_h_l107_c7_6d1e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_cond;
     result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iftrue;
     result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output := result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l124_c7_f0b7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_auto_advance_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l107_c7_6d1e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_x_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_x_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_y_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_6c28_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l134_c7_df9f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_cond;
     result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output := result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- y_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_y_MUX_uxn_device_h_l72_c7_ab68_cond;
     y_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_y_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     y_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_y_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l72_c7_ab68_return_output := y_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- x_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_x_MUX_uxn_device_h_l35_c2_2af4_cond;
     x_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_x_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     x_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_x_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l35_c2_2af4_return_output := x_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_cond;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output := result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_9eae] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output := auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l134_c7_df9f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_9eae_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l89_c7_814f_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_y_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_y_MUX_uxn_device_h_l72_c7_ab68_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_cond;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output := result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- y_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_y_MUX_uxn_device_h_l64_c7_aebf_cond;
     y_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_y_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     y_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_y_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l64_c7_aebf_return_output := y_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l142_c7_d5f0] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output;

     -- auto_advance_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_cond;
     auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output := auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output := result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output := result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_vram_address_MUX[uxn_device_h_l89_c7_814f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_cond;
     result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iftrue;
     result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output := result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l142_c7_d5f0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_auto_advance_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l89_c7_814f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_y_MUX_uxn_device_h_l64_c7_aebf_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_43c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output;

     -- auto_advance_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_cond;
     auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output := auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output := result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- y_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_y_MUX_uxn_device_h_l53_c7_4b5b_cond;
     y_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     y_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_y_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l53_c7_4b5b_return_output := y_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output := result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_6c28] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output := result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_43c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_6c28_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_y_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_y_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     -- auto_advance_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_cond;
     auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output := auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_6f50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output;

     -- result_vram_value_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output := result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_vram_address_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output := result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output := result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l72_c7_ab68] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_cond;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output := result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- y_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_y_MUX_uxn_device_h_l45_c7_1a20_cond;
     y_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_y_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     y_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_y_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l45_c7_1a20_return_output := y_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_6f50_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_auto_advance_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l72_c7_ab68_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_y_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_y_MUX_uxn_device_h_l45_c7_1a20_return_output;
     -- y_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_y_MUX_uxn_device_h_l35_c2_2af4_cond;
     y_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_y_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     y_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_y_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l35_c2_2af4_return_output := y_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_8f69] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output;

     -- auto_advance_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_cond;
     auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output := auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_vram_address_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output := result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l64_c7_aebf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_cond;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output := result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_8f69_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l64_c7_aebf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l35_c2_2af4_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output := result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- auto_advance_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_cond;
     auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output := auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l161_c1_16da] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output := result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_vram_address_MUX[uxn_device_h_l53_c7_4b5b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_cond;
     result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iftrue;
     result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output := result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output := result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l161_c1_16da_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l35_c2_2af4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l53_c7_4b5b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l45_c7_1a20_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- result_vram_value_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output := result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l45_c7_1a20] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_cond;
     result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iftrue;
     result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output := result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output;

     -- printf_uxn_device_h_l162_c4_6dc0[uxn_device_h_l162_c4_6dc0] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0 <= VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg0;
     printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1 <= VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg1;
     printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2 <= VAR_printf_uxn_device_h_l162_c4_6dc0_uxn_device_h_l162_c4_6dc0_arg2;
     -- Outputs

     -- result_is_vram_write_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output := result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c7_1a20_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l45_c7_1a20_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output := result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- result_vram_address_MUX[uxn_device_h_l35_c2_2af4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_cond;
     result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iftrue;
     result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output := result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_535e_uxn_device_h_l26_l187_DUPLICATE_9bc3 LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_535e_uxn_device_h_l26_l187_DUPLICATE_9bc3_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_535e(
     result,
     VAR_result_is_vram_write_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l35_c2_2af4_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l35_c2_2af4_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_535e_uxn_device_h_l26_l187_DUPLICATE_9bc3_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_535e_uxn_device_h_l26_l187_DUPLICATE_9bc3_return_output;
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
