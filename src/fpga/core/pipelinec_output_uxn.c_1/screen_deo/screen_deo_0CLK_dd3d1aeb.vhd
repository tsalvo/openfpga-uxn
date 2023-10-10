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
-- printf_uxn_device_h_l42_c2_e239[uxn_device_h_l42_c2_e239]
signal printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1 : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l44_c6_b9fe]
signal BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_9fab]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l44_c2_a928]
signal sprite_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l44_c2_a928]
signal x_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l44_c2_a928]
signal auto_advance_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l44_c2_a928]
signal y_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l44_c2_a928]
signal pixel_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l44_c2_a928]
signal is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l44_c2_a928]
signal color_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(1 downto 0);

-- result_vram_address_MUX[uxn_device_h_l44_c2_a928]
signal result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l44_c2_a928]
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_a928]
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l44_c2_a928]
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l44_c2_a928]
signal result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l44_c2_a928]
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_a928]
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l45_c7_4111]
signal BIN_OP_EQ_uxn_device_h_l45_c7_4111_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_4111_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_9eba]
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l45_c3_9eba]
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_9eba]
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l45_c3_9eba]
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l54_c11_a72c]
signal BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_583e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l54_c7_9fab]
signal sprite_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l54_c7_9fab]
signal x_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l54_c7_9fab]
signal auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l54_c7_9fab]
signal y_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l54_c7_9fab]
signal pixel_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l54_c7_9fab]
signal is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l54_c7_9fab]
signal color_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(1 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_9fab]
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l54_c7_9fab]
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l54_c7_9fab]
signal result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l54_c7_9fab]
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l54_c7_9fab]
signal result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l54_c7_9fab]
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l55_c7_f90f]
signal BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_46b3]
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l55_c3_46b3]
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l55_c3_46b3]
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l62_c11_0c7e]
signal BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_41ca]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l62_c7_583e]
signal sprite_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l62_c7_583e]
signal x_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l62_c7_583e]
signal auto_advance_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l62_c7_583e]
signal y_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(15 downto 0);

-- pixel_MUX[uxn_device_h_l62_c7_583e]
signal pixel_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l62_c7_583e]
signal is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l62_c7_583e]
signal color_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(1 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_583e]
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l62_c7_583e]
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l62_c7_583e]
signal result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l62_c7_583e]
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l62_c7_583e]
signal result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l62_c7_583e]
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l63_c7_e2da]
signal BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l63_c3_2113]
signal pixel_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l63_c3_2113]
signal is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l63_c3_2113]
signal color_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(1 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_2113]
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l63_c3_2113]
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l63_c3_2113]
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l66_c20_1a46]
signal BIN_OP_AND_uxn_device_h_l66_c20_1a46_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_1a46_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l66_c20_4663]
signal BIN_OP_EQ_uxn_device_h_l66_c20_4663_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_4663_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l66_c20_f9fb]
signal MUX_uxn_device_h_l66_c20_f9fb_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_f9fb_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_f9fb_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l66_c20_f9fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l73_c11_f792]
signal BIN_OP_EQ_uxn_device_h_l73_c11_f792_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_f792_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_3fd8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l73_c7_41ca]
signal sprite_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l73_c7_41ca]
signal x_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l73_c7_41ca]
signal auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l73_c7_41ca]
signal y_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_41ca]
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l73_c7_41ca]
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l73_c7_41ca]
signal result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l73_c7_41ca]
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l73_c7_41ca]
signal result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l73_c7_41ca]
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l74_c7_7015]
signal BIN_OP_EQ_uxn_device_h_l74_c7_7015_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_7015_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_19cf]
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l74_c3_19cf]
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l74_c3_19cf]
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l81_c11_dabf]
signal BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_04a4]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l81_c7_3fd8]
signal sprite_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l81_c7_3fd8]
signal x_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l81_c7_3fd8]
signal auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l81_c7_3fd8]
signal y_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_3fd8]
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l81_c7_3fd8]
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l81_c7_3fd8]
signal result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l81_c7_3fd8]
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l81_c7_3fd8]
signal result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l81_c7_3fd8]
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l82_c7_8bd1]
signal BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output : unsigned(0 downto 0);

-- sprite_MUX[uxn_device_h_l82_c3_c348]
signal sprite_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_c348]
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l82_c3_c348]
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l82_c3_c348]
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_e827]
signal BIN_OP_EQ_uxn_device_h_l90_c11_e827_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_e827_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_bb50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l90_c7_04a4]
signal x_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_04a4]
signal auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l90_c7_04a4]
signal y_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_04a4]
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_04a4]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_04a4]
signal result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_04a4]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l90_c7_04a4]
signal result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_04a4]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_9a3b]
signal BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_f5a3]
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_f5a3]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_f5a3]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l98_c11_97eb]
signal BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_b58f]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l98_c7_bb50]
signal x_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l98_c7_bb50]
signal auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l98_c7_bb50]
signal y_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_bb50]
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l98_c7_bb50]
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l98_c7_bb50]
signal result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l98_c7_bb50]
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l98_c7_bb50]
signal result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l98_c7_bb50]
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c7_4c1f]
signal BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l99_c3_8afe]
signal x_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_8afe]
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c3_8afe]
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c3_8afe]
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l108_c11_938f]
signal BIN_OP_EQ_uxn_device_h_l108_c11_938f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_938f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_e306]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l108_c7_b58f]
signal x_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l108_c7_b58f]
signal auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l108_c7_b58f]
signal y_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_b58f]
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l108_c7_b58f]
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l108_c7_b58f]
signal result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l108_c7_b58f]
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l108_c7_b58f]
signal result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l108_c7_b58f]
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l109_c7_18b5]
signal BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_b015]
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l109_c3_b015]
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l109_c3_b015]
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l116_c11_6225]
signal BIN_OP_EQ_uxn_device_h_l116_c11_6225_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_6225_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_6575]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l116_c7_e306]
signal x_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(15 downto 0);

-- auto_advance_MUX[uxn_device_h_l116_c7_e306]
signal auto_advance_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l116_c7_e306]
signal y_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_e306]
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l116_c7_e306]
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l116_c7_e306]
signal result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l116_c7_e306]
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l116_c7_e306]
signal result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l116_c7_e306]
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l117_c7_bcca]
signal BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output : unsigned(0 downto 0);

-- x_MUX[uxn_device_h_l117_c3_7409]
signal x_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_7409]
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l117_c3_7409]
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l117_c3_7409]
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l118_c4_785b]
signal BIN_OP_OR_uxn_device_h_l118_c4_785b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_785b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l125_c11_0e9b]
signal BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_3877]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l125_c7_6575]
signal auto_advance_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l125_c7_6575]
signal y_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_6575]
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l125_c7_6575]
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l125_c7_6575]
signal result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l125_c7_6575]
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l125_c7_6575]
signal result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l125_c7_6575]
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l126_c7_255b]
signal BIN_OP_EQ_uxn_device_h_l126_c7_255b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_255b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_1e25]
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l126_c3_1e25]
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l126_c3_1e25]
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l133_c11_f962]
signal BIN_OP_EQ_uxn_device_h_l133_c11_f962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_f962_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_48dd]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l133_c7_3877]
signal auto_advance_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l133_c7_3877]
signal y_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_3877]
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l133_c7_3877]
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l133_c7_3877]
signal result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l133_c7_3877]
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l133_c7_3877]
signal result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l133_c7_3877]
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l134_c7_df4e]
signal BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l134_c3_f672]
signal y_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_f672]
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l134_c3_f672]
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l134_c3_f672]
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l143_c11_9644]
signal BIN_OP_EQ_uxn_device_h_l143_c11_9644_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_9644_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_d9ef]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l143_c7_48dd]
signal auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l143_c7_48dd]
signal y_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_48dd]
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l143_c7_48dd]
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l143_c7_48dd]
signal result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l143_c7_48dd]
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l143_c7_48dd]
signal result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l143_c7_48dd]
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l144_c7_42e2]
signal BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_badc]
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l144_c3_badc]
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l144_c3_badc]
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l151_c11_0a72]
signal BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_108a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l151_c7_d9ef]
signal auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l151_c7_d9ef]
signal y_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_d9ef]
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l151_c7_d9ef]
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l151_c7_d9ef]
signal result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l151_c7_d9ef]
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l151_c7_d9ef]
signal result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l151_c7_d9ef]
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l152_c7_65f1]
signal BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output : unsigned(0 downto 0);

-- y_MUX[uxn_device_h_l152_c3_59f2]
signal y_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(15 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_59f2]
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l152_c3_59f2]
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l152_c3_59f2]
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_device_h_l153_c4_ca1c]
signal BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l160_c11_03d0]
signal BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_3b50]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l160_c7_108a]
signal auto_advance_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_108a]
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l160_c7_108a]
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c7_108a]
signal result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l160_c7_108a]
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l160_c7_108a]
signal result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c7_108a]
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l161_c7_874c]
signal BIN_OP_EQ_uxn_device_h_l161_c7_874c_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_874c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output : unsigned(0 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_c500]
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l161_c3_c500]
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l161_c3_c500]
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_3c06]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l162_c27_d77a]
signal BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l162_c27_7685]
signal BIN_OP_GT_uxn_device_h_l162_c27_7685_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_7685_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l162_c27_7347]
signal MUX_uxn_device_h_l162_c27_7347_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_7347_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_7347_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l162_c27_7347_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l169_c11_01fc]
signal BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_9364]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l169_c7_3b50]
signal auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_3b50]
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l169_c7_3b50]
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l169_c7_3b50]
signal result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l169_c7_3b50]
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l169_c7_3b50]
signal result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l169_c7_3b50]
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l170_c7_f9f4]
signal BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_6a0f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l170_c3_cca9]
signal auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(7 downto 0);

-- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_cca9]
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l170_c3_cca9]
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l170_c3_cca9]
signal result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(31 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l170_c3_cca9]
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(7 downto 0);

-- result_vram_value_MUX[uxn_device_h_l170_c3_cca9]
signal result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l170_c3_cca9]
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);

-- printf_uxn_device_h_l171_c4_9e1f[uxn_device_h_l171_c4_9e1f]
signal printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_6cf6]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l176_c27_eb19]
signal BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l182_c11_266c]
signal BIN_OP_EQ_uxn_device_h_l182_c11_266c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_266c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l182_c7_7594]
signal result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(31 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l182_c7_7594]
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(0 downto 0);

-- result_vram_value_MUX[uxn_device_h_l182_c7_7594]
signal result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l182_c7_7594]
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l183_c7_c77e]
signal BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l183_c3_1257]
signal result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(31 downto 0);

