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
-- Submodules: 294
entity screen_deo_0CLK_6582db05 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 device_port : in unsigned(3 downto 0);
 phase : in unsigned(7 downto 0);
 previous_device_ram_read : in unsigned(7 downto 0);
 return_output : out device_out_result_t);
end screen_deo_0CLK_6582db05;
architecture arch of screen_deo_0CLK_6582db05 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal vram_addr : unsigned(31 downto 0) := to_unsigned(0, 32);
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
is_vram_write => to_unsigned(0, 1),
vram_write_layer => to_unsigned(0, 1),
vram_address => to_unsigned(0, 32),
u8_value => to_unsigned(0, 8),
is_deo_done => to_unsigned(0, 1))
;
signal REG_COMB_vram_addr : unsigned(31 downto 0);
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
-- BIN_OP_EQ[uxn_device_h_l40_c6_5e93]
signal BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_15d2]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l40_c2_cf34]
signal auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l40_c2_cf34]
signal layer_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l40_c2_cf34]
signal color_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(1 downto 0);

-- result_MUX[uxn_device_h_l40_c2_cf34]
signal result_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal result_MUX_uxn_device_h_l40_c2_cf34_iftrue : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_cf34_iffalse : device_out_result_t;
signal result_MUX_uxn_device_h_l40_c2_cf34_return_output : device_out_result_t;

-- vram_addr_MUX[uxn_device_h_l40_c2_cf34]
signal vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l40_c2_cf34]
signal y_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l40_c2_cf34]
signal is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l40_c2_cf34]
signal pixel_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l40_c2_cf34]
signal sprite_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l40_c2_cf34]
signal x_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l42_c7_0d74]
signal BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l42_c3_5f56]
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(0 downto 0);

-- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_5f56]
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(0 downto 0);
signal result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l42_c3_5f56]
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l50_c11_57ca]
signal BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_e1bc]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l50_c7_15d2]
signal auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l50_c7_15d2]
signal layer_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l50_c7_15d2]
signal color_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l50_c7_15d2]
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l50_c7_15d2]
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l50_c7_15d2]
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l50_c7_15d2]
signal result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l50_c7_15d2]
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l50_c7_15d2]
signal result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l50_c7_15d2]
signal vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l50_c7_15d2]
signal y_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l50_c7_15d2]
signal is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l50_c7_15d2]
signal pixel_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l50_c7_15d2]
signal sprite_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l50_c7_15d2]
signal x_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l51_c7_83b1]
signal BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l51_c3_aac9]
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l51_c3_aac9]
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l57_c11_a54c]
signal BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_6ea6]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l57_c7_e1bc]
signal auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);

-- layer_MUX[uxn_device_h_l57_c7_e1bc]
signal layer_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l57_c7_e1bc]
signal color_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l57_c7_e1bc]
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l57_c7_e1bc]
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l57_c7_e1bc]
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l57_c7_e1bc]
signal result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l57_c7_e1bc]
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l57_c7_e1bc]
signal result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l57_c7_e1bc]
signal vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l57_c7_e1bc]
signal y_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(15 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l57_c7_e1bc]
signal is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l57_c7_e1bc]
signal pixel_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l57_c7_e1bc]
signal sprite_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l57_c7_e1bc]
signal x_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l58_c7_9f8b]
signal BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output : unsigned(0 downto 0);

-- layer_MUX[uxn_device_h_l58_c3_0c0b]
signal layer_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
signal layer_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);

-- color_MUX[uxn_device_h_l58_c3_0c0b]
signal color_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal color_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(1 downto 0);
signal color_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(1 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l58_c3_0c0b]
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l58_c3_0c0b]
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(7 downto 0);

-- is_fill_mode_MUX[uxn_device_h_l58_c3_0c0b]
signal is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
signal is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);

-- pixel_MUX[uxn_device_h_l58_c3_0c0b]
signal pixel_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(7 downto 0);
signal pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_device_h_l61_c20_1c69]
signal BIN_OP_AND_uxn_device_h_l61_c20_1c69_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_1c69_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l61_c20_e8e1]
signal BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l61_c20_ad21]
signal MUX_uxn_device_h_l61_c20_ad21_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_ad21_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_ad21_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l61_c20_ad21_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_device_h_l62_c13_3968]
signal BIN_OP_AND_uxn_device_h_l62_c13_3968_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_3968_right : unsigned(6 downto 0);
signal BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output : unsigned(7 downto 0);

-- MUX[uxn_device_h_l62_c13_6d2c]
signal MUX_uxn_device_h_l62_c13_6d2c_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_6d2c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_6d2c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l62_c13_6d2c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l68_c11_ecf1]
signal BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_9992]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l68_c7_6ea6]
signal auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l68_c7_6ea6]
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l68_c7_6ea6]
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l68_c7_6ea6]
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l68_c7_6ea6]
signal result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l68_c7_6ea6]
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l68_c7_6ea6]
signal result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l68_c7_6ea6]
signal vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l68_c7_6ea6]
signal y_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l68_c7_6ea6]
signal sprite_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l68_c7_6ea6]
signal x_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l69_c7_0a58]
signal BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l69_c3_92cc]
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l69_c3_92cc]
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l75_c11_b531]
signal BIN_OP_EQ_uxn_device_h_l75_c11_b531_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_b531_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_2c28]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l75_c7_9992]
signal auto_advance_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l75_c7_9992]
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l75_c7_9992]
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l75_c7_9992]
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l75_c7_9992]
signal result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l75_c7_9992]
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l75_c7_9992]
signal result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l75_c7_9992]
signal vram_addr_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l75_c7_9992]
signal y_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(15 downto 0);

-- sprite_MUX[uxn_device_h_l75_c7_9992]
signal sprite_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l75_c7_9992]
signal x_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l76_c7_10fc]
signal BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l76_c3_4f7e]
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l76_c3_4f7e]
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(7 downto 0);

-- sprite_MUX[uxn_device_h_l76_c3_4f7e]
signal sprite_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(7 downto 0);
signal sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l83_c11_9386]
signal BIN_OP_EQ_uxn_device_h_l83_c11_9386_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_9386_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_7693]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l83_c7_2c28]
signal auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l83_c7_2c28]
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l83_c7_2c28]
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l83_c7_2c28]
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l83_c7_2c28]
signal result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l83_c7_2c28]
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l83_c7_2c28]
signal result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l83_c7_2c28]
signal vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l83_c7_2c28]
signal y_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l83_c7_2c28]
signal x_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l84_c7_c00a]
signal BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l84_c3_93b9]
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l84_c3_93b9]
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l90_c11_13f9]
signal BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_2a12]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l90_c7_7693]
signal auto_advance_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l90_c7_7693]
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l90_c7_7693]
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l90_c7_7693]
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l90_c7_7693]
signal result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l90_c7_7693]
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l90_c7_7693]
signal result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l90_c7_7693]
signal vram_addr_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l90_c7_7693]
signal y_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l90_c7_7693]
signal x_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l91_c7_5af6]
signal BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l91_c3_d2d3]
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l91_c3_d2d3]
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l91_c3_d2d3]
signal x_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l99_c11_9a00]
signal BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_1244]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l99_c7_2a12]
signal auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l99_c7_2a12]
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l99_c7_2a12]
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l99_c7_2a12]
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l99_c7_2a12]
signal result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l99_c7_2a12]
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l99_c7_2a12]
signal result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l99_c7_2a12]
signal vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l99_c7_2a12]
signal y_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l99_c7_2a12]
signal x_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l100_c7_0046]
signal BIN_OP_EQ_uxn_device_h_l100_c7_0046_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_0046_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l100_c3_e13e]
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l100_c3_e13e]
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l106_c11_716b]
signal BIN_OP_EQ_uxn_device_h_l106_c11_716b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_716b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_2ac7]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l106_c7_1244]
signal auto_advance_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l106_c7_1244]
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l106_c7_1244]
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l106_c7_1244]
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l106_c7_1244]
signal result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l106_c7_1244]
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l106_c7_1244]
signal result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l106_c7_1244]
signal vram_addr_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l106_c7_1244]
signal y_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(15 downto 0);

-- x_MUX[uxn_device_h_l106_c7_1244]
signal x_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l107_c7_f0e1]
signal BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l107_c3_f278]
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l107_c3_f278]
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(7 downto 0);

-- x_MUX[uxn_device_h_l107_c3_f278]
signal x_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
signal x_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(15 downto 0);
signal x_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l108_c4_9933]
signal BIN_OP_OR_uxn_device_h_l108_c4_9933_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_9933_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l114_c11_0252]
signal BIN_OP_EQ_uxn_device_h_l114_c11_0252_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_0252_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_6b1e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l114_c7_2ac7]
signal auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l114_c7_2ac7]
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l114_c7_2ac7]
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l114_c7_2ac7]
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l114_c7_2ac7]
signal result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l114_c7_2ac7]
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l114_c7_2ac7]
signal result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l114_c7_2ac7]
signal vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l114_c7_2ac7]
signal y_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l115_c7_5d83]
signal BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l115_c3_f5f8]
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l115_c3_f5f8]
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l121_c11_b8d8]
signal BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_8204]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l121_c7_6b1e]
signal auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l121_c7_6b1e]
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l121_c7_6b1e]
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l121_c7_6b1e]
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l121_c7_6b1e]
signal result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l121_c7_6b1e]
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l121_c7_6b1e]
signal result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l121_c7_6b1e]
signal vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l121_c7_6b1e]
signal y_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l122_c7_1a2d]
signal BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l122_c3_cd3b]
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l122_c3_cd3b]
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l122_c3_cd3b]
signal y_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l130_c11_b839]
signal BIN_OP_EQ_uxn_device_h_l130_c11_b839_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_b839_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_771a]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l130_c7_8204]
signal auto_advance_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l130_c7_8204]
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l130_c7_8204]
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l130_c7_8204]
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l130_c7_8204]
signal result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l130_c7_8204]
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l130_c7_8204]
signal result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l130_c7_8204]
signal vram_addr_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l130_c7_8204]
signal y_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l131_c7_f56b]
signal BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l131_c3_9ad0]
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l131_c3_9ad0]
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l137_c11_2ab1]
signal BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_c3c8]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l137_c7_771a]
signal auto_advance_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l137_c7_771a]
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l137_c7_771a]
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l137_c7_771a]
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l137_c7_771a]
signal result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l137_c7_771a]
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l137_c7_771a]
signal result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l137_c7_771a]
signal vram_addr_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(31 downto 0);

-- y_MUX[uxn_device_h_l137_c7_771a]
signal y_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l138_c7_50aa]
signal BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l138_c3_fce5]
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l138_c3_fce5]
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(7 downto 0);

-- y_MUX[uxn_device_h_l138_c3_fce5]
signal y_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
signal y_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(15 downto 0);
signal y_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_device_h_l139_c4_9f47]
signal BIN_OP_OR_uxn_device_h_l139_c4_9f47_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_9f47_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_device_h_l145_c11_359f]
signal BIN_OP_EQ_uxn_device_h_l145_c11_359f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_359f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output : unsigned(0 downto 0);

-- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_881e]
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
signal FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l145_c7_c3c8]
signal auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l145_c7_c3c8]
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l145_c7_c3c8]
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l145_c7_c3c8]
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l145_c7_c3c8]
signal result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l145_c7_c3c8]
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l145_c7_c3c8]
signal result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l145_c7_c3c8]
signal vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l146_c7_2cbb]
signal BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l146_c3_ddbf]
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l146_c3_ddbf]
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output : unsigned(7 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_29aa]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left : unsigned(15 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right : unsigned(8 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output : unsigned(24 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l147_c27_51a6]
signal BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left : unsigned(24 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output : unsigned(25 downto 0);

-- BIN_OP_GT[uxn_device_h_l147_c27_3f18]
signal BIN_OP_GT_uxn_device_h_l147_c27_3f18_left : unsigned(25 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3f18_right : unsigned(17 downto 0);
signal BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l147_c27_4b19]
signal MUX_uxn_device_h_l147_c27_4b19_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_4b19_iftrue : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_4b19_iffalse : unsigned(0 downto 0);
signal MUX_uxn_device_h_l147_c27_4b19_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_device_h_l153_c11_cde0]
signal BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_9cd5]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l153_c7_881e]
signal auto_advance_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l153_c7_881e]
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l153_c7_881e]
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l153_c7_881e]
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l153_c7_881e]
signal result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l153_c7_881e]
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l153_c7_881e]
signal result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l153_c7_881e]
signal vram_addr_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(31 downto 0);

-- BIN_OP_EQ[uxn_device_h_l154_c7_5988]
signal BIN_OP_EQ_uxn_device_h_l154_c7_5988_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_5988_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_dab0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output : unsigned(0 downto 0);

-- auto_advance_MUX[uxn_device_h_l154_c3_bea9]
signal auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
signal auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l154_c3_bea9]
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l154_c3_bea9]
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);

-- result_device_ram_address_MUX[uxn_device_h_l154_c3_bea9]
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
signal result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);

-- result_vram_address_MUX[uxn_device_h_l154_c3_bea9]
signal result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(31 downto 0);

-- result_vram_write_layer_MUX[uxn_device_h_l154_c3_bea9]
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
signal result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_device_h_l154_c3_bea9]
signal result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);

-- vram_addr_MUX[uxn_device_h_l154_c3_bea9]
signal vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(31 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_34dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l160_c4_0193]
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l160_c4_0193]
signal result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(31 downto 0);

-- vram_addr_MUX[uxn_device_h_l160_c4_0193]
signal vram_addr_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(31 downto 0);
signal vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_05ef]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l161_c18_9a94]
signal BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output : unsigned(64 downto 0);

-- BIN_OP_AND[uxn_device_h_l162_c5_f59b]
signal BIN_OP_AND_uxn_device_h_l162_c5_f59b_left : unsigned(31 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_f59b_right : unsigned(17 downto 0);
signal BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l163_c21_7729]
signal BIN_OP_AND_uxn_device_h_l163_c21_7729_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_7729_right : unsigned(4 downto 0);
signal BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l163_c21_cb21]
signal BIN_OP_GT_uxn_device_h_l163_c21_cb21_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_cb21_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l163_c21_c4d6]
signal MUX_uxn_device_h_l163_c21_c4d6_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l163_c21_c4d6_iftrue : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_c4d6_iffalse : unsigned(20 downto 0);
signal MUX_uxn_device_h_l163_c21_c4d6_return_output : unsigned(20 downto 0);

-- BIN_OP_OR[uxn_device_h_l163_c5_7d0c]
signal BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right : unsigned(20 downto 0);
signal BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output : unsigned(31 downto 0);

-- BIN_OP_AND[uxn_device_h_l164_c21_e7b9]
signal BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right : unsigned(5 downto 0);
signal BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_device_h_l164_c21_1616]
signal BIN_OP_GT_uxn_device_h_l164_c21_1616_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_1616_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output : unsigned(0 downto 0);

