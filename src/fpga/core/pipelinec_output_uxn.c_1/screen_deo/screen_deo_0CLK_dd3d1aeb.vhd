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
-- printf_uxn_device_h_l42_c2_bc6d[uxn_device_h_l42_c2_bc6d]
signal printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l44_c6_c9ab]
signal BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_3ec1]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l44_c2_1f65]
signal color_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(1 downto 0);

-- x_MUX[uxn_device_h_l44_c2_1f65]
signal x_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l44_c2_1f65]
signal sprite_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l44_c2_1f65]
signal pixel_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l44_c2_1f65]
signal y_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l44_c2_1f65]
signal auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l44_c2_1f65]
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l44_c2_1f65]
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l44_c2_1f65]
signal result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l44_c2_1f65]
signal result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_1f65]
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l44_c2_1f65]
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_1f65]
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l44_c2_1f65]
signal is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c7_3fa8]
signal BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c3_63fb]
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_63fb]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c3_63fb]
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(7 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_63fb]
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c11_d9c4]
signal BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_1c53]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c7_3ec1]
signal color_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(1 downto 0);

-- x_MUX[uxn_device_h_l54_c7_3ec1]
signal x_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l54_c7_3ec1]
signal sprite_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l54_c7_3ec1]
signal pixel_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l54_c7_3ec1]
signal y_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l54_c7_3ec1]
signal auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c7_3ec1]
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l54_c7_3ec1]
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l54_c7_3ec1]
signal result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l54_c7_3ec1]
signal result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_3ec1]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c7_3ec1]
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c7_3ec1]
signal is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l55_c7_d6e1]
signal BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l55_c3_5446]
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_5446]
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l55_c3_5446]
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l62_c11_c42a]
signal BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_e9eb]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l62_c7_1c53]
signal color_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(1 downto 0);

-- x_MUX[uxn_device_h_l62_c7_1c53]
signal x_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l62_c7_1c53]
signal sprite_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);

-- pixel_MUX[uxn_device_h_l62_c7_1c53]
signal pixel_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l62_c7_1c53]
signal y_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l62_c7_1c53]
signal auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l62_c7_1c53]
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l62_c7_1c53]
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l62_c7_1c53]
signal result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l62_c7_1c53]
signal result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_1c53]
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l62_c7_1c53]
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l62_c7_1c53]
signal is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l63_c7_940e]
signal BIN_OP_EQ_uxn_device_h_l63_c7_940e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_940e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l63_c3_120e]
signal color_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(1 downto 0);

-- pixel_MUX[uxn_device_h_l63_c3_120e]
signal pixel_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l63_c3_120e]
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_120e]
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l63_c3_120e]
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l63_c3_120e]
signal is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c20_121d]
signal BIN_OP_AND_uxn_device_h_l66_c20_121d_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_121d_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l66_c20_1987]
signal BIN_OP_EQ_uxn_device_h_l66_c20_1987_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_1987_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l66_c20_a611]
signal MUX_uxn_device_h_l66_c20_a611_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_a611_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_a611_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_a611_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c11_6252]
signal BIN_OP_EQ_uxn_device_h_l73_c11_6252_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_6252_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_0d3e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l73_c7_e9eb]
signal x_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l73_c7_e9eb]
signal sprite_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l73_c7_e9eb]
signal y_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l73_c7_e9eb]
signal auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c7_e9eb]
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l73_c7_e9eb]
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l73_c7_e9eb]
signal result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l73_c7_e9eb]
signal result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_e9eb]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c7_e9eb]
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l74_c7_9454]
signal BIN_OP_EQ_uxn_device_h_l74_c7_9454_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_9454_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l74_c3_6df5]
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_6df5]
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l74_c3_6df5]
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_32ce]
signal BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_d156]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l81_c7_0d3e]
signal x_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l81_c7_0d3e]
signal sprite_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c7_0d3e]
signal y_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_0d3e]
signal auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_0d3e]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_0d3e]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_0d3e]
signal result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_0d3e]
signal result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_0d3e]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_0d3e]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_d0eb]
signal BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l82_c3_2edb]
signal sprite_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_2edb]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_2edb]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_2edb]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_6070]
signal BIN_OP_EQ_uxn_device_h_l90_c11_6070_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_6070_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_1c73]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c7_d156]
signal x_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l90_c7_d156]
signal y_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_d156]
signal auto_advance_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_d156]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_d156]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l90_c7_d156]
signal result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_d156]
signal result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_d156]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_d156]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_f82d]
signal BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_611e]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_611e]
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_611e]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c11_2ae5]
signal BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_b33b]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l98_c7_1c73]
signal x_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l98_c7_1c73]
signal y_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l98_c7_1c73]
signal auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l98_c7_1c73]
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l98_c7_1c73]
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l98_c7_1c73]
signal result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l98_c7_1c73]
signal result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_1c73]
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l98_c7_1c73]
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c7_41fe]
signal BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l99_c3_7586]
signal x_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c3_7586]
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_7586]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c3_7586]
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c11_70fa]
signal BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_93cc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c7_b33b]
signal x_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l108_c7_b33b]
signal y_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l108_c7_b33b]
signal auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c7_b33b]
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l108_c7_b33b]
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l108_c7_b33b]
signal result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l108_c7_b33b]
signal result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_b33b]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c7_b33b]
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c7_ddfc]
signal BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l109_c3_8651]
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_8651]
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l109_c3_8651]
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_394f]
signal BIN_OP_EQ_uxn_device_h_l116_c11_394f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_394f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_5720]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l116_c7_93cc]
signal x_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(15 downto 0);

-- y_MUX[uxn_device_h_l116_c7_93cc]
signal y_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_93cc]
signal auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_93cc]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_93cc]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_93cc]
signal result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_93cc]
signal result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_93cc]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_93cc]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_4a14]
signal BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l117_c3_b2d5]
signal x_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_b2d5]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_b2d5]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_b2d5]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l118_c4_bfce]
signal BIN_OP_OR_uxn_device_h_l118_c4_bfce_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_bfce_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_719d]
signal BIN_OP_EQ_uxn_device_h_l125_c11_719d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_719d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_2cea]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l125_c7_5720]
signal y_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_5720]
signal auto_advance_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c7_5720]
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l125_c7_5720]
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l125_c7_5720]
signal result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l125_c7_5720]
signal result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_5720]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c7_5720]
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l126_c7_d35a]
signal BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l126_c3_4f11]
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_4f11]
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_4f11]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_3b09]
signal BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_94f9]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l133_c7_2cea]
signal y_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l133_c7_2cea]
signal auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l133_c7_2cea]
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l133_c7_2cea]
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l133_c7_2cea]
signal result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l133_c7_2cea]
signal result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_2cea]
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c7_2cea]
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c7_f2bf]
signal BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l134_c3_6235]
signal y_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c3_6235]
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_6235]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c3_6235]
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c11_6195]
signal BIN_OP_EQ_uxn_device_h_l143_c11_6195_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_6195_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_6ca2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l143_c7_94f9]
signal y_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l143_c7_94f9]
signal auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c7_94f9]
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l143_c7_94f9]
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l143_c7_94f9]
signal result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l143_c7_94f9]
signal result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_94f9]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c7_94f9]
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c7_e87a]
signal BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c3_6eb4]
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_6eb4]
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c3_6eb4]
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_8fb5]
signal BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_daa3]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l151_c7_6ca2]
signal y_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_6ca2]
signal auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_6ca2]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_6ca2]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_6ca2]
signal result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_6ca2]
signal result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_6ca2]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_6ca2]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_0a51]
signal BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l152_c3_8fc0]
signal y_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(15 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_8fc0]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_8fc0]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_8fc0]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c4_2727]
signal BIN_OP_OR_uxn_device_h_l153_c4_2727_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_2727_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_1241]
signal BIN_OP_EQ_uxn_device_h_l160_c11_1241_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_1241_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_1961]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_daa3]
signal auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_daa3]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_daa3]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_daa3]
signal result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_daa3]
signal result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_daa3]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_daa3]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_58da]
signal BIN_OP_EQ_uxn_device_h_l161_c7_58da_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_58da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_b09b]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_b09b]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_b09b]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_f693]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right : unsigned(9 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output : unsigned(25 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l162_c27_c4c9]
signal BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left : unsigned(25 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output : unsigned(26 downto 0);

-- BIN_OP_GT[uxn_device_h_l162_c27_3ff0]
signal BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left : unsigned(26 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right : unsigned(19 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l162_c27_2a7c]
signal MUX_uxn_device_h_l162_c27_2a7c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_2a7c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_2a7c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_2a7c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l169_c11_9537]
signal BIN_OP_EQ_uxn_device_h_l169_c11_9537_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_9537_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_e347]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c7_1961]
signal auto_advance_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l169_c7_1961]
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l169_c7_1961]
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l169_c7_1961]
signal result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l169_c7_1961]
signal result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_1961]
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c7_1961]
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c7_1537]
signal BIN_OP_EQ_uxn_device_h_l170_c7_1537_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_1537_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_5253]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l170_c3_3d7f]
signal auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l170_c3_3d7f]
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l170_c3_3d7f]
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l170_c3_3d7f]
signal result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l170_c3_3d7f]
signal result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(31 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_3d7f]
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l170_c3_3d7f]
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(7 downto 0);