-- result_vram_value_MUX[uxn_device_h_l183_c3_1257]
signal result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(1 downto 0);
signal result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(1 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l183_c3_1257]
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_2;
      base.is_device_ram_read := ref_toks_3;
      base.device_ram_address := ref_toks_4;
      base.vram_value := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.is_device_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239
printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239 : entity work.printf_uxn_device_h_l42_c2_e239_0CLK_de264c78 port map (
printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE,
printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0,
printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1);

-- BIN_OP_EQ_uxn_device_h_l44_c6_b9fe
BIN_OP_EQ_uxn_device_h_l44_c6_b9fe : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left,
BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right,
BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- sprite_MUX_uxn_device_h_l44_c2_a928
sprite_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l44_c2_a928_cond,
sprite_MUX_uxn_device_h_l44_c2_a928_iftrue,
sprite_MUX_uxn_device_h_l44_c2_a928_iffalse,
sprite_MUX_uxn_device_h_l44_c2_a928_return_output);

-- x_MUX_uxn_device_h_l44_c2_a928
x_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l44_c2_a928_cond,
x_MUX_uxn_device_h_l44_c2_a928_iftrue,
x_MUX_uxn_device_h_l44_c2_a928_iffalse,
x_MUX_uxn_device_h_l44_c2_a928_return_output);

-- auto_advance_MUX_uxn_device_h_l44_c2_a928
auto_advance_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l44_c2_a928_cond,
auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue,
auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse,
auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output);

-- y_MUX_uxn_device_h_l44_c2_a928
y_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l44_c2_a928_cond,
y_MUX_uxn_device_h_l44_c2_a928_iftrue,
y_MUX_uxn_device_h_l44_c2_a928_iffalse,
y_MUX_uxn_device_h_l44_c2_a928_return_output);

-- pixel_MUX_uxn_device_h_l44_c2_a928
pixel_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l44_c2_a928_cond,
pixel_MUX_uxn_device_h_l44_c2_a928_iftrue,
pixel_MUX_uxn_device_h_l44_c2_a928_iffalse,
pixel_MUX_uxn_device_h_l44_c2_a928_return_output);

-- is_fill_mode_MUX_uxn_device_h_l44_c2_a928
is_fill_mode_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond,
is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue,
is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse,
is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output);

-- color_MUX_uxn_device_h_l44_c2_a928
color_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l44_c2_a928_cond,
color_MUX_uxn_device_h_l44_c2_a928_iftrue,
color_MUX_uxn_device_h_l44_c2_a928_iffalse,
color_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_vram_address_MUX_uxn_device_h_l44_c2_a928
result_vram_address_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond,
result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l44_c2_a928
result_is_deo_done_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond,
result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l44_c2_a928
result_device_ram_address_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond,
result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_vram_value_MUX_uxn_device_h_l44_c2_a928
result_vram_value_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond,
result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l44_c2_a928
result_is_vram_write_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond,
result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output);

-- BIN_OP_EQ_uxn_device_h_l45_c7_4111
BIN_OP_EQ_uxn_device_h_l45_c7_4111 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l45_c7_4111_left,
BIN_OP_EQ_uxn_device_h_l45_c7_4111_right,
BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba
result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond,
result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue,
result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse,
result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba
result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond,
result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue,
result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse,
result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output);

-- BIN_OP_EQ_uxn_device_h_l54_c11_a72c
BIN_OP_EQ_uxn_device_h_l54_c11_a72c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left,
BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right,
BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output);

-- sprite_MUX_uxn_device_h_l54_c7_9fab
sprite_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l54_c7_9fab_cond,
sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue,
sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse,
sprite_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- x_MUX_uxn_device_h_l54_c7_9fab
x_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l54_c7_9fab_cond,
x_MUX_uxn_device_h_l54_c7_9fab_iftrue,
x_MUX_uxn_device_h_l54_c7_9fab_iffalse,
x_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- auto_advance_MUX_uxn_device_h_l54_c7_9fab
auto_advance_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond,
auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue,
auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse,
auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- y_MUX_uxn_device_h_l54_c7_9fab
y_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l54_c7_9fab_cond,
y_MUX_uxn_device_h_l54_c7_9fab_iftrue,
y_MUX_uxn_device_h_l54_c7_9fab_iffalse,
y_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- pixel_MUX_uxn_device_h_l54_c7_9fab
pixel_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l54_c7_9fab_cond,
pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue,
pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse,
pixel_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- is_fill_mode_MUX_uxn_device_h_l54_c7_9fab
is_fill_mode_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond,
is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue,
is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse,
is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- color_MUX_uxn_device_h_l54_c7_9fab
color_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l54_c7_9fab_cond,
color_MUX_uxn_device_h_l54_c7_9fab_iftrue,
color_MUX_uxn_device_h_l54_c7_9fab_iffalse,
color_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab
result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond,
result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_vram_address_MUX_uxn_device_h_l54_c7_9fab
result_vram_address_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond,
result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab
result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond,
result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_vram_value_MUX_uxn_device_h_l54_c7_9fab
result_vram_value_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond,
result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab
result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond,
result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue,
result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse,
result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output);

-- BIN_OP_EQ_uxn_device_h_l55_c7_f90f
BIN_OP_EQ_uxn_device_h_l55_c7_f90f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left,
BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right,
BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3
result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond,
result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3
result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond,
result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output);

-- BIN_OP_EQ_uxn_device_h_l62_c11_0c7e
BIN_OP_EQ_uxn_device_h_l62_c11_0c7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left,
BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right,
BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- sprite_MUX_uxn_device_h_l62_c7_583e
sprite_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l62_c7_583e_cond,
sprite_MUX_uxn_device_h_l62_c7_583e_iftrue,
sprite_MUX_uxn_device_h_l62_c7_583e_iffalse,
sprite_MUX_uxn_device_h_l62_c7_583e_return_output);

-- x_MUX_uxn_device_h_l62_c7_583e
x_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l62_c7_583e_cond,
x_MUX_uxn_device_h_l62_c7_583e_iftrue,
x_MUX_uxn_device_h_l62_c7_583e_iffalse,
x_MUX_uxn_device_h_l62_c7_583e_return_output);

-- auto_advance_MUX_uxn_device_h_l62_c7_583e
auto_advance_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l62_c7_583e_cond,
auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue,
auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse,
auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output);

-- y_MUX_uxn_device_h_l62_c7_583e
y_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l62_c7_583e_cond,
y_MUX_uxn_device_h_l62_c7_583e_iftrue,
y_MUX_uxn_device_h_l62_c7_583e_iffalse,
y_MUX_uxn_device_h_l62_c7_583e_return_output);

-- pixel_MUX_uxn_device_h_l62_c7_583e
pixel_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l62_c7_583e_cond,
pixel_MUX_uxn_device_h_l62_c7_583e_iftrue,
pixel_MUX_uxn_device_h_l62_c7_583e_iffalse,
pixel_MUX_uxn_device_h_l62_c7_583e_return_output);

-- is_fill_mode_MUX_uxn_device_h_l62_c7_583e
is_fill_mode_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond,
is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue,
is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse,
is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output);

-- color_MUX_uxn_device_h_l62_c7_583e
color_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l62_c7_583e_cond,
color_MUX_uxn_device_h_l62_c7_583e_iftrue,
color_MUX_uxn_device_h_l62_c7_583e_iffalse,
color_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l62_c7_583e
result_is_deo_done_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond,
result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_vram_address_MUX_uxn_device_h_l62_c7_583e
result_vram_address_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond,
result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l62_c7_583e
result_device_ram_address_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond,
result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_vram_value_MUX_uxn_device_h_l62_c7_583e
result_vram_value_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond,
result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l62_c7_583e
result_is_vram_write_MUX_uxn_device_h_l62_c7_583e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond,
result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output);

-- BIN_OP_EQ_uxn_device_h_l63_c7_e2da
BIN_OP_EQ_uxn_device_h_l63_c7_e2da : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left,
BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right,
BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output);

-- pixel_MUX_uxn_device_h_l63_c3_2113
pixel_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l63_c3_2113_cond,
pixel_MUX_uxn_device_h_l63_c3_2113_iftrue,
pixel_MUX_uxn_device_h_l63_c3_2113_iffalse,
pixel_MUX_uxn_device_h_l63_c3_2113_return_output);

-- is_fill_mode_MUX_uxn_device_h_l63_c3_2113
is_fill_mode_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond,
is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue,
is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse,
is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output);

-- color_MUX_uxn_device_h_l63_c3_2113
color_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l63_c3_2113_cond,
color_MUX_uxn_device_h_l63_c3_2113_iftrue,
color_MUX_uxn_device_h_l63_c3_2113_iffalse,
color_MUX_uxn_device_h_l63_c3_2113_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l63_c3_2113
result_is_deo_done_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond,
result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue,
result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse,
result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l63_c3_2113
result_device_ram_address_MUX_uxn_device_h_l63_c3_2113 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond,
result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue,
result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse,
result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output);

-- BIN_OP_AND_uxn_device_h_l66_c20_1a46
BIN_OP_AND_uxn_device_h_l66_c20_1a46 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l66_c20_1a46_left,
BIN_OP_AND_uxn_device_h_l66_c20_1a46_right,
BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output);

-- BIN_OP_EQ_uxn_device_h_l66_c20_4663
BIN_OP_EQ_uxn_device_h_l66_c20_4663 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l66_c20_4663_left,
BIN_OP_EQ_uxn_device_h_l66_c20_4663_right,
BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output);

-- MUX_uxn_device_h_l66_c20_f9fb
MUX_uxn_device_h_l66_c20_f9fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l66_c20_f9fb_cond,
MUX_uxn_device_h_l66_c20_f9fb_iftrue,
MUX_uxn_device_h_l66_c20_f9fb_iffalse,
MUX_uxn_device_h_l66_c20_f9fb_return_output);