-- MUX[uxn_device_h_l164_c21_92a9]
signal MUX_uxn_device_h_l164_c21_92a9_cond : unsigned(0 downto 0);
signal MUX_uxn_device_h_l164_c21_92a9_iftrue : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_92a9_iffalse : unsigned(21 downto 0);
signal MUX_uxn_device_h_l164_c21_92a9_return_output : unsigned(21 downto 0);

-- BIN_OP_OR[uxn_device_h_l164_c5_296f]
signal BIN_OP_OR_uxn_device_h_l164_c5_296f_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_296f_right : unsigned(21 downto 0);
signal BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output : unsigned(31 downto 0);

-- BIN_OP_OR[uxn_device_h_l165_c5_1396]
signal BIN_OP_OR_uxn_device_h_l165_c5_1396_left : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_1396_right : unsigned(31 downto 0);
signal BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output : unsigned(31 downto 0);

-- printf_uxn_device_h_l168_c5_d5b1[uxn_device_h_l168_c5_d5b1]
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE : unsigned(0 downto 0);
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3 : unsigned(31 downto 0);
signal printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4 : unsigned(31 downto 0);

-- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_3acd]
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right : unsigned(31 downto 0);
signal BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output : unsigned(63 downto 0);

-- BIN_OP_PLUS[uxn_device_h_l171_c28_8428]
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left : unsigned(63 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right : unsigned(31 downto 0);
signal BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output : unsigned(64 downto 0);

-- BIN_OP_EQ[uxn_device_h_l178_c11_d0c5]
signal BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output : unsigned(0 downto 0);

-- result_is_deo_done_MUX[uxn_device_h_l178_c7_803d]
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(0 downto 0);
signal result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l178_c7_803d]
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l178_c7_803d]
signal result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(31 downto 0);

-- result_u8_value_MUX[uxn_device_h_l178_c7_803d]
signal result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_device_h_l179_c7_7115]
signal BIN_OP_EQ_uxn_device_h_l179_c7_7115_left : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_7115_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_device_h_l179_c3_9fa0]
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(0 downto 0);

-- result_vram_address_MUX[uxn_device_h_l179_c3_9fa0]
signal result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(31 downto 0);
signal result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(31 downto 0);

-- result_u8_value_MUX[uxn_device_h_l179_c3_9fa0]
signal result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7
signal CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output : unsigned(15 downto 0);

function CONST_REF_RD_device_out_result_t_device_out_result_t_dca2( ref_toks_0 : device_out_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned) return device_out_result_t is
 
  variable base : device_out_result_t; 
  variable return_output : device_out_result_t;
begin
      base := ref_toks_0;
      base.is_deo_done := ref_toks_1;
      base.is_device_ram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;

      return_output := base;
      return return_output; 
end function;

function CAST_TO_uint2_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(1 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,2)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint4_t_uint2_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(1 downto 0);
  variable return_output : unsigned(3 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,4)));
    return return_output;
end function;

function CONST_REF_RD_device_out_result_t_device_out_result_t_66f5( ref_toks_0 : device_out_result_t;
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
      base.is_deo_done := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.device_ram_address := ref_toks_3;
      base.vram_address := ref_toks_4;
      base.vram_write_layer := ref_toks_5;
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

function CAST_TO_uint32_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(31 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,32)));
    return return_output;
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_device_h_l40_c6_5e93
BIN_OP_EQ_uxn_device_h_l40_c6_5e93 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left,
BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right,
BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- auto_advance_MUX_uxn_device_h_l40_c2_cf34
auto_advance_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond,
auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue,
auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse,
auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- layer_MUX_uxn_device_h_l40_c2_cf34
layer_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l40_c2_cf34_cond,
layer_MUX_uxn_device_h_l40_c2_cf34_iftrue,
layer_MUX_uxn_device_h_l40_c2_cf34_iffalse,
layer_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- color_MUX_uxn_device_h_l40_c2_cf34
color_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l40_c2_cf34_cond,
color_MUX_uxn_device_h_l40_c2_cf34_iftrue,
color_MUX_uxn_device_h_l40_c2_cf34_iffalse,
color_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- result_MUX_uxn_device_h_l40_c2_cf34
result_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_device_out_result_t_device_out_result_t_0CLK_de264c78 port map (
result_MUX_uxn_device_h_l40_c2_cf34_cond,
result_MUX_uxn_device_h_l40_c2_cf34_iftrue,
result_MUX_uxn_device_h_l40_c2_cf34_iffalse,
result_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- vram_addr_MUX_uxn_device_h_l40_c2_cf34
vram_addr_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond,
vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue,
vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse,
vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- y_MUX_uxn_device_h_l40_c2_cf34
y_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l40_c2_cf34_cond,
y_MUX_uxn_device_h_l40_c2_cf34_iftrue,
y_MUX_uxn_device_h_l40_c2_cf34_iffalse,
y_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- is_fill_mode_MUX_uxn_device_h_l40_c2_cf34
is_fill_mode_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond,
is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue,
is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse,
is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- pixel_MUX_uxn_device_h_l40_c2_cf34
pixel_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l40_c2_cf34_cond,
pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue,
pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse,
pixel_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- sprite_MUX_uxn_device_h_l40_c2_cf34
sprite_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l40_c2_cf34_cond,
sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue,
sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse,
sprite_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- x_MUX_uxn_device_h_l40_c2_cf34
x_MUX_uxn_device_h_l40_c2_cf34 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l40_c2_cf34_cond,
x_MUX_uxn_device_h_l40_c2_cf34_iftrue,
x_MUX_uxn_device_h_l40_c2_cf34_iffalse,
x_MUX_uxn_device_h_l40_c2_cf34_return_output);

-- BIN_OP_EQ_uxn_device_h_l42_c7_0d74
BIN_OP_EQ_uxn_device_h_l42_c7_0d74 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left,
BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right,
BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56
result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond,
result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue,
result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse,
result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output);

-- result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse,
result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56
result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond,
result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue,
result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse,
result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output);

-- BIN_OP_EQ_uxn_device_h_l50_c11_57ca
BIN_OP_EQ_uxn_device_h_l50_c11_57ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left,
BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right,
BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- auto_advance_MUX_uxn_device_h_l50_c7_15d2
auto_advance_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond,
auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue,
auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse,
auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- layer_MUX_uxn_device_h_l50_c7_15d2
layer_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l50_c7_15d2_cond,
layer_MUX_uxn_device_h_l50_c7_15d2_iftrue,
layer_MUX_uxn_device_h_l50_c7_15d2_iffalse,
layer_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- color_MUX_uxn_device_h_l50_c7_15d2
color_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l50_c7_15d2_cond,
color_MUX_uxn_device_h_l50_c7_15d2_iftrue,
color_MUX_uxn_device_h_l50_c7_15d2_iffalse,
color_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2
result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond,
result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2
result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond,
result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2
result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond,
result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_vram_address_MUX_uxn_device_h_l50_c7_15d2
result_vram_address_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond,
result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2
result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- result_u8_value_MUX_uxn_device_h_l50_c7_15d2
result_u8_value_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond,
result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue,
result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse,
result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- vram_addr_MUX_uxn_device_h_l50_c7_15d2
vram_addr_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond,
vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue,
vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse,
vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- y_MUX_uxn_device_h_l50_c7_15d2
y_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l50_c7_15d2_cond,
y_MUX_uxn_device_h_l50_c7_15d2_iftrue,
y_MUX_uxn_device_h_l50_c7_15d2_iffalse,
y_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- is_fill_mode_MUX_uxn_device_h_l50_c7_15d2
is_fill_mode_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond,
is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue,
is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse,
is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- pixel_MUX_uxn_device_h_l50_c7_15d2
pixel_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l50_c7_15d2_cond,
pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue,
pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse,
pixel_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- sprite_MUX_uxn_device_h_l50_c7_15d2
sprite_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l50_c7_15d2_cond,
sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue,
sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse,
sprite_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- x_MUX_uxn_device_h_l50_c7_15d2
x_MUX_uxn_device_h_l50_c7_15d2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l50_c7_15d2_cond,
x_MUX_uxn_device_h_l50_c7_15d2_iftrue,
x_MUX_uxn_device_h_l50_c7_15d2_iffalse,
x_MUX_uxn_device_h_l50_c7_15d2_return_output);

-- BIN_OP_EQ_uxn_device_h_l51_c7_83b1
BIN_OP_EQ_uxn_device_h_l51_c7_83b1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left,
BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right,
BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9
result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond,
result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9
result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond,
result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output);

-- BIN_OP_EQ_uxn_device_h_l57_c11_a54c
BIN_OP_EQ_uxn_device_h_l57_c11_a54c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left,
BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right,
BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- auto_advance_MUX_uxn_device_h_l57_c7_e1bc
auto_advance_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond,
auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- layer_MUX_uxn_device_h_l57_c7_e1bc
layer_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l57_c7_e1bc_cond,
layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
layer_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- color_MUX_uxn_device_h_l57_c7_e1bc
color_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l57_c7_e1bc_cond,
color_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
color_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
color_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc
result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc
result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc
result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_vram_address_MUX_uxn_device_h_l57_c7_e1bc
result_vram_address_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc
result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- result_u8_value_MUX_uxn_device_h_l57_c7_e1bc
result_u8_value_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond,
result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- vram_addr_MUX_uxn_device_h_l57_c7_e1bc
vram_addr_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond,
vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- y_MUX_uxn_device_h_l57_c7_e1bc
y_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l57_c7_e1bc_cond,
y_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
y_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
y_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc
is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond,
is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- pixel_MUX_uxn_device_h_l57_c7_e1bc
pixel_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l57_c7_e1bc_cond,
pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- sprite_MUX_uxn_device_h_l57_c7_e1bc
sprite_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l57_c7_e1bc_cond,
sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- x_MUX_uxn_device_h_l57_c7_e1bc
x_MUX_uxn_device_h_l57_c7_e1bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l57_c7_e1bc_cond,
x_MUX_uxn_device_h_l57_c7_e1bc_iftrue,
x_MUX_uxn_device_h_l57_c7_e1bc_iffalse,
x_MUX_uxn_device_h_l57_c7_e1bc_return_output);

-- BIN_OP_EQ_uxn_device_h_l58_c7_9f8b
BIN_OP_EQ_uxn_device_h_l58_c7_9f8b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left,
BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right,
BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output);

-- layer_MUX_uxn_device_h_l58_c3_0c0b
layer_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
layer_MUX_uxn_device_h_l58_c3_0c0b_cond,
layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
layer_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- color_MUX_uxn_device_h_l58_c3_0c0b
color_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint2_t_uint2_t_0CLK_de264c78 port map (
color_MUX_uxn_device_h_l58_c3_0c0b_cond,
color_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
color_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
color_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b
result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond,
result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b
result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond,
result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b
is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond,
is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- pixel_MUX_uxn_device_h_l58_c3_0c0b
pixel_MUX_uxn_device_h_l58_c3_0c0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
pixel_MUX_uxn_device_h_l58_c3_0c0b_cond,
pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue,
pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse,
pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output);

-- BIN_OP_AND_uxn_device_h_l61_c20_1c69
BIN_OP_AND_uxn_device_h_l61_c20_1c69 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l61_c20_1c69_left,
BIN_OP_AND_uxn_device_h_l61_c20_1c69_right,
BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output);

-- BIN_OP_EQ_uxn_device_h_l61_c20_e8e1
BIN_OP_EQ_uxn_device_h_l61_c20_e8e1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left,
BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right,
BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output);

-- MUX_uxn_device_h_l61_c20_ad21
MUX_uxn_device_h_l61_c20_ad21 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l61_c20_ad21_cond,
MUX_uxn_device_h_l61_c20_ad21_iftrue,
MUX_uxn_device_h_l61_c20_ad21_iffalse,
MUX_uxn_device_h_l61_c20_ad21_return_output);

-- BIN_OP_AND_uxn_device_h_l62_c13_3968
BIN_OP_AND_uxn_device_h_l62_c13_3968 : entity work.BIN_OP_AND_uint8_t_uint7_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l62_c13_3968_left,
BIN_OP_AND_uxn_device_h_l62_c13_3968_right,
BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output);

-- MUX_uxn_device_h_l62_c13_6d2c
MUX_uxn_device_h_l62_c13_6d2c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l62_c13_6d2c_cond,
MUX_uxn_device_h_l62_c13_6d2c_iftrue,
MUX_uxn_device_h_l62_c13_6d2c_iffalse,
MUX_uxn_device_h_l62_c13_6d2c_return_output);

-- BIN_OP_EQ_uxn_device_h_l68_c11_ecf1
BIN_OP_EQ_uxn_device_h_l68_c11_ecf1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left,
BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right,
BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output);

-- auto_advance_MUX_uxn_device_h_l68_c7_6ea6
auto_advance_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond,
auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6
result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6
result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6
result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_vram_address_MUX_uxn_device_h_l68_c7_6ea6
result_vram_address_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6
result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- result_u8_value_MUX_uxn_device_h_l68_c7_6ea6
result_u8_value_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond,
result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- vram_addr_MUX_uxn_device_h_l68_c7_6ea6
vram_addr_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond,
vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- y_MUX_uxn_device_h_l68_c7_6ea6
y_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l68_c7_6ea6_cond,
y_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
y_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
y_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- sprite_MUX_uxn_device_h_l68_c7_6ea6
sprite_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l68_c7_6ea6_cond,
sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- x_MUX_uxn_device_h_l68_c7_6ea6
x_MUX_uxn_device_h_l68_c7_6ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l68_c7_6ea6_cond,
x_MUX_uxn_device_h_l68_c7_6ea6_iftrue,
x_MUX_uxn_device_h_l68_c7_6ea6_iffalse,
x_MUX_uxn_device_h_l68_c7_6ea6_return_output);

-- BIN_OP_EQ_uxn_device_h_l69_c7_0a58
BIN_OP_EQ_uxn_device_h_l69_c7_0a58 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left,
BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right,
BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc
result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond,
result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue,
result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse,
result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc
result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond,
result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue,
result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse,
result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output);

-- BIN_OP_EQ_uxn_device_h_l75_c11_b531
BIN_OP_EQ_uxn_device_h_l75_c11_b531 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l75_c11_b531_left,
BIN_OP_EQ_uxn_device_h_l75_c11_b531_right,
BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- auto_advance_MUX_uxn_device_h_l75_c7_9992
auto_advance_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l75_c7_9992_cond,
auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue,
auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse,
auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l75_c7_9992
result_is_deo_done_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l75_c7_9992
result_is_vram_write_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l75_c7_9992
result_device_ram_address_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_vram_address_MUX_uxn_device_h_l75_c7_9992
result_vram_address_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond,
result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output);

-- result_u8_value_MUX_uxn_device_h_l75_c7_9992
result_u8_value_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond,
result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue,
result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse,
result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output);

-- vram_addr_MUX_uxn_device_h_l75_c7_9992
vram_addr_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l75_c7_9992_cond,
vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue,
vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse,
vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output);