-- printf_uxn_device_h_l171_c4_4b94[uxn_device_h_l171_c4_4b94]
signal printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_8926]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l176_c27_0b38]
signal BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l182_c11_58f4]
signal BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l182_c7_9c69]
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l182_c7_9c69]
signal result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l182_c7_9c69]
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l182_c7_9c69]
signal result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(1 downto 0);

-- BIN_OP_EQ[uxn_device_h_l183_c7_f6f1]
signal BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l183_c3_a8b0]
signal result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(31 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l183_c3_a8b0]
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l183_c3_a8b0]
signal result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(1 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_b459( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.vram_value := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.is_device_ram_read := ref_toks_5;
      base.device_ram_address := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d
printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d : entity work.printf_uxn_device_h_l42_c2_bc6d_0CLK_de264c78 port map (
printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE,
printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0,
printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1);

-- BIN_OP_EQ_uxn_device_h_l44_c6_c9ab
BIN_OP_EQ_uxn_device_h_l44_c6_c9ab : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left,
BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right,
BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- color_MUX_uxn_device_h_l44_c2_1f65
color_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l44_c2_1f65_cond,
color_MUX_uxn_device_h_l44_c2_1f65_iftrue,
color_MUX_uxn_device_h_l44_c2_1f65_iffalse,
color_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- x_MUX_uxn_device_h_l44_c2_1f65
x_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l44_c2_1f65_cond,
x_MUX_uxn_device_h_l44_c2_1f65_iftrue,
x_MUX_uxn_device_h_l44_c2_1f65_iffalse,
x_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- sprite_MUX_uxn_device_h_l44_c2_1f65
sprite_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l44_c2_1f65_cond,
sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue,
sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse,
sprite_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- pixel_MUX_uxn_device_h_l44_c2_1f65
pixel_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l44_c2_1f65_cond,
pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue,
pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse,
pixel_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- y_MUX_uxn_device_h_l44_c2_1f65
y_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l44_c2_1f65_cond,
y_MUX_uxn_device_h_l44_c2_1f65_iftrue,
y_MUX_uxn_device_h_l44_c2_1f65_iffalse,
y_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- auto_advance_MUX_uxn_device_h_l44_c2_1f65
auto_advance_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond,
auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue,
auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse,
auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65
result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond,
result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65
result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond,
result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_vram_value_MUX_uxn_device_h_l44_c2_1f65
result_vram_value_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond,
result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_vram_address_MUX_uxn_device_h_l44_c2_1f65
result_vram_address_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond,
result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65
result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond,
result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- is_fill_mode_MUX_uxn_device_h_l44_c2_1f65
is_fill_mode_MUX_uxn_device_h_l44_c2_1f65 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond,
is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue,
is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse,
is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c7_3fa8
BIN_OP_EQ_uxn_device_h_l45_c7_3fa8 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left,
BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right,
BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb
result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb
result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c11_d9c4
BIN_OP_EQ_uxn_device_h_l54_c11_d9c4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left,
BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right,
BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- color_MUX_uxn_device_h_l54_c7_3ec1
color_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c7_3ec1_cond,
color_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
color_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
color_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- x_MUX_uxn_device_h_l54_c7_3ec1
x_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l54_c7_3ec1_cond,
x_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
x_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
x_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- sprite_MUX_uxn_device_h_l54_c7_3ec1
sprite_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l54_c7_3ec1_cond,
sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- pixel_MUX_uxn_device_h_l54_c7_3ec1
pixel_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c7_3ec1_cond,
pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- y_MUX_uxn_device_h_l54_c7_3ec1
y_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l54_c7_3ec1_cond,
y_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
y_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
y_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- auto_advance_MUX_uxn_device_h_l54_c7_3ec1
auto_advance_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond,
auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1
result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1
result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_vram_value_MUX_uxn_device_h_l54_c7_3ec1
result_vram_value_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_vram_address_MUX_uxn_device_h_l54_c7_3ec1
result_vram_address_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1
result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1
is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond,
is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output);

-- BIN_OP_EQ_uxn_device_h_l55_c7_d6e1
BIN_OP_EQ_uxn_device_h_l55_c7_d6e1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left,
BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right,
BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l55_c3_5446
result_is_deo_done_MUX_uxn_device_h_l55_c3_5446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond,
result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue,
result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse,
result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l55_c3_5446
result_device_ram_address_MUX_uxn_device_h_l55_c3_5446 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond,
result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue,
result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse,
result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output);

-- BIN_OP_EQ_uxn_device_h_l62_c11_c42a
BIN_OP_EQ_uxn_device_h_l62_c11_c42a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left,
BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right,
BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- color_MUX_uxn_device_h_l62_c7_1c53
color_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l62_c7_1c53_cond,
color_MUX_uxn_device_h_l62_c7_1c53_iftrue,
color_MUX_uxn_device_h_l62_c7_1c53_iffalse,
color_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- x_MUX_uxn_device_h_l62_c7_1c53
x_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l62_c7_1c53_cond,
x_MUX_uxn_device_h_l62_c7_1c53_iftrue,
x_MUX_uxn_device_h_l62_c7_1c53_iffalse,
x_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- sprite_MUX_uxn_device_h_l62_c7_1c53
sprite_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l62_c7_1c53_cond,
sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue,
sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse,
sprite_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- pixel_MUX_uxn_device_h_l62_c7_1c53
pixel_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l62_c7_1c53_cond,
pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue,
pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse,
pixel_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- y_MUX_uxn_device_h_l62_c7_1c53
y_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l62_c7_1c53_cond,
y_MUX_uxn_device_h_l62_c7_1c53_iftrue,
y_MUX_uxn_device_h_l62_c7_1c53_iffalse,
y_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- auto_advance_MUX_uxn_device_h_l62_c7_1c53
auto_advance_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond,
auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue,
auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse,
auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53
result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond,
result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53
result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond,
result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_vram_value_MUX_uxn_device_h_l62_c7_1c53
result_vram_value_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond,
result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_vram_address_MUX_uxn_device_h_l62_c7_1c53
result_vram_address_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond,
result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53
result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond,
result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue,
result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse,
result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- is_fill_mode_MUX_uxn_device_h_l62_c7_1c53
is_fill_mode_MUX_uxn_device_h_l62_c7_1c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond,
is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue,
is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse,
is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output);

-- BIN_OP_EQ_uxn_device_h_l63_c7_940e
BIN_OP_EQ_uxn_device_h_l63_c7_940e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l63_c7_940e_left,
BIN_OP_EQ_uxn_device_h_l63_c7_940e_right,
BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output);