-- BIN_OP_EQ_uxn_device_h_l73_c11_f792
BIN_OP_EQ_uxn_device_h_l73_c11_f792 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l73_c11_f792_left,
BIN_OP_EQ_uxn_device_h_l73_c11_f792_right,
BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- sprite_MUX_uxn_device_h_l73_c7_41ca
sprite_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l73_c7_41ca_cond,
sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue,
sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse,
sprite_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- x_MUX_uxn_device_h_l73_c7_41ca
x_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l73_c7_41ca_cond,
x_MUX_uxn_device_h_l73_c7_41ca_iftrue,
x_MUX_uxn_device_h_l73_c7_41ca_iffalse,
x_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- auto_advance_MUX_uxn_device_h_l73_c7_41ca
auto_advance_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond,
auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue,
auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse,
auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- y_MUX_uxn_device_h_l73_c7_41ca
y_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l73_c7_41ca_cond,
y_MUX_uxn_device_h_l73_c7_41ca_iftrue,
y_MUX_uxn_device_h_l73_c7_41ca_iffalse,
y_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca
result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond,
result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_vram_address_MUX_uxn_device_h_l73_c7_41ca
result_vram_address_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond,
result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca
result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond,
result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_vram_value_MUX_uxn_device_h_l73_c7_41ca
result_vram_value_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond,
result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca
result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond,
result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue,
result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse,
result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output);

-- BIN_OP_EQ_uxn_device_h_l74_c7_7015
BIN_OP_EQ_uxn_device_h_l74_c7_7015 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l74_c7_7015_left,
BIN_OP_EQ_uxn_device_h_l74_c7_7015_right,
BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf
result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond,
result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf
result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond,
result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output);

-- BIN_OP_EQ_uxn_device_h_l81_c11_dabf
BIN_OP_EQ_uxn_device_h_l81_c11_dabf : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left,
BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right,
BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- sprite_MUX_uxn_device_h_l81_c7_3fd8
sprite_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l81_c7_3fd8_cond,
sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- x_MUX_uxn_device_h_l81_c7_3fd8
x_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l81_c7_3fd8_cond,
x_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
x_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
x_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- auto_advance_MUX_uxn_device_h_l81_c7_3fd8
auto_advance_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond,
auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- y_MUX_uxn_device_h_l81_c7_3fd8
y_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l81_c7_3fd8_cond,
y_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
y_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
y_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8
result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_vram_address_MUX_uxn_device_h_l81_c7_3fd8
result_vram_address_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8
result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_vram_value_MUX_uxn_device_h_l81_c7_3fd8
result_vram_value_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8
result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond,
result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output);

-- BIN_OP_EQ_uxn_device_h_l82_c7_8bd1
BIN_OP_EQ_uxn_device_h_l82_c7_8bd1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left,
BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right,
BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output);

-- sprite_MUX_uxn_device_h_l82_c3_c348
sprite_MUX_uxn_device_h_l82_c3_c348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l82_c3_c348_cond,
sprite_MUX_uxn_device_h_l82_c3_c348_iftrue,
sprite_MUX_uxn_device_h_l82_c3_c348_iffalse,
sprite_MUX_uxn_device_h_l82_c3_c348_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l82_c3_c348
result_is_deo_done_MUX_uxn_device_h_l82_c3_c348 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond,
result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue,
result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse,
result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l82_c3_c348
result_device_ram_address_MUX_uxn_device_h_l82_c3_c348 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond,
result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue,
result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse,
result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_e827
BIN_OP_EQ_uxn_device_h_l90_c11_e827 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_e827_left,
BIN_OP_EQ_uxn_device_h_l90_c11_e827_right,
BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- x_MUX_uxn_device_h_l90_c7_04a4
x_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_04a4_cond,
x_MUX_uxn_device_h_l90_c7_04a4_iftrue,
x_MUX_uxn_device_h_l90_c7_04a4_iffalse,
x_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_04a4
auto_advance_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond,
auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- y_MUX_uxn_device_h_l90_c7_04a4
y_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_04a4_cond,
y_MUX_uxn_device_h_l90_c7_04a4_iftrue,
y_MUX_uxn_device_h_l90_c7_04a4_iffalse,
y_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4
result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_04a4
result_vram_address_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4
result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_vram_value_MUX_uxn_device_h_l90_c7_04a4
result_vram_value_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond,
result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4
result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_9a3b
BIN_OP_EQ_uxn_device_h_l91_c7_9a3b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left,
BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right,
BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3
result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3
result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output);

-- BIN_OP_EQ_uxn_device_h_l98_c11_97eb
BIN_OP_EQ_uxn_device_h_l98_c11_97eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left,
BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right,
BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- x_MUX_uxn_device_h_l98_c7_bb50
x_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l98_c7_bb50_cond,
x_MUX_uxn_device_h_l98_c7_bb50_iftrue,
x_MUX_uxn_device_h_l98_c7_bb50_iffalse,
x_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- auto_advance_MUX_uxn_device_h_l98_c7_bb50
auto_advance_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond,
auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue,
auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse,
auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- y_MUX_uxn_device_h_l98_c7_bb50
y_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l98_c7_bb50_cond,
y_MUX_uxn_device_h_l98_c7_bb50_iftrue,
y_MUX_uxn_device_h_l98_c7_bb50_iffalse,
y_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50
result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond,
result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_vram_address_MUX_uxn_device_h_l98_c7_bb50
result_vram_address_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond,
result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50
result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond,
result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_vram_value_MUX_uxn_device_h_l98_c7_bb50
result_vram_value_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond,
result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50
result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond,
result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue,
result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse,
result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c7_4c1f
BIN_OP_EQ_uxn_device_h_l99_c7_4c1f : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left,
BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right,
BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output);

-- x_MUX_uxn_device_h_l99_c3_8afe
x_MUX_uxn_device_h_l99_c3_8afe : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c3_8afe_cond,
x_MUX_uxn_device_h_l99_c3_8afe_iftrue,
x_MUX_uxn_device_h_l99_c3_8afe_iffalse,
x_MUX_uxn_device_h_l99_c3_8afe_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe
result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe
result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output);

-- BIN_OP_EQ_uxn_device_h_l108_c11_938f
BIN_OP_EQ_uxn_device_h_l108_c11_938f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l108_c11_938f_left,
BIN_OP_EQ_uxn_device_h_l108_c11_938f_right,
BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output);

-- x_MUX_uxn_device_h_l108_c7_b58f
x_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l108_c7_b58f_cond,
x_MUX_uxn_device_h_l108_c7_b58f_iftrue,
x_MUX_uxn_device_h_l108_c7_b58f_iffalse,
x_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- auto_advance_MUX_uxn_device_h_l108_c7_b58f
auto_advance_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond,
auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue,
auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse,
auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- y_MUX_uxn_device_h_l108_c7_b58f
y_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l108_c7_b58f_cond,
y_MUX_uxn_device_h_l108_c7_b58f_iftrue,
y_MUX_uxn_device_h_l108_c7_b58f_iffalse,
y_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f
result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_vram_address_MUX_uxn_device_h_l108_c7_b58f
result_vram_address_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond,
result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f
result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_vram_value_MUX_uxn_device_h_l108_c7_b58f
result_vram_value_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond,
result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f
result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse,
result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output);

-- BIN_OP_EQ_uxn_device_h_l109_c7_18b5
BIN_OP_EQ_uxn_device_h_l109_c7_18b5 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left,
BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right,
BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l109_c3_b015
result_is_deo_done_MUX_uxn_device_h_l109_c3_b015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond,
result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue,
result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse,
result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l109_c3_b015
result_device_ram_address_MUX_uxn_device_h_l109_c3_b015 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond,
result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue,
result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse,
result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output);

-- BIN_OP_EQ_uxn_device_h_l116_c11_6225
BIN_OP_EQ_uxn_device_h_l116_c11_6225 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l116_c11_6225_left,
BIN_OP_EQ_uxn_device_h_l116_c11_6225_right,
BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output);

-- x_MUX_uxn_device_h_l116_c7_e306
x_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l116_c7_e306_cond,
x_MUX_uxn_device_h_l116_c7_e306_iftrue,
x_MUX_uxn_device_h_l116_c7_e306_iffalse,
x_MUX_uxn_device_h_l116_c7_e306_return_output);

-- auto_advance_MUX_uxn_device_h_l116_c7_e306
auto_advance_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l116_c7_e306_cond,
auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue,
auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse,
auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output);

-- y_MUX_uxn_device_h_l116_c7_e306
y_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l116_c7_e306_cond,
y_MUX_uxn_device_h_l116_c7_e306_iftrue,
y_MUX_uxn_device_h_l116_c7_e306_iffalse,
y_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l116_c7_e306
result_is_deo_done_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_vram_address_MUX_uxn_device_h_l116_c7_e306
result_vram_address_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond,
result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l116_c7_e306
result_device_ram_address_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_vram_value_MUX_uxn_device_h_l116_c7_e306
result_vram_value_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond,
result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l116_c7_e306
result_is_vram_write_MUX_uxn_device_h_l116_c7_e306 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse,
result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output);

-- BIN_OP_EQ_uxn_device_h_l117_c7_bcca
BIN_OP_EQ_uxn_device_h_l117_c7_bcca : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left,
BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right,
BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output);

-- x_MUX_uxn_device_h_l117_c3_7409
x_MUX_uxn_device_h_l117_c3_7409 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l117_c3_7409_cond,
x_MUX_uxn_device_h_l117_c3_7409_iftrue,
x_MUX_uxn_device_h_l117_c3_7409_iffalse,
x_MUX_uxn_device_h_l117_c3_7409_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l117_c3_7409
result_is_deo_done_MUX_uxn_device_h_l117_c3_7409 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse,
result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l117_c3_7409
result_device_ram_address_MUX_uxn_device_h_l117_c3_7409 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse,
result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output);

-- BIN_OP_OR_uxn_device_h_l118_c4_785b
BIN_OP_OR_uxn_device_h_l118_c4_785b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l118_c4_785b_left,
BIN_OP_OR_uxn_device_h_l118_c4_785b_right,
BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output);

-- BIN_OP_EQ_uxn_device_h_l125_c11_0e9b
BIN_OP_EQ_uxn_device_h_l125_c11_0e9b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left,
BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right,
BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output);

-- auto_advance_MUX_uxn_device_h_l125_c7_6575
auto_advance_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l125_c7_6575_cond,
auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue,
auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse,
auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output);

-- y_MUX_uxn_device_h_l125_c7_6575
y_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l125_c7_6575_cond,
y_MUX_uxn_device_h_l125_c7_6575_iftrue,
y_MUX_uxn_device_h_l125_c7_6575_iffalse,
y_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l125_c7_6575
result_is_deo_done_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond,
result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_vram_address_MUX_uxn_device_h_l125_c7_6575
result_vram_address_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond,
result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l125_c7_6575
result_device_ram_address_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond,
result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_vram_value_MUX_uxn_device_h_l125_c7_6575
result_vram_value_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond,
result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l125_c7_6575
result_is_vram_write_MUX_uxn_device_h_l125_c7_6575 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond,
result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue,
result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse,
result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output);