-- y_MUX_uxn_device_h_l75_c7_9992
y_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l75_c7_9992_cond,
y_MUX_uxn_device_h_l75_c7_9992_iftrue,
y_MUX_uxn_device_h_l75_c7_9992_iffalse,
y_MUX_uxn_device_h_l75_c7_9992_return_output);

-- sprite_MUX_uxn_device_h_l75_c7_9992
sprite_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l75_c7_9992_cond,
sprite_MUX_uxn_device_h_l75_c7_9992_iftrue,
sprite_MUX_uxn_device_h_l75_c7_9992_iffalse,
sprite_MUX_uxn_device_h_l75_c7_9992_return_output);

-- x_MUX_uxn_device_h_l75_c7_9992
x_MUX_uxn_device_h_l75_c7_9992 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l75_c7_9992_cond,
x_MUX_uxn_device_h_l75_c7_9992_iftrue,
x_MUX_uxn_device_h_l75_c7_9992_iffalse,
x_MUX_uxn_device_h_l75_c7_9992_return_output);

-- BIN_OP_EQ_uxn_device_h_l76_c7_10fc
BIN_OP_EQ_uxn_device_h_l76_c7_10fc : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left,
BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right,
BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e
result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond,
result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e
result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond,
result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output);

-- sprite_MUX_uxn_device_h_l76_c3_4f7e
sprite_MUX_uxn_device_h_l76_c3_4f7e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
sprite_MUX_uxn_device_h_l76_c3_4f7e_cond,
sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue,
sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse,
sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output);

-- BIN_OP_EQ_uxn_device_h_l83_c11_9386
BIN_OP_EQ_uxn_device_h_l83_c11_9386 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l83_c11_9386_left,
BIN_OP_EQ_uxn_device_h_l83_c11_9386_right,
BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output);

-- auto_advance_MUX_uxn_device_h_l83_c7_2c28
auto_advance_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond,
auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue,
auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse,
auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28
result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond,
result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28
result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond,
result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28
result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond,
result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_vram_address_MUX_uxn_device_h_l83_c7_2c28
result_vram_address_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond,
result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28
result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- result_u8_value_MUX_uxn_device_h_l83_c7_2c28
result_u8_value_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond,
result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue,
result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse,
result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- vram_addr_MUX_uxn_device_h_l83_c7_2c28
vram_addr_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond,
vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue,
vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse,
vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- y_MUX_uxn_device_h_l83_c7_2c28
y_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l83_c7_2c28_cond,
y_MUX_uxn_device_h_l83_c7_2c28_iftrue,
y_MUX_uxn_device_h_l83_c7_2c28_iffalse,
y_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- x_MUX_uxn_device_h_l83_c7_2c28
x_MUX_uxn_device_h_l83_c7_2c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l83_c7_2c28_cond,
x_MUX_uxn_device_h_l83_c7_2c28_iftrue,
x_MUX_uxn_device_h_l83_c7_2c28_iffalse,
x_MUX_uxn_device_h_l83_c7_2c28_return_output);

-- BIN_OP_EQ_uxn_device_h_l84_c7_c00a
BIN_OP_EQ_uxn_device_h_l84_c7_c00a : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left,
BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right,
BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9
result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond,
result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9
result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond,
result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output);

-- BIN_OP_EQ_uxn_device_h_l90_c11_13f9
BIN_OP_EQ_uxn_device_h_l90_c11_13f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left,
BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right,
BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- auto_advance_MUX_uxn_device_h_l90_c7_7693
auto_advance_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l90_c7_7693_cond,
auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue,
auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse,
auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l90_c7_7693
result_is_deo_done_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l90_c7_7693
result_is_vram_write_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l90_c7_7693
result_device_ram_address_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_vram_address_MUX_uxn_device_h_l90_c7_7693
result_vram_address_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond,
result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output);

-- result_u8_value_MUX_uxn_device_h_l90_c7_7693
result_u8_value_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond,
result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue,
result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse,
result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output);

-- vram_addr_MUX_uxn_device_h_l90_c7_7693
vram_addr_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l90_c7_7693_cond,
vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue,
vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse,
vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output);

-- y_MUX_uxn_device_h_l90_c7_7693
y_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l90_c7_7693_cond,
y_MUX_uxn_device_h_l90_c7_7693_iftrue,
y_MUX_uxn_device_h_l90_c7_7693_iffalse,
y_MUX_uxn_device_h_l90_c7_7693_return_output);

-- x_MUX_uxn_device_h_l90_c7_7693
x_MUX_uxn_device_h_l90_c7_7693 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l90_c7_7693_cond,
x_MUX_uxn_device_h_l90_c7_7693_iftrue,
x_MUX_uxn_device_h_l90_c7_7693_iffalse,
x_MUX_uxn_device_h_l90_c7_7693_return_output);

-- BIN_OP_EQ_uxn_device_h_l91_c7_5af6
BIN_OP_EQ_uxn_device_h_l91_c7_5af6 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left,
BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right,
BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3
result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond,
result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue,
result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse,
result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3
result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond,
result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue,
result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse,
result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output);

-- x_MUX_uxn_device_h_l91_c3_d2d3
x_MUX_uxn_device_h_l91_c3_d2d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l91_c3_d2d3_cond,
x_MUX_uxn_device_h_l91_c3_d2d3_iftrue,
x_MUX_uxn_device_h_l91_c3_d2d3_iffalse,
x_MUX_uxn_device_h_l91_c3_d2d3_return_output);

-- BIN_OP_EQ_uxn_device_h_l99_c11_9a00
BIN_OP_EQ_uxn_device_h_l99_c11_9a00 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left,
BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right,
BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output);

-- auto_advance_MUX_uxn_device_h_l99_c7_2a12
auto_advance_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond,
auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue,
auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse,
auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12
result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond,
result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12
result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond,
result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12
result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond,
result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_vram_address_MUX_uxn_device_h_l99_c7_2a12
result_vram_address_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond,
result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12
result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- result_u8_value_MUX_uxn_device_h_l99_c7_2a12
result_u8_value_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond,
result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue,
result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse,
result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- vram_addr_MUX_uxn_device_h_l99_c7_2a12
vram_addr_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond,
vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue,
vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse,
vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- y_MUX_uxn_device_h_l99_c7_2a12
y_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l99_c7_2a12_cond,
y_MUX_uxn_device_h_l99_c7_2a12_iftrue,
y_MUX_uxn_device_h_l99_c7_2a12_iffalse,
y_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- x_MUX_uxn_device_h_l99_c7_2a12
x_MUX_uxn_device_h_l99_c7_2a12 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l99_c7_2a12_cond,
x_MUX_uxn_device_h_l99_c7_2a12_iftrue,
x_MUX_uxn_device_h_l99_c7_2a12_iffalse,
x_MUX_uxn_device_h_l99_c7_2a12_return_output);

-- BIN_OP_EQ_uxn_device_h_l100_c7_0046
BIN_OP_EQ_uxn_device_h_l100_c7_0046 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l100_c7_0046_left,
BIN_OP_EQ_uxn_device_h_l100_c7_0046_right,
BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e
result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond,
result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e
result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond,
result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output);

-- BIN_OP_EQ_uxn_device_h_l106_c11_716b
BIN_OP_EQ_uxn_device_h_l106_c11_716b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l106_c11_716b_left,
BIN_OP_EQ_uxn_device_h_l106_c11_716b_right,
BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- auto_advance_MUX_uxn_device_h_l106_c7_1244
auto_advance_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l106_c7_1244_cond,
auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue,
auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse,
auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l106_c7_1244
result_is_deo_done_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l106_c7_1244
result_is_vram_write_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l106_c7_1244
result_device_ram_address_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_vram_address_MUX_uxn_device_h_l106_c7_1244
result_vram_address_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond,
result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output);

-- result_u8_value_MUX_uxn_device_h_l106_c7_1244
result_u8_value_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond,
result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue,
result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse,
result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output);

-- vram_addr_MUX_uxn_device_h_l106_c7_1244
vram_addr_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l106_c7_1244_cond,
vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue,
vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse,
vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output);

-- y_MUX_uxn_device_h_l106_c7_1244
y_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l106_c7_1244_cond,
y_MUX_uxn_device_h_l106_c7_1244_iftrue,
y_MUX_uxn_device_h_l106_c7_1244_iffalse,
y_MUX_uxn_device_h_l106_c7_1244_return_output);

-- x_MUX_uxn_device_h_l106_c7_1244
x_MUX_uxn_device_h_l106_c7_1244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l106_c7_1244_cond,
x_MUX_uxn_device_h_l106_c7_1244_iftrue,
x_MUX_uxn_device_h_l106_c7_1244_iffalse,
x_MUX_uxn_device_h_l106_c7_1244_return_output);

-- BIN_OP_EQ_uxn_device_h_l107_c7_f0e1
BIN_OP_EQ_uxn_device_h_l107_c7_f0e1 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left,
BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right,
BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l107_c3_f278
result_is_deo_done_MUX_uxn_device_h_l107_c3_f278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond,
result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue,
result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse,
result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l107_c3_f278
result_device_ram_address_MUX_uxn_device_h_l107_c3_f278 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond,
result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue,
result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse,
result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output);

-- x_MUX_uxn_device_h_l107_c3_f278
x_MUX_uxn_device_h_l107_c3_f278 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
x_MUX_uxn_device_h_l107_c3_f278_cond,
x_MUX_uxn_device_h_l107_c3_f278_iftrue,
x_MUX_uxn_device_h_l107_c3_f278_iffalse,
x_MUX_uxn_device_h_l107_c3_f278_return_output);

-- BIN_OP_OR_uxn_device_h_l108_c4_9933
BIN_OP_OR_uxn_device_h_l108_c4_9933 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l108_c4_9933_left,
BIN_OP_OR_uxn_device_h_l108_c4_9933_right,
BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output);

-- BIN_OP_EQ_uxn_device_h_l114_c11_0252
BIN_OP_EQ_uxn_device_h_l114_c11_0252 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l114_c11_0252_left,
BIN_OP_EQ_uxn_device_h_l114_c11_0252_right,
BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- auto_advance_MUX_uxn_device_h_l114_c7_2ac7
auto_advance_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond,
auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7
result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7
result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7
result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_vram_address_MUX_uxn_device_h_l114_c7_2ac7
result_vram_address_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7
result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- result_u8_value_MUX_uxn_device_h_l114_c7_2ac7
result_u8_value_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond,
result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- vram_addr_MUX_uxn_device_h_l114_c7_2ac7
vram_addr_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond,
vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- y_MUX_uxn_device_h_l114_c7_2ac7
y_MUX_uxn_device_h_l114_c7_2ac7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l114_c7_2ac7_cond,
y_MUX_uxn_device_h_l114_c7_2ac7_iftrue,
y_MUX_uxn_device_h_l114_c7_2ac7_iffalse,
y_MUX_uxn_device_h_l114_c7_2ac7_return_output);

-- BIN_OP_EQ_uxn_device_h_l115_c7_5d83
BIN_OP_EQ_uxn_device_h_l115_c7_5d83 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left,
BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right,
BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8
result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8
result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output);

-- BIN_OP_EQ_uxn_device_h_l121_c11_b8d8
BIN_OP_EQ_uxn_device_h_l121_c11_b8d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left,
BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right,
BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output);

-- auto_advance_MUX_uxn_device_h_l121_c7_6b1e
auto_advance_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond,
auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e
result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e
result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e
result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_vram_address_MUX_uxn_device_h_l121_c7_6b1e
result_vram_address_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e
result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- result_u8_value_MUX_uxn_device_h_l121_c7_6b1e
result_u8_value_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond,
result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- vram_addr_MUX_uxn_device_h_l121_c7_6b1e
vram_addr_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond,
vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- y_MUX_uxn_device_h_l121_c7_6b1e
y_MUX_uxn_device_h_l121_c7_6b1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l121_c7_6b1e_cond,
y_MUX_uxn_device_h_l121_c7_6b1e_iftrue,
y_MUX_uxn_device_h_l121_c7_6b1e_iffalse,
y_MUX_uxn_device_h_l121_c7_6b1e_return_output);

-- BIN_OP_EQ_uxn_device_h_l122_c7_1a2d
BIN_OP_EQ_uxn_device_h_l122_c7_1a2d : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left,
BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right,
BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b
result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond,
result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue,
result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse,
result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b
result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond,
result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue,
result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse,
result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output);

-- y_MUX_uxn_device_h_l122_c3_cd3b
y_MUX_uxn_device_h_l122_c3_cd3b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l122_c3_cd3b_cond,
y_MUX_uxn_device_h_l122_c3_cd3b_iftrue,
y_MUX_uxn_device_h_l122_c3_cd3b_iffalse,
y_MUX_uxn_device_h_l122_c3_cd3b_return_output);

-- BIN_OP_EQ_uxn_device_h_l130_c11_b839
BIN_OP_EQ_uxn_device_h_l130_c11_b839 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l130_c11_b839_left,
BIN_OP_EQ_uxn_device_h_l130_c11_b839_right,
BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output);

-- auto_advance_MUX_uxn_device_h_l130_c7_8204
auto_advance_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l130_c7_8204_cond,
auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue,
auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse,
auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l130_c7_8204
result_is_deo_done_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l130_c7_8204
result_is_vram_write_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l130_c7_8204
result_device_ram_address_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_vram_address_MUX_uxn_device_h_l130_c7_8204
result_vram_address_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond,
result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output);

-- result_u8_value_MUX_uxn_device_h_l130_c7_8204
result_u8_value_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond,
result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue,
result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse,
result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output);

-- vram_addr_MUX_uxn_device_h_l130_c7_8204
vram_addr_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l130_c7_8204_cond,
vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue,
vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse,
vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output);

-- y_MUX_uxn_device_h_l130_c7_8204
y_MUX_uxn_device_h_l130_c7_8204 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l130_c7_8204_cond,
y_MUX_uxn_device_h_l130_c7_8204_iftrue,
y_MUX_uxn_device_h_l130_c7_8204_iffalse,
y_MUX_uxn_device_h_l130_c7_8204_return_output);

-- BIN_OP_EQ_uxn_device_h_l131_c7_f56b
BIN_OP_EQ_uxn_device_h_l131_c7_f56b : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left,
BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right,
BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0
result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond,
result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue,
result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse,
result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0
result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond,
result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue,
result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse,
result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output);

-- BIN_OP_EQ_uxn_device_h_l137_c11_2ab1
BIN_OP_EQ_uxn_device_h_l137_c11_2ab1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left,
BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right,
BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- auto_advance_MUX_uxn_device_h_l137_c7_771a
auto_advance_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l137_c7_771a_cond,
auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue,
auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse,
auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l137_c7_771a
result_is_deo_done_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond,
result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l137_c7_771a
result_is_vram_write_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond,
result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l137_c7_771a
result_device_ram_address_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond,
result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_vram_address_MUX_uxn_device_h_l137_c7_771a
result_vram_address_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond,
result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a
result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output);