-- color_MUX_uxn_device_h_l63_c3_120e
color_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l63_c3_120e_cond,
color_MUX_uxn_device_h_l63_c3_120e_iftrue,
color_MUX_uxn_device_h_l63_c3_120e_iffalse,
color_MUX_uxn_device_h_l63_c3_120e_return_output);

-- pixel_MUX_uxn_device_h_l63_c3_120e
pixel_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l63_c3_120e_cond,
pixel_MUX_uxn_device_h_l63_c3_120e_iftrue,
pixel_MUX_uxn_device_h_l63_c3_120e_iffalse,
pixel_MUX_uxn_device_h_l63_c3_120e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l63_c3_120e
result_is_deo_done_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond,
result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l63_c3_120e
result_device_ram_address_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond,
result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output);

-- is_fill_mode_MUX_uxn_device_h_l63_c3_120e
is_fill_mode_MUX_uxn_device_h_l63_c3_120e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond,
is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue,
is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse,
is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c20_121d
BIN_OP_AND_uxn_device_h_l66_c20_121d : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c20_121d_left,
BIN_OP_AND_uxn_device_h_l66_c20_121d_right,
BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output);

-- BIN_OP_EQ_uxn_device_h_l66_c20_1987
BIN_OP_EQ_uxn_device_h_l66_c20_1987 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l66_c20_1987_left,
BIN_OP_EQ_uxn_device_h_l66_c20_1987_right,
BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output);

-- MUX_uxn_device_h_l66_c20_a611
MUX_uxn_device_h_l66_c20_a611 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l66_c20_a611_cond,
MUX_uxn_device_h_l66_c20_a611_iftrue,
MUX_uxn_device_h_l66_c20_a611_iffalse,
MUX_uxn_device_h_l66_c20_a611_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c11_6252
BIN_OP_EQ_uxn_device_h_l73_c11_6252 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c11_6252_left,
BIN_OP_EQ_uxn_device_h_l73_c11_6252_right,
BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- x_MUX_uxn_device_h_l73_c7_e9eb
x_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l73_c7_e9eb_cond,
x_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
x_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
x_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- sprite_MUX_uxn_device_h_l73_c7_e9eb
sprite_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c7_e9eb_cond,
sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- y_MUX_uxn_device_h_l73_c7_e9eb
y_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l73_c7_e9eb_cond,
y_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
y_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
y_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- auto_advance_MUX_uxn_device_h_l73_c7_e9eb
auto_advance_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond,
auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb
result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb
result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_vram_value_MUX_uxn_device_h_l73_c7_e9eb
result_vram_value_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_vram_address_MUX_uxn_device_h_l73_c7_e9eb
result_vram_address_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb
result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output);

-- BIN_OP_EQ_uxn_device_h_l74_c7_9454
BIN_OP_EQ_uxn_device_h_l74_c7_9454 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l74_c7_9454_left,
BIN_OP_EQ_uxn_device_h_l74_c7_9454_right,
BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5
result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond,
result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5
result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond,
result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_32ce
BIN_OP_EQ_uxn_device_h_l81_c11_32ce : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left,
BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right,
BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output);

-- x_MUX_uxn_device_h_l81_c7_0d3e
x_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_0d3e_cond,
x_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
x_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
x_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- sprite_MUX_uxn_device_h_l81_c7_0d3e
sprite_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l81_c7_0d3e_cond,
sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- y_MUX_uxn_device_h_l81_c7_0d3e
y_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_0d3e_cond,
y_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
y_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
y_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_0d3e
auto_advance_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond,
auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e
result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e
result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_0d3e
result_vram_value_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_0d3e
result_vram_address_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e
result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_d0eb
BIN_OP_EQ_uxn_device_h_l82_c7_d0eb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left,
BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right,
BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output);

-- sprite_MUX_uxn_device_h_l82_c3_2edb
sprite_MUX_uxn_device_h_l82_c3_2edb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l82_c3_2edb_cond,
sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue,
sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse,
sprite_MUX_uxn_device_h_l82_c3_2edb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb
result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb
result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_6070
BIN_OP_EQ_uxn_device_h_l90_c11_6070 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_6070_left,
BIN_OP_EQ_uxn_device_h_l90_c11_6070_right,
BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- x_MUX_uxn_device_h_l90_c7_d156
x_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_d156_cond,
x_MUX_uxn_device_h_l90_c7_d156_iftrue,
x_MUX_uxn_device_h_l90_c7_d156_iffalse,
x_MUX_uxn_device_h_l90_c7_d156_return_output);

-- y_MUX_uxn_device_h_l90_c7_d156
y_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_d156_cond,
y_MUX_uxn_device_h_l90_c7_d156_iftrue,
y_MUX_uxn_device_h_l90_c7_d156_iffalse,
y_MUX_uxn_device_h_l90_c7_d156_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_d156
auto_advance_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_d156_cond,
auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_d156
result_is_deo_done_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_d156
result_is_vram_write_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_vram_value_MUX_uxn_device_h_l90_c7_d156
result_vram_value_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond,
result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_d156
result_vram_address_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_d156
result_device_ram_address_MUX_uxn_device_h_l90_c7_d156 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_f82d
BIN_OP_EQ_uxn_device_h_l91_c7_f82d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left,
BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right,
BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_611e
result_is_deo_done_MUX_uxn_device_h_l91_c3_611e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_611e
result_device_ram_address_MUX_uxn_device_h_l91_c3_611e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c11_2ae5
BIN_OP_EQ_uxn_device_h_l98_c11_2ae5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left,
BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right,
BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- x_MUX_uxn_device_h_l98_c7_1c73
x_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l98_c7_1c73_cond,
x_MUX_uxn_device_h_l98_c7_1c73_iftrue,
x_MUX_uxn_device_h_l98_c7_1c73_iffalse,
x_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- y_MUX_uxn_device_h_l98_c7_1c73
y_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l98_c7_1c73_cond,
y_MUX_uxn_device_h_l98_c7_1c73_iftrue,
y_MUX_uxn_device_h_l98_c7_1c73_iffalse,
y_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- auto_advance_MUX_uxn_device_h_l98_c7_1c73
auto_advance_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond,
auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue,
auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse,
auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73
result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond,
result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73
result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond,
result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_vram_value_MUX_uxn_device_h_l98_c7_1c73
result_vram_value_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond,
result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_vram_address_MUX_uxn_device_h_l98_c7_1c73
result_vram_address_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond,
result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73
result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond,
result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue,
result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse,
result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c7_41fe
BIN_OP_EQ_uxn_device_h_l99_c7_41fe : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left,
BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right,
BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output);

-- x_MUX_uxn_device_h_l99_c3_7586
x_MUX_uxn_device_h_l99_c3_7586 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c3_7586_cond,
x_MUX_uxn_device_h_l99_c3_7586_iftrue,
x_MUX_uxn_device_h_l99_c3_7586_iffalse,
x_MUX_uxn_device_h_l99_c3_7586_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c3_7586
result_is_deo_done_MUX_uxn_device_h_l99_c3_7586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c3_7586
result_device_ram_address_MUX_uxn_device_h_l99_c3_7586 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c11_70fa
BIN_OP_EQ_uxn_device_h_l108_c11_70fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left,
BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right,
BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- x_MUX_uxn_device_h_l108_c7_b33b
x_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c7_b33b_cond,
x_MUX_uxn_device_h_l108_c7_b33b_iftrue,
x_MUX_uxn_device_h_l108_c7_b33b_iffalse,
x_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- y_MUX_uxn_device_h_l108_c7_b33b
y_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l108_c7_b33b_cond,
y_MUX_uxn_device_h_l108_c7_b33b_iftrue,
y_MUX_uxn_device_h_l108_c7_b33b_iffalse,
y_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- auto_advance_MUX_uxn_device_h_l108_c7_b33b
auto_advance_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond,
auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue,
auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse,
auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b
result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b
result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_vram_value_MUX_uxn_device_h_l108_c7_b33b
result_vram_value_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond,
result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_vram_address_MUX_uxn_device_h_l108_c7_b33b
result_vram_address_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond,
result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b
result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c7_ddfc
BIN_OP_EQ_uxn_device_h_l109_c7_ddfc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left,
BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right,
BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l109_c3_8651
result_is_deo_done_MUX_uxn_device_h_l109_c3_8651 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond,
result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue,
result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse,
result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l109_c3_8651
result_device_ram_address_MUX_uxn_device_h_l109_c3_8651 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond,
result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue,
result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse,
result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_394f
BIN_OP_EQ_uxn_device_h_l116_c11_394f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_394f_left,
BIN_OP_EQ_uxn_device_h_l116_c11_394f_right,
BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output);