-- BIN_OP_EQ_uxn_device_h_l126_c7_255b
BIN_OP_EQ_uxn_device_h_l126_c7_255b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l126_c7_255b_left,
BIN_OP_EQ_uxn_device_h_l126_c7_255b_right,
BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25
result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond,
result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue,
result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse,
result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25
result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond,
result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue,
result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse,
result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output);

-- BIN_OP_EQ_uxn_device_h_l133_c11_f962
BIN_OP_EQ_uxn_device_h_l133_c11_f962 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l133_c11_f962_left,
BIN_OP_EQ_uxn_device_h_l133_c11_f962_right,
BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- auto_advance_MUX_uxn_device_h_l133_c7_3877
auto_advance_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l133_c7_3877_cond,
auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue,
auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse,
auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output);

-- y_MUX_uxn_device_h_l133_c7_3877
y_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l133_c7_3877_cond,
y_MUX_uxn_device_h_l133_c7_3877_iftrue,
y_MUX_uxn_device_h_l133_c7_3877_iffalse,
y_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l133_c7_3877
result_is_deo_done_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond,
result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_vram_address_MUX_uxn_device_h_l133_c7_3877
result_vram_address_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond,
result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l133_c7_3877
result_device_ram_address_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond,
result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_vram_value_MUX_uxn_device_h_l133_c7_3877
result_vram_value_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond,
result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l133_c7_3877
result_is_vram_write_MUX_uxn_device_h_l133_c7_3877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond,
result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue,
result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse,
result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output);

-- BIN_OP_EQ_uxn_device_h_l134_c7_df4e
BIN_OP_EQ_uxn_device_h_l134_c7_df4e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left,
BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right,
BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output);

-- y_MUX_uxn_device_h_l134_c3_f672
y_MUX_uxn_device_h_l134_c3_f672 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l134_c3_f672_cond,
y_MUX_uxn_device_h_l134_c3_f672_iftrue,
y_MUX_uxn_device_h_l134_c3_f672_iffalse,
y_MUX_uxn_device_h_l134_c3_f672_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l134_c3_f672
result_is_deo_done_MUX_uxn_device_h_l134_c3_f672 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond,
result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue,
result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse,
result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l134_c3_f672
result_device_ram_address_MUX_uxn_device_h_l134_c3_f672 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond,
result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue,
result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse,
result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output);

-- BIN_OP_EQ_uxn_device_h_l143_c11_9644
BIN_OP_EQ_uxn_device_h_l143_c11_9644 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l143_c11_9644_left,
BIN_OP_EQ_uxn_device_h_l143_c11_9644_right,
BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- auto_advance_MUX_uxn_device_h_l143_c7_48dd
auto_advance_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond,
auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue,
auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse,
auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- y_MUX_uxn_device_h_l143_c7_48dd
y_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l143_c7_48dd_cond,
y_MUX_uxn_device_h_l143_c7_48dd_iftrue,
y_MUX_uxn_device_h_l143_c7_48dd_iffalse,
y_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd
result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond,
result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_vram_address_MUX_uxn_device_h_l143_c7_48dd
result_vram_address_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond,
result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd
result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond,
result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_vram_value_MUX_uxn_device_h_l143_c7_48dd
result_vram_value_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond,
result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd
result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond,
result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue,
result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse,
result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output);

-- BIN_OP_EQ_uxn_device_h_l144_c7_42e2
BIN_OP_EQ_uxn_device_h_l144_c7_42e2 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left,
BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right,
BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l144_c3_badc
result_is_deo_done_MUX_uxn_device_h_l144_c3_badc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond,
result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l144_c3_badc
result_device_ram_address_MUX_uxn_device_h_l144_c3_badc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond,
result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output);

-- BIN_OP_EQ_uxn_device_h_l151_c11_0a72
BIN_OP_EQ_uxn_device_h_l151_c11_0a72 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left,
BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right,
BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output);

-- auto_advance_MUX_uxn_device_h_l151_c7_d9ef
auto_advance_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond,
auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- y_MUX_uxn_device_h_l151_c7_d9ef
y_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l151_c7_d9ef_cond,
y_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
y_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
y_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef
result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_vram_address_MUX_uxn_device_h_l151_c7_d9ef
result_vram_address_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef
result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_vram_value_MUX_uxn_device_h_l151_c7_d9ef
result_vram_value_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef
result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond,
result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue,
result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse,
result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output);

-- BIN_OP_EQ_uxn_device_h_l152_c7_65f1
BIN_OP_EQ_uxn_device_h_l152_c7_65f1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left,
BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right,
BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output);

-- y_MUX_uxn_device_h_l152_c3_59f2
y_MUX_uxn_device_h_l152_c3_59f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l152_c3_59f2_cond,
y_MUX_uxn_device_h_l152_c3_59f2_iftrue,
y_MUX_uxn_device_h_l152_c3_59f2_iffalse,
y_MUX_uxn_device_h_l152_c3_59f2_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2
result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond,
result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2
result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond,
result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output);

-- BIN_OP_OR_uxn_device_h_l153_c4_ca1c
BIN_OP_OR_uxn_device_h_l153_c4_ca1c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left,
BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right,
BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output);

-- BIN_OP_EQ_uxn_device_h_l160_c11_03d0
BIN_OP_EQ_uxn_device_h_l160_c11_03d0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left,
BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right,
BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- auto_advance_MUX_uxn_device_h_l160_c7_108a
auto_advance_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l160_c7_108a_cond,
auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue,
auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse,
auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l160_c7_108a
result_is_deo_done_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond,
result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c7_108a
result_vram_address_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond,
result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l160_c7_108a
result_device_ram_address_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond,
result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_vram_value_MUX_uxn_device_h_l160_c7_108a
result_vram_value_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond,
result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c7_108a
result_is_vram_write_MUX_uxn_device_h_l160_c7_108a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output);

-- BIN_OP_EQ_uxn_device_h_l161_c7_874c
BIN_OP_EQ_uxn_device_h_l161_c7_874c : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l161_c7_874c_left,
BIN_OP_EQ_uxn_device_h_l161_c7_874c_right,
BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l161_c3_c500
result_is_deo_done_MUX_uxn_device_h_l161_c3_c500 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond,
result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue,
result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse,
result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l161_c3_c500
result_device_ram_address_MUX_uxn_device_h_l161_c3_c500 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond,
result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue,
result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse,
result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06 : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output);

-- BIN_OP_PLUS_uxn_device_h_l162_c27_d77a
BIN_OP_PLUS_uxn_device_h_l162_c27_d77a : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left,
BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right,
BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output);

-- BIN_OP_GT_uxn_device_h_l162_c27_7685
BIN_OP_GT_uxn_device_h_l162_c27_7685 : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l162_c27_7685_left,
BIN_OP_GT_uxn_device_h_l162_c27_7685_right,
BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output);

-- MUX_uxn_device_h_l162_c27_7347
MUX_uxn_device_h_l162_c27_7347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l162_c27_7347_cond,
MUX_uxn_device_h_l162_c27_7347_iftrue,
MUX_uxn_device_h_l162_c27_7347_iffalse,
MUX_uxn_device_h_l162_c27_7347_return_output);

-- BIN_OP_EQ_uxn_device_h_l169_c11_01fc
BIN_OP_EQ_uxn_device_h_l169_c11_01fc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left,
BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right,
BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output);

-- auto_advance_MUX_uxn_device_h_l169_c7_3b50
auto_advance_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond,
auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue,
auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse,
auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50
result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond,
result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_vram_address_MUX_uxn_device_h_l169_c7_3b50
result_vram_address_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond,
result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50
result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond,
result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_vram_value_MUX_uxn_device_h_l169_c7_3b50
result_vram_value_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond,
result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50
result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond,
result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue,
result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse,
result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output);

-- BIN_OP_EQ_uxn_device_h_l170_c7_f9f4
BIN_OP_EQ_uxn_device_h_l170_c7_f9f4 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left,
BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right,
BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output);

-- auto_advance_MUX_uxn_device_h_l170_c3_cca9
auto_advance_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond,
auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue,
auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse,
auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9
result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond,
result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_vram_address_MUX_uxn_device_h_l170_c3_cca9
result_vram_address_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond,
result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9
result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond,
result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_vram_value_MUX_uxn_device_h_l170_c3_cca9
result_vram_value_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond,
result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9
result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond,
result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output);

-- printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f
printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f : entity work.printf_uxn_device_h_l171_c4_9e1f_0CLK_de264c78 port map (
printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE,
printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0,
printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1,
printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6 : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output);

-- BIN_OP_PLUS_uxn_device_h_l176_c27_eb19
BIN_OP_PLUS_uxn_device_h_l176_c27_eb19 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left,
BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right,
BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output);

-- BIN_OP_EQ_uxn_device_h_l182_c11_266c
BIN_OP_EQ_uxn_device_h_l182_c11_266c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l182_c11_266c_left,
BIN_OP_EQ_uxn_device_h_l182_c11_266c_right,
BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output);

-- result_vram_address_MUX_uxn_device_h_l182_c7_7594
result_vram_address_MUX_uxn_device_h_l182_c7_7594 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond,
result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue,
result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse,
result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l182_c7_7594
result_is_deo_done_MUX_uxn_device_h_l182_c7_7594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond,
result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue,
result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse,
result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output);

-- result_vram_value_MUX_uxn_device_h_l182_c7_7594
result_vram_value_MUX_uxn_device_h_l182_c7_7594 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond,
result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue,
result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse,
result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l182_c7_7594
result_is_vram_write_MUX_uxn_device_h_l182_c7_7594 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond,
result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue,
result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse,
result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output);

-- BIN_OP_EQ_uxn_device_h_l183_c7_c77e
BIN_OP_EQ_uxn_device_h_l183_c7_c77e : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left,
BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right,
BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output);

-- result_vram_address_MUX_uxn_device_h_l183_c3_1257
result_vram_address_MUX_uxn_device_h_l183_c3_1257 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond,
result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue,
result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse,
result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output);