-- result_u8_value_MUX_uxn_device_h_l137_c7_771a
result_u8_value_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond,
result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue,
result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse,
result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output);

-- vram_addr_MUX_uxn_device_h_l137_c7_771a
vram_addr_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l137_c7_771a_cond,
vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue,
vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse,
vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output);

-- y_MUX_uxn_device_h_l137_c7_771a
y_MUX_uxn_device_h_l137_c7_771a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l137_c7_771a_cond,
y_MUX_uxn_device_h_l137_c7_771a_iftrue,
y_MUX_uxn_device_h_l137_c7_771a_iffalse,
y_MUX_uxn_device_h_l137_c7_771a_return_output);

-- BIN_OP_EQ_uxn_device_h_l138_c7_50aa
BIN_OP_EQ_uxn_device_h_l138_c7_50aa : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left,
BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right,
BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5
result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond,
result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue,
result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse,
result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5
result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond,
result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue,
result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse,
result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output);

-- y_MUX_uxn_device_h_l138_c3_fce5
y_MUX_uxn_device_h_l138_c3_fce5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
y_MUX_uxn_device_h_l138_c3_fce5_cond,
y_MUX_uxn_device_h_l138_c3_fce5_iftrue,
y_MUX_uxn_device_h_l138_c3_fce5_iffalse,
y_MUX_uxn_device_h_l138_c3_fce5_return_output);

-- BIN_OP_OR_uxn_device_h_l139_c4_9f47
BIN_OP_OR_uxn_device_h_l139_c4_9f47 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l139_c4_9f47_left,
BIN_OP_OR_uxn_device_h_l139_c4_9f47_right,
BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output);

-- BIN_OP_EQ_uxn_device_h_l145_c11_359f
BIN_OP_EQ_uxn_device_h_l145_c11_359f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l145_c11_359f_left,
BIN_OP_EQ_uxn_device_h_l145_c11_359f_right,
BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output);

-- FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse,
FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output);

-- auto_advance_MUX_uxn_device_h_l145_c7_c3c8
auto_advance_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond,
auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8
result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8
result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8
result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_vram_address_MUX_uxn_device_h_l145_c7_c3c8
result_vram_address_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8
result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- result_u8_value_MUX_uxn_device_h_l145_c7_c3c8
result_u8_value_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond,
result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- vram_addr_MUX_uxn_device_h_l145_c7_c3c8
vram_addr_MUX_uxn_device_h_l145_c7_c3c8 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond,
vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue,
vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse,
vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output);

-- BIN_OP_EQ_uxn_device_h_l146_c7_2cbb
BIN_OP_EQ_uxn_device_h_l146_c7_2cbb : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left,
BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right,
BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf
result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse,
result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf
result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse,
result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa : entity work.BIN_OP_INFERRED_MULT_uint16_t_uint9_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output);

-- BIN_OP_PLUS_uxn_device_h_l147_c27_51a6
BIN_OP_PLUS_uxn_device_h_l147_c27_51a6 : entity work.BIN_OP_PLUS_uint25_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left,
BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right,
BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output);

-- BIN_OP_GT_uxn_device_h_l147_c27_3f18
BIN_OP_GT_uxn_device_h_l147_c27_3f18 : entity work.BIN_OP_GT_uint26_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l147_c27_3f18_left,
BIN_OP_GT_uxn_device_h_l147_c27_3f18_right,
BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output);

-- MUX_uxn_device_h_l147_c27_4b19
MUX_uxn_device_h_l147_c27_4b19 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l147_c27_4b19_cond,
MUX_uxn_device_h_l147_c27_4b19_iftrue,
MUX_uxn_device_h_l147_c27_4b19_iffalse,
MUX_uxn_device_h_l147_c27_4b19_return_output);

-- BIN_OP_EQ_uxn_device_h_l153_c11_cde0
BIN_OP_EQ_uxn_device_h_l153_c11_cde0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left,
BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right,
BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output);

-- auto_advance_MUX_uxn_device_h_l153_c7_881e
auto_advance_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l153_c7_881e_cond,
auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue,
auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse,
auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l153_c7_881e
result_is_deo_done_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond,
result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l153_c7_881e
result_is_vram_write_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond,
result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l153_c7_881e
result_device_ram_address_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond,
result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_vram_address_MUX_uxn_device_h_l153_c7_881e
result_vram_address_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond,
result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e
result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output);

-- result_u8_value_MUX_uxn_device_h_l153_c7_881e
result_u8_value_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond,
result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue,
result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse,
result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output);

-- vram_addr_MUX_uxn_device_h_l153_c7_881e
vram_addr_MUX_uxn_device_h_l153_c7_881e : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l153_c7_881e_cond,
vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue,
vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse,
vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output);

-- BIN_OP_EQ_uxn_device_h_l154_c7_5988
BIN_OP_EQ_uxn_device_h_l154_c7_5988 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l154_c7_5988_left,
BIN_OP_EQ_uxn_device_h_l154_c7_5988_right,
BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output);

-- auto_advance_MUX_uxn_device_h_l154_c3_bea9
auto_advance_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond,
auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue,
auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse,
auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9
result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond,
result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9
result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond,
result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9
result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond,
result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_vram_address_MUX_uxn_device_h_l154_c3_bea9
result_vram_address_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond,
result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9
result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- result_u8_value_MUX_uxn_device_h_l154_c3_bea9
result_u8_value_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond,
result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue,
result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse,
result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- vram_addr_MUX_uxn_device_h_l154_c3_bea9
vram_addr_MUX_uxn_device_h_l154_c3_bea9 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond,
vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue,
vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse,
vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l160_c4_0193
result_is_vram_write_MUX_uxn_device_h_l160_c4_0193 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse,
result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output);

-- result_vram_address_MUX_uxn_device_h_l160_c4_0193
result_vram_address_MUX_uxn_device_h_l160_c4_0193 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond,
result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue,
result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse,
result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output);

-- vram_addr_MUX_uxn_device_h_l160_c4_0193
vram_addr_MUX_uxn_device_h_l160_c4_0193 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
vram_addr_MUX_uxn_device_h_l160_c4_0193_cond,
vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue,
vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse,
vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output);

-- BIN_OP_PLUS_uxn_device_h_l161_c18_9a94
BIN_OP_PLUS_uxn_device_h_l161_c18_9a94 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left,
BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right,
BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output);

-- BIN_OP_AND_uxn_device_h_l162_c5_f59b
BIN_OP_AND_uxn_device_h_l162_c5_f59b : entity work.BIN_OP_AND_uint32_t_uint18_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l162_c5_f59b_left,
BIN_OP_AND_uxn_device_h_l162_c5_f59b_right,
BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output);

-- BIN_OP_AND_uxn_device_h_l163_c21_7729
BIN_OP_AND_uxn_device_h_l163_c21_7729 : entity work.BIN_OP_AND_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l163_c21_7729_left,
BIN_OP_AND_uxn_device_h_l163_c21_7729_right,
BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output);

-- BIN_OP_GT_uxn_device_h_l163_c21_cb21
BIN_OP_GT_uxn_device_h_l163_c21_cb21 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l163_c21_cb21_left,
BIN_OP_GT_uxn_device_h_l163_c21_cb21_right,
BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output);

-- MUX_uxn_device_h_l163_c21_c4d6
MUX_uxn_device_h_l163_c21_c4d6 : entity work.MUX_uint1_t_uint21_t_uint21_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l163_c21_c4d6_cond,
MUX_uxn_device_h_l163_c21_c4d6_iftrue,
MUX_uxn_device_h_l163_c21_c4d6_iffalse,
MUX_uxn_device_h_l163_c21_c4d6_return_output);

-- BIN_OP_OR_uxn_device_h_l163_c5_7d0c
BIN_OP_OR_uxn_device_h_l163_c5_7d0c : entity work.BIN_OP_OR_uint32_t_uint21_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left,
BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right,
BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output);

-- BIN_OP_AND_uxn_device_h_l164_c21_e7b9
BIN_OP_AND_uxn_device_h_l164_c21_e7b9 : entity work.BIN_OP_AND_uint8_t_uint6_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left,
BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right,
BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output);

-- BIN_OP_GT_uxn_device_h_l164_c21_1616
BIN_OP_GT_uxn_device_h_l164_c21_1616 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_device_h_l164_c21_1616_left,
BIN_OP_GT_uxn_device_h_l164_c21_1616_right,
BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output);

-- MUX_uxn_device_h_l164_c21_92a9
MUX_uxn_device_h_l164_c21_92a9 : entity work.MUX_uint1_t_uint22_t_uint22_t_0CLK_de264c78 port map (
MUX_uxn_device_h_l164_c21_92a9_cond,
MUX_uxn_device_h_l164_c21_92a9_iftrue,
MUX_uxn_device_h_l164_c21_92a9_iffalse,
MUX_uxn_device_h_l164_c21_92a9_return_output);

-- BIN_OP_OR_uxn_device_h_l164_c5_296f
BIN_OP_OR_uxn_device_h_l164_c5_296f : entity work.BIN_OP_OR_uint32_t_uint22_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l164_c5_296f_left,
BIN_OP_OR_uxn_device_h_l164_c5_296f_right,
BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output);

-- BIN_OP_OR_uxn_device_h_l165_c5_1396
BIN_OP_OR_uxn_device_h_l165_c5_1396 : entity work.BIN_OP_OR_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_device_h_l165_c5_1396_left,
BIN_OP_OR_uxn_device_h_l165_c5_1396_right,
BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output);

-- printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1 : entity work.printf_uxn_device_h_l168_c5_d5b1_0CLK_de264c78 port map (
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE,
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0,
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1,
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2,
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3,
printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4);

-- BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd : entity work.BIN_OP_INFERRED_MULT_uint32_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right,
BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output);

-- BIN_OP_PLUS_uxn_device_h_l171_c28_8428
BIN_OP_PLUS_uxn_device_h_l171_c28_8428 : entity work.BIN_OP_PLUS_uint64_t_uint32_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left,
BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right,
BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output);

-- BIN_OP_EQ_uxn_device_h_l178_c11_d0c5
BIN_OP_EQ_uxn_device_h_l178_c11_d0c5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left,
BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right,
BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output);

-- result_is_deo_done_MUX_uxn_device_h_l178_c7_803d
result_is_deo_done_MUX_uxn_device_h_l178_c7_803d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond,
result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue,
result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse,
result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l178_c7_803d
result_is_vram_write_MUX_uxn_device_h_l178_c7_803d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond,
result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue,
result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse,
result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output);

-- result_vram_address_MUX_uxn_device_h_l178_c7_803d
result_vram_address_MUX_uxn_device_h_l178_c7_803d : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond,
result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue,
result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse,
result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output);

-- result_u8_value_MUX_uxn_device_h_l178_c7_803d
result_u8_value_MUX_uxn_device_h_l178_c7_803d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond,
result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue,
result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse,
result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output);

-- BIN_OP_EQ_uxn_device_h_l179_c7_7115
BIN_OP_EQ_uxn_device_h_l179_c7_7115 : entity work.BIN_OP_EQ_uint4_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_device_h_l179_c7_7115_left,
BIN_OP_EQ_uxn_device_h_l179_c7_7115_right,
BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output);

-- result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0
result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond,
result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue,
result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse,
result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output);

-- result_vram_address_MUX_uxn_device_h_l179_c3_9fa0
result_vram_address_MUX_uxn_device_h_l179_c3_9fa0 : entity work.MUX_uint1_t_uint32_t_uint32_t_0CLK_de264c78 port map (
result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond,
result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue,
result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse,
result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output);

-- result_u8_value_MUX_uxn_device_h_l179_c3_9fa0
result_u8_value_MUX_uxn_device_h_l179_c3_9fa0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond,
result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue,
result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse,
result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output);

-- CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7
CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x,
CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 device_port,
 phase,
 previous_device_ram_read,
 -- Registers
 vram_addr,
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
 BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output,
 auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output,
 layer_MUX_uxn_device_h_l40_c2_cf34_return_output,
 color_MUX_uxn_device_h_l40_c2_cf34_return_output,
 result_MUX_uxn_device_h_l40_c2_cf34_return_output,
 vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output,
 y_MUX_uxn_device_h_l40_c2_cf34_return_output,
 is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output,
 pixel_MUX_uxn_device_h_l40_c2_cf34_return_output,
 sprite_MUX_uxn_device_h_l40_c2_cf34_return_output,
 x_MUX_uxn_device_h_l40_c2_cf34_return_output,
 BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output,
 result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output,
 result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output,
 result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output,
 BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output,
 layer_MUX_uxn_device_h_l50_c7_15d2_return_output,
 color_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output,
 result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output,
 vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output,
 y_MUX_uxn_device_h_l50_c7_15d2_return_output,
 is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output,
 pixel_MUX_uxn_device_h_l50_c7_15d2_return_output,
 sprite_MUX_uxn_device_h_l50_c7_15d2_return_output,
 x_MUX_uxn_device_h_l50_c7_15d2_return_output,
 BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output,
 BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 layer_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 color_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 y_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 x_MUX_uxn_device_h_l57_c7_e1bc_return_output,
 BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output,
 layer_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 color_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output,
 BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output,
 BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output,
 MUX_uxn_device_h_l61_c20_ad21_return_output,
 BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output,
 MUX_uxn_device_h_l62_c13_6d2c_return_output,
 BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output,
 auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 y_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 x_MUX_uxn_device_h_l68_c7_6ea6_return_output,
 BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output,
 result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output,
 result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output,
 BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output,
 auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output,
 result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output,
 vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output,
 y_MUX_uxn_device_h_l75_c7_9992_return_output,
 sprite_MUX_uxn_device_h_l75_c7_9992_return_output,
 x_MUX_uxn_device_h_l75_c7_9992_return_output,
 BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output,
 result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output,
 sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output,
 BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output,
 auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output,
 result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output,
 vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output,
 y_MUX_uxn_device_h_l83_c7_2c28_return_output,
 x_MUX_uxn_device_h_l83_c7_2c28_return_output,
 BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output,
 BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output,
 auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output,
 result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output,
 vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output,
 y_MUX_uxn_device_h_l90_c7_7693_return_output,
 x_MUX_uxn_device_h_l90_c7_7693_return_output,
 BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output,
 result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output,
 result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output,
 x_MUX_uxn_device_h_l91_c3_d2d3_return_output,
 BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output,
 auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output,
 result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output,
 vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output,
 y_MUX_uxn_device_h_l99_c7_2a12_return_output,
 x_MUX_uxn_device_h_l99_c7_2a12_return_output,
 BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output,
 result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output,
 BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output,
 result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output,
 vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output,
 y_MUX_uxn_device_h_l106_c7_1244_return_output,
 x_MUX_uxn_device_h_l106_c7_1244_return_output,
 BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output,
 result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output,
 result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output,
 x_MUX_uxn_device_h_l107_c3_f278_return_output,
 BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output,
 BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 y_MUX_uxn_device_h_l114_c7_2ac7_return_output,
 BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output,
 result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output,
 BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output,
 auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 y_MUX_uxn_device_h_l121_c7_6b1e_return_output,
 BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output,
 result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output,
 result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output,
 y_MUX_uxn_device_h_l122_c3_cd3b_return_output,
 BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output,
 auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output,
 result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output,
 vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output,
 y_MUX_uxn_device_h_l130_c7_8204_return_output,
 BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output,
 result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output,
 result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output,
 BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output,
 result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output,
 vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output,
 y_MUX_uxn_device_h_l137_c7_771a_return_output,
 BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output,
 result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output,
 result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output,
 y_MUX_uxn_device_h_l138_c3_fce5_return_output,
 BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output,
 BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output,
 FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output,
 auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output,
 BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output,
 result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output,
 result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output,
 BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output,
 BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output,
 MUX_uxn_device_h_l147_c27_4b19_return_output,
 BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output,
 auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output,
 result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output,
 vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output,
 BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output,
 auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output,
 result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output,
 vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output,
 result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output,
 result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output,
 vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output,
 BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output,
 BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output,
 BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output,
 BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output,
 MUX_uxn_device_h_l163_c21_c4d6_return_output,
 BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output,
 BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output,
 BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output,
 MUX_uxn_device_h_l164_c21_92a9_return_output,
 BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output,
 BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output,
 BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output,
 BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output,
 BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output,
 result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output,
 result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output,
 result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output,
 result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output,
 BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output,
 result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output,
 result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output,
 result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output,
 CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : device_out_result_t;
 variable VAR_device_port : unsigned(3 downto 0);
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_previous_device_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_result_MUX_uxn_device_h_l40_c2_cf34_iftrue : device_out_result_t;
 variable VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_dca2_uxn_device_h_l40_c2_cf34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_cf34_iffalse : device_out_result_t;
 variable VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_66f5_uxn_device_h_l40_c2_cf34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_cf34_return_output : device_out_result_t;
 variable VAR_result_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_uxn_device_h_l41_c3_ac95 : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_cf34_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_cf34_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_cf34_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l40_c2_cf34_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_5f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l44_c4_489c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_15d2_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_15d2_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_e1bc_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l50_c7_15d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l52_c4_ef3d : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_6ea6_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l57_c7_e1bc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
 variable VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(1 downto 0);
 variable VAR_color_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l63_c4_734b : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(0 downto 0);
 variable VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse : unsigned(7 downto 0);
 variable VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_ca71_return_output : unsigned(1 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_ad21_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_ad21_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_ad21_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l61_c20_ad21_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_6d2c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_6d2c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_6d2c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_right : unsigned(6 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output : unsigned(7 downto 0);
 variable VAR_MUX_uxn_device_h_l62_c13_6d2c_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9992_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l68_c7_6ea6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l70_c4_1315 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9992_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9992_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_2c28_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l75_c7_9992_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l78_c4_4cbc : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse : unsigned(7 downto 0);
 variable VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_2c28_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_2c28_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7693_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l83_c7_2c28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l85_c4_a4d0 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7693_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_d2d3_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7693_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_2a12_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l90_c7_7693_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l94_c4_b00c : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l91_c3_d2d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_2a12_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_2a12_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1244_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l99_c7_2a12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l101_c4_d481 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2ac7_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1244_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_f278_return_output : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1244_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l106_c7_1244_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l109_c4_3631 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_f278_iftrue : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_f278_iffalse : unsigned(15 downto 0);
 variable VAR_x_MUX_uxn_device_h_l107_c3_f278_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_6b1e_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l114_c7_2ac7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l116_c4_8691 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_cd3b_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8204_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l121_c7_6b1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l125_c4_01e1 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l122_c3_cd3b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8204_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8204_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_771a_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l130_c7_8204_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l132_c4_d33e : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_771a_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_fce5_return_output : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_771a_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l137_c7_771a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l140_c4_35ca : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_fce5_iftrue : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_fce5_iffalse : unsigned(15 downto 0);
 variable VAR_y_MUX_uxn_device_h_l138_c3_fce5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
 variable VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l148_c4_baa7 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_4b19_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_4b19_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_4b19_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right : unsigned(8 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left : unsigned(24 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_left : unsigned(25 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l147_c27_4b19_return_output : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse : unsigned(0 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
 variable VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_uxn_device_h_l156_c4_3016 : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_75bf_return_output : unsigned(7 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l171_c5_488a : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse : unsigned(31 downto 0);
 variable VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_cond : unsigned(0 downto 0);
 variable VAR_vram_addr_uxn_device_h_l161_c5_fe44 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_right : unsigned(17 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_c4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_c4d6_iftrue : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_c4d6_iffalse : unsigned(20 downto 0);
 variable VAR_MUX_uxn_device_h_l163_c21_c4d6_return_output : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right : unsigned(20 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_left : unsigned(31 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_92a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right : unsigned(5 downto 0);
 variable VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_92a9_iftrue : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_92a9_iffalse : unsigned(21 downto 0);
 variable VAR_MUX_uxn_device_h_l164_c21_92a9_return_output : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_right : unsigned(21 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1 : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_1a6e_return_output : unsigned(3 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3 : unsigned(31 downto 0);
 variable VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4 : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left : unsigned(63 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right : unsigned(31 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output : unsigned(64 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_left : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(31 downto 0);
 variable VAR_result_vram_address_uxn_device_h_l182_c4_c888 : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(31 downto 0);
 variable VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_uxn_device_h_l183_c4_0f3a : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output : unsigned(31 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_7ea5_return_output : unsigned(31 downto 0);
 variable VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_4646_return_output : unsigned(31 downto 0);
 -- State registers comb logic variables
variable REG_VAR_vram_addr : unsigned(31 downto 0);
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
  REG_VAR_vram_addr := vram_addr;
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
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_right := to_unsigned(4, 3);
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l164_c21_92a9_iftrue := to_unsigned(2097152, 22);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right := to_unsigned(400, 9);
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right := to_unsigned(15, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_right := to_unsigned(13, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right := to_unsigned(400, 32);
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_right := to_unsigned(14, 4);
     VAR_result_vram_address_uxn_device_h_l182_c4_c888 := resize(to_unsigned(0, 1), 32);
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue := VAR_result_vram_address_uxn_device_h_l182_c4_c888;
     VAR_result_device_ram_address_uxn_device_h_l94_c4_b00c := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue := VAR_result_device_ram_address_uxn_device_h_l94_c4_b00c;
     VAR_result_device_ram_address_uxn_device_h_l132_c4_d33e := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue := VAR_result_device_ram_address_uxn_device_h_l132_c4_d33e;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_right := to_unsigned(8, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_right := to_unsigned(262143, 18);
     VAR_MUX_uxn_device_h_l164_c21_92a9_iffalse := resize(to_unsigned(0, 1), 22);
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l163_c21_c4d6_iffalse := resize(to_unsigned(0, 1), 21);
     VAR_result_device_ram_address_uxn_device_h_l44_c4_489c := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue := VAR_result_device_ram_address_uxn_device_h_l44_c4_489c;
     VAR_MUX_uxn_device_h_l61_c20_ad21_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right := to_unsigned(14, 4);
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right := to_unsigned(32, 6);
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_right := unsigned'(X"f0000000");
     VAR_result_device_ram_address_uxn_device_h_l148_c4_baa7 := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue := VAR_result_device_ram_address_uxn_device_h_l148_c4_baa7;
     VAR_vram_addr_uxn_device_h_l41_c3_ac95 := resize(to_unsigned(0, 1), 32);
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue := VAR_vram_addr_uxn_device_h_l41_c3_ac95;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse := to_unsigned(0, 1);
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_right := to_unsigned(143999, 18);
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l63_c4_734b := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_result_device_ram_address_uxn_device_h_l63_c4_734b;
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_right := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse := to_unsigned(1, 1);
     VAR_MUX_uxn_device_h_l62_c13_6d2c_iffalse := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right := to_unsigned(12, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right := to_unsigned(0, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l163_c21_c4d6_iftrue := to_unsigned(1048576, 21);
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right := to_unsigned(1, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_right := to_unsigned(64, 7);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_right := to_unsigned(128, 8);
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_right := to_unsigned(16, 5);
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right := to_unsigned(14, 4);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l156_c4_3016 := resize(to_unsigned(0, 1), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_result_device_ram_address_uxn_device_h_l156_c4_3016;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right := to_unsigned(7, 3);
     VAR_result_device_ram_address_uxn_device_h_l125_c4_01e1 := resize(to_unsigned(43, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue := VAR_result_device_ram_address_uxn_device_h_l125_c4_01e1;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l70_c4_1315 := resize(to_unsigned(47, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue := VAR_result_device_ram_address_uxn_device_h_l70_c4_1315;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_right := to_unsigned(11, 4);
     VAR_MUX_uxn_device_h_l147_c27_4b19_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_device_h_l61_c20_ad21_iffalse := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right := to_unsigned(10, 4);
     VAR_result_device_ram_address_uxn_device_h_l101_c4_d481 := resize(to_unsigned(41, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue := VAR_result_device_ram_address_uxn_device_h_l101_c4_d481;
     VAR_result_device_ram_address_uxn_device_h_l52_c4_ef3d := resize(to_unsigned(46, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue := VAR_result_device_ram_address_uxn_device_h_l52_c4_ef3d;
     VAR_MUX_uxn_device_h_l62_c13_6d2c_iftrue := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right := to_unsigned(14, 4);
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l140_c4_35ca := resize(to_unsigned(38, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue := VAR_result_device_ram_address_uxn_device_h_l140_c4_35ca;
     VAR_result_device_ram_address_uxn_device_h_l78_c4_4cbc := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue := VAR_result_device_ram_address_uxn_device_h_l78_c4_4cbc;
     VAR_result_device_ram_address_uxn_device_h_l85_c4_a4d0 := resize(to_unsigned(40, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue := VAR_result_device_ram_address_uxn_device_h_l85_c4_a4d0;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right := to_unsigned(14, 4);
     VAR_result_u8_value_uxn_device_h_l183_c4_0f3a := resize(to_unsigned(0, 1), 8);
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue := VAR_result_u8_value_uxn_device_h_l183_c4_0f3a;
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right := to_unsigned(0, 1);
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right := to_unsigned(400, 32);
     VAR_result_device_ram_address_uxn_device_h_l109_c4_3631 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue := VAR_result_device_ram_address_uxn_device_h_l109_c4_3631;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue := to_unsigned(0, 1);
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse := to_unsigned(1, 1);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right := to_unsigned(14, 4);
     VAR_MUX_uxn_device_h_l147_c27_4b19_iftrue := to_unsigned(1, 1);
     VAR_result_device_ram_address_uxn_device_h_l116_c4_8691 := resize(to_unsigned(42, 6), 8);
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue := VAR_result_device_ram_address_uxn_device_h_l116_c4_8691;

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
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_CLOCK_ENABLE;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue := auto_advance;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue := auto_advance;
     VAR_color_MUX_uxn_device_h_l40_c2_cf34_iftrue := color;
     VAR_color_MUX_uxn_device_h_l50_c7_15d2_iftrue := color;
     VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iffalse := color;
     VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iffalse := color;
     REG_VAR_ctrl_none := ctrl_none;
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left := VAR_device_port;
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left := VAR_device_port;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse := is_fill_mode;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse := is_fill_mode;
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond := is_fill_mode;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond := is_fill_mode;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_cond := is_fill_mode;
     VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue := layer;
     VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse := layer;
     VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse := layer;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue := layer;
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_left := pixel;
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left := pixel;
     VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue := pixel;
     VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse := pixel;
     VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse := pixel;
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3 := resize(pixel, 32);
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_left := VAR_previous_device_ram_read;
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_left := VAR_previous_device_ram_read;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_previous_device_ram_read;
     VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue := VAR_previous_device_ram_read;
     VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue := sprite;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iffalse := sprite;
     VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse := sprite;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue := vram_addr;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue := vram_addr;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_left := x;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right := x;
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0 := resize(x, 32);
     VAR_x_MUX_uxn_device_h_l106_c7_1244_iffalse := x;
     VAR_x_MUX_uxn_device_h_l107_c3_f278_iffalse := x;
     VAR_x_MUX_uxn_device_h_l40_c2_cf34_iftrue := x;
     VAR_x_MUX_uxn_device_h_l50_c7_15d2_iftrue := x;
     VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iftrue := x;
     VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iftrue := x;
     VAR_x_MUX_uxn_device_h_l75_c7_9992_iftrue := x;
     VAR_x_MUX_uxn_device_h_l83_c7_2c28_iftrue := x;
     VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iffalse := x;
     VAR_x_MUX_uxn_device_h_l99_c7_2a12_iftrue := x;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left := y;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_left := y;
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1 := resize(y, 32);
     VAR_y_MUX_uxn_device_h_l106_c7_1244_iftrue := y;
     VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iftrue := y;
     VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iffalse := y;
     VAR_y_MUX_uxn_device_h_l130_c7_8204_iftrue := y;
     VAR_y_MUX_uxn_device_h_l137_c7_771a_iffalse := y;
     VAR_y_MUX_uxn_device_h_l138_c3_fce5_iffalse := y;
     VAR_y_MUX_uxn_device_h_l40_c2_cf34_iftrue := y;
     VAR_y_MUX_uxn_device_h_l50_c7_15d2_iftrue := y;
     VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iftrue := y;
     VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iftrue := y;
     VAR_y_MUX_uxn_device_h_l75_c7_9992_iftrue := y;
     VAR_y_MUX_uxn_device_h_l83_c7_2c28_iftrue := y;
     VAR_y_MUX_uxn_device_h_l90_c7_7693_iftrue := y;
     VAR_y_MUX_uxn_device_h_l99_c7_2a12_iftrue := y;
     -- BIN_OP_EQ[uxn_device_h_l83_c11_9386] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l83_c11_9386_left <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_left;
     BIN_OP_EQ_uxn_device_h_l83_c11_9386_right <= VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output := BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;

     -- BIN_OP_EQ[uxn_device_h_l106_c11_716b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l106_c11_716b_left <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_left;
     BIN_OP_EQ_uxn_device_h_l106_c11_716b_right <= VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output := BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;

     -- CAST_TO_uint4_t[uxn_device_h_l168_c127_1a6e] LATENCY=0
     VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_1a6e_return_output := CAST_TO_uint4_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l130_c11_b839] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l130_c11_b839_left <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_left;
     BIN_OP_EQ_uxn_device_h_l130_c11_b839_right <= VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output := BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;

     -- BIN_OP_EQ[uxn_device_h_l153_c11_cde0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_left;
     BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right <= VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output := BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;

     -- BIN_OP_EQ[uxn_device_h_l137_c11_2ab1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_left;
     BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right <= VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output := BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l145_c11_359f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l145_c11_359f_left <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_left;
     BIN_OP_EQ_uxn_device_h_l145_c11_359f_right <= VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output := BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;

     -- BIN_OP_AND[uxn_device_h_l163_c21_7729] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l163_c21_7729_left <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_left;
     BIN_OP_AND_uxn_device_h_l163_c21_7729_right <= VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output := BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output;

     -- BIN_OP_EQ[uxn_device_h_l68_c11_ecf1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_left;
     BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right <= VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output := BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;

     -- BIN_OP_EQ[uxn_device_h_l40_c6_5e93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_left;
     BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right <= VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output := BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;

     -- CAST_TO_uint8_t[uxn_device_h_l157_c22_75bf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_75bf_return_output := CAST_TO_uint8_t_uint2_t(
     color);

     -- BIN_OP_EQ[uxn_device_h_l90_c11_13f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_left;
     BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right <= VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output := BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l57_c11_a54c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_left;
     BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right <= VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output := BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;

     -- BIN_OP_EQ[uxn_device_h_l122_c7_1a2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_left;
     BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right <= VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output := BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output;

     -- BIN_OP_EQ[uxn_device_h_l91_c7_5af6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_left;
     BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right <= VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output := BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_4646 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_4646_return_output := CAST_TO_uint32_t_uint16_t(
     x);

     -- BIN_OP_EQ[uxn_device_h_l42_c7_0d74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_left;
     BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right <= VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output := BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output;

     -- BIN_OP_EQ[uxn_device_h_l69_c7_0a58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_left;
     BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right <= VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output := BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_device_h_l75_c11_b531] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l75_c11_b531_left <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_left;
     BIN_OP_EQ_uxn_device_h_l75_c11_b531_right <= VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output := BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;

     -- CAST_TO_uint2_t[uxn_device_h_l60_c12_ca71] LATENCY=0
     VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_ca71_return_output := CAST_TO_uint2_t_uint8_t(
     VAR_previous_device_ram_read);

     -- result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d[uxn_device_h_l42_c3_5f56] LATENCY=0
     VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_5f56_return_output := result.is_device_ram_write;

     -- CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output := result.vram_write_layer;

     -- BIN_OP_EQ[uxn_device_h_l138_c7_50aa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_left;
     BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right <= VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output := BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output;

     -- CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_7ea5 LATENCY=0
     VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_7ea5_return_output := CAST_TO_uint32_t_uint16_t(
     y);

     -- CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_device_h_l58_c7_9f8b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_left;
     BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right <= VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output := BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l100_c7_0046] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l100_c7_0046_left <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_left;
     BIN_OP_EQ_uxn_device_h_l100_c7_0046_right <= VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output := BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output;

     -- BIN_OP_EQ[uxn_device_h_l146_c7_2cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_left;
     BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right <= VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output := BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output;

     -- BIN_OP_EQ[uxn_device_h_l114_c11_0252] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l114_c11_0252_left <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_left;
     BIN_OP_EQ_uxn_device_h_l114_c11_0252_right <= VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output := BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;

     -- BIN_OP_EQ[uxn_device_h_l76_c7_10fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_left;
     BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right <= VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output := BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output;

     -- BIN_OP_EQ[uxn_device_h_l107_c7_f0e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_left;
     BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right <= VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output := BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output;

     -- CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f LATENCY=0
     VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output := result.vram_address;

     -- BIN_OP_EQ[uxn_device_h_l179_c7_7115] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l179_c7_7115_left <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_left;
     BIN_OP_EQ_uxn_device_h_l179_c7_7115_right <= VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output := BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output;

     -- BIN_OP_AND[uxn_device_h_l164_c21_e7b9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_left;
     BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right <= VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output := BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output;

     -- BIN_OP_EQ[uxn_device_h_l99_c11_9a00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_left;
     BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right <= VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output := BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;

     -- BIN_OP_AND[uxn_device_h_l62_c13_3968] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l62_c13_3968_left <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_left;
     BIN_OP_AND_uxn_device_h_l62_c13_3968_right <= VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output := BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_device_ram_read);

     -- BIN_OP_AND[uxn_device_h_l61_c20_1c69] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l61_c20_1c69_left <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_left;
     BIN_OP_AND_uxn_device_h_l61_c20_1c69_right <= VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output := BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output;

     -- BIN_OP_EQ[uxn_device_h_l115_c7_5d83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_left;
     BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right <= VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output := BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output;

     -- BIN_OP_EQ[uxn_device_h_l131_c7_f56b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_left;
     BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right <= VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output := BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output;

     -- BIN_OP_EQ[uxn_device_h_l50_c11_57ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_left;
     BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right <= VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output := BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;

     -- BIN_OP_EQ[uxn_device_h_l121_c11_b8d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_left;
     BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right <= VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output := BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l147_c27_29aa] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output;

     -- CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output := result.is_deo_done;

     -- BIN_OP_EQ[uxn_device_h_l84_c7_c00a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_left;
     BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right <= VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output := BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output;

     -- CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output := result.device_ram_address;

     -- BIN_OP_EQ[uxn_device_h_l51_c7_83b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_left;
     BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right <= VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output := BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l160_c4_0193] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_cond;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output := result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output;

     -- BIN_OP_EQ[uxn_device_h_l154_c7_5988] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l154_c7_5988_left <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_left;
     BIN_OP_EQ_uxn_device_h_l154_c7_5988_right <= VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output := BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;

     -- BIN_OP_EQ[uxn_device_h_l178_c11_d0c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_left;
     BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right <= VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output := BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_left := VAR_BIN_OP_AND_uxn_device_h_l163_c21_7729_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_left := VAR_BIN_OP_AND_uxn_device_h_l164_c21_e7b9_return_output;
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left := VAR_BIN_OP_AND_uxn_device_h_l61_c20_1c69_return_output;
     VAR_MUX_uxn_device_h_l62_c13_6d2c_cond := resize(VAR_BIN_OP_AND_uxn_device_h_l62_c13_3968_return_output, 1);
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond := VAR_BIN_OP_EQ_uxn_device_h_l100_c7_0046_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l106_c11_716b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_f278_cond := VAR_BIN_OP_EQ_uxn_device_h_l107_c7_f0e1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_2ac7_cond := VAR_BIN_OP_EQ_uxn_device_h_l114_c11_0252_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond := VAR_BIN_OP_EQ_uxn_device_h_l115_c7_5d83_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_6b1e_cond := VAR_BIN_OP_EQ_uxn_device_h_l121_c11_b8d8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_cd3b_cond := VAR_BIN_OP_EQ_uxn_device_h_l122_c7_1a2d_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_8204_cond := VAR_BIN_OP_EQ_uxn_device_h_l130_c11_b839_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond := VAR_BIN_OP_EQ_uxn_device_h_l131_c7_f56b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_771a_cond := VAR_BIN_OP_EQ_uxn_device_h_l137_c11_2ab1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_fce5_cond := VAR_BIN_OP_EQ_uxn_device_h_l138_c7_50aa_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond := VAR_BIN_OP_EQ_uxn_device_h_l145_c11_359f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond := VAR_BIN_OP_EQ_uxn_device_h_l146_c7_2cbb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_cond := VAR_BIN_OP_EQ_uxn_device_h_l153_c11_cde0_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond := VAR_BIN_OP_EQ_uxn_device_h_l154_c7_5988_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond := VAR_BIN_OP_EQ_uxn_device_h_l178_c11_d0c5_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond := VAR_BIN_OP_EQ_uxn_device_h_l179_c7_7115_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_cf34_cond := VAR_BIN_OP_EQ_uxn_device_h_l40_c6_5e93_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond := VAR_BIN_OP_EQ_uxn_device_h_l42_c7_0d74_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_15d2_cond := VAR_BIN_OP_EQ_uxn_device_h_l50_c11_57ca_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond := VAR_BIN_OP_EQ_uxn_device_h_l51_c7_83b1_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_e1bc_cond := VAR_BIN_OP_EQ_uxn_device_h_l57_c11_a54c_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond := VAR_BIN_OP_EQ_uxn_device_h_l58_c7_9f8b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_6ea6_cond := VAR_BIN_OP_EQ_uxn_device_h_l68_c11_ecf1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond := VAR_BIN_OP_EQ_uxn_device_h_l69_c7_0a58_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_9992_cond := VAR_BIN_OP_EQ_uxn_device_h_l75_c11_b531_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output;
     VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_cond := VAR_BIN_OP_EQ_uxn_device_h_l76_c7_10fc_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_2c28_cond := VAR_BIN_OP_EQ_uxn_device_h_l83_c11_9386_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond := VAR_BIN_OP_EQ_uxn_device_h_l84_c7_c00a_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_7693_cond := VAR_BIN_OP_EQ_uxn_device_h_l90_c11_13f9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_d2d3_cond := VAR_BIN_OP_EQ_uxn_device_h_l91_c7_5af6_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_2a12_cond := VAR_BIN_OP_EQ_uxn_device_h_l99_c11_9a00_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l147_c27_29aa_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_device_h_l108_l123_l92_l139_DUPLICATE_0b27_return_output;
     VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_CAST_TO_uint2_t_uxn_device_h_l60_c12_ca71_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_4646_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l161_l171_DUPLICATE_4646_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_7ea5_return_output;
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left := VAR_CAST_TO_uint32_t_uint16_t_uxn_device_h_l171_l161_DUPLICATE_7ea5_return_output;
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2 := resize(VAR_CAST_TO_uint4_t_uxn_device_h_l168_c127_1a6e_return_output, 32);
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_CAST_TO_uint8_t_uxn_device_h_l157_c22_75bf_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_deo_done_d41d_uxn_device_h_l138_l76_l51_l131_l58_l84_l91_l69_l100_l107_l154_l115_l122_DUPLICATE_5e94_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_is_vram_write_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_9f21_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_CONST_REF_RD_uint1_t_device_out_result_t_vram_write_layer_d41d_uxn_device_h_l75_l121_l68_l114_l57_l106_l153_l50_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_7ac6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_CONST_REF_RD_uint32_t_device_out_result_t_vram_address_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_746f_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_device_ram_address_d41d_uxn_device_h_l138_l42_l76_l51_l131_l146_l58_l84_l91_l153_l69_l100_l107_l154_l115_l122_DUPLICATE_e4d1_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_CONST_REF_RD_uint8_t_device_out_result_t_u8_value_d41d_uxn_device_h_l75_l121_l68_l114_l178_l57_l106_l50_l179_l99_l145_l90_l137_l154_l83_l130_DUPLICATE_66f7_return_output;
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse := VAR_result_is_device_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_device_out_result_t_is_device_ram_write_d41d_uxn_device_h_l42_c3_5f56_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l160_c4_0193_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l138_c3_fce5] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_cond;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output := result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output;

     -- BIN_OP_GT[uxn_device_h_l164_c21_1616] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l164_c21_1616_left <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_left;
     BIN_OP_GT_uxn_device_h_l164_c21_1616_right <= VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output := BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l115_c3_f5f8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_cond;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output := result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output := result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l171_c28_3acd] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l42_c3_5f56] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_cond;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output := result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l138_c3_fce5] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_cond;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output := result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output;

     -- result_u8_value_MUX[uxn_device_h_l179_c3_9fa0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_cond;
     result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iftrue;
     result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output := result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output;

     -- result_is_device_ram_write_MUX[uxn_device_h_l42_c3_5f56] LATENCY=0
     -- Inputs
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_cond;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iftrue;
     result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse <= VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_iffalse;
     -- Outputs
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output := result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l131_c3_9ad0] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_cond;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output := result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output;

     -- BIN_OP_OR[uxn_device_h_l139_c4_9f47] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l139_c4_9f47_left <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_left;
     BIN_OP_OR_uxn_device_h_l139_c4_9f47_right <= VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output := BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l179_c3_9fa0] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_cond;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output := result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l84_c3_93b9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_cond;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output := result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_cond;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output := result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l100_c3_e13e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_cond;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output := result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l91_c3_d2d3] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_cond;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output := result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l131_c3_9ad0] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_cond;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output := result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l122_c3_cd3b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_cond;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output := result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l146_c3_ddbf] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_cond;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output := result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l100_c3_e13e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_cond;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output := result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output;

     -- auto_advance_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_cond;
     auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output := auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l107_c3_f278] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_cond;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output := result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output := result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output := result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l84_c3_93b9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_cond;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output := result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output;

     -- BIN_OP_OR[uxn_device_h_l108_c4_9933] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l108_c4_9933_left <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_left;
     BIN_OP_OR_uxn_device_h_l108_c4_9933_right <= VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output := BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l147_c27_51a6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_left;
     BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right <= VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output := BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l122_c3_cd3b] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_cond;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output := result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output;

     -- BIN_OP_INFERRED_MULT[uxn_device_h_l161_c18_05ef] LATENCY=0
     -- Inputs
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_left;
     BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right <= VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_right;
     -- Outputs
     VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output := BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output;

     -- MUX[uxn_device_h_l62_c13_6d2c] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l62_c13_6d2c_cond <= VAR_MUX_uxn_device_h_l62_c13_6d2c_cond;
     MUX_uxn_device_h_l62_c13_6d2c_iftrue <= VAR_MUX_uxn_device_h_l62_c13_6d2c_iftrue;
     MUX_uxn_device_h_l62_c13_6d2c_iffalse <= VAR_MUX_uxn_device_h_l62_c13_6d2c_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l62_c13_6d2c_return_output := MUX_uxn_device_h_l62_c13_6d2c_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output := result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- result_u8_value_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output := result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- sprite_MUX[uxn_device_h_l76_c3_4f7e] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l76_c3_4f7e_cond <= VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_cond;
     sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue <= VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iftrue;
     sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse <= VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output := sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l42_c3_5f56] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_cond;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output := result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l76_c3_4f7e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_cond;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output := result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output;

     -- pixel_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_cond;
     pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output := pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l91_c3_d2d3] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_cond;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output := result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output;

     -- BIN_OP_GT[uxn_device_h_l163_c21_cb21] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l163_c21_cb21_left <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_left;
     BIN_OP_GT_uxn_device_h_l163_c21_cb21_right <= VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output := BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l76_c3_4f7e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_cond;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output := result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output;

     -- BIN_OP_EQ[uxn_device_h_l61_c20_e8e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_left;
     BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right <= VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output := BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_cond;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output := result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l51_c3_aac9] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_cond;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output := result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l69_c3_92cc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_cond;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output := result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output;

     -- result_vram_address_MUX[uxn_device_h_l179_c3_9fa0] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_cond;
     result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iftrue;
     result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output := result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l107_c3_f278] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_cond;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output := result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l69_c3_92cc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_cond;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output := result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l51_c3_aac9] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_cond;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output := result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output;

     -- color_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_color_MUX_uxn_device_h_l58_c3_0c0b_cond;
     color_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     color_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_color_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l58_c3_0c0b_return_output := color_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l178_c7_803d] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_cond;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output := result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l115_c3_f5f8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_cond;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output := result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output;

     -- CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x <= VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output := CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_device_h_l61_c20_ad21_cond := VAR_BIN_OP_EQ_uxn_device_h_l61_c20_e8e1_return_output;
     VAR_MUX_uxn_device_h_l163_c21_c4d6_cond := VAR_BIN_OP_GT_uxn_device_h_l163_c21_cb21_return_output;
     VAR_MUX_uxn_device_h_l164_c21_92a9_cond := VAR_BIN_OP_GT_uxn_device_h_l164_c21_1616_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l161_c18_05ef_return_output;
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left := VAR_BIN_OP_INFERRED_MULT_uxn_device_h_l171_c28_3acd_return_output;
     VAR_x_MUX_uxn_device_h_l107_c3_f278_iftrue := VAR_BIN_OP_OR_uxn_device_h_l108_c4_9933_return_output;
     VAR_y_MUX_uxn_device_h_l138_c3_fce5_iftrue := VAR_BIN_OP_OR_uxn_device_h_l139_c4_9f47_return_output;
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_left := VAR_BIN_OP_PLUS_uxn_device_h_l147_c27_51a6_return_output;
     VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output;
     VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_device_h_l93_l124_DUPLICATE_c6e7_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_MUX_uxn_device_h_l62_c13_6d2c_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_auto_advance_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_color_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_pixel_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l100_c3_e13e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l107_c3_f278_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l115_c3_f5f8_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l122_c3_cd3b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l131_c3_9ad0_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l138_c3_fce5_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l146_c3_ddbf_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l51_c3_aac9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l69_c3_92cc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l76_c3_4f7e_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l84_c3_93b9_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_result_device_ram_address_MUX_uxn_device_h_l91_c3_d2d3_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l100_c3_e13e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l107_c3_f278_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l115_c3_f5f8_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l122_c3_cd3b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l131_c3_9ad0_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l138_c3_fce5_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l178_c7_803d_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l51_c3_aac9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l69_c3_92cc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l76_c3_4f7e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l84_c3_93b9_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l91_c3_d2d3_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue := VAR_result_is_vram_write_MUX_uxn_device_h_l179_c3_9fa0_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue := VAR_result_u8_value_MUX_uxn_device_h_l179_c3_9fa0_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l179_c3_9fa0_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_vram_write_layer_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iftrue := VAR_sprite_MUX_uxn_device_h_l76_c3_4f7e_return_output;
     -- result_is_deo_done_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_cond;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output := result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l178_c7_803d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_cond;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output := result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output;

     -- color_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_color_MUX_uxn_device_h_l57_c7_e1bc_cond;
     color_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     color_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_color_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l57_c7_e1bc_return_output := color_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- x_MUX[uxn_device_h_l91_c3_d2d3] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l91_c3_d2d3_cond <= VAR_x_MUX_uxn_device_h_l91_c3_d2d3_cond;
     x_MUX_uxn_device_h_l91_c3_d2d3_iftrue <= VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iftrue;
     x_MUX_uxn_device_h_l91_c3_d2d3_iffalse <= VAR_x_MUX_uxn_device_h_l91_c3_d2d3_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l91_c3_d2d3_return_output := x_MUX_uxn_device_h_l91_c3_d2d3_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output := result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- auto_advance_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_cond;
     auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iftrue;
     auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output := auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- BIN_OP_GT[uxn_device_h_l147_c27_3f18] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_device_h_l147_c27_3f18_left <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_left;
     BIN_OP_GT_uxn_device_h_l147_c27_3f18_right <= VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output := BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_cond;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output := result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- sprite_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_sprite_MUX_uxn_device_h_l75_c7_9992_cond;
     sprite_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iftrue;
     sprite_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_sprite_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l75_c7_9992_return_output := sprite_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_dca2[uxn_device_h_l40_c2_cf34] LATENCY=0
     VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_dca2_uxn_device_h_l40_c2_cf34_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_dca2(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l42_c3_5f56_return_output,
     VAR_result_is_device_ram_write_MUX_uxn_device_h_l42_c3_5f56_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l42_c3_5f56_return_output);

     -- MUX[uxn_device_h_l61_c20_ad21] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l61_c20_ad21_cond <= VAR_MUX_uxn_device_h_l61_c20_ad21_cond;
     MUX_uxn_device_h_l61_c20_ad21_iftrue <= VAR_MUX_uxn_device_h_l61_c20_ad21_iftrue;
     MUX_uxn_device_h_l61_c20_ad21_iffalse <= VAR_MUX_uxn_device_h_l61_c20_ad21_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l61_c20_ad21_return_output := MUX_uxn_device_h_l61_c20_ad21_return_output;

     -- pixel_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_cond;
     pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output := pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- x_MUX[uxn_device_h_l107_c3_f278] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l107_c3_f278_cond <= VAR_x_MUX_uxn_device_h_l107_c3_f278_cond;
     x_MUX_uxn_device_h_l107_c3_f278_iftrue <= VAR_x_MUX_uxn_device_h_l107_c3_f278_iftrue;
     x_MUX_uxn_device_h_l107_c3_f278_iffalse <= VAR_x_MUX_uxn_device_h_l107_c3_f278_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l107_c3_f278_return_output := x_MUX_uxn_device_h_l107_c3_f278_return_output;

     -- result_u8_value_MUX[uxn_device_h_l178_c7_803d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_cond;
     result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iftrue;
     result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output := result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output;

     -- result_vram_address_MUX[uxn_device_h_l178_c7_803d] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_cond;
     result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iftrue;
     result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output := result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output;

     -- MUX[uxn_device_h_l164_c21_92a9] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l164_c21_92a9_cond <= VAR_MUX_uxn_device_h_l164_c21_92a9_cond;
     MUX_uxn_device_h_l164_c21_92a9_iftrue <= VAR_MUX_uxn_device_h_l164_c21_92a9_iftrue;
     MUX_uxn_device_h_l164_c21_92a9_iffalse <= VAR_MUX_uxn_device_h_l164_c21_92a9_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l164_c21_92a9_return_output := MUX_uxn_device_h_l164_c21_92a9_return_output;

     -- MUX[uxn_device_h_l163_c21_c4d6] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l163_c21_c4d6_cond <= VAR_MUX_uxn_device_h_l163_c21_c4d6_cond;
     MUX_uxn_device_h_l163_c21_c4d6_iftrue <= VAR_MUX_uxn_device_h_l163_c21_c4d6_iftrue;
     MUX_uxn_device_h_l163_c21_c4d6_iffalse <= VAR_MUX_uxn_device_h_l163_c21_c4d6_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l163_c21_c4d6_return_output := MUX_uxn_device_h_l163_c21_c4d6_return_output;

     -- layer_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_cond;
     layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_return_output := layer_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- y_MUX[uxn_device_h_l122_c3_cd3b] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l122_c3_cd3b_cond <= VAR_y_MUX_uxn_device_h_l122_c3_cd3b_cond;
     y_MUX_uxn_device_h_l122_c3_cd3b_iftrue <= VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iftrue;
     y_MUX_uxn_device_h_l122_c3_cd3b_iffalse <= VAR_y_MUX_uxn_device_h_l122_c3_cd3b_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l122_c3_cd3b_return_output := y_MUX_uxn_device_h_l122_c3_cd3b_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l161_c18_9a94] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_left;
     BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right <= VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output := BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output;

     -- y_MUX[uxn_device_h_l138_c3_fce5] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l138_c3_fce5_cond <= VAR_y_MUX_uxn_device_h_l138_c3_fce5_cond;
     y_MUX_uxn_device_h_l138_c3_fce5_iftrue <= VAR_y_MUX_uxn_device_h_l138_c3_fce5_iftrue;
     y_MUX_uxn_device_h_l138_c3_fce5_iffalse <= VAR_y_MUX_uxn_device_h_l138_c3_fce5_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l138_c3_fce5_return_output := y_MUX_uxn_device_h_l138_c3_fce5_return_output;

     -- BIN_OP_PLUS[uxn_device_h_l171_c28_8428] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_left;
     BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right <= VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output := BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_device_h_l147_c27_4b19_cond := VAR_BIN_OP_GT_uxn_device_h_l147_c27_3f18_return_output;
     VAR_vram_addr_uxn_device_h_l161_c5_fe44 := resize(VAR_BIN_OP_PLUS_uxn_device_h_l161_c18_9a94_return_output, 32);
     VAR_result_vram_address_uxn_device_h_l171_c5_488a := resize(VAR_BIN_OP_PLUS_uxn_device_h_l171_c28_8428_return_output, 32);
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right := VAR_MUX_uxn_device_h_l163_c21_c4d6_return_output;
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_right := VAR_MUX_uxn_device_h_l164_c21_92a9_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue := VAR_MUX_uxn_device_h_l61_c20_ad21_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_auto_advance_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_color_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_color_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_layer_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_pixel_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_MUX_uxn_device_h_l40_c2_cf34_iftrue := VAR_result_TRUE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_dca2_uxn_device_h_l40_c2_cf34_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l178_c7_803d_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l178_c7_803d_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l178_c7_803d_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_sprite_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_x_MUX_uxn_device_h_l106_c7_1244_iftrue := VAR_x_MUX_uxn_device_h_l107_c3_f278_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7693_iftrue := VAR_x_MUX_uxn_device_h_l91_c3_d2d3_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iftrue := VAR_y_MUX_uxn_device_h_l122_c3_cd3b_return_output;
     VAR_y_MUX_uxn_device_h_l137_c7_771a_iftrue := VAR_y_MUX_uxn_device_h_l138_c3_fce5_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse := VAR_result_vram_address_uxn_device_h_l171_c5_488a;
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_left := VAR_vram_addr_uxn_device_h_l161_c5_fe44;
     -- x_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_x_MUX_uxn_device_h_l106_c7_1244_cond;
     x_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_x_MUX_uxn_device_h_l106_c7_1244_iftrue;
     x_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_x_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l106_c7_1244_return_output := x_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- result_u8_value_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_cond;
     result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output := result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- BIN_OP_AND[uxn_device_h_l162_c5_f59b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_device_h_l162_c5_f59b_left <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_left;
     BIN_OP_AND_uxn_device_h_l162_c5_f59b_right <= VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output := BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- layer_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_cond;
     layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output := layer_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- pixel_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_cond;
     pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_return_output := pixel_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- auto_advance_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_cond;
     auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output := auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- color_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_color_MUX_uxn_device_h_l50_c7_15d2_cond;
     color_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_color_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     color_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_color_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l50_c7_15d2_return_output := color_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_cond;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output := result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l58_c3_0c0b] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_cond;
     is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iftrue;
     is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output := is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output;

     -- y_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_y_MUX_uxn_device_h_l137_c7_771a_cond;
     y_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_y_MUX_uxn_device_h_l137_c7_771a_iftrue;
     y_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_y_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l137_c7_771a_return_output := y_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- MUX[uxn_device_h_l147_c27_4b19] LATENCY=0
     -- Inputs
     MUX_uxn_device_h_l147_c27_4b19_cond <= VAR_MUX_uxn_device_h_l147_c27_4b19_cond;
     MUX_uxn_device_h_l147_c27_4b19_iftrue <= VAR_MUX_uxn_device_h_l147_c27_4b19_iftrue;
     MUX_uxn_device_h_l147_c27_4b19_iffalse <= VAR_MUX_uxn_device_h_l147_c27_4b19_iffalse;
     -- Outputs
     VAR_MUX_uxn_device_h_l147_c27_4b19_return_output := MUX_uxn_device_h_l147_c27_4b19_return_output;

     -- sprite_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_cond;
     sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output := sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- Submodule level 4
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left := VAR_BIN_OP_AND_uxn_device_h_l162_c5_f59b_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue := VAR_MUX_uxn_device_h_l147_c27_4b19_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_auto_advance_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_color_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_color_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue := VAR_is_fill_mode_MUX_uxn_device_h_l58_c3_0c0b_return_output;
     VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_pixel_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_sprite_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_x_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_x_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_y_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_y_MUX_uxn_device_h_l137_c7_771a_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- result_u8_value_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- sprite_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_cond;
     sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output := sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_cond;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output := result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- auto_advance_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_cond;
     auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iftrue;
     auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output := auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_cond;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output := result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- layer_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_layer_MUX_uxn_device_h_l50_c7_15d2_cond;
     layer_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     layer_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l50_c7_15d2_return_output := layer_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l146_c3_ddbf] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_cond;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output := result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_cond;
     is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output := is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- BIN_OP_OR[uxn_device_h_l163_c5_7d0c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_left;
     BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right <= VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output := BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output;

     -- pixel_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     pixel_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_cond;
     pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_return_output := pixel_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- x_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_x_MUX_uxn_device_h_l99_c7_2a12_cond;
     x_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_x_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     x_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_x_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l99_c7_2a12_return_output := x_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- y_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_y_MUX_uxn_device_h_l130_c7_8204_cond;
     y_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_y_MUX_uxn_device_h_l130_c7_8204_iftrue;
     y_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_y_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l130_c7_8204_return_output := y_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- color_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     color_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_color_MUX_uxn_device_h_l40_c2_cf34_cond;
     color_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_color_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     color_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_color_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_color_MUX_uxn_device_h_l40_c2_cf34_return_output := color_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- Submodule level 5
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_left := VAR_BIN_OP_OR_uxn_device_h_l163_c5_7d0c_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_auto_advance_MUX_uxn_device_h_l137_c7_771a_return_output;
     REG_VAR_color := VAR_color_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_layer_MUX_uxn_device_h_l50_c7_15d2_return_output;
     REG_VAR_pixel := VAR_pixel_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue := VAR_result_is_deo_done_MUX_uxn_device_h_l146_c3_ddbf_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_sprite_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_x_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_x_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_y_MUX_uxn_device_h_l130_c7_8204_return_output;
     -- y_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_y_MUX_uxn_device_h_l121_c7_6b1e_cond;
     y_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     y_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_y_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l121_c7_6b1e_return_output := y_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- auto_advance_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_cond;
     auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iftrue;
     auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output := auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- layer_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     layer_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_layer_MUX_uxn_device_h_l40_c2_cf34_cond;
     layer_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     layer_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_layer_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_layer_MUX_uxn_device_h_l40_c2_cf34_return_output := layer_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- BIN_OP_OR[uxn_device_h_l164_c5_296f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l164_c5_296f_left <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_left;
     BIN_OP_OR_uxn_device_h_l164_c5_296f_right <= VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output := BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_cond;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output := result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_u8_value_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_cond;
     result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output := result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_cond;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output := result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_cond;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output := result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_cond;
     is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output := is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- x_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_x_MUX_uxn_device_h_l90_c7_7693_cond;
     x_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_x_MUX_uxn_device_h_l90_c7_7693_iftrue;
     x_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_x_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l90_c7_7693_return_output := x_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- sprite_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_cond;
     sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_return_output := sprite_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- Submodule level 6
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_left := VAR_BIN_OP_OR_uxn_device_h_l164_c5_296f_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_auto_advance_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_is_fill_mode_MUX_uxn_device_h_l50_c7_15d2_return_output;
     REG_VAR_layer := VAR_layer_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_sprite_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_x_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_x_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_y_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     -- result_is_vram_write_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_cond;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output := result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- sprite_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     sprite_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_cond;
     sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_return_output := sprite_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- auto_advance_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_cond;
     auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output := auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- result_u8_value_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_cond;
     result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output := result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_cond;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output := result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- y_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_y_MUX_uxn_device_h_l114_c7_2ac7_cond;
     y_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     y_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_y_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l114_c7_2ac7_return_output := y_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- x_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_x_MUX_uxn_device_h_l83_c7_2c28_cond;
     x_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_x_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     x_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_x_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l83_c7_2c28_return_output := x_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- BIN_OP_OR[uxn_device_h_l165_c5_1396] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_device_h_l165_c5_1396_left <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_left;
     BIN_OP_OR_uxn_device_h_l165_c5_1396_right <= VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output := BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- is_fill_mode_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_cond;
     is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output := is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- Submodule level 7
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4 := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue := VAR_BIN_OP_OR_uxn_device_h_l165_c5_1396_return_output;
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_auto_advance_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     REG_VAR_is_fill_mode := VAR_is_fill_mode_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     REG_VAR_sprite := VAR_sprite_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_x_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_x_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_y_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_y_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- x_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_x_MUX_uxn_device_h_l75_c7_9992_cond;
     x_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_x_MUX_uxn_device_h_l75_c7_9992_iftrue;
     x_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_x_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l75_c7_9992_return_output := x_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- y_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_y_MUX_uxn_device_h_l106_c7_1244_cond;
     y_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_y_MUX_uxn_device_h_l106_c7_1244_iftrue;
     y_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_y_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l106_c7_1244_return_output := y_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_cond;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output := result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_u8_value_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- vram_addr_MUX[uxn_device_h_l160_c4_0193] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l160_c4_0193_cond <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_cond;
     vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iftrue;
     vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output := vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output;

     -- auto_advance_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_cond;
     auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output := auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l160_c4_0193] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_cond;
     result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iftrue;
     result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output := result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output;

     -- Submodule level 8
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_auto_advance_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l160_c4_0193_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue := VAR_vram_addr_MUX_uxn_device_h_l160_c4_0193_return_output;
     VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_x_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_y_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_y_MUX_uxn_device_h_l106_c7_1244_return_output;
     -- x_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_x_MUX_uxn_device_h_l68_c7_6ea6_cond;
     x_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     x_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_x_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l68_c7_6ea6_return_output := x_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- y_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_y_MUX_uxn_device_h_l99_c7_2a12_cond;
     y_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_y_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     y_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_y_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l99_c7_2a12_return_output := y_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- result_vram_address_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_cond;
     result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output := result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- vram_addr_MUX[uxn_device_h_l154_c3_bea9] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_cond;
     vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iftrue;
     vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output := vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_cond;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output := result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- result_u8_value_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_cond;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output := result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- auto_advance_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_cond;
     auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iftrue;
     auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output := auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- Submodule level 9
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_auto_advance_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_result_vram_address_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue := VAR_vram_addr_MUX_uxn_device_h_l154_c3_bea9_return_output;
     VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_x_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_y_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_y_MUX_uxn_device_h_l99_c7_2a12_return_output;
     -- vram_addr_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_cond;
     vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iftrue;
     vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output := vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- auto_advance_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_cond;
     auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output := auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_u8_value_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_cond;
     result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output := result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- result_vram_address_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_cond;
     result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iftrue;
     result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output := result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- x_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_x_MUX_uxn_device_h_l57_c7_e1bc_cond;
     x_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     x_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_x_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l57_c7_e1bc_return_output := x_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_cond;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output := result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output := result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- y_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_y_MUX_uxn_device_h_l90_c7_7693_cond;
     y_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_y_MUX_uxn_device_h_l90_c7_7693_iftrue;
     y_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_y_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l90_c7_7693_return_output := y_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output := result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- Submodule level 10
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_auto_advance_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_vram_addr_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_x_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_x_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_y_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_y_MUX_uxn_device_h_l90_c7_7693_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_cond;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output := result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- auto_advance_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_cond;
     auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iftrue;
     auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output := auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- x_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_x_MUX_uxn_device_h_l50_c7_15d2_cond;
     x_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_x_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     x_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_x_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l50_c7_15d2_return_output := x_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output := result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output := result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_vram_address_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_cond;
     result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output := result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- y_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_y_MUX_uxn_device_h_l83_c7_2c28_cond;
     y_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_y_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     y_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_y_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l83_c7_2c28_return_output := y_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_cond;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output := result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- vram_addr_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_cond;
     vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output := vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_cond;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output := result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- Submodule level 11
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_auto_advance_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_vram_addr_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_x_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_x_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_y_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_y_MUX_uxn_device_h_l83_c7_2c28_return_output;
     -- result_device_ram_address_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output := result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_vram_address_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_cond;
     result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iftrue;
     result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output := result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- y_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_y_MUX_uxn_device_h_l75_c7_9992_cond;
     y_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_y_MUX_uxn_device_h_l75_c7_9992_iftrue;
     y_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_y_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l75_c7_9992_return_output := y_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- auto_advance_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_cond;
     auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output := auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output := result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_cond;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output := result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- x_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     x_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_x_MUX_uxn_device_h_l40_c2_cf34_cond;
     x_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_x_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     x_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_x_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_x_MUX_uxn_device_h_l40_c2_cf34_return_output := x_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output := result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- vram_addr_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_cond;
     vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iftrue;
     vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output := vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- result_u8_value_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_cond;
     result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output := result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- Submodule level 12
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_auto_advance_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse := VAR_vram_addr_MUX_uxn_device_h_l137_c7_771a_return_output;
     REG_VAR_x := VAR_x_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_y_MUX_uxn_device_h_l75_c7_9992_return_output;
     -- y_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_y_MUX_uxn_device_h_l68_c7_6ea6_cond;
     y_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     y_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_y_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l68_c7_6ea6_return_output := y_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output := result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- vram_addr_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_cond;
     vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iftrue;
     vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output := vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_cond;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output := result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_cond;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output := result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- auto_advance_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_cond;
     auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iftrue;
     auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output := auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_cond;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output := result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l137_c7_771a] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output;

     -- result_vram_address_MUX[uxn_device_h_l130_c7_8204] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_cond;
     result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iftrue;
     result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output := result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output := result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- Submodule level 13
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l137_c7_771a_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_auto_advance_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse := VAR_vram_addr_MUX_uxn_device_h_l130_c7_8204_return_output;
     VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_y_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l145_c7_c3c8] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output;

     -- vram_addr_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_cond;
     vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output := vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_cond;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output := result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output := result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_vram_address_MUX[uxn_device_h_l121_c7_6b1e] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_cond;
     result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iftrue;
     result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output := result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output;

     -- auto_advance_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_cond;
     auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output := auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- result_u8_value_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_cond;
     result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output := result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- y_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_y_MUX_uxn_device_h_l57_c7_e1bc_cond;
     y_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     y_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_y_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l57_c7_e1bc_return_output := y_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- Submodule level 14
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l145_c7_c3c8_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_auto_advance_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse := VAR_vram_addr_MUX_uxn_device_h_l121_c7_6b1e_return_output;
     VAR_y_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_y_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     -- y_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_y_MUX_uxn_device_h_l50_c7_15d2_cond;
     y_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_y_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     y_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_y_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l50_c7_15d2_return_output := y_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- auto_advance_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_cond;
     auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output := auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- vram_addr_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_cond;
     vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output := vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_cond;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output := result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- FALSE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c7_881e] LATENCY=0
     -- Inputs
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_cond;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iftrue;
     FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse <= VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_iffalse;
     -- Outputs
     VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output := FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output;

     -- result_vram_address_MUX[uxn_device_h_l114_c7_2ac7] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_cond;
     result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iftrue;
     result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output := result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output;

     -- Submodule level 15
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue := VAR_FALSE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c7_881e_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_auto_advance_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_device_ram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_vram_write_layer_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse := VAR_vram_addr_MUX_uxn_device_h_l114_c7_2ac7_return_output;
     VAR_y_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_y_MUX_uxn_device_h_l50_c7_15d2_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l153_c1_9cd5] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output;

     -- y_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     y_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_y_MUX_uxn_device_h_l40_c2_cf34_cond;
     y_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_y_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     y_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_y_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_y_MUX_uxn_device_h_l40_c2_cf34_return_output := y_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- result_vram_write_layer_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output := result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- result_device_ram_address_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output := result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_vram_address_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_cond;
     result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iftrue;
     result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output := result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- vram_addr_MUX[uxn_device_h_l106_c7_1244] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l106_c7_1244_cond <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_cond;
     vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iftrue;
     vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output := vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- auto_advance_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_cond;
     auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output := auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_u8_value_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- Submodule level 16
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l153_c1_9cd5_return_output;
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_auto_advance_MUX_uxn_device_h_l50_c7_15d2_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_is_vram_write_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_u8_value_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l106_c7_1244_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse := VAR_vram_addr_MUX_uxn_device_h_l106_c7_1244_return_output;
     REG_VAR_y := VAR_y_MUX_uxn_device_h_l40_c2_cf34_return_output;
     -- auto_advance_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_cond;
     auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output := auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- result_vram_address_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_cond;
     result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output := result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- vram_addr_MUX[uxn_device_h_l99_c7_2a12] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_cond;
     vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iftrue;
     vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output := vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output;

     -- result_u8_value_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output := result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_is_vram_write_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output := result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l154_c1_dab0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output;

     -- Submodule level 17
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l154_c1_dab0_return_output;
     REG_VAR_auto_advance := VAR_auto_advance_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_is_deo_done_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l99_c7_2a12_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse := VAR_vram_addr_MUX_uxn_device_h_l99_c7_2a12_return_output;
     -- result_vram_address_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_cond;
     result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iftrue;
     result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output := result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- result_is_deo_done_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output := result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_device_h_l160_c1_34dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output;

     -- vram_addr_MUX[uxn_device_h_l90_c7_7693] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l90_c7_7693_cond <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_cond;
     vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iftrue;
     vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output := vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output;

     -- Submodule level 18
     VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_device_h_l160_c1_34dc_return_output;
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l90_c7_7693_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse := VAR_vram_addr_MUX_uxn_device_h_l90_c7_7693_return_output;
     -- vram_addr_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_cond;
     vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output := vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- result_vram_address_MUX[uxn_device_h_l83_c7_2c28] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_cond;
     result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iftrue;
     result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output := result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output;

     -- printf_uxn_device_h_l168_c5_d5b1[uxn_device_h_l168_c5_d5b1] LATENCY=0
     -- Clock enable
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_CLOCK_ENABLE;
     -- Inputs
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0 <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg0;
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1 <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg1;
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2 <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg2;
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3 <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg3;
     printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4 <= VAR_printf_uxn_device_h_l168_c5_d5b1_uxn_device_h_l168_c5_d5b1_arg4;
     -- Outputs

     -- Submodule level 19
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l83_c7_2c28_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse := VAR_vram_addr_MUX_uxn_device_h_l83_c7_2c28_return_output;
     -- vram_addr_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_cond;
     vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iftrue;
     vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output := vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- result_vram_address_MUX[uxn_device_h_l75_c7_9992] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_cond;
     result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iftrue;
     result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output := result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output;

     -- Submodule level 20
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l75_c7_9992_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse := VAR_vram_addr_MUX_uxn_device_h_l75_c7_9992_return_output;
     -- result_vram_address_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_cond;
     result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output := result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- vram_addr_MUX[uxn_device_h_l68_c7_6ea6] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_cond;
     vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iftrue;
     vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output := vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output;

     -- Submodule level 21
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse := VAR_vram_addr_MUX_uxn_device_h_l68_c7_6ea6_return_output;
     -- vram_addr_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_cond;
     vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output := vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- result_vram_address_MUX[uxn_device_h_l57_c7_e1bc] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_cond;
     result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iftrue;
     result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output := result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output;

     -- Submodule level 22
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_result_vram_address_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse := VAR_vram_addr_MUX_uxn_device_h_l57_c7_e1bc_return_output;
     -- result_vram_address_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_cond;
     result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output := result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- vram_addr_MUX[uxn_device_h_l50_c7_15d2] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_cond;
     vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iftrue;
     vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output := vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output;

     -- Submodule level 23
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_vram_addr_MUX_uxn_device_h_l50_c7_15d2_return_output;
     -- vram_addr_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_cond;
     vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output := vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_66f5[uxn_device_h_l40_c2_cf34] LATENCY=0
     VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_66f5_uxn_device_h_l40_c2_cf34_return_output := CONST_REF_RD_device_out_result_t_device_out_result_t_66f5(
     result,
     VAR_result_is_deo_done_MUX_uxn_device_h_l50_c7_15d2_return_output,
     VAR_result_is_vram_write_MUX_uxn_device_h_l50_c7_15d2_return_output,
     VAR_result_device_ram_address_MUX_uxn_device_h_l50_c7_15d2_return_output,
     VAR_result_vram_address_MUX_uxn_device_h_l50_c7_15d2_return_output,
     VAR_result_vram_write_layer_MUX_uxn_device_h_l50_c7_15d2_return_output,
     VAR_result_u8_value_MUX_uxn_device_h_l50_c7_15d2_return_output);

     -- Submodule level 24
     VAR_result_MUX_uxn_device_h_l40_c2_cf34_iffalse := VAR_result_FALSE_INPUT_MUX_CONST_REF_RD_device_out_result_t_device_out_result_t_66f5_uxn_device_h_l40_c2_cf34_return_output;
     REG_VAR_vram_addr := VAR_vram_addr_MUX_uxn_device_h_l40_c2_cf34_return_output;
     -- result_MUX[uxn_device_h_l40_c2_cf34] LATENCY=0
     -- Inputs
     result_MUX_uxn_device_h_l40_c2_cf34_cond <= VAR_result_MUX_uxn_device_h_l40_c2_cf34_cond;
     result_MUX_uxn_device_h_l40_c2_cf34_iftrue <= VAR_result_MUX_uxn_device_h_l40_c2_cf34_iftrue;
     result_MUX_uxn_device_h_l40_c2_cf34_iffalse <= VAR_result_MUX_uxn_device_h_l40_c2_cf34_iffalse;
     -- Outputs
     VAR_result_MUX_uxn_device_h_l40_c2_cf34_return_output := result_MUX_uxn_device_h_l40_c2_cf34_return_output;

     -- Submodule level 25
     REG_VAR_result := VAR_result_MUX_uxn_device_h_l40_c2_cf34_return_output;
     VAR_return_output := VAR_result_MUX_uxn_device_h_l40_c2_cf34_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_vram_addr <= REG_VAR_vram_addr;
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
     vram_addr <= REG_COMB_vram_addr;
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