-- x_MUX_uxn_device_h_l116_c7_93cc
x_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l116_c7_93cc_cond,
x_MUX_uxn_device_h_l116_c7_93cc_iftrue,
x_MUX_uxn_device_h_l116_c7_93cc_iffalse,
x_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- y_MUX_uxn_device_h_l116_c7_93cc
y_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_93cc_cond,
y_MUX_uxn_device_h_l116_c7_93cc_iftrue,
y_MUX_uxn_device_h_l116_c7_93cc_iffalse,
y_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_93cc
auto_advance_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond,
auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc
result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc
result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_93cc
result_vram_value_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_93cc
result_vram_address_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc
result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_4a14
BIN_OP_EQ_uxn_device_h_l117_c7_4a14 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left,
BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right,
BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output);

-- x_MUX_uxn_device_h_l117_c3_b2d5
x_MUX_uxn_device_h_l117_c3_b2d5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c3_b2d5_cond,
x_MUX_uxn_device_h_l117_c3_b2d5_iftrue,
x_MUX_uxn_device_h_l117_c3_b2d5_iffalse,
x_MUX_uxn_device_h_l117_c3_b2d5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5
result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5
result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output);

-- BIN_OP_OR_uxn_device_h_l118_c4_bfce
BIN_OP_OR_uxn_device_h_l118_c4_bfce : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l118_c4_bfce_left,
BIN_OP_OR_uxn_device_h_l118_c4_bfce_right,
BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_719d
BIN_OP_EQ_uxn_device_h_l125_c11_719d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_719d_left,
BIN_OP_EQ_uxn_device_h_l125_c11_719d_right,
BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- y_MUX_uxn_device_h_l125_c7_5720
y_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_5720_cond,
y_MUX_uxn_device_h_l125_c7_5720_iftrue,
y_MUX_uxn_device_h_l125_c7_5720_iffalse,
y_MUX_uxn_device_h_l125_c7_5720_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_5720
auto_advance_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_5720_cond,
auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c7_5720
result_is_deo_done_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l125_c7_5720
result_is_vram_write_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond,
result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_vram_value_MUX_uxn_device_h_l125_c7_5720
result_vram_value_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond,
result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_vram_address_MUX_uxn_device_h_l125_c7_5720
result_vram_address_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond,
result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c7_5720
result_device_ram_address_MUX_uxn_device_h_l125_c7_5720 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output);

-- BIN_OP_EQ_uxn_device_h_l126_c7_d35a
BIN_OP_EQ_uxn_device_h_l126_c7_d35a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left,
BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right,
BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11
result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond,
result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue,
result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse,
result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11
result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output);

-- BIN_OP_EQ_uxn_device_h_l133_c11_3b09
BIN_OP_EQ_uxn_device_h_l133_c11_3b09 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left,
BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right,
BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- y_MUX_uxn_device_h_l133_c7_2cea
y_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l133_c7_2cea_cond,
y_MUX_uxn_device_h_l133_c7_2cea_iftrue,
y_MUX_uxn_device_h_l133_c7_2cea_iffalse,
y_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- auto_advance_MUX_uxn_device_h_l133_c7_2cea
auto_advance_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond,
auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue,
auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse,
auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea
result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond,
result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea
result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond,
result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_vram_value_MUX_uxn_device_h_l133_c7_2cea
result_vram_value_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond,
result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_vram_address_MUX_uxn_device_h_l133_c7_2cea
result_vram_address_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond,
result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea
result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c7_f2bf
BIN_OP_EQ_uxn_device_h_l134_c7_f2bf : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left,
BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right,
BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output);

-- y_MUX_uxn_device_h_l134_c3_6235
y_MUX_uxn_device_h_l134_c3_6235 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c3_6235_cond,
y_MUX_uxn_device_h_l134_c3_6235_iftrue,
y_MUX_uxn_device_h_l134_c3_6235_iffalse,
y_MUX_uxn_device_h_l134_c3_6235_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c3_6235
result_is_deo_done_MUX_uxn_device_h_l134_c3_6235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c3_6235
result_device_ram_address_MUX_uxn_device_h_l134_c3_6235 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c11_6195
BIN_OP_EQ_uxn_device_h_l143_c11_6195 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c11_6195_left,
BIN_OP_EQ_uxn_device_h_l143_c11_6195_right,
BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- y_MUX_uxn_device_h_l143_c7_94f9
y_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c7_94f9_cond,
y_MUX_uxn_device_h_l143_c7_94f9_iftrue,
y_MUX_uxn_device_h_l143_c7_94f9_iffalse,
y_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- auto_advance_MUX_uxn_device_h_l143_c7_94f9
auto_advance_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond,
auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue,
auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse,
auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9
result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9
result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond,
result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_vram_value_MUX_uxn_device_h_l143_c7_94f9
result_vram_value_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond,
result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_vram_address_MUX_uxn_device_h_l143_c7_94f9
result_vram_address_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond,
result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9
result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c7_e87a
BIN_OP_EQ_uxn_device_h_l144_c7_e87a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left,
BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right,
BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4
result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4
result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_8fb5
BIN_OP_EQ_uxn_device_h_l151_c11_8fb5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left,
BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right,
BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- y_MUX_uxn_device_h_l151_c7_6ca2
y_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l151_c7_6ca2_cond,
y_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
y_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
y_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_6ca2
auto_advance_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond,
auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2
result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2
result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_6ca2
result_vram_value_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_6ca2
result_vram_address_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2
result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_0a51
BIN_OP_EQ_uxn_device_h_l152_c7_0a51 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left,
BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right,
BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output);

-- y_MUX_uxn_device_h_l152_c3_8fc0
y_MUX_uxn_device_h_l152_c3_8fc0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l152_c3_8fc0_cond,
y_MUX_uxn_device_h_l152_c3_8fc0_iftrue,
y_MUX_uxn_device_h_l152_c3_8fc0_iffalse,
y_MUX_uxn_device_h_l152_c3_8fc0_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0
result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0
result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c4_2727
BIN_OP_OR_uxn_device_h_l153_c4_2727 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c4_2727_left,
BIN_OP_OR_uxn_device_h_l153_c4_2727_right,
BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_1241
BIN_OP_EQ_uxn_device_h_l160_c11_1241 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_1241_left,
BIN_OP_EQ_uxn_device_h_l160_c11_1241_right,
BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_daa3
auto_advance_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond,
auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3
result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3
result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_daa3
result_vram_value_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_daa3
result_vram_address_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3
result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_58da
BIN_OP_EQ_uxn_device_h_l161_c7_58da : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_58da_left,
BIN_OP_EQ_uxn_device_h_l161_c7_58da_right,
BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b
result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b
result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint10_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output);

-- BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9
BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9 : entity work.BIN_OP_PLUS_uint26_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left,
BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right,
BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output);

-- BIN_OP_GT_uxn_device_h_l162_c27_3ff0
BIN_OP_GT_uxn_device_h_l162_c27_3ff0 : entity work.BIN_OP_GT_uint27_t_uint20_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left,
BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right,
BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output);

-- MUX_uxn_device_h_l162_c27_2a7c
MUX_uxn_device_h_l162_c27_2a7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l162_c27_2a7c_cond,
MUX_uxn_device_h_l162_c27_2a7c_iftrue,
MUX_uxn_device_h_l162_c27_2a7c_iffalse,
MUX_uxn_device_h_l162_c27_2a7c_return_output);