-- result_vram_value_MUX_uxn_device_h_l183_c3_1257
result_vram_value_MUX_uxn_device_h_l183_c3_1257 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond,
result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue,
result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse,
result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l183_c3_1257
result_is_vram_write_MUX_uxn_device_h_l183_c3_1257 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond,
result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue,
result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse,
result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x,
CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output);



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
 BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output,
 sprite_MUX_uxn_device_h_l44_c2_a928_return_output,
 x_MUX_uxn_device_h_l44_c2_a928_return_output,
 auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output,
 y_MUX_uxn_device_h_l44_c2_a928_return_output,
 pixel_MUX_uxn_device_h_l44_c2_a928_return_output,
 is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output,
 color_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output,
 BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output,
 result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output,
 result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output,
 BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output,
 sprite_MUX_uxn_device_h_l54_c7_9fab_return_output,
 x_MUX_uxn_device_h_l54_c7_9fab_return_output,
 auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output,
 y_MUX_uxn_device_h_l54_c7_9fab_return_output,
 pixel_MUX_uxn_device_h_l54_c7_9fab_return_output,
 is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output,
 color_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output,
 result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output,
 BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output,
 BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output,
 sprite_MUX_uxn_device_h_l62_c7_583e_return_output,
 x_MUX_uxn_device_h_l62_c7_583e_return_output,
 auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output,
 y_MUX_uxn_device_h_l62_c7_583e_return_output,
 pixel_MUX_uxn_device_h_l62_c7_583e_return_output,
 is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output,
 color_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output,
 BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output,
 pixel_MUX_uxn_device_h_l63_c3_2113_return_output,
 is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output,
 color_MUX_uxn_device_h_l63_c3_2113_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output,
 result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output,
 result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output,
 BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output,
 BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output,
 MUX_uxn_device_h_l66_c20_f9fb_return_output,
 BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 sprite_MUX_uxn_device_h_l73_c7_41ca_return_output,
 x_MUX_uxn_device_h_l73_c7_41ca_return_output,
 auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output,
 y_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output,
 result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output,
 BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output,
 result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output,
 BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output,
 sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 x_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 y_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output,
 BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output,
 sprite_MUX_uxn_device_h_l82_c3_c348_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output,
 result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output,
 result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output,
 x_MUX_uxn_device_h_l90_c7_04a4_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output,
 y_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output,
 BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output,
 x_MUX_uxn_device_h_l98_c7_bb50_return_output,
 auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output,
 y_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output,
 result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output,
 x_MUX_uxn_device_h_l99_c3_8afe_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output,
 BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output,
 x_MUX_uxn_device_h_l108_c7_b58f_return_output,
 auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output,
 y_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output,
 result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output,
 BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output,
 result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output,
 result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output,
 BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output,
 x_MUX_uxn_device_h_l116_c7_e306_return_output,
 auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output,
 y_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output,
 result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output,
 BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output,
 x_MUX_uxn_device_h_l117_c3_7409_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output,
 result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output,
 result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output,
 BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output,
 BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output,
 auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output,
 y_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output,
 result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output,
 BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output,
 result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output,
 result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output,
 BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output,
 auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output,
 y_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output,
 result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output,
 BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output,
 y_MUX_uxn_device_h_l134_c3_f672_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output,
 result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output,
 result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output,
 BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output,
 y_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output,
 result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output,
 BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output,
 BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output,
 auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 y_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output,
 BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output,
 y_MUX_uxn_device_h_l152_c3_59f2_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output,
 BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output,
 BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output,
 auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output,
 BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output,
 result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output,
 result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output,
 BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output,
 BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output,
 MUX_uxn_device_h_l162_c27_7347_return_output,
 BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output,
 auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output,
 result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output,
 BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output,
 auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output,
 BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output,
 BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output,
 result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output,
 result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output,
 result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output,
 result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output,
 BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output,
 result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output,
 result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output,
 result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1 : unsigned(31 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l48_c4_2590 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l57_c4_0f4d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l68_c4_c6a9 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_32b3_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_f9fb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_f9fb_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_f9fb_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l66_c20_f9fb_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l76_c4_2f78 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_4c24 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l93_c4_eea0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l103_c4_5c12 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l111_c4_e686 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l120_c4_e7ab : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l128_c4_f883 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l138_c4_8103 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l146_c4_83f2 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l155_c4_3117 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l164_c4_ac54 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_7347_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_7347_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_7347_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l162_c27_7347_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l176_c4_a1a7 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l174_c4_e5bf : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_1ed7_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_c49b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left : unsigned(63 downto 0);
 variable VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7987_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l186_c4_1e8e : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(1 downto 0);
 variable VAR_result_vram_value_uxn_device_h_l187_c4_9cc3 : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(1 downto 0);
 variable VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_79b9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output : unsigned(1 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6_uxn_device_h_l196_l35_DUPLICATE_370e_return_output : device_out_result_t;
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
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right := to_unsigned(14, 4);
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l120_c4_e7ab := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue := VAR_result_device_ram_address_uxn_device_h_l120_c4_e7ab;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l48_c4_2590 := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue := VAR_result_device_ram_address_uxn_device_h_l48_c4_2590;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_right := to_unsigned(7, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l174_c4_e5bf := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue := VAR_result_device_ram_address_uxn_device_h_l174_c4_e5bf;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l162_c27_7347_iffalse := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_right := to_unsigned(5, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse := to_unsigned(1, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l85_c4_4c24 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_4c24;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l162_c27_7347_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l93_c4_eea0 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue := VAR_result_device_ram_address_uxn_device_h_l93_c4_eea0;
     VAR_result_device_ram_address_uxn_device_h_l68_c4_c6a9 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue := VAR_result_device_ram_address_uxn_device_h_l68_c4_c6a9;
     VAR_result_device_ram_address_uxn_device_h_l57_c4_0f4d := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue := VAR_result_device_ram_address_uxn_device_h_l57_c4_0f4d;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_right := to_unsigned(11, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l128_c4_f883 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue := VAR_result_device_ram_address_uxn_device_h_l128_c4_f883;
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l76_c4_2f78 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue := VAR_result_device_ram_address_uxn_device_h_l76_c4_2f78;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right := to_unsigned(14, 4);
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_right := to_unsigned(143999, 18);
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l164_c4_ac54 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue := VAR_result_device_ram_address_uxn_device_h_l164_c4_ac54;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l66_c20_f9fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue := to_unsigned(0, 1);
     VAR_result_vram_address_uxn_device_h_l186_c4_1e8e := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue := VAR_result_vram_address_uxn_device_h_l186_c4_1e8e;
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right := to_unsigned(4, 3);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right := to_unsigned(14, 4);
     VAR_result_device_ram_address_uxn_device_h_l103_c4_5c12 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue := VAR_result_device_ram_address_uxn_device_h_l103_c4_5c12;
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_right := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l138_c4_8103 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue := VAR_result_device_ram_address_uxn_device_h_l138_c4_8103;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l111_c4_e686 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue := VAR_result_device_ram_address_uxn_device_h_l111_c4_e686;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right := to_unsigned(9, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l146_c4_83f2 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue := VAR_result_device_ram_address_uxn_device_h_l146_c4_83f2;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right := to_unsigned(0, 1);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue := to_unsigned(0, 1);
     VAR_result_vram_value_uxn_device_h_l187_c4_9cc3 := resize(to_unsigned(0, 1), 2);
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue := VAR_result_vram_value_uxn_device_h_l187_c4_9cc3;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right := to_unsigned(14, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_right := to_unsigned(10, 4);
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l66_c20_f9fb_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse := to_unsigned(0, 1);
     VAR_result_device_ram_address_uxn_device_h_l155_c4_3117 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue := VAR_result_device_ram_address_uxn_device_h_l155_c4_3117;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse := to_unsigned(0, 1);

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_CLOCK_ENABLE;
     VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l44_c2_a928_iftrue := color;
     VAR_color_MUX_uxn_device_h_l54_c7_9fab_iftrue := color;
     VAR_color_MUX_uxn_device_h_l62_c7_583e_iffalse := color;
     VAR_color_MUX_uxn_device_h_l63_c3_2113_iffalse := color;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left := VAR_device_port;
     VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0 := resize(VAR_device_port, 32);
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse := is_fill_mode;
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left := VAR_phase;
     VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1 := resize(VAR_phase, 32);
     VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iffalse := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iffalse := sprite;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right := x;
     VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l108_c7_b58f_iftrue := x;
     VAR_x_MUX_uxn_device_h_l116_c7_e306_iffalse := x;
     VAR_x_MUX_uxn_device_h_l117_c3_7409_iffalse := x;
     VAR_x_MUX_uxn_device_h_l44_c2_a928_iftrue := x;
     VAR_x_MUX_uxn_device_h_l54_c7_9fab_iftrue := x;
     VAR_x_MUX_uxn_device_h_l62_c7_583e_iftrue := x;
     VAR_x_MUX_uxn_device_h_l73_c7_41ca_iftrue := x;
     VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iftrue := x;
     VAR_x_MUX_uxn_device_h_l90_c7_04a4_iftrue := x;
     VAR_x_MUX_uxn_device_h_l99_c3_8afe_iffalse := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left := y;
     VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l108_c7_b58f_iftrue := y;
     VAR_y_MUX_uxn_device_h_l116_c7_e306_iftrue := y;
     VAR_y_MUX_uxn_device_h_l125_c7_6575_iftrue := y;
     VAR_y_MUX_uxn_device_h_l134_c3_f672_iffalse := y;
     VAR_y_MUX_uxn_device_h_l143_c7_48dd_iftrue := y;
     VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iffalse := y;
     VAR_y_MUX_uxn_device_h_l152_c3_59f2_iffalse := y;
     VAR_y_MUX_uxn_device_h_l44_c2_a928_iftrue := y;
     VAR_y_MUX_uxn_device_h_l54_c7_9fab_iftrue := y;
     VAR_y_MUX_uxn_device_h_l62_c7_583e_iftrue := y;
     VAR_y_MUX_uxn_device_h_l73_c7_41ca_iftrue := y;
     VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_04a4_iftrue := y;
     VAR_y_MUX_uxn_device_h_l98_c7_bb50_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l126_c7_255b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l126_c7_255b_left <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_left;
     BIN_OP_EQ_uxn_device_h_l126_c7_255b_right <= VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output := BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l90_c11_e827] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_e827_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_e827_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l65_c12_32b3] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_32b3_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_AND[uxn_device_h_l66_c20_1a46] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l66_c20_1a46_left <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_left;
     BIN_OP_AND_uxn_device_h_l66_c20_1a46_right <= VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output := BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output;

     -- BIN_OP_EQ[uxn_device_h_l144_c7_42e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_left;
     BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right <= VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output := BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output;

     -- BIN_OP_EQ[uxn_device_h_l117_c7_bcca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_left;
     BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right <= VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output := BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l182_c11_266c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l182_c11_266c_left <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_left;
     BIN_OP_EQ_uxn_device_h_l182_c11_266c_right <= VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output := BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l73_c11_f792] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l73_c11_f792_left <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_left;
     BIN_OP_EQ_uxn_device_h_l73_c11_f792_right <= VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output := BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;

     -- BIN_OP_EQ[uxn_device_h_l44_c6_b9fe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_left;
     BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right <= VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output := BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;

     -- BIN_OP_EQ[uxn_device_h_l81_c11_dabf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_left;
     BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right <= VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output := BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;

     -- BIN_OP_EQ[uxn_device_h_l98_c11_97eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_left;
     BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right <= VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output := BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l74_c7_7015] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l74_c7_7015_left <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_left;
     BIN_OP_EQ_uxn_device_h_l74_c7_7015_right <= VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output := BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output;

     -- BIN_OP_EQ[uxn_device_h_l116_c11_6225] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l116_c11_6225_left <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_left;
     BIN_OP_EQ_uxn_device_h_l116_c11_6225_right <= VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output := BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;

     -- BIN_OP_EQ[uxn_device_h_l45_c7_4111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l45_c7_4111_left <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_left;
     BIN_OP_EQ_uxn_device_h_l45_c7_4111_right <= VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output := BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output;

     -- BIN_OP_EQ[uxn_device_h_l152_c7_65f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_left;
     BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right <= VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output := BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l125_c11_0e9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_left;
     BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right <= VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output := BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l134_c7_df4e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_left;
     BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right <= VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output := BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l109_c7_18b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_left;
     BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right <= VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output := BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output;

     -- BIN_OP_EQ[uxn_device_h_l62_c11_0c7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_left;
     BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right <= VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output := BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l143_c11_9644] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l143_c11_9644_left <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_left;
     BIN_OP_EQ_uxn_device_h_l143_c11_9644_right <= VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output := BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output := result.is_device_ram_read;

     -- BIN_OP_EQ[uxn_device_h_l63_c7_e2da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_left;
     BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right <= VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output := BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_9a3b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l151_c11_0a72] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_left;
     BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right <= VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output := BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;

     -- CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4 LATENCY=0
     VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output := result.vram_value;

     -- BIN_OP_EQ[uxn_device_h_l170_c7_f9f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_left;
     BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right <= VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output := BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;

     -- BIN_OP_EQ[uxn_device_h_l160_c11_03d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_left;
     BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right <= VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output := BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l169_c11_01fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_left;
     BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right <= VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output := BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l54_c11_a72c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_left;
     BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right <= VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output := BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l176_c27_c49b] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_c49b_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CAST_TO_uint4_t[uxn_device_h_l171_c91_1ed7] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_1ed7_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l183_c7_c77e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_left;
     BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right <= VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output := BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l161_c7_874c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l161_c7_874c_left <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_left;
     BIN_OP_EQ_uxn_device_h_l161_c7_874c_right <= VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output := BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l82_c7_8bd1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_left;
     BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right <= VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output := BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c7_4c1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_left;
     BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output := BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output := result.is_deo_done;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_79b9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_79b9_return_output := result.is_device_ram_write;

     -- BIN_OP_EQ[uxn_device_h_l133_c11_f962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l133_c11_f962_left <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_left;
     BIN_OP_EQ_uxn_device_h_l133_c11_f962_right <= VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output := BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output := result.device_ram_address;

     -- printf_uxn_device_h_l42_c2_e239[uxn_device_h_l42_c2_e239] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0 <= VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg0;
     printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1 <= VAR_printf_uxn_device_h_l42_c2_e239_uxn_device_h_l42_c2_e239_arg1;
     -- Outputs

     -- BIN_OP_EQ[uxn_device_h_l55_c7_f90f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_left;
     BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right <= VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output := BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output;

     -- CAST_TO_uint32_t[uxn_device_h_l176_c63_7987] LATENCY=0
     VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7987_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l162_c27_3c06] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l108_c11_938f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l108_c11_938f_left <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_left;
     BIN_OP_EQ_uxn_device_h_l108_c11_938f_right <= VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output := BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;

     -- Submodule level 1
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_left := VAR_BIN_OP_AND_uxn_device_h_l66_c20_1a46_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l108_c11_938f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond := VAR_BIN_OP_EQ_uxn_device_h_l109_c7_18b5_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_e306_cond := VAR_BIN_OP_EQ_uxn_device_h_l116_c11_6225_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_7409_cond := VAR_BIN_OP_EQ_uxn_device_h_l117_c7_bcca_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_6575_cond := VAR_BIN_OP_EQ_uxn_device_h_l125_c11_0e9b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond := VAR_BIN_OP_EQ_uxn_device_h_l126_c7_255b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_3877_cond := VAR_BIN_OP_EQ_uxn_device_h_l133_c11_f962_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_f672_cond := VAR_BIN_OP_EQ_uxn_device_h_l134_c7_df4e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_48dd_cond := VAR_BIN_OP_EQ_uxn_device_h_l143_c11_9644_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond := VAR_BIN_OP_EQ_uxn_device_h_l144_c7_42e2_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_d9ef_cond := VAR_BIN_OP_EQ_uxn_device_h_l151_c11_0a72_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_59f2_cond := VAR_BIN_OP_EQ_uxn_device_h_l152_c7_65f1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond := VAR_BIN_OP_EQ_uxn_device_h_l160_c11_03d0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond := VAR_BIN_OP_EQ_uxn_device_h_l161_c7_874c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond := VAR_BIN_OP_EQ_uxn_device_h_l169_c11_01fc_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond := VAR_BIN_OP_EQ_uxn_device_h_l170_c7_f9f4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond := VAR_BIN_OP_EQ_uxn_device_h_l182_c11_266c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond := VAR_BIN_OP_EQ_uxn_device_h_l183_c7_c77e_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_a928_cond := VAR_BIN_OP_EQ_uxn_device_h_l44_c6_b9fe_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond := VAR_BIN_OP_EQ_uxn_device_h_l45_c7_4111_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_9fab_cond := VAR_BIN_OP_EQ_uxn_device_h_l54_c11_a72c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond := VAR_BIN_OP_EQ_uxn_device_h_l55_c7_f90f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_583e_cond := VAR_BIN_OP_EQ_uxn_device_h_l62_c11_0c7e_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_pixel_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond := VAR_BIN_OP_EQ_uxn_device_h_l63_c7_e2da_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_41ca_cond := VAR_BIN_OP_EQ_uxn_device_h_l73_c11_f792_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond := VAR_BIN_OP_EQ_uxn_device_h_l74_c7_7015_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_3fd8_cond := VAR_BIN_OP_EQ_uxn_device_h_l81_c11_dabf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output;
     VAR_sprite_MUX_uxn_device_h_l82_c3_c348_cond := VAR_BIN_OP_EQ_uxn_device_h_l82_c7_8bd1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_04a4_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_e827_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_9a3b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_bb50_cond := VAR_BIN_OP_EQ_uxn_device_h_l98_c11_97eb_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_8afe_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c7_4c1f_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l162_c27_3c06_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l135_l153_l118_l100_DUPLICATE_64f2_return_output;
     VAR_color_MUX_uxn_device_h_l63_c3_2113_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l65_c12_32b3_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c27_c49b_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right := VAR_CAST_TO_uint32_t_uxn_device_h_l176_c63_7987_return_output;
     VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l171_c91_1ed7_return_output, 32);
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l117_l134_l152_l91_l109_l74_l82_DUPLICATE_d9ad_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_read_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_c497_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_79b9_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l45_l44_DUPLICATE_79b9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_08fa_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_CONST_REF_RD_uint2_t_device_out_result_t_vram_value_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_48d4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l98_l151_l170_l90_l143_l81_l133_l73_l125_l182_l62_l116_l54_l183_l108_l160_l44_DUPLICATE_007a_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l55_l126_l170_l99_l63_l144_l161_l45_l117_l134_l152_l91_l169_l109_l74_l82_DUPLICATE_cfdd_return_output;
     -- pixel_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_pixel_MUX_uxn_device_h_l63_c3_2113_cond;
     pixel_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iftrue;
     pixel_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_pixel_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l63_c3_2113_return_output := pixel_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l134_c3_f672] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_cond;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output := result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l74_c3_19cf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_cond;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output := result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_cond;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output := result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- color_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_color_MUX_uxn_device_h_l63_c3_2113_cond;
     color_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_color_MUX_uxn_device_h_l63_c3_2113_iftrue;
     color_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_color_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l63_c3_2113_return_output := color_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l117_c3_7409] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_cond;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output := result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l91_c3_f5a3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output := CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l117_c3_7409] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output := result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l109_c3_b015] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_cond;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output := result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l74_c3_19cf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_cond;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output := result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c3_8afe] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l109_c3_b015] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output := result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l152_c3_59f2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_cond;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output := result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output;

     -- result_vram_value_MUX[uxn_device_h_l183_c3_1257] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_cond;
     result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iftrue;
     result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output := result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output;

     -- sprite_MUX[uxn_device_h_l82_c3_c348] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l82_c3_c348_cond <= VAR_sprite_MUX_uxn_device_h_l82_c3_c348_cond;
     sprite_MUX_uxn_device_h_l82_c3_c348_iftrue <= VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iftrue;
     sprite_MUX_uxn_device_h_l82_c3_c348_iffalse <= VAR_sprite_MUX_uxn_device_h_l82_c3_c348_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l82_c3_c348_return_output := sprite_MUX_uxn_device_h_l82_c3_c348_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output := result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_f5a3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l176_c27_6cf6] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l126_c3_1e25] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output := result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l99_c3_8afe] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output := result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l182_c7_7594] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_cond;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output := result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_cond;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output := result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- BIN_OP_OR[uxn_device_h_l118_c4_785b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l118_c4_785b_left <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_left;
     BIN_OP_OR_uxn_device_h_l118_c4_785b_right <= VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output := BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output;

     -- result_vram_value_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output := result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_f5a3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l126_c3_1e25] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_cond;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output := result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output;

     -- BIN_OP_OR[uxn_device_h_l153_c4_ca1c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_left;
     BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right <= VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output := BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l55_c3_46b3] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output := result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output := result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l183_c3_1257] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_cond;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output := result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l82_c3_c348] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_cond;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output := result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l152_c3_59f2] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output := result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l45_c3_9eba] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output := result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output := result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l162_c27_d77a] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_left;
     BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right <= VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output := BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l183_c3_1257] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_cond;
     result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iftrue;
     result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output := result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l55_c3_46b3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_cond;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output := result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l82_c3_c348] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_cond;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output := result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l152_c3_59f2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_cond;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output := result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c3_8afe] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l45_c3_9eba] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output := result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l45_c3_9eba] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_cond;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output := result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l55_c3_46b3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_cond;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output := result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l144_c3_badc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_cond;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output := result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l66_c20_4663] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l66_c20_4663_left <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_left;
     BIN_OP_EQ_uxn_device_h_l66_c20_4663_right <= VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output := BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output;

     -- auto_advance_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_cond;
     auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output := auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l144_c3_badc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_cond;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output := result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l161_c3_c500] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output := result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l144_c3_badc] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output := result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l117_c3_7409] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_cond;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output := result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l74_c3_19cf] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output := result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output := result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l161_c3_c500] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_cond;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output := result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l134_c3_f672] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output := result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l45_c3_9eba] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_cond;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output := result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l126_c3_1e25] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_cond;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output := result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output := result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l82_c3_c348] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output := result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l109_c3_b015] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_cond;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output := result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l134_c3_f672] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_cond;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output := result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l66_c20_f9fb_cond := VAR_BIN_OP_EQ_uxn_device_h_l66_c20_4663_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l176_c27_6cf6_return_output;
     VAR_x_MUX_uxn_device_h_l117_c3_7409_iftrue := VAR_BIN_OP_OR_uxn_device_h_l118_c4_785b_return_output;
     VAR_y_MUX_uxn_device_h_l152_c3_59f2_iftrue := VAR_BIN_OP_OR_uxn_device_h_l153_c4_ca1c_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_left := VAR_BIN_OP_PLUS_uxn_device_h_l162_c27_d77a_return_output;
     VAR_x_MUX_uxn_device_h_l99_c3_8afe_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output;
     VAR_y_MUX_uxn_device_h_l134_c3_f672_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l101_l136_DUPLICATE_012f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_auto_advance_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_color_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_color_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_pixel_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l109_c3_b015_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l117_c3_7409_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l126_c3_1e25_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l134_c3_f672_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l144_c3_badc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l152_c3_59f2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l161_c3_c500_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l45_c3_9eba_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l55_c3_46b3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l74_c3_19cf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l82_c3_c348_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_f5a3_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c3_8afe_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l109_c3_b015_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l117_c3_7409_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l126_c3_1e25_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l134_c3_f672_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l144_c3_badc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l152_c3_59f2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l182_c7_7594_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l45_c3_9eba_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l55_c3_46b3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l74_c3_19cf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l82_c3_c348_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_f5a3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c3_8afe_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l109_c3_b015_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l117_c3_7409_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l126_c3_1e25_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l134_c3_f672_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l144_c3_badc_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l152_c3_59f2_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l161_c3_c500_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l45_c3_9eba_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l55_c3_46b3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l74_c3_19cf_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l82_c3_c348_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l91_c3_f5a3_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_result_is_device_ram_read_MUX_uxn_device_h_l99_c3_8afe_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue := VAR_result_is_device_ram_write_MUX_uxn_device_h_l45_c3_9eba_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l183_c3_1257_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l183_c3_1257_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue := VAR_result_vram_value_MUX_uxn_device_h_l183_c3_1257_return_output;
     VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue := VAR_sprite_MUX_uxn_device_h_l82_c3_c348_return_output;
     -- color_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_color_MUX_uxn_device_h_l62_c7_583e_cond;
     color_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_color_MUX_uxn_device_h_l62_c7_583e_iftrue;
     color_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_color_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l62_c7_583e_return_output := color_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- MUX[uxn_device_h_l66_c20_f9fb] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l66_c20_f9fb_cond <= VAR_MUX_uxn_device_h_l66_c20_f9fb_cond;
     MUX_uxn_device_h_l66_c20_f9fb_iftrue <= VAR_MUX_uxn_device_h_l66_c20_f9fb_iftrue;
     MUX_uxn_device_h_l66_c20_f9fb_iffalse <= VAR_MUX_uxn_device_h_l66_c20_f9fb_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l66_c20_f9fb_return_output := MUX_uxn_device_h_l66_c20_f9fb_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- BIN_OP_GT[uxn_device_h_l162_c27_7685] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l162_c27_7685_left <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_left;
     BIN_OP_GT_uxn_device_h_l162_c27_7685_right <= VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output := BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output := result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- result_vram_value_MUX[uxn_device_h_l182_c7_7594] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_cond;
     result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iftrue;
     result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output := result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output;

     -- auto_advance_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_cond;
     auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output := auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- x_MUX[uxn_device_h_l117_c3_7409] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l117_c3_7409_cond <= VAR_x_MUX_uxn_device_h_l117_c3_7409_cond;
     x_MUX_uxn_device_h_l117_c3_7409_iftrue <= VAR_x_MUX_uxn_device_h_l117_c3_7409_iftrue;
     x_MUX_uxn_device_h_l117_c3_7409_iffalse <= VAR_x_MUX_uxn_device_h_l117_c3_7409_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l117_c3_7409_return_output := x_MUX_uxn_device_h_l117_c3_7409_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output := result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- sprite_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_cond;
     sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output := sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l176_c27_eb19] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_left;
     BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right <= VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output := BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output := result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l182_c7_7594] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_cond;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output := result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output;

     -- pixel_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_pixel_MUX_uxn_device_h_l62_c7_583e_cond;
     pixel_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iftrue;
     pixel_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_pixel_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l62_c7_583e_return_output := pixel_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- x_MUX[uxn_device_h_l99_c3_8afe] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c3_8afe_cond <= VAR_x_MUX_uxn_device_h_l99_c3_8afe_cond;
     x_MUX_uxn_device_h_l99_c3_8afe_iftrue <= VAR_x_MUX_uxn_device_h_l99_c3_8afe_iftrue;
     x_MUX_uxn_device_h_l99_c3_8afe_iffalse <= VAR_x_MUX_uxn_device_h_l99_c3_8afe_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c3_8afe_return_output := x_MUX_uxn_device_h_l99_c3_8afe_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output := result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- y_MUX[uxn_device_h_l152_c3_59f2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l152_c3_59f2_cond <= VAR_y_MUX_uxn_device_h_l152_c3_59f2_cond;
     y_MUX_uxn_device_h_l152_c3_59f2_iftrue <= VAR_y_MUX_uxn_device_h_l152_c3_59f2_iftrue;
     y_MUX_uxn_device_h_l152_c3_59f2_iffalse <= VAR_y_MUX_uxn_device_h_l152_c3_59f2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l152_c3_59f2_return_output := y_MUX_uxn_device_h_l152_c3_59f2_return_output;

     -- y_MUX[uxn_device_h_l134_c3_f672] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l134_c3_f672_cond <= VAR_y_MUX_uxn_device_h_l134_c3_f672_cond;
     y_MUX_uxn_device_h_l134_c3_f672_iftrue <= VAR_y_MUX_uxn_device_h_l134_c3_f672_iftrue;
     y_MUX_uxn_device_h_l134_c3_f672_iffalse <= VAR_y_MUX_uxn_device_h_l134_c3_f672_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l134_c3_f672_return_output := y_MUX_uxn_device_h_l134_c3_f672_return_output;

     -- result_vram_address_MUX[uxn_device_h_l182_c7_7594] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_cond;
     result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iftrue;
     result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output := result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l162_c27_7347_cond := VAR_BIN_OP_GT_uxn_device_h_l162_c27_7685_return_output;
     VAR_result_vram_address_uxn_device_h_l176_c4_a1a7 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l176_c27_eb19_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue := VAR_MUX_uxn_device_h_l66_c20_f9fb_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_color_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_color_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_pixel_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l182_c7_7594_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l182_c7_7594_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l182_c7_7594_return_output;
     VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_sprite_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_x_MUX_uxn_device_h_l116_c7_e306_iftrue := VAR_x_MUX_uxn_device_h_l117_c3_7409_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_bb50_iftrue := VAR_x_MUX_uxn_device_h_l99_c3_8afe_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_3877_iftrue := VAR_y_MUX_uxn_device_h_l134_c3_f672_return_output;
     VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iftrue := VAR_y_MUX_uxn_device_h_l152_c3_59f2_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue := VAR_result_vram_address_uxn_device_h_l176_c4_a1a7;
     -- x_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_x_MUX_uxn_device_h_l116_c7_e306_cond;
     x_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_x_MUX_uxn_device_h_l116_c7_e306_iftrue;
     x_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_x_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l116_c7_e306_return_output := x_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_vram_value_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output := result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_cond;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output := result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- sprite_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_cond;
     sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_return_output := sprite_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_vram_address_MUX[uxn_device_h_l170_c3_cca9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_cond;
     result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iftrue;
     result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output := result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- MUX[uxn_device_h_l162_c27_7347] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l162_c27_7347_cond <= VAR_MUX_uxn_device_h_l162_c27_7347_cond;
     MUX_uxn_device_h_l162_c27_7347_iftrue <= VAR_MUX_uxn_device_h_l162_c27_7347_iftrue;
     MUX_uxn_device_h_l162_c27_7347_iffalse <= VAR_MUX_uxn_device_h_l162_c27_7347_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l162_c27_7347_return_output := MUX_uxn_device_h_l162_c27_7347_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output := result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- y_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_y_MUX_uxn_device_h_l151_c7_d9ef_cond;
     y_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     y_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_y_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l151_c7_d9ef_return_output := y_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- auto_advance_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_cond;
     auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iftrue;
     auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output := auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- color_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_color_MUX_uxn_device_h_l54_c7_9fab_cond;
     color_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_color_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     color_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_color_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l54_c7_9fab_return_output := color_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- pixel_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_cond;
     pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_return_output := pixel_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output := result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l63_c3_2113] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_cond;
     is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iftrue;
     is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output := is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output;

     -- Submodule level 4
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue := VAR_MUX_uxn_device_h_l162_c27_7347_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_auto_advance_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_color_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_color_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l63_c3_2113_return_output;
     VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_pixel_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l170_c3_cca9_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_sprite_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_x_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_x_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_y_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_y_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     -- result_vram_value_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_cond;
     result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output := result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_cond;
     result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output := result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- color_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_color_MUX_uxn_device_h_l44_c2_a928_cond;
     color_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_color_MUX_uxn_device_h_l44_c2_a928_iftrue;
     color_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_color_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l44_c2_a928_return_output := color_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- x_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_x_MUX_uxn_device_h_l108_c7_b58f_cond;
     x_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_x_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     x_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_x_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l108_c7_b58f_return_output := x_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- y_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_y_MUX_uxn_device_h_l143_c7_48dd_cond;
     y_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_y_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     y_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_y_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l143_c7_48dd_return_output := y_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- sprite_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_sprite_MUX_uxn_device_h_l62_c7_583e_cond;
     sprite_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iftrue;
     sprite_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_sprite_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l62_c7_583e_return_output := sprite_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- pixel_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_pixel_MUX_uxn_device_h_l44_c2_a928_cond;
     pixel_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iftrue;
     pixel_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_pixel_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l44_c2_a928_return_output := pixel_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- auto_advance_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_cond;
     auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output := auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l161_c3_c500] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_cond;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output := result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_cond;
     is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iftrue;
     is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output := is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- Submodule level 5
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_auto_advance_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l62_c7_583e_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l161_c3_c500_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_sprite_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_x_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_x_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_y_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_y_MUX_uxn_device_h_l143_c7_48dd_return_output;
     -- result_vram_value_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_cond;
     is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output := is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- sprite_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_cond;
     sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_return_output := sprite_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- auto_advance_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_cond;
     auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output := auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output := result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output := result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- x_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_x_MUX_uxn_device_h_l98_c7_bb50_cond;
     x_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_x_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     x_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_x_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l98_c7_bb50_return_output := x_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- y_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_y_MUX_uxn_device_h_l133_c7_3877_cond;
     y_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_y_MUX_uxn_device_h_l133_c7_3877_iftrue;
     y_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_y_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l133_c7_3877_return_output := y_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_cond;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output := result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_cond;
     result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output := result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- Submodule level 6
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_auto_advance_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_sprite_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_x_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_y_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_y_MUX_uxn_device_h_l133_c7_3877_return_output;
     -- x_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_x_MUX_uxn_device_h_l90_c7_04a4_cond;
     x_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     x_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_04a4_return_output := x_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output := result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- sprite_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_sprite_MUX_uxn_device_h_l44_c2_a928_cond;
     sprite_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iftrue;
     sprite_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_sprite_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l44_c2_a928_return_output := sprite_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output := result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_vram_address_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_cond;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output := result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- auto_advance_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_cond;
     auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iftrue;
     auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output := auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_cond;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output := result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output := result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- y_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_y_MUX_uxn_device_h_l125_c7_6575_cond;
     y_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_y_MUX_uxn_device_h_l125_c7_6575_iftrue;
     y_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_y_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l125_c7_6575_return_output := y_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_cond;
     is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iftrue;
     is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output := is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- Submodule level 7
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_auto_advance_MUX_uxn_device_h_l133_c7_3877_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l143_c7_48dd_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_y_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_y_MUX_uxn_device_h_l125_c7_6575_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_cond;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output := result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output := result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- result_vram_address_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_cond;
     result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output := result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- x_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_x_MUX_uxn_device_h_l81_c7_3fd8_cond;
     x_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     x_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_x_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l81_c7_3fd8_return_output := x_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output := result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- auto_advance_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_cond;
     auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iftrue;
     auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output := auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_cond;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output := result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- y_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_y_MUX_uxn_device_h_l116_c7_e306_cond;
     y_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_y_MUX_uxn_device_h_l116_c7_e306_iftrue;
     y_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_y_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l116_c7_e306_return_output := y_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_vram_value_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_cond;
     result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output := result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_auto_advance_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_x_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_x_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_y_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_y_MUX_uxn_device_h_l116_c7_e306_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_cond;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output := result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- result_vram_value_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_cond;
     result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output := result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output := result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_cond;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output := result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- x_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_x_MUX_uxn_device_h_l73_c7_41ca_cond;
     x_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_x_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     x_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_x_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l73_c7_41ca_return_output := x_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- auto_advance_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_cond;
     auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iftrue;
     auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output := auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- y_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_y_MUX_uxn_device_h_l108_c7_b58f_cond;
     y_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_y_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     y_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_y_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l108_c7_b58f_return_output := y_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_cond;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output := result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_vram_address_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_cond;
     result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iftrue;
     result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output := result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_auto_advance_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_x_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_x_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_y_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_y_MUX_uxn_device_h_l108_c7_b58f_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_cond;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output := result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- y_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_y_MUX_uxn_device_h_l98_c7_bb50_cond;
     y_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_y_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     y_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_y_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l98_c7_bb50_return_output := y_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- x_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_x_MUX_uxn_device_h_l62_c7_583e_cond;
     x_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_x_MUX_uxn_device_h_l62_c7_583e_iftrue;
     x_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_x_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l62_c7_583e_return_output := x_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output := result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_cond;
     result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output := result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_vram_address_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_cond;
     result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output := result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- auto_advance_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_cond;
     auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output := auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output := result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l125_c7_6575] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_cond;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output := result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_auto_advance_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l125_c7_6575_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_x_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_x_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_y_MUX_uxn_device_h_l98_c7_bb50_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_cond;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output := result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output := result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output := result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- auto_advance_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_cond;
     auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output := auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output := result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l133_c7_3877] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output;

     -- result_vram_address_MUX[uxn_device_h_l116_c7_e306] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_cond;
     result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iftrue;
     result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output := result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output;

     -- x_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_x_MUX_uxn_device_h_l54_c7_9fab_cond;
     x_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_x_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     x_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_x_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l54_c7_9fab_return_output := x_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- y_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_y_MUX_uxn_device_h_l90_c7_04a4_cond;
     y_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     y_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_04a4_return_output := y_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output := result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l133_c7_3877_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_auto_advance_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l116_c7_e306_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_x_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_x_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_04a4_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l143_c7_48dd] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output := result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output := result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- x_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_x_MUX_uxn_device_h_l44_c2_a928_cond;
     x_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_x_MUX_uxn_device_h_l44_c2_a928_iftrue;
     x_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_x_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l44_c2_a928_return_output := x_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- y_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_y_MUX_uxn_device_h_l81_c7_3fd8_cond;
     y_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     y_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_y_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l81_c7_3fd8_return_output := y_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output := result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output := auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output := result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- result_vram_address_MUX[uxn_device_h_l108_c7_b58f] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_cond;
     result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iftrue;
     result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output := result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l143_c7_48dd_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l108_c7_b58f_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l98_c7_bb50_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_y_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_y_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     -- y_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_y_MUX_uxn_device_h_l73_c7_41ca_cond;
     y_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_y_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     y_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_y_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l73_c7_41ca_return_output := y_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_vram_address_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output := result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l151_c7_d9ef] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_vram_value_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output := result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l98_c7_bb50] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_cond;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output := result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output;

     -- auto_advance_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_cond;
     auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output := auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l151_c7_d9ef_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_auto_advance_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l98_c7_bb50_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_y_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_y_MUX_uxn_device_h_l73_c7_41ca_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output := result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_vram_value_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- y_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_y_MUX_uxn_device_h_l62_c7_583e_cond;
     y_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_y_MUX_uxn_device_h_l62_c7_583e_iftrue;
     y_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_y_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l62_c7_583e_return_output := y_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c7_108a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l90_c7_04a4] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output := result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- auto_advance_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_cond;
     auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output := auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c7_108a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_04a4_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_y_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_y_MUX_uxn_device_h_l62_c7_583e_return_output;
     -- y_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_y_MUX_uxn_device_h_l54_c7_9fab_cond;
     y_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_y_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     y_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_y_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l54_c7_9fab_return_output := y_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_vram_value_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output := result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output := result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_cond;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output := result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- auto_advance_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_cond;
     auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iftrue;
     auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output := auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l81_c7_3fd8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_cond;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output := result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c7_3b50] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output := result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c7_3b50_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_auto_advance_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l81_c7_3fd8_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_y_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_y_MUX_uxn_device_h_l54_c7_9fab_return_output;
     -- result_vram_value_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_cond;
     result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output := result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_cond;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output := result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output := result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- result_is_device_ram_read_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output := result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l73_c7_41ca] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_cond;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output := result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output;

     -- auto_advance_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_cond;
     auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output := auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l169_c1_9364] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output := result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- y_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_y_MUX_uxn_device_h_l44_c2_a928_cond;
     y_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_y_MUX_uxn_device_h_l44_c2_a928_iftrue;
     y_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_y_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l44_c2_a928_return_output := y_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l169_c1_9364_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_auto_advance_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_is_device_ram_read_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l73_c7_41ca_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l62_c7_583e_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l44_c2_a928_return_output;
     -- result_is_device_ram_read_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_cond;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output := result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_cond;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output := result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- auto_advance_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_cond;
     auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iftrue;
     auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output := auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_vram_address_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_cond;
     result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output := result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l170_c1_6a0f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output;

     -- result_vram_value_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output := result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output := result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l62_c7_583e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_cond;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output := result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output;

     -- Submodule level 17
     VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l170_c1_6a0f_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l44_c2_a928_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l62_c7_583e_return_output;
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_vram_value_MUX_uxn_device_h_l54_c7_9fab_return_output;
     -- printf_uxn_device_h_l171_c4_9e1f[uxn_device_h_l171_c4_9e1f] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0 <= VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg0;
     printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1 <= VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg1;
     printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2 <= VAR_printf_uxn_device_h_l171_c4_9e1f_uxn_device_h_l171_c4_9e1f_arg2;
     -- Outputs

     -- result_is_deo_done_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output := result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_cond;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output := result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_vram_value_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_cond;
     result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output := result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_vram_address_MUX[uxn_device_h_l54_c7_9fab] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_cond;
     result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iftrue;
     result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output := result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output;

     -- Submodule level 18
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l54_c7_9fab_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l54_c7_9fab_return_output;
     -- result_vram_address_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_cond;
     result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output := result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l44_c2_a928] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_cond;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output := result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output;

     -- Submodule level 19
     -- CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6_uxn_device_h_l196_l35_DUPLICATE_370e LATENCY=0
     VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6_uxn_device_h_l196_l35_DUPLICATE_370e_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6(
     result,
     VAR_result_vram_address_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_is_deo_done_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_is_device_ram_read_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_vram_value_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l44_c2_a928_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l44_c2_a928_return_output);

     -- Submodule level 20
     REG_VAR_result := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6_uxn_device_h_l196_l35_DUPLICATE_370e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_device_out_result_t_device_out_result_t_b4d6_uxn_device_h_l196_l35_DUPLICATE_370e_return_output;
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