-- BIN_OP_EQ_uxn_device_h_l169_c11_9537
BIN_OP_EQ_uxn_device_h_l169_c11_9537 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l169_c11_9537_left,
BIN_OP_EQ_uxn_device_h_l169_c11_9537_right,
BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c7_1961
auto_advance_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c7_1961_cond,
auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue,
auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse,
auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l169_c7_1961
result_is_deo_done_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l169_c7_1961
result_is_vram_write_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_vram_value_MUX_uxn_device_h_l169_c7_1961
result_vram_value_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond,
result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_vram_address_MUX_uxn_device_h_l169_c7_1961
result_vram_address_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond,
result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c7_1961
result_device_ram_address_MUX_uxn_device_h_l169_c7_1961 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c7_1537
BIN_OP_EQ_uxn_device_h_l170_c7_1537 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c7_1537_left,
BIN_OP_EQ_uxn_device_h_l170_c7_1537_right,
BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output);

-- auto_advance_MUX_uxn_device_h_l170_c3_3d7f
auto_advance_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond,
auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f
result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f
result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_vram_value_MUX_uxn_device_h_l170_c3_3d7f
result_vram_value_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_vram_address_MUX_uxn_device_h_l170_c3_3d7f
result_vram_address_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f
result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond,
result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output);

-- printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94
printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94 : entity work.printf_uxn_device_h_l171_c4_4b94_0CLK_de264c78 port map (
printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE,
printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0,
printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1,
printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output);

-- BIN_OP_PLUS_uxn_device_h_l176_c27_0b38
BIN_OP_PLUS_uxn_device_h_l176_c27_0b38 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left,
BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right,
BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output);

-- BIN_OP_EQ_uxn_device_h_l182_c11_58f4
BIN_OP_EQ_uxn_device_h_l182_c11_58f4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left,
BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right,
BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69
result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond,
result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue,
result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse,
result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output);

-- result_vram_address_MUX_uxn_device_h_l182_c7_9c69
result_vram_address_MUX_uxn_device_h_l182_c7_9c69 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond,
result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue,
result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse,
result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69
result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond,
result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue,
result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse,
result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output);

-- result_vram_value_MUX_uxn_device_h_l182_c7_9c69
result_vram_value_MUX_uxn_device_h_l182_c7_9c69 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond,
result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue,
result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse,
result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output);

-- BIN_OP_EQ_uxn_device_h_l183_c7_f6f1
BIN_OP_EQ_uxn_device_h_l183_c7_f6f1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left,
BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right,
BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output);

-- result_vram_address_MUX_uxn_device_h_l183_c3_a8b0
result_vram_address_MUX_uxn_device_h_l183_c3_a8b0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond,
result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue,
result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse,
result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0
result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond,
result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output);

-- result_vram_value_MUX_uxn_device_h_l183_c3_a8b0
result_vram_value_MUX_uxn_device_h_l183_c3_a8b0 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond,
result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue,
result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse,
result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x,
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output);



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
 BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 color_MUX_uxn_device_h_l44_c2_1f65_return_output,
 x_MUX_uxn_device_h_l44_c2_1f65_return_output,
 sprite_MUX_uxn_device_h_l44_c2_1f65_return_output,
 pixel_MUX_uxn_device_h_l44_c2_1f65_return_output,
 y_MUX_uxn_device_h_l44_c2_1f65_return_output,
 auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output,
 is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output,
 color_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 x_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 y_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output,
 BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output,
 result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output,
 BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 color_MUX_uxn_device_h_l62_c7_1c53_return_output,
 x_MUX_uxn_device_h_l62_c7_1c53_return_output,
 sprite_MUX_uxn_device_h_l62_c7_1c53_return_output,
 pixel_MUX_uxn_device_h_l62_c7_1c53_return_output,
 y_MUX_uxn_device_h_l62_c7_1c53_return_output,
 auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output,
 result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output,
 is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output,
 BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output,
 color_MUX_uxn_device_h_l63_c3_120e_return_output,
 pixel_MUX_uxn_device_h_l63_c3_120e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output,
 is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output,
 BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output,
 BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output,
 MUX_uxn_device_h_l66_c20_a611_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 x_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 y_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output,
 BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output,
 result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output,
 x_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 y_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output,
 sprite_MUX_uxn_device_h_l82_c3_2edb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output,
 x_MUX_uxn_device_h_l90_c7_d156_return_output,
 y_MUX_uxn_device_h_l90_c7_d156_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output,
 x_MUX_uxn_device_h_l98_c7_1c73_return_output,
 y_MUX_uxn_device_h_l98_c7_1c73_return_output,
 auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output,
 result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output,
 x_MUX_uxn_device_h_l99_c3_7586_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output,
 x_MUX_uxn_device_h_l108_c7_b33b_return_output,
 y_MUX_uxn_device_h_l108_c7_b33b_return_output,
 auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output,
 result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output,
 x_MUX_uxn_device_h_l116_c7_93cc_return_output,
 y_MUX_uxn_device_h_l116_c7_93cc_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output,
 x_MUX_uxn_device_h_l117_c3_b2d5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output,
 BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output,
 y_MUX_uxn_device_h_l125_c7_5720_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output,
 BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output,
 y_MUX_uxn_device_h_l133_c7_2cea_return_output,
 auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output,
 y_MUX_uxn_device_h_l134_c3_6235_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 y_MUX_uxn_device_h_l143_c7_94f9_return_output,
 auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output,
 y_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output,
 y_MUX_uxn_device_h_l152_c3_8fc0_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output,
 BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output,
 BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output,
 BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output,
 MUX_uxn_device_h_l162_c27_2a7c_return_output,
 BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output,
 auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output,
 auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output,
 BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output,
 BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output,
 result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output,
 result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output,
 result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output,
 BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output,
 result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output,
 result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output,
 result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_3180 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l57_c4_0c96 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l68_c4_67f1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_9d06_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_a611_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_a611_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_a611_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_a611_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_afe3 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_7c98 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l93_c4_316d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l103_c4_5561 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_0f52 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_bfa0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l128_c4_3da7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l138_c4_0cd9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_f375 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_f419 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l164_c4_2ea1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_2a7c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_2a7c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_2a7c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right : unsigned(9 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left : unsigned(26 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right : unsigned(19 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_2a7c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l176_c4_1eb8 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l174_c4_6879 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_5910_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_fec8_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7207_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l186_c4_18f1 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l187_c4_7eae : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l45_DUPLICATE_a1dd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b459_uxn_device_h_l196_l35_DUPLICATE_7d1e_return_output : device_out_result_t;
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
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l138_c4_0cd9 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue := VAR_result_device_ram_address_uxn_device_h_l138_c4_0cd9;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_7c98 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_7c98;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l68_c4_67f1 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue := VAR_result_device_ram_address_uxn_device_h_l68_c4_67f1;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right := to_unsigned(4, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_right := to_unsigned(13, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue := to_unsigned(1, 1);
     VAR_result_vram_address_uxn_device_h_l186_c4_18f1 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue := VAR_result_vram_address_uxn_device_h_l186_c4_18f1;
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right := to_unsigned(6, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right := to_unsigned(14, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_right := to_unsigned(128, 8);
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l128_c4_3da7 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue := VAR_result_device_ram_address_uxn_device_h_l128_c4_3da7;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_right := to_unsigned(9, 4);
     VAR_result_device_ram_address_uxn_device_h_l164_c4_2ea1 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue := VAR_result_device_ram_address_uxn_device_h_l164_c4_2ea1;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l174_c4_6879 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue := VAR_result_device_ram_address_uxn_device_h_l174_c4_6879;
     VAR_MUX_uxn_device_h_l66_c20_a611_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right := to_unsigned(575999, 20);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l57_c4_0c96 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue := VAR_result_device_ram_address_uxn_device_h_l57_c4_0c96;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_f419 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_f419;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l162_c27_2a7c_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_f375 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_f375;
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right := to_unsigned(2, 2);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_bfa0 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_bfa0;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_0f52 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_0f52;
     VAR_result_device_ram_address_uxn_device_h_l48_c4_3180 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_3180;
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l162_c27_2a7c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right := to_unsigned(12, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l66_c20_a611_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right := to_unsigned(800, 10);
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right := to_unsigned(7, 3);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l103_c4_5561 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue := VAR_result_device_ram_address_uxn_device_h_l103_c4_5561;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l93_c4_316d := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue := VAR_result_device_ram_address_uxn_device_h_l93_c4_316d;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_right := to_unsigned(3, 2);
     VAR_result_vram_value_uxn_device_h_l187_c4_7eae := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue := VAR_result_vram_value_uxn_device_h_l187_c4_7eae;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right := to_unsigned(800, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_afe3 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_afe3;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l44_c2_1f65_iftrue := color;
     VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iftrue := color;
     VAR_color_MUX_uxn_device_h_l62_c7_1c53_iffalse := color;
     VAR_color_MUX_uxn_device_h_l63_c3_120e_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left := VAR_device_port;
     VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left := VAR_phase;
     VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right := x;
     VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l108_c7_b33b_iftrue := x;
     VAR_x_MUX_uxn_device_h_l116_c7_93cc_iffalse := x;
     VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iffalse := x;
     VAR_x_MUX_uxn_device_h_l44_c2_1f65_iftrue := x;
     VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iftrue := x;
     VAR_x_MUX_uxn_device_h_l62_c7_1c53_iftrue := x;
     VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c7_d156_iftrue := x;
     VAR_x_MUX_uxn_device_h_l99_c3_7586_iffalse := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_left := y;
     VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l108_c7_b33b_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_93cc_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_5720_iftrue := y;
     VAR_y_MUX_uxn_device_h_l134_c3_6235_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c7_94f9_iftrue := y;
     VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iffalse := y;
     VAR_y_MUX_uxn_device_h_l44_c2_1f65_iftrue := y;
     VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iftrue := y;
     VAR_y_MUX_uxn_device_h_l62_c7_1c53_iftrue := y;
     VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_d156_iftrue := y;
     VAR_y_MUX_uxn_device_h_l98_c7_1c73_iftrue := y;
     -- CAST_TO_uint32_t[uxn_device_h_l176_c63_7207] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7207_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l45_DUPLICATE_a1dd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l45_DUPLICATE_a1dd_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l74_c7_9454] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l74_c7_9454_left <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_left;
     BIN_OP_EQ_uxn_device_h_l74_c7_9454_right <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output := BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output;

     -- printf_uxn_device_h_l42_c2_bc6d[uxn_device_h_l42_c2_bc6d] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0 <= VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg0;
     printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1 <= VAR_printf_uxn_device_h_l42_c2_bc6d_uxn_device_h_l42_c2_bc6d_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l90_c11_6070] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_6070_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_6070_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_f82d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l65_c12_9d06] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_9d06_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l169_c11_9537] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l169_c11_9537_left <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_left;
     BIN_OP_EQ_uxn_device_h_l169_c11_9537_right <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output := BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_3b09] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_719d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_719d_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_719d_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output := result.vram_value;

     -- BIN_OP_AND[uxn_device_h_l66_c20_121d] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c20_121d_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_left;
     BIN_OP_AND_uxn_device_h_l66_c20_121d_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output := BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_8fb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c7_3fa8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_left;
     BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output := BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output;

     -- BIN_OP_EQ[uxn_device_h_l63_c7_940e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l63_c7_940e_left <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_left;
     BIN_OP_EQ_uxn_device_h_l63_c7_940e_right <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output := BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c11_6195] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c11_6195_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_left;
     BIN_OP_EQ_uxn_device_h_l143_c11_6195_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output := BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_58da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_58da_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_58da_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c11_d9c4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_left;
     BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output := BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l62_c11_c42a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_left;
     BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output := BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l183_c7_f6f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_left;
     BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output := BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l170_c7_1537] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c7_1537_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_left;
     BIN_OP_EQ_uxn_device_h_l170_c7_1537_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output := BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l176_c27_fec8] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_fec8_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_f693] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_0a51] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_4a14] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c7_41fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_left;
     BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output := BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l108_c11_70fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_left;
     BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output := BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;

     -- BIN_OP_EQ[uxn_device_h_l55_c7_d6e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_left;
     BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output := BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output := result.is_device_ram_read;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_EQ[uxn_device_h_l109_c7_ddfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_left;
     BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output := BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_d0eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l44_c6_c9ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_left;
     BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output := BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c7_f2bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_left;
     BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output := BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_394f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_394f_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_394f_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_1241] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_1241_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_1241_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;

     -- BIN_OP_EQ[uxn_device_h_l182_c11_58f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_left;
     BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output := BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l98_c11_2ae5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_left;
     BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output := BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l171_c91_5910] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_5910_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l144_c7_e87a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_left;
     BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output := BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output;

     -- BIN_OP_EQ[uxn_device_h_l126_c7_d35a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_left;
     BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output := BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l73_c11_6252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c11_6252_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_left;
     BIN_OP_EQ_uxn_device_h_l73_c11_6252_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output := BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_32ce] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_left := VAR_BIN_OP_AND_uxn_device_h_l66_c20_121d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_70fa_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_ddfc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_93cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_394f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_b2d5_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_4a14_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_5720_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_719d_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_d35a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_2cea_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_3b09_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_6235_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_f2bf_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_94f9_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_6195_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_e87a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_6ca2_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_8fb5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_8fc0_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_0a51_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_1241_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_58da_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_9537_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_1537_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_58f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_f6f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_1f65_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_c9ab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_3fa8_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_3ec1_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_d9c4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_d6e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_1c53_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_c42a_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_pixel_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_940e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_e9eb_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_6252_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_9454_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_0d3e_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_32ce_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output;
     VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_d0eb_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_d156_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_6070_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_f82d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_1c73_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_2ae5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_7586_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_41fe_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_f693_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l100_l118_l153_l135_DUPLICATE_b959_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_120e_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_9d06_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_fec8_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7207_return_output;
     VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_5910_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l91_l126_l170_l74_l82_l144_DUPLICATE_282f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_95e3_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l45_DUPLICATE_a1dd_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l44_l45_DUPLICATE_a1dd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_8382_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_4d32_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l44_l116_l98_l182_l90_l170_l81_l160_l73_l143_l151_l62_l133_l54_l125_l183_l108_DUPLICATE_29bf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l134_l55_l117_l152_l63_l99_l109_l169_l91_l126_l82_l170_l74_l161_l45_l144_DUPLICATE_677b_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_7586] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output;

     -- result_vram_value_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- sprite_MUX[uxn_device_h_l82_c3_2edb] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l82_c3_2edb_cond <= VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_cond;
     sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue <= VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iftrue;
     sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse <= VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_return_output := sprite_MUX_uxn_device_h_l82_c3_2edb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- BIN_OP_OR[uxn_device_h_l118_c4_bfce] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l118_c4_bfce_left <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_left;
     BIN_OP_OR_uxn_device_h_l118_c4_bfce_right <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output := BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_8651] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output := result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_8fc0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_cond;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output := result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_b2d5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output;

     -- result_vram_value_MUX[uxn_device_h_l183_c3_a8b0] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_cond;
     result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iftrue;
     result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output := result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_2edb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l55_c3_5446] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_cond;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output := result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c3_6eb4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l74_c3_6df5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_cond;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output := result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c3_6235] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l162_c27_c4c9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_left;
     BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output := BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c4_2727] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c4_2727_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_left;
     BIN_OP_OR_uxn_device_h_l153_c4_2727_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output := BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c3_6235] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_b09b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output;

     -- pixel_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_pixel_MUX_uxn_device_h_l63_c3_120e_cond;
     pixel_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iftrue;
     pixel_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_pixel_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l63_c3_120e_return_output := pixel_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l74_c3_6df5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_cond;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output := result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_4f11] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output := result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l109_c3_8651] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_cond;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output := result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_6235] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_611e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output;

     -- auto_advance_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_cond;
     auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output := auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_4f11] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_63fb] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output := result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_cond;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output := result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_b2d5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output := CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_b2d5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_2edb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output;

     -- result_vram_address_MUX[uxn_device_h_l183_c3_a8b0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_cond;
     result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iftrue;
     result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output := result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_611e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_63fb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output;

     -- color_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_color_MUX_uxn_device_h_l63_c3_120e_cond;
     color_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_color_MUX_uxn_device_h_l63_c3_120e_iftrue;
     color_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_color_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l63_c3_120e_return_output := color_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_8fc0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_6df5] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output := result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c3_7586] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c3_7586] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_611e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_8926] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l183_c3_a8b0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_cond;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output := result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l182_c7_9c69] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_cond;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output := result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l126_c3_4f11] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_cond;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output := result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_6eb4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_5446] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output := result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c3_63fb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_2edb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_8fc0] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c3_63fb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c3_6eb4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l55_c3_5446] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_cond;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output := result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l109_c3_8651] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_cond;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output := result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output;

     -- BIN_OP_EQ[uxn_device_h_l66_c20_1987] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l66_c20_1987_left <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_left;
     BIN_OP_EQ_uxn_device_h_l66_c20_1987_right <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output := BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_b09b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l66_c20_a611_cond := VAR_BIN_OP_EQ_uxn_device_h_l66_c20_1987_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_8926_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l118_c4_bfce_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iftrue := VAR_BIN_OP_OR_uxn_device_h_l153_c4_2727_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left := VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_c4c9_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_7586_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_6235_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_5310_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_auto_advance_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_color_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_pixel_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_8651_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_b2d5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_4f11_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_6235_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_6eb4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_8fc0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_b09b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_63fb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_5446_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_6df5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_2edb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_611e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_7586_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_8651_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_b2d5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_4f11_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_6235_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_6eb4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_8fc0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_9c69_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_63fb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_5446_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_6df5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_2edb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_611e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_7586_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_8651_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_b2d5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_4f11_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_6235_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_6eb4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_8fc0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_b09b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_63fb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_5446_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_6df5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_2edb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_611e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_7586_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_63fb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_a8b0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l183_c3_a8b0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l183_c3_a8b0_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue := VAR_sprite_MUX_uxn_device_h_l82_c3_2edb_return_output;
     -- MUX[uxn_device_h_l66_c20_a611] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l66_c20_a611_cond <= VAR_MUX_uxn_device_h_l66_c20_a611_cond;
     MUX_uxn_device_h_l66_c20_a611_iftrue <= VAR_MUX_uxn_device_h_l66_c20_a611_iftrue;
     MUX_uxn_device_h_l66_c20_a611_iffalse <= VAR_MUX_uxn_device_h_l66_c20_a611_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l66_c20_a611_return_output := MUX_uxn_device_h_l66_c20_a611_return_output;

     -- y_MUX[uxn_device_h_l152_c3_8fc0] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l152_c3_8fc0_cond <= VAR_y_MUX_uxn_device_h_l152_c3_8fc0_cond;
     y_MUX_uxn_device_h_l152_c3_8fc0_iftrue <= VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iftrue;
     y_MUX_uxn_device_h_l152_c3_8fc0_iffalse <= VAR_y_MUX_uxn_device_h_l152_c3_8fc0_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l152_c3_8fc0_return_output := y_MUX_uxn_device_h_l152_c3_8fc0_return_output;

     -- color_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_color_MUX_uxn_device_h_l62_c7_1c53_cond;
     color_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_color_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     color_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_color_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l62_c7_1c53_return_output := color_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_vram_address_MUX[uxn_device_h_l182_c7_9c69] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_cond;
     result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iftrue;
     result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output := result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output := result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- x_MUX[uxn_device_h_l99_c3_7586] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c3_7586_cond <= VAR_x_MUX_uxn_device_h_l99_c3_7586_cond;
     x_MUX_uxn_device_h_l99_c3_7586_iftrue <= VAR_x_MUX_uxn_device_h_l99_c3_7586_iftrue;
     x_MUX_uxn_device_h_l99_c3_7586_iffalse <= VAR_x_MUX_uxn_device_h_l99_c3_7586_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c3_7586_return_output := x_MUX_uxn_device_h_l99_c3_7586_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l176_c27_0b38] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_left;
     BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output := BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output;

     -- y_MUX[uxn_device_h_l134_c3_6235] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c3_6235_cond <= VAR_y_MUX_uxn_device_h_l134_c3_6235_cond;
     y_MUX_uxn_device_h_l134_c3_6235_iftrue <= VAR_y_MUX_uxn_device_h_l134_c3_6235_iftrue;
     y_MUX_uxn_device_h_l134_c3_6235_iffalse <= VAR_y_MUX_uxn_device_h_l134_c3_6235_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c3_6235_return_output := y_MUX_uxn_device_h_l134_c3_6235_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- sprite_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_cond;
     sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output := sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_cond;
     auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output := auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l182_c7_9c69] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_cond;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output := result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output := result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- x_MUX[uxn_device_h_l117_c3_b2d5] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c3_b2d5_cond <= VAR_x_MUX_uxn_device_h_l117_c3_b2d5_cond;
     x_MUX_uxn_device_h_l117_c3_b2d5_iftrue <= VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iftrue;
     x_MUX_uxn_device_h_l117_c3_b2d5_iffalse <= VAR_x_MUX_uxn_device_h_l117_c3_b2d5_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c3_b2d5_return_output := x_MUX_uxn_device_h_l117_c3_b2d5_return_output;

     -- BIN_OP_GT[uxn_device_h_l162_c27_3ff0] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_left;
     BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output := BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output;

     -- result_vram_value_MUX[uxn_device_h_l182_c7_9c69] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_cond;
     result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iftrue;
     result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output := result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output;

     -- pixel_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_cond;
     pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_return_output := pixel_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_cond;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output := result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l162_c27_2a7c_cond := VAR_BIN_OP_GT_uxn_device_h_l162_c27_3ff0_return_output;
     VAR_result_vram_address_uxn_device_h_l176_c4_1eb8 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_0b38_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue := VAR_MUX_uxn_device_h_l66_c20_a611_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_color_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_pixel_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_9c69_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l182_c7_9c69_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l182_c7_9c69_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_sprite_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_93cc_iftrue := VAR_x_MUX_uxn_device_h_l117_c3_b2d5_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_1c73_iftrue := VAR_x_MUX_uxn_device_h_l99_c3_7586_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_2cea_iftrue := VAR_y_MUX_uxn_device_h_l134_c3_6235_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iftrue := VAR_y_MUX_uxn_device_h_l152_c3_8fc0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue := VAR_result_vram_address_uxn_device_h_l176_c4_1eb8;
     -- pixel_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_cond;
     pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output := pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- x_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_x_MUX_uxn_device_h_l116_c7_93cc_cond;
     x_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_x_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     x_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_x_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l116_c7_93cc_return_output := x_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l63_c3_120e] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_cond;
     is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iftrue;
     is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output := is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_cond;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output := result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- result_vram_address_MUX[uxn_device_h_l170_c3_3d7f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_cond;
     result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iftrue;
     result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output := result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output;

     -- color_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_color_MUX_uxn_device_h_l54_c7_3ec1_cond;
     color_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     color_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_color_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c7_3ec1_return_output := color_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output := auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- result_vram_value_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_cond;
     result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output := result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- MUX[uxn_device_h_l162_c27_2a7c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l162_c27_2a7c_cond <= VAR_MUX_uxn_device_h_l162_c27_2a7c_cond;
     MUX_uxn_device_h_l162_c27_2a7c_iftrue <= VAR_MUX_uxn_device_h_l162_c27_2a7c_iftrue;
     MUX_uxn_device_h_l162_c27_2a7c_iffalse <= VAR_MUX_uxn_device_h_l162_c27_2a7c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l162_c27_2a7c_return_output := MUX_uxn_device_h_l162_c27_2a7c_return_output;

     -- y_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_y_MUX_uxn_device_h_l151_c7_6ca2_cond;
     y_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     y_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_y_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l151_c7_6ca2_return_output := y_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- sprite_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_cond;
     sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output := sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue := VAR_MUX_uxn_device_h_l162_c27_2a7c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_color_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_120e_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_pixel_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l170_c3_3d7f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_sprite_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_x_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_y_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     -- result_vram_value_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- color_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_color_MUX_uxn_device_h_l44_c2_1f65_cond;
     color_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_color_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     color_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_color_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l44_c2_1f65_return_output := color_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- y_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_y_MUX_uxn_device_h_l143_c7_94f9_cond;
     y_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_y_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     y_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_y_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c7_94f9_return_output := y_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- pixel_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_cond;
     pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_return_output := pixel_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_b09b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output;

     -- sprite_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_cond;
     sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_return_output := sprite_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- x_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_x_MUX_uxn_device_h_l108_c7_b33b_cond;
     x_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_x_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     x_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_x_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c7_b33b_return_output := x_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- result_vram_address_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_cond;
     result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iftrue;
     result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output := result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output := auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_cond;
     is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output := is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_1c53_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_b09b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_sprite_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_x_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_y_MUX_uxn_device_h_l143_c7_94f9_return_output;
     -- is_fill_mode_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output := is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- result_vram_value_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- auto_advance_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_cond;
     auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output := auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- y_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_y_MUX_uxn_device_h_l133_c7_2cea_cond;
     y_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_y_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     y_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_y_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l133_c7_2cea_return_output := y_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- sprite_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_cond;
     sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output := sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- x_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_x_MUX_uxn_device_h_l98_c7_1c73_cond;
     x_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_x_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     x_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_x_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l98_c7_1c73_return_output := x_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_auto_advance_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_sprite_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_x_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_y_MUX_uxn_device_h_l133_c7_2cea_return_output;
     -- sprite_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_cond;
     sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_return_output := sprite_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- auto_advance_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_cond;
     auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output := auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- y_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_y_MUX_uxn_device_h_l125_c7_5720_cond;
     y_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_5720_iftrue;
     y_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_5720_return_output := y_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_cond;
     is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output := is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_vram_value_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output := result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output := result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- x_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_x_MUX_uxn_device_h_l90_c7_d156_cond;
     x_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_d156_iftrue;
     x_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_d156_return_output := x_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output := result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_auto_advance_MUX_uxn_device_h_l133_c7_2cea_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l143_c7_94f9_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_5720_return_output;
     -- result_vram_address_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output := result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_vram_value_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output := result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- y_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_y_MUX_uxn_device_h_l116_c7_93cc_cond;
     y_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     y_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_93cc_return_output := y_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- x_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_x_MUX_uxn_device_h_l81_c7_0d3e_cond;
     x_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     x_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_0d3e_return_output := x_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output := result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- auto_advance_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output := auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_93cc_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_cond;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output := result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output := result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- result_vram_address_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_cond;
     result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output := result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output := auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- y_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_y_MUX_uxn_device_h_l108_c7_b33b_cond;
     y_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_y_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     y_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_y_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l108_c7_b33b_return_output := y_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- x_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_x_MUX_uxn_device_h_l73_c7_e9eb_cond;
     x_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     x_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_x_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l73_c7_e9eb_return_output := x_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- result_vram_value_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_cond;
     result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output := result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_x_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_y_MUX_uxn_device_h_l108_c7_b33b_return_output;
     -- result_vram_address_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_cond;
     result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output := result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- y_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_y_MUX_uxn_device_h_l98_c7_1c73_cond;
     y_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_y_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     y_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_y_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l98_c7_1c73_return_output := y_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c7_5720] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- auto_advance_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_cond;
     auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output := auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- x_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_x_MUX_uxn_device_h_l62_c7_1c53_cond;
     x_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_x_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     x_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_x_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l62_c7_1c53_return_output := x_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_auto_advance_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l125_c7_5720_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_x_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_y_MUX_uxn_device_h_l98_c7_1c73_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output := result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_vram_value_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output := result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- auto_advance_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_cond;
     auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output := auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output := result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_93cc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_2cea] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output := result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- y_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_y_MUX_uxn_device_h_l90_c7_d156_cond;
     y_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_d156_iftrue;
     y_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_d156_return_output := y_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- x_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_x_MUX_uxn_device_h_l54_c7_3ec1_cond;
     x_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     x_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_x_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l54_c7_3ec1_return_output := x_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_2cea_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_auto_advance_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_93cc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_x_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_d156_return_output;
     -- auto_advance_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output := auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- x_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_x_MUX_uxn_device_h_l44_c2_1f65_cond;
     x_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_x_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     x_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_x_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l44_c2_1f65_return_output := x_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- y_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_y_MUX_uxn_device_h_l81_c7_0d3e_cond;
     y_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     y_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_0d3e_return_output := y_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output := result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_vram_address_MUX[uxn_device_h_l108_c7_b33b] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_cond;
     result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iftrue;
     result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output := result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output := result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_94f9] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_94f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b33b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l98_c7_1c73_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- result_vram_address_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output := result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output := auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- y_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_y_MUX_uxn_device_h_l73_c7_e9eb_cond;
     y_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     y_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_y_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l73_c7_e9eb_return_output := y_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l98_c7_1c73] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_cond;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output := result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_6ca2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_cond;
     result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output := result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_6ca2_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l98_c7_1c73_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_y_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_daa3] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- auto_advance_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_cond;
     auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output := auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_d156] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- y_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_y_MUX_uxn_device_h_l62_c7_1c53_cond;
     y_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_y_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     y_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_y_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l62_c7_1c53_return_output := y_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_daa3_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_auto_advance_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_d156_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_y_MUX_uxn_device_h_l62_c7_1c53_return_output;
     -- y_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_y_MUX_uxn_device_h_l54_c7_3ec1_cond;
     y_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     y_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_y_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l54_c7_3ec1_return_output := y_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output := result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output := result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- auto_advance_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_cond;
     auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output := auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_vram_value_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_1961] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_0d3e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_1961_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_auto_advance_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_0d3e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_y_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     -- auto_advance_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_cond;
     auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output := auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_e347] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output;

     -- result_vram_value_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output := result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- y_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_y_MUX_uxn_device_h_l44_c2_1f65_cond;
     y_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_y_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     y_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_y_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l44_c2_1f65_return_output := y_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_vram_address_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output := result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c7_e9eb] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_e347_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_auto_advance_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l73_c7_e9eb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l62_c7_1c53_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l44_c2_1f65_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output := result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output := result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output := result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_vram_address_MUX[uxn_device_h_l62_c7_1c53] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_cond;
     result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iftrue;
     result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output := result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output;

     -- result_vram_value_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_5253] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output;

     -- auto_advance_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_cond;
     auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output := auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_5253_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l44_c2_1f65_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l62_c7_1c53_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     -- result_vram_address_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- result_vram_value_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output := result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output := result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l54_c7_3ec1] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output;

     -- printf_uxn_device_h_l171_c4_4b94[uxn_device_h_l171_c4_4b94] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0 <= VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg0;
     printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1 <= VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg1;
     printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2 <= VAR_printf_uxn_device_h_l171_c4_4b94_uxn_device_h_l171_c4_4b94_arg2;
     -- Outputs

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l54_c7_3ec1_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output := result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- result_vram_address_MUX[uxn_device_h_l44_c2_1f65] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_cond;
     result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iftrue;
     result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output := result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_b459_uxn_device_h_l196_l35_DUPLICATE_7d1e LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b459_uxn_device_h_l196_l35_DUPLICATE_7d1e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b459(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_1f65_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_1f65_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b459_uxn_device_h_l196_l35_DUPLICATE_7d1e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b459_uxn_device_h_l196_l35_DUPLICATE_7d1e_return_output;
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
